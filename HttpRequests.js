let response = "";

function getOption(theUrl, params, method = "GET", object)
{

    var http = new XMLHttpRequest();
    theUrl += "?" + params


    http.open(method, theUrl, true); // true for asynchronous
    http.setRequestHeader( "Authorization", 'Bearer ' + window.token);
    http.setRequestHeader("Content-type", "application/json");
    http.setRequestHeader("Accept", "application/json");
    http.setRequestHeader("Content-length", params.length);
    http.setRequestHeader("Connection", "close");
    http.send();

    return http.onreadystatechange = function(response) { // Call a function when the state changes.
        if (http.readyState === XMLHttpRequest.DONE) {
            if (http.status === 200) {
                response = JSON.parse(http.responseText)

            } else {
                response = ["error: " + http.status]
            }
            object.model = JSON.parse(JSON.stringify(response.style))
        }
    }
}

function getImage(theUrl, params, method = "GET", object)
{

    var http = new XMLHttpRequest();
    theUrl += "?" + params


    http.open(method, theUrl, true); // true for asynchronous
    http.setRequestHeader( "Authorization", 'Bearer ' + window.token);

    http.setRequestHeader("Content-type", "application/json");
    http.setRequestHeader("Accept", "application/json");
    http.setRequestHeader("Content-length", params.length);
    http.setRequestHeader("Connection", "close");
    http.send();

    return http.onreadystatechange = function(response) { // Call a function when the state changes.
        if (http.readyState === XMLHttpRequest.DONE) {
            if (http.status === 200) {
                response = JSON.parse(http.responseText)
            } else {
                response = ["error: " + http.status]
            }
            if (response.count === 0) {
                window.i = response.count;

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
                response = JSON.parse(http.responseText)
                if (response.status === 200) {
                    object.visible = false

                    window.show = true
                    window.token = response.token
                    window.userId = response.user_id
                    menu.visible=true
                    imageCalendar.source= "http://www.mirror.tceptt.com/api/load_page?page=calendar&user_id=" + response.user_id + "&token=" + response.token
                    media.source= "http://www.mirror.tceptt.com/api/load_page?page=media&user_id=" + response.user_id + "&token=" + response.token

                    //After Login set Menu
                    let str= "width=" + window.screen.width + "&height=" + window.screen.height
                    let calendarProperties = "&calendarW=" + mirrorCalendar.width + "&calendarH=" + mirrorCalendar.height + "&calendarX=" + mirrorCalendar.x + "&calendarY=" + mirrorCalendar.y
                    let mediaProperties = "&mediaW=" + rectMedia.width + "&mediaH=" + rectMedia.height

                    str += calendarProperties + mediaProperties
                    str +=  '&type=style'
                    getOption("http://www.mirror.tceptt.com/api/clients/settings", str, "GET", object)
                } else {
                    object.visible = true
                    messageText.text = response.message
                    messageText.color = "red"
                }
            } else {
                response = ["error: " + http.status]
            }
        }
    }
}

//function loadPage(theUrl, params, method = "GET", object)
//{

//    var http = new XMLHttpRequest();
//    theUrl += "?" + params


//    http.open(method, theUrl, true); // true for asynchronous
//    //    http.setRequestHeader( "Authorization", 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5YjBkOGVlMGQzODdiNjdhYTY0ZjAzZDllODM5MmViMyIsInN1YiI6IjU2MjlmNDBlYzNhMzY4MWI1ZTAwMTkxMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.UxgW0dUhS62m41KjqEf35RWfpw4ghCbnSmSq4bsB32o');

//    http.setRequestHeader("Content-type", "application/json");
//    http.setRequestHeader("Accept", "application/json");
//    http.setRequestHeader("Content-length", params.length);
//    http.setRequestHeader("Connection", "close");
//    http.send();

//    return http.onreadystatechange = function(response) { // Call a function when the state changes.
//        if (http.readyState === XMLHttpRequest.DONE) {
//            if (http.status === 200) {
//                console.log("sucess: " + theUrl + "/" + method )
//                console.log(JSON.stringify(http.responseText))
//                response = JSON.parse(http.responseText)
//            } else {
//                console.log("error: " + theUrl + http.status)
//                response = ["error: " + http.status]
//            }

//            object.source = response

//        }
//    }
//}
