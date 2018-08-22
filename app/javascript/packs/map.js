import GMaps from 'gmaps/gmaps.js';
import { autocomplete } from '../components/autocomplete';
autocomplete();

const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
  const markers = JSON.parse(mapElement.dataset.markers);
  map.addMarkers(markers);
  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }
}

 const btnMap = document.getElementById("btn-map");
 const btnCard = document.getElementById("btn-card");
 const map = document.getElementById("map");
 const cards = document.getElementById("cards");

  btnMap.addEventListener("click", function() {
    btnMap.classList.add("hidden") ;
    btnCard.classList.remove("hidden") ;
    cards.classList.add("hidden");
    map.classList.remove("hidden");
  }, );

  btnCard.addEventListener("click", function() {
    btnCard.classList.add("hidden") ;
    btnMap.classList.remove("hidden") ;
    map.classList.add("hidden");
    cards.classList.remove("hidden");
  }, );
