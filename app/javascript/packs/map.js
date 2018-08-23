import GMaps from 'gmaps/gmaps.js';
import { autocomplete } from '../components/autocomplete';
autocomplete();

const map = document.getElementById('map');
function drawMap(mapElement) {
  if (mapElement) { // don't try to build a map if there's no div#map to inject in
    const m = new GMaps({ el: '#map', lat: 0, lng: 0 });
    const markers = JSON.parse(mapElement.dataset.markers);
    m.addMarkers(markers);
    if (markers.length === 0) {
      m.setZoom(2);
    } else if (markers.length === 1) {
      m.setCenter(markers[0].lat, markers[0].lng);
      m.setZoom(14);
    } else {
      m.fitLatLngBounds(markers);
    }
  }
}

 const btnMap = document.getElementById("btn-map");
 const btnCard = document.getElementById("btn-card");
 const cards = document.getElementById("cards");

  btnMap.addEventListener("click", function() {
    btnMap.classList.add("hide") ;
    btnCard.classList.remove("hide") ;
    cards.classList.add("hide");
    map.classList.remove("hide");
    drawMap(map);
  });

  btnCard.addEventListener("click", function() {
    btnCard.classList.add("hide") ;
    btnMap.classList.remove("hide") ;
    map.classList.add("hide");
    cards.classList.remove("hide");
  });
