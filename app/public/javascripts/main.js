var map;
var mapElem = document.querySelector('#map');
var posElem = document.querySelector('#position');
var countryElem = document.querySelector('#country');
var questionElem = document.querySelector('#question');

var score = 0;
var gameID = null;
var correctanswer = null;

function startGame() {
    $.ajax({
            'method': 'POST',
            'url': '/api/game/start '
        })
        .done(function(data) {
            gameID = data.gameID;
            alert(data.message);
            
            getNextQuestion();
        })
        .fail(function(err) {
            alert('Failed');
        });


}

// window.onload = function() {
    setTimeout(function() {
        startGame();
    }, 1000);
// }


function updateScore() {
    document.querySelector('#score').innerHTML = 'Score: ' + score;
}
updateScore();

function getNextQuestion() {
    $.ajax({
        'method': 'POST',
        'url': '/api/game/questions',
        'data': { gameID: gameID }
    })
    .done(function(data) {
        if (data.answer && data.answer.country) {
            correctanswer = data.answer.country;
            //alert(data.answer.answerText);
            questionElem.innerHTML = data.answer.answerText;
        } else {
            //getNextQuestion();
        }
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
                          score = score + 1;
                          updateScore();
                        getNextQuestion();
                    } else {
                        alert('Wrong. Try again.');
                    }
                } else {
                    getNextQuestion();
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


// Set the date we're counting down to
var countDownDate = new Date().getTime() + 120000;

// Update the count down every 1 second
var x = setInterval(function() {

    // Get todays date and time
    var now = new Date().getTime();
    
    // Find the distance between now an the count down date
    var distance = countDownDate - now;
    
    // Time calculations for days, hours, minutes and seconds
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
    
    // Output the result in an element with id="demo"
    document.getElementById("demo").innerHTML = minutes + "m " + seconds + "s ";
    
    // If the count down is over, write some text 
    if (distance < 0) {
        clearInterval(x);
        //document.getElementById("demo").innerHTML = 'EXPIRED';
        
        $.ajax({
                'method': 'POST',
                'url': '/api/game/end',
                'data': { gameID: gameID, score: score }
            })
            .done(function(data) {
                gotoGameOver();
                alert(data.message);
            })
            .fail(function(err) {
                gotoGameOver();
                alert('Failed');
            });
    }
}, 1000);

function gotoGameOver() {
    setTimeout(function() {
        window.location = '/gameover';
    }, 1000);
}

