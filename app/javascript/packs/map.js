import GMaps from 'gmaps/gmaps.js';
import { autocomplete } from '../components/autocomplete';


const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
  const markers = JSON.parse(mapElement.dataset.markers);

  markers.forEach((marker) => {

    const mapMarker = map.createMarker(marker);
    mapMarker.addListener('click', function() {
      // get supplier id from marker
      const id = mapMarker.supplier_id;
      const place_price = mapMarker.place_price;

      // change slideShow
      const photoToHide = document.querySelector('.supplier-photo:not(.hidden)');
      photoToHide.classList.add('hidden');
      const photoToDisplay = document.getElementById(`supplier-photo-${id}`);
      photoToDisplay.classList.remove('hidden');
      const detailsToHide = document.querySelector('.supplier-details:not(.hidden)');
      detailsToHide.classList.add('hidden');
      const detailsToDisplay = document.getElementById(`supplier-details-${id}`);
      detailsToDisplay.classList.remove('hidden');
      const descriptionToHide = document.querySelector('.supplier-description:not(.hidden)');
      descriptionToHide.classList.add('hidden');
      const descriptionToDisplay = document.getElementById(`supplier-description-${id}`);
      descriptionToDisplay.classList.remove('hidden');

      // fill the form with new value of supplier_id
      const input = document.querySelector("form #supplier_id");
      input.value = id;

      const amount = document.getElementById("amount");
      amount.innerText = place_price.toString();

    });
    map.addMarker(mapMarker);
  });
  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }
}


autocomplete();
