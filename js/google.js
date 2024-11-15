console.log("Hola desde Google JS");
$(document).ready(function () {
    obtenerUbicacion();
});

function obtenerUbicacion() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(mostrarUbicación, mostrarError);
    } else {
        alert("La geolocalización no es soportada por este navegador.");
    }
}

function mostrarUbicación(position) {
    const lat = position.coords.latitude;
    const lon = position.coords.longitude;
    console.log("Latitud: " + lat + ", Longitud: " + lon);

    obtenerDireccion(lat, lon);
    initMapComponents(lat, lon);

}


function mostrarError(error) {
    switch (error.code) {
        case error.PERMISSION_DENIED:
            alert("El usuario se negó el permiso de ubicación");
            break;
        case error.PERMISSION_UNAVAILABLE:
            alert("El usuario no está disponible");
            break;
        case error.PERMISSION_TIMEOUT:
            alert("Se agotó el tiempo de espera");
            break;
        default:
            alert("Error desconido: " + error.message);
            break;
    }
}

function obtenerDireccion(lat, lon) {
    const latLng = { lat: lat, lng: lon };
    const geocoder = new google.maps.Geocoder();
    geocoder.geocode({ location: latLng }, function (results, status) {
        if (status = 'OK') {
            console.log(results);
            if (results[0]) {
                const direccion = results[0].formatted_address;
                document.getElementById('direccion').innerText = "Dirección: " + direccion;
            } else {
                alert("No se encontraron resultados de direccion.");
            }
        } else {
            alert("Geocodificacion fallida." + status);
        }
    });
}

function initMapComponents(lat, lon) {
    const ubicacion = { lat: lat, lng: lon };

    const mapa = new google.maps.Map(document.getElementById("map"), {
        zoom: 15,
        center: ubicacion
    });

    new google.maps.Marker({
        position: ubicacion,
        map: mapa,
        title: "Ubicación Actual"
    });

    const paranorama = new google.maps.StreetViewPanorama(
        document.getElementById("street"), {
        position: ubicacion,
        pov: { heading: 90, pitch: 5 }
    }
    );
    //vincular el Street View al mapa
    mapa.setStreetView(panorama);
}