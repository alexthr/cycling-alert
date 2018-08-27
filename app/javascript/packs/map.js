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

if(btnMap) {
  btnMap.addEventListener("click", function() {
    btnMap.classList.add("hide") ;
    btnCard.classList.remove("hide") ;
    cards.classList.add("hide");
    map.classList.remove("hide");
    map.style.display = "block";
    drawMap(map);
  });
}

if(btnCard) {
  btnCard.addEventListener("click", function() {
    btnCard.classList.add("hide") ;
    btnMap.classList.remove("hide") ;
    map.classList.add("hide");
    cards.classList.remove("hide");
    map.style.display = "none";
  });
}


const map2 = document.getElementById('stickymap');
function displayMap(mapE) {
if (mapE) {
  const sticky = new GMaps({ el: '#stickymap', lat: 0, lng: 0 });
  const mkers = JSON.parse(mapE.dataset.mkers);
  sticky.addMarkers(mkers);
  if (mkers.length === 0) {
    sticky.setZoom(2);
  } else if (mkers.length === 1) {
    sticky.setCenter(mkers[0].lat, mkers[0].lng);
    sticky.setZoom(14);
  } else {
    sticky.fitLatLngBounds(mkers);
    }
  }
}
  map2.style.display = "block";
  displayMap(map2);
