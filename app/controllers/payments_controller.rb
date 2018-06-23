class PaymentsController < ApplicationController
  before_action :set_bundle

  def create
    customer = Stripe::Customer.create(
        source: params[:stripeToken],
        email:  current_user.email
      )

      charge = Stripe::Charge.create(
        customer:     customer.id,   # You should store this customer id and re-use it.
        amount:       @bundle.amount_cents,
        description:  "Paiment de la commande #{@bundle.id}",
        currency:     @bundle.amount.currency
      )

      @bundle.update(payment: charge.to_json, state: 'paid')
      redirect_to bundle_path(@bundle)

    rescue Stripe::CardError => e
      flash[:alert] = "Désolés. Votre paiement n'a pas été pris en compte. Veuillez réessayer."
      redirect_to bundle_path(@bundle)
  end

  private

  def set_bundle
    @bundle = current_user.bundles.where(state: 'pending').find(params[:bundle_id])
  end
end
