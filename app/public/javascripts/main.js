var map;
var mapElem = document.querySelector('#map');
var posElem = document.querySelector('#position');
var countryElem = document.querySelector('#country');

var correctanswer = null;
function doSomething() {
    $.ajax({
            'url': '/api/game/start '
        })
        .done(function(data) {
            alert(data.message);
        })
        .fail(function(err) {
            alert('Failed');
        });
}
function getNextQuestion() {
    $.ajax({
        'url': '/api/game/questions '
    })
    .done(function(data) {
        correctanswer = data.answer.country;
        alert(data.answer.answerText);
    })
    .fail(function(err) {
        alert('Failed');
    });
}

function geocodeCountry(pos) {
    var url = 'https://maps.googleapis.com/maps/api/geocode/json?'
    url += 'latlng=' + pos.lat + ', ' + pos.lng;
    url += '&key=AIzaSyA4cFsNGI0CNvZ_dWfc2fdIsO3JMWTpXDg';

    // window.open(url);

    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            var response = JSON.parse(xhr.responseText);

            if (response.status == 'OK' && response.results.length > 0) {
                var firstResult = response.results[0];
                var addressComps = firstResult.address_components;
                var countryComp = null;

                for (var i=0; i<addressComps.length; i++) {
                    if (addressComps[i].types.indexOf('country') != -1) {
                        countryComp = addressComps[i];
                        break;
                    }
                }
                countryElem.innerHTML = countryComp.long_name;
                if (correctanswer) {
                    if (correctanswer == countryComp.short_name) {
                        correctanswer = null;
                        alert('You got it right!');
                        getNextQuestion();
                    } else {
                        alert('Wrong. Try again.');
                    }
                }
            }
        }
    }
    xhr.open('GET', url, true);
    xhr.send();
}

function initMap() {
    var options = {
        disableDefaultUI: true,
        draggable: false,
        center: {
            lat: 40.53,
            lng: -10
        },
        zoom: 2
    }
    map = new google.maps.Map(mapElem, options);
    console.log(map);

    map.addListener('click', function(event) {
        var pos = {
            lat: event.latLng.lat(),
            lng: event.latLng.lng()
        }
        posElem.innerHTML = pos.lat + ', ' + pos.lng;

        geocodeCountry(pos);
    });

}

//var score = new Array ()




