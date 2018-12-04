var api_key= "";
var search = "";
var url ="";
var access_token ="10a08fd7-1e1b-46fd-9866-ed2252b08217";
var url2 ="";
var url3 ="";
var t = 0;





$('.btn-default').on('click', function(){
    $(this).siblings().removeClass('active');
    $(this).toggleClass('active');
});
//clear ajax JSON Cache
$(document).ready(function() {
    $.ajaxSetup({ cache: false });
});


//on click assign these variables
$(document).ready(function(){
    $("#btnMovie").click(function(){
        api_key = 'movie';

    });
});
$(document).ready(function(){
    $("#btnBook").click(function(){
        api_key = 'book';

    });
});
$(document).ready(function(){
    $("#btnGame").click(
        function(){
            api_key = 'game';

        });
});

$(document).ready(function(){
$('#btnMovie').click(function() {
    $('#btnMovie').removeClass('btn-default').addClass('btn-primary ');
})
});

$(document).ready(function(){
    $('#btnBook').click(function() {
        $('#btnBook').removeClass('btn-default').addClass('btn-primary ');
    })
});

$(document).ready(function(){
    $('#btnGame').click(function() {
        $('#btnGame').removeClass('btn-default').addClass('btn-primary ');

    })
});

$(document).ready(function(){
    $('#searchButton').click(function() {
        $('#btnMovie').removeClass('btn-primary').addClass('btn-default ');
        $('#btnBook').removeClass('btn-primary').addClass('btn-default ');
        $('#btnGame').removeClass('btn-primary').addClass('btn-default ');
    })
});

//on search click input field to var SEARCH
$(document).ready(function(){
    $("#searchButton").click(
        function () {
            search = $('#searchField').val();

            if (search.toString() == '') {
                alert("No Search Term");
            }
            else if(api_key == '') {
                alert("Must Select Search Type! M, B, or G!");


            }else{


                url = "https://api.mediahound.com/1.3/search/all/";

                url2 = "?access_token=";
                url3 = "&pageSize=20&types=";





                var finalUrl = url.concat(search, url2, access_token, url3, api_key);




                $(document).ready(function(){


                    // we'll store the search term here
                    $.getJSON(finalUrl,function(json) {

                        $.each(json.content, function (i, runner) {



                        });
                        if(t = 1){
                        switch (api_key) {
                            case 'movie':
                                t=1;
                                $.each(json.content, function (i, item) {

                                    if (item.object.metadata.releaseDate != undefined) {
                                        var dt = eval(item.object.metadata.releaseDate * 1000);
                                        var myDate = new Date(dt);
                                    } else if (item.object.metadata.releaseDate == undefined) {
                                        myDate = "No Date Found, Sorry!";
                                    }

                                    if (item.object.metadata.description != undefined) {
                                        var description = item.object.metadata.description;
                                    } else if ((item.object.metadata.description == undefined)) {
                                         description = "Unfortunately No Description Found!";
                                    }


                                    $('<tr>').html(
                                        "<td><img src=" + item.object.primaryImage.metadata.thumbnail.url + "></td><td>" + item.object.metadata.name + "</td><td>" + myDate + "</td><td>" + description + "</td>").appendTo('#secondTable');
                                    console.log(item);
                                    if (i === 21) {
                                        return false;
                                    }
                                });
                                break;
                            case 'book':
                            t=1;
                                $.each(json.content, function (i, item) {

                                    if (item.object.metadata.releaseDate != undefined) {
                                        var dt = eval(item.object.metadata.releaseDate * 1000);
                                        var myDate = new Date(dt);
                                    } else if (item.object.metadata.releaseDate == undefined) {
                                        myDate = "No Date Found, Sorry!";
                                    }



                                    $('<tr>').html(
                                        "<td><img src=" + item.object.primaryImage.metadata.thumbnail.url + "></td><td>" + item.object.metadata.name + "</td><td>" + myDate + "</td><td>" + item.object.metadata.altId + "</td>").appendTo('#secondTable');
                                    console.log(item);
                                    if (i === 21) {
                                        return false;
                                    }
                                });
                                break;
                            case 'game':
                                t=1;
                                $.each(json.content, function (i, item) {

                                    if (item.object.metadata.releaseDate != undefined) {
                                        var dt = eval(item.object.metadata.releaseDate * 1000);
                                        var myDate = new Date(dt);
                                    } else if (item.object.metadata.releaseDate == undefined) {
                                        myDate = "No Date Found, Sorry!";
                                    }



                                    $('<tr>').html(
                                        "<td><img src=" + item.object.primaryImage.metadata.thumbnail.url + "></td><td>" + item.object.metadata.name + "</td><td>" + myDate + "</td><td>" + item.object.metadata.altId + "</td>").appendTo('#secondTable');
                                    console.log(item);
                                    if (i === 21) {
                                        return false;
                                    }
                                });
                                break;
                        }}else if(t==1){


                            $('#secondTable').empty();
                        }
                    });

                });
            }
        });
});


