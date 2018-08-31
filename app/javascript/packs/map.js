import GMaps from 'gmaps/gmaps.js';
import { autocomplete } from '../components/autocomplete';
autocomplete();

const map = document.getElementById('issue-map');
function drawMap(mapElement) {
  if (mapElement) { // don't try to build a map if there's no div#map to inject in
    const m = new GMaps({ el: '#issue-map', lat: 0, lng: 0 });
    const styles = [
    {
        "featureType": "landscape.man_made",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#f7f7f7"
            }
        ]
    },
    {
        "featureType": "landscape.natural",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "poi.business",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "simplified"
            }
        ]
    },
    {
        "featureType": "poi.medical",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "poi.park",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "poi.park",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#e5e8d9"
            }
        ]
    },
    {
        "featureType": "poi.sports_complex",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "hue": "#ff0000"
            },
            {
                "saturation": -100
            },
            {
                "lightness": 99
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "color": "#808080"
            },
            {
                "lightness": 54
            },
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "color": "#767676"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "color": "#ffffff"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#828282"
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#b4b4b2"
            }
        ]
    },
    {
        "featureType": "road.local",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#c9c9c9"
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "all",
        "stylers": [
            {
                "saturation": 43
            },
            {
                "lightness": -11
            },
            {
                "color": "#89cada"
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#b1cad6"
            }
        ]
    }
];
    m.addStyle({
      styles: styles,
      mapTypeId: 'map_style'
    });
    m.setStyle('map_style');
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
  const stylesSticky = [
    {
        "featureType": "landscape.man_made",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#f7f7f7"
            }
        ]
    },
    {
        "featureType": "landscape.natural",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "poi.business",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "simplified"
            }
        ]
    },
    {
        "featureType": "poi.medical",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "poi.park",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "poi.park",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#e5e8d9"
            }
        ]
    },
    {
        "featureType": "poi.sports_complex",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "hue": "#ff0000"
            },
            {
                "saturation": -100
            },
            {
                "lightness": 99
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "color": "#808080"
            },
            {
                "lightness": 54
            },
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "color": "#767676"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "color": "#ffffff"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#828282"
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#b4b4b2"
            }
        ]
    },
    {
        "featureType": "road.local",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#c9c9c9"
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "all",
        "stylers": [
            {
                "saturation": 43
            },
            {
                "lightness": -11
            },
            {
                "color": "#89cada"
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#b1cad6"
            }
        ]
    }
];
    sticky.addStyle({
      styles: stylesSticky,
      mapTypeId: 'map_style'
    });
    sticky.setStyle('map_style');
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

if(map2) {
  map2.style.display = "block";
  displayMap(map2);
}


