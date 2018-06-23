class BundlesController < ApplicationController
  def show
    @bundle = Bundle.find(params[:id])
  end

  def new
    @bundle = Bundle.new
  end

  def create
    session[:bundle] = {}
    session[:bundle][:starts_on] = params[:starts_on]
    session[:bundle][:ends_on] = params[:ends_on]
    session[:bundle][:where] = params[:where]
    session[:bundle][:capacity] = params[:capacity]
    session[:bundle][:budget] = params[:budget]
    session[:bundle][:categories] = params[:categories]
    @bundle = Bundle.new
    @bundle.user = current_user
    @bundle.starts_on = params[:starts_on]
    @bundle.ends_on = params[:ends_on]
    @bundle.capacity = params[:capacity]
    @bundle.save
    if params[:categories].nil? || params[:starts_on].nil? || params[:ends_on].nil? || params[:where].nil? || params[:capacity].nil? || params[:budget].nil?
      render :new
    elsif params[:categories].include?("lieu")
      redirect_to location_bundle_path(@bundle)
    else
      redirect_to services_bundle_path(@bundle)
    end
  end

  def location
    @bundle = Bundle.find(params[:id])
    @places_suppliers = Supplier.near(session[:bundle]['where'], 80).where.not(latitude: nil, longitude: nil)
    # start_date = DateTime.parse(session[:bundle]['starts_on'])
    # end_date = DateTime.parse(session[:bundle]['ends_on'])
    # dates = session[:bundle]['starts_on'].split(' au ')
    # start_date = DateTime.parse(dates.first)
    # end_date = DateTime.parse(dates.last)
    @event_days = (@bundle.starts_on..@bundle.ends_on).map{ |a| a }

    @places_suppliers = check_availabilities(@places_suppliers)
    @places_suppliers = check_budget(@places_suppliers)
    @places_suppliers = check_capacity(@places_suppliers)

    @markers = @places_suppliers.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude,
        supplier_id: place.id,
        place_price: ActionController::Base.helpers.humanized_money(place.price * @event_days.count, symbol_first: false, no_cents: true),
        infoWindow: { content: render_to_string(partial: "/bundles/map_box", locals: { place: place }) }
      }
    end
    @places_suppliers
  end

  def services
    # 1 - Selection of all suppliers that are not 'lieu'
    @services_supplier = Supplier.joins(:service).where.not(services: { category: 'lieu' })
    # 2 - bundle that we are building
    @bundle = Bundle.find(params[:id])
    # 3 - selected services on the new bundle page
    @services_selected = session[:bundle]["categories"]
    # 4 - check session where en fct des areas des suppliers (autres services)
    # a) get region from address put in the form by the user
    geocode_where = Geocoder.search(session[:bundle]['where'])
    array_geocode = geocode_where.first.address_components
    region = ""
    array_geocode.each do |address_component|
      if address_component["types"].first == "administrative_area_level_1"
        region = address_component["long_name"]
      end
    end
    # b) keep only suppliers which area is variable region
    @services_supplier = @services_supplier.select do |service_supplier|
      service_supplier.area.region == region
    end
    # 5 - check availabilities by comparing dates of user and availabilities of suppliers
    # a) get  start and end dates entered by user and transform it in an array of dates
    start_date = DateTime.parse(session[:bundle]['starts_on'])
    end_date = DateTime.parse(session[:bundle]['ends_on'])
    @event_days = (start_date..end_date).map{ |a| a }
    # b) call check_availabilities method to filter suppliers
    @services_supplier = check_availabilities(@services_supplier)
    # what's above is ok
    #--------------------------------------------------------------------------

    # 6 - check budget
    # a) check if lieu was selected to build a remaining budget
    # b) differenciate budget traiteur with other services
    total_budget = Money.new(session[:bundle]['budget'].to_i * 100, "eur")
    capacity = session[:bundle]['capacity'].to_i
    @services_supplier = @services_supplier.select do |service_supplier|
      if @services_selected.include?("lieu")
        # get price of the chosen lieu
        location_budget = Money.new(@bundle.suppliers.first.price.to_i * @event_days.count * 100, "eur")
        remaining_budget = total_budget - location_budget
        nb_of_other_services = @services_selected.count - 1
        if @services_selected.include?("traiteur")
          nb_of_other_services = @services_selected.count - 2
          caterer_budget = 0.7 * remaining_budget
          if service_supplier.service.category == "traiteur"
            service_supplier.price * capacity <= caterer_budget
          else
            remaining_budget = remaining_budget - caterer_budget
            other_services_budget = remaining_budget / nb_of_other_services
            service_supplier.price <= other_services_budget
          end
        else
          other_services_budget = remaining_budget / nb_of_other_services
          service_supplier.price <= other_services_budget
        end
      else
        remaining_budget = Money.new(session[:bundle]['budget'].to_i * 100, "eur")
        if @services_selected.include?("traiteur")
          nb_of_other_services = @services_selected.count - 1
          caterer_budget = 0.7 * remaining_budget
          if service_supplier.service.category == "traiteur"
            service_supplier.price * capacity <= caterer_budget
          else
            remaining_budget = remaining_budget - caterer_budget
            other_services_budget = remaining_budget / nb_of_other_services
            service_supplier.price <= other_services_budget
          end
        else
          other_services_budget = remaining_budget / nb_of_other_services
          service_supplier.price <= other_services_budget
        end
      end
    end
    @services_selected.delete("lieu")
    @services_supplier
  end

  def check_availabilities(suppliers)
    return suppliers.select do |supplier|
      supplier.availabilities.map do |avail|
        (avail.starts_on..avail.ends_on).map{ |a| a }.flatten.uniq.include?(@event_days)
      end
    end
  end

  def check_budget(suppliers)
    nb_days = @event_days.count
    budget = session[:bundle]['budget'].to_i
    return suppliers.select do |supplier|
      (supplier.price.to_f * nb_days) <= (0.3 * budget)
    end
  end

  def check_capacity(suppliers)
    return suppliers.select do |supplier|
      supplier.capacity >= @bundle.capacity
    end
  end
end
