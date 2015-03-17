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

/*$(window).load(function() {
    $('.flexslider').flexslider(
        {

        }
    );
}); */

$(document).ready(function() {

    $('#more').click(function() {
        $(this).toggleClass('active');
        $(this).next('.dropdown').toggle();
        return false;
    });

      /*
    $('.dropdown a').click(function() {
        $(this).unbind('click');
        return false;
    }); */



    $(function(){
        $('#header').data('size','big');
    });

    $(window).scroll(function(){
        if($(document).scrollTop() > 0)
        {
            if($('#header').data('size') == 'big')
            {
                $('#header').data('size','small');
                $('.header_links').hide();
                $('.header_browse').hide();
                $('#header').stop().animate({
                    height:'60px'
                },600);
            }
        }
        else
        {
            if($('#header').data('size') == 'small')
            {
                $('#header').data('size','big');
                $('.header_links').fadeIn();
                $('.header_browse').fadeIn();
                $('#header').stop().animate({
                    height:'80px'
                },600);
            }
        }
    });



});


