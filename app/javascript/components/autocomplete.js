function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    let issueAddress = document.getElementById('issue_address');
    let start = document.getElementById('itinerary-start');
    let end = document.getElementById('itinerary-end');

    if (issueAddress) {
      let autocomplete = new google.maps.places.Autocomplete(issueAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(issueAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }

    if (start) {
      let autocomplete = new google.maps.places.Autocomplete(start, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(start, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }


    if (end) {
      let autocomplete = new google.maps.places.Autocomplete(end, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(end, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }

  });
}

export { autocomplete };
