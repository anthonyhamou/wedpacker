function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var where = document.getElementById('where');

    if (where) {
      var autocomplete = new google.maps.places.Autocomplete(where, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(where, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
