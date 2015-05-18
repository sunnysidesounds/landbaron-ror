// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require html5shiv-printshiv
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery.textchange

// Removed due to b.browser undefined
// require jquery.details

//= require preorder
//= require angular.min
//= require angular-ui-router
//= require ui-bootstrap-tpls-0.12.0
//= require jquery.bxslider
//= require jquery.validate
//= require additional-methods
//= require jquery.maskedinput
//= require jquery.formatCurrency



$(document).ready(function() {

    //Header dropdown
    $('#more').click(function() {
        $(this).toggleClass('active');
        $(this).next('.dropdown').toggle();
        return false;
    });

    //Sliding header
    $(function(){
        $('#header').data('size','big');
    });

    // Sticky header with slider
    $(window).scroll(function(){
        if($(document).scrollTop() > 0){
            if($('#header').data('size') == 'big'){
                $('#header').data('size','small');
                $('.header_links').hide();
                if(getLocalPath() == "investment_detail"){
                    console.log("Found details, Rendering inves not button");
                    $('#invest_now_header').css('visibility', 'visible');
                }
                $('.header_browse').hide();
                $('#header').stop().animate({
                    height:'60px'
                },600);
            }
        } else {
            if($('#header').data('size') == 'small') {
                $('#header').data('size','big');
                $('#invest_now_header').css('visibility', 'hidden');
                $('.header_links').fadeIn();
                $('.header_browse').fadeIn();
                $('#header').stop().animate({
                    height:'80px'
                },600);
            }
        }
    });
    // Media slider
    $('.bxslider').bxSlider({
        auto: true,
        autoControls: true,
        onSliderLoad: function(){
            $("#slider").css("visibility", "visible");
        }
    });


    // Principle Mini Bios slide down to large bios.
    $(".investor_principal_sublist").click(function(event) {
        event.preventDefault();
        $('html, body').animate({
            scrollTop: $("#principle_section").offset().top
        }, 2000);
    });

    // Sign-In Form Validation
    $("#new_user").validate({
        debug: false, //if set to true form won't submit
        rules: {
        "user[username]": {required: true},
        "user[password]": {required: true}
        }
    });

    // Registration Form Validation
    $("#create_user").validate({
        debug: false, //if set to true form won't submit
        rules: {
            "user[first_name]": {required: true},
            "user[phone_number]": {required: true},
            "user[username]": {required: true},
            "user[address]": {required: true},
            "user[city]": {required: true},
            "user[state]": {required: true},
            "user[income_range]": {required: true},
            "user[postal_code]": {required: true, digits:true},
            "user[email]": { required:true, email:true },
            "user[password]": {required: true, minlength: 4},
            "user[password_confirmation]": {
                required: true, equalTo: "#user_password", minlength: 4
            },
            "user[last_name]": {required: true}
        },
        messages : {

        },
        errorPlacement: function(error, element) {
            if (element.attr("type") == "radio") {
                error.insertBefore(element);
            } else {
                error.insertAfter(element);
            }
        }
    });

    // Format Phone Number
    $("#user_phone_number").mask("(999) 999-9999");

    // Investment Now Currency Field.
    $('#quote_total_amount').blur(function()
    {
        $('#quote_total_amount').formatCurrency();
    });


    // Progress bar assets, core is in details template
    $( "#progressbar").height(20);
    $( "#progressbar").width(230);




    // Voting stuff
    //####### on page load, retrive votes for each content
    $.each( $('.voting_wrapper'), function(){

        //retrive unique id from this voting_wrapper element
        var unique_id = $(this).attr("id");

        //prepare post content
        post_data = {'unique_id':unique_id, 'vote':'fetch'};

        //send our data
        $.post('/vote', post_data,  function(response) {

            //retrive votes from server, replace each vote count text
            $('#'+unique_id+' .up_votes').text(response.vote_up);
            $('#'+unique_id+' .down_votes').text(response.vote_down);
        },'json');
    });

    $(".voting_wrapper .voting_btn").click(function (e) {

        //get class name (down_button / up_button) of clicked element
        var clicked_button = $(this).children().attr('class');

        //get unique ID from voted parent element
        var unique_id   = $(this).parent().attr("id");

        if(clicked_button==='down_button') //user disliked the content
        {
            //prepare post content
            post_data = {'unique_id':unique_id, 'vote':'down'};

            //send our data to "vote_process.php" using jQuery $.post()
            $.post('vote_process.php', post_data, function(data) {

                //replace vote down count text with new values
                $('#'+unique_id+' .down_votes').text(data);

                //thank user for the dislike
                alert("Thanks! Each Vote Counts, Even Dislikes!");

            }).fail(function(err) {

                //alert user about the HTTP server error
                alert(err.statusText);
            });
        }
        else if(clicked_button==='up_button') //user liked the content
        {
            //prepare post content
            post_data = {'unique_id':unique_id, 'vote':'up'};

            //send our data to "vote_process.php" using jQuery $.post()
            $.post('vote_process.php', post_data, function(data) {

                //replace vote up count text with new values
                $('#'+unique_id+' .up_votes').text(data);

                //thank user for liking the content
                alert("Thanks! For Liking This Content.");
            }).fail(function(err) {

                //alert user about the HTTP server error
                alert(err.statusText);
            });
        }

    });
//end





});


// Helper methods
function getLocalPath(){
    var str = window.location.pathname;
    return str.substring(1, 18);

}


