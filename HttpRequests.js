let response = "";

function getOption(theUrl, params, method = "GET", object)
{

    var http = new XMLHttpRequest();
    theUrl += "?" + params


    http.open(method, theUrl, true); // true for asynchronous
    //    http.setRequestHeader( "Authorization", 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5YjBkOGVlMGQzODdiNjdhYTY0ZjAzZDllODM5MmViMyIsInN1YiI6IjU2MjlmNDBlYzNhMzY4MWI1ZTAwMTkxMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.UxgW0dUhS62m41KjqEf35RWfpw4ghCbnSmSq4bsB32o');

    http.setRequestHeader("Content-type", "application/json");
    http.setRequestHeader("Accept", "application/json");
    http.setRequestHeader("Content-length", params.length);
    http.setRequestHeader("Connection", "close");
    http.send();

    return http.onreadystatechange = function(response) { // Call a function when the state changes.
        if (http.readyState === XMLHttpRequest.DONE) {
            if (http.status === 200) {
                console.log("sucess: " + theUrl + "/" + method )
                //                    console.log(JSON.stringify(http.responseText))
                response = JSON.parse(http.responseText)
            } else {
                //                    console.log("error: " + theUrl + http.status)
                response = ["error: " + http.status]
            }
            object.model = response
        }
    }
}

function getImage(theUrl, params, method = "GET", object)
{

    var http = new XMLHttpRequest();
    theUrl += "?" + params


    http.open(method, theUrl, true); // true for asynchronous
    //    http.setRequestHeader( "Authorization", 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5YjBkOGVlMGQzODdiNjdhYTY0ZjAzZDllODM5MmViMyIsInN1YiI6IjU2MjlmNDBlYzNhMzY4MWI1ZTAwMTkxMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.UxgW0dUhS62m41KjqEf35RWfpw4ghCbnSmSq4bsB32o');

    http.setRequestHeader("Content-type", "application/json");
    http.setRequestHeader("Accept", "application/json");
    http.setRequestHeader("Content-length", params.length);
    http.setRequestHeader("Connection", "close");
    http.send();

    return http.onreadystatechange = function(response) { // Call a function when the state changes.
        if (http.readyState === XMLHttpRequest.DONE) {
            if (http.status === 200) {
                console.log("sucess: " + theUrl + "/" + method )
//                console.log(JSON.stringify(http.responseText))
                response = JSON.parse(http.responseText)
            } else {
                //                    console.log("error: " + theUrl + http.status)
                response = ["error: " + http.status]
            }
            if (response.count === 0) {
                window.i = count;

            }
            object.source = response.url

        }
    }
}

function login(theUrl, params, method = "GET", object)
{

    var http = new XMLHttpRequest();
    theUrl += "?" + params


    http.open(method, theUrl, true); // true for asynchronous
    //    http.setRequestHeader( "Authorization", 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5YjBkOGVlMGQzODdiNjdhYTY0ZjAzZDllODM5MmViMyIsInN1YiI6IjU2MjlmNDBlYzNhMzY4MWI1ZTAwMTkxMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.UxgW0dUhS62m41KjqEf35RWfpw4ghCbnSmSq4bsB32o');

    http.setRequestHeader("Content-type", "application/json");
    http.setRequestHeader("Accept", "application/json");
    http.setRequestHeader("Content-length", params.length);
    http.setRequestHeader("Connection", "close");
    http.send();

    return http.onreadystatechange = function(response) { // Call a function when the state changes.
        if (http.readyState === XMLHttpRequest.DONE) {
            if (http.status === 200) {
                console.log("sucess: " + theUrl + "/" + method )
                console.log(JSON.stringify(http.responseText))
                response = JSON.parse(http.responseText)
                if (response.status === 200) {
                    object.visible = false
                    media.url = window.newUrl
                    window.show = true
                } else {
                    object.visible = true
                }
            } else {
                console.log("error: " + theUrl + http.status)
                response = ["error: " + http.status]
            }
        }
    }
}
