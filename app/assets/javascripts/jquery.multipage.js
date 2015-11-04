(function($) {
    $.fn.multipage = function(options) {
        options = $.extend({  
            submitButton: "" 
        }, options); 
        
        var element = this;

        var steps = $(element).find("fieldset");
        var count = steps.size();
        var submmitButtonName = "#" + options.submitButton;
        $(submmitButtonName).hide();

        steps.each(function(i) {

            $(this).wrap("<div id='step" + i + "' class='row'></div>");
            $($(this).find(".signup_navigation_button")).append("<p class='steps_navigation text-center' id='step" + i + "commands'></p>");

            if (i == 0) {
                createButton(i, "Submit and advance to next step");
                selectStep(i);
            }
            else if (i == count - 1) {
                $("#step" + i).hide();
                // createPrevButton(i);
            }
            else {
                $("#step" + i).hide();
                createButton(i, "CONTINUE");
            }
        });

        function createPrevButton(i) {
            var stepName = "step" + i;
            $("#" + stepName + "commands").append("<a href='#' id='" + stepName + "Prev' class='prev'>< Back</a>");

            $("#" + stepName + "Prev").bind("click", function(e) {
                $("#" + stepName).hide();
                $("#step" + (i - 1)).show();
                $(submmitButtonName).hide();
               selectStep(i - 1);
            });
        }

        function createButton(i, text) {
            var stepName = "step" + i;
            $("#" + stepName + "commands").append("<input type='submit' value='"+text+"' id='" + stepName + "Next' class='signup-next-btn'>");

            $("#" + stepName + "Next").bind("click", function(e) {
                if($("#create_user")[0].checkValidity()){
                    $("fieldset").show();
                    $("#" + stepName).hide();
                    $("#step" + (i + 1)).show();    
                    if (i + 2 == count){
                        e.preventDefault();
                        $(submmitButtonName).show();                    
                    }else{
                        e.preventDefault();
                    }
                }
                
               // selectStep(i + 1);
            });
        }



        function selectStep(i) {
            $("#steps li").removeClass("current");
            $("#stepDesc" + i).addClass("current");
        }

    }
})(jQuery); 