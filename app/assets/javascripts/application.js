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

});


// Helper methods
function getLocalPath(){
    var str = window.location.pathname;
    return str.substring(1, 18);

}


