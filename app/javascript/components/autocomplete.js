function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    let issueAddress = document.getElementById('issue_address');

    if (issueAddress) {
      let autocomplete = new google.maps.places.Autocomplete(issueAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(issueAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
