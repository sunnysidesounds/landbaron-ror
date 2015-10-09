module ApplicationHelper


    def bootstrap_class_for flash_type
        { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type] || flash_type.to_s
    end

    def flash_messages(opts = {})
        flash.each do |msg_type, message|
          concat(content_tag(:div, message, class: "flash_notif #{bootstrap_class_for(msg_type)} fade in") do 
                  concat content_tag(:button, 'x', class: "close", onclick: "$('.flash_notif').hide()")
                  concat message 
                end)
        end
        nil
    end

  def show_field_error(model, field)
    s=""

    if !model.errors[field].empty?
      s =
          <<-EOHTML
           <div class="error_message">
             #{model.errors[field][0]}
           </div>
      EOHTML
    end

    s.html_safe
  end

  def income_range
    [
        ['Your Income Range', ''],
        ['Over $200,000 in net income past 2 years', 'Over $200,000'],
        ['Over $300,000 in income w/spouse the past 2 years', 'Over $300,000 w/spouse'],
        ['Net worth of over $1,000,000', 'Net work $1,000,000']
    ]
  end

  def us_states
    [
        ["", ""],
        ["Alaska", "Alaska"],
        ["Alabama", "Alabama"],
        ["Arkansas", "Arkansas"],
        ["American Samoa", "American Samoa"],
        ["Arizona", "Arizona"],
        ["California", "California"],
        ["Colorado", "Colorado"],
        ["Connecticut", "Connecticut"],
        ["District of Columbia", "District of Columbia"],
        ["Delaware", "Delaware"],
        ["Florida", "Florida"],
        ["Georgia", "Georgia"],
        ["Guam", "Guam"],
        ["Hawaii", "Hawaii"],
        ["Iowa", "Iowa"],
        ["Idaho", "Idaho"],
        ["Illinois", "Illinois"],
        ["Indiana", "Indiana"],
        ["Kansas", "Kansas"],
        ["Kentucky", "Kentucky"],
        ["Louisiana", "Louisiana"],
        ["Massachusetts", "Massachusetts"],
        ["Maryland", "Maryland"],
        ["Maine", "Maine"],
        ["Michigan", "Michigan"],
        ["Minnesota", "Minnesota"],
        ["Missouri", "Missouri"],
        ["Mississippi", "Mississippi"],
        ["Montana", "Montana"],
        ["North Carolina", "North Carolina"],
        ["North Dakota", "North Dakota"],
        ["Nebraska", "Nebraska"],
        ["New Hampshire", "New Hampshire"],
        ["New Jersey", "New Jersey"],
        ["New Mexico", "New Mexico"],
        ["Nevada", "Nevada"],
        ["New York", "New York"],
        ["Ohio", "Ohio"],
        ["Oklahoma", "Oklahoma"],
        ["Oregon", "Oregon"],
        ["Pennsylvania", "Pennsylvania"],
        ["Puerto Rico", "Puerto Rico"],
        ["Rhode Island", "Rhode Island"],
        ["South Carolina", "South Carolina"],
        ["South Dakota", "South Dakota"],
        ["Tennessee", "Tennessee"],
        ["Texas", "Texas"],
        ["Utah", "Utah"],
        ["Virginia", "Virginia"],
        ["Virgin Islands", "Virgin Islands"],
        ["Vermont", "Vermont"],
        ["Washington", "Washington"],
        ["Wisconsin", "Wisconsin"],
        ["West Virginia", "West Virginia"],
        ["Wyoming", "Wyoming"]
    ]
  end

  def countries
    [
        ["Afghanistan", "Afghanistan"],
        ["Aland Islands", "Aland Islands"],
        ["Albania", "Albania"],
        ["Algeria", "Algeria"],
        ["American Samoa", "American Samoa"],
        ["Andorra", "Andorra"],
        ["Angola", "Angola"],
        ["Anguilla", "Anguilla"],
        ["Antarctica", "Antarctica"],
        ["Antigua And Barbuda", "Antigua And Barbuda"],
        ["Argentina", "Argentina"],
        ["Armenia", "Armenia"],
        ["Aruba", "Aruba"],
        ["Australia", "Australia"],
        ["Austria", "Austria"],
        ["Azerbaijan", "Azerbaijan"],
        ["Bahamas", "Bahamas"],
        ["Bahrain", "Bahrain"],
        ["Bangladesh", "Bangladesh"],
        ["Barbados", "Barbados"],
        ["Belarus", "Belarus"],
        ["Belgium", "Belgium"],
        ["Belize", "Belize"],
        ["Benin", "Benin"],
        ["Bermuda", "Bermuda"],
        ["Bhutan", "Bhutan"],
        ["Bolivia", "Bolivia"],
        ["Bosnia and Herzegowina", "Bosnia and Herzegowina"],
        ["Botswana", "Botswana"],
        ["Bouvet Island", "Bouvet Island"],
        ["Brazil", "Brazil"],
        ["British Indian Ocean Territory", "British Indian Ocean Territory"],
        ["Brunei Darussalam", "Brunei Darussalam"],
        ["Bulgaria", "Bulgaria"],
        ["Burkina Faso", "Burkina Faso"],
        ["Burundi", "Burundi"],
        ["Cambodia", "Cambodia"],
        ["Cameroon", "Cameroon"],
        ["Canada", "Canada"],
        ["Cape Verde", "Cape Verde"],
        ["Cayman Islands", "Cayman Islands"],
        ["Central African Republic", "Central African Republic"],
        ["Chad", "Chad"],
        ["Chile", "Chile"],
        ["China", "China"],
        ["Christmas Island", "Christmas Island"],
        ["Cocos (Keeling) Islands", "Cocos (Keeling) Islands"],
        ["Colombia", "Colombia"],
        ["Comoros", "Comoros"],
        ["Congo", "Congo"],
        ["Cook Islands", "Cook Islands"],
        ["Costa Rica", "Costa Rica"],
        ["Cote d'Ivoire", "Cote d'Ivoire"],
        ["Croatia", "Croatia"],
        ["Cuba", "Cuba"],
        ["Cyprus", "Cyprus"],
        ["Czech Republic", "Czech Republic"],
        ["Denmark", "Denmark"],
        ["Djibouti", "Djibouti"],
        ["Dominica", "Dominica"],
        ["Dominican Republic", "Dominican Republic"],
        ["Ecuador", "Ecuador"],
        ["Egypt", "Egypt"],
        ["El Salvador", "El Salvador"],
        ["Equatorial Guinea", "Equatorial Guinea"],
        ["Eritrea", "Eritrea"],
        ["Estonia", "Estonia"],
        ["Ethiopia", "Ethiopia"],
        ["Falkland Islands (Malvinas)", "Falkland Islands (Malvinas)"],
        ["Faroe Islands", "Faroe Islands"],
        ["Fiji", "Fiji"],
        ["Finland", "Finland"],
        ["France", "France"],
        ["French Guiana", "French Guiana"],
        ["French Polynesia", "French Polynesia"],
        ["French Southern Territories", "French Southern Territories"],
        ["Gabon", "Gabon"],
        ["Gambia", "Gambia"],
        ["Georgia", "Georgia"],
        ["Germany", "Germany"],
        ["Ghana", "Ghana"],
        ["Gibraltar", "Gibraltar"],
        ["Greece", "Greece"],
        ["Greenland", "Greenland"],
        ["Grenada", "Grenada"],
        ["Guadeloupe", "Guadeloupe"],
        ["Guam", "Guam"],
        ["Guatemala", "Guatemala"],
        ["Guernsey", "Guernsey"],
        ["Guinea", "Guinea"],
        ["Guinea-Bissau", "Guinea-Bissau"],
        ["Guyana", "Guyana"],
        ["Haiti", "Haiti"],
        ["Honduras", "Honduras"],
        ["Hong Kong", "Hong Kong"],
        ["Hungary", "Hungary"],
        ["Iceland", "Iceland"],
        ["India", "India"],
        ["Indonesia", "Indonesia"],
        ["Iran, Islamic Republic of", "Iran, Islamic Republic of"],
        ["Iraq", "Iraq"],
        ["Ireland", "Ireland"],
        ["Isle of Man", "Isle of Man"],
        ["Israel", "Israel"],
        ["Italy", "Italy"],
        ["Jamaica", "Jamaica"],
        ["Japan", "Japan"],
        ["Jersey", "Jersey"],
        ["Jordan", "Jordan"],
        ["Kazakhstan", "Kazakhstan"],
        ["Kenya", "Kenya"],
        ["Kiribati", "Kiribati"],
        ["Korea, Democratic People's Republic of", "Korea, Democratic People's Republic of"],
        ["Korea, Republic of", "Korea, Republic of"],
        ["Kuwait", "Kuwait"],
        ["Kyrgyzstan", "Kyrgyzstan"],
        ["Lao People's Democratic Republic", "Lao People's Democratic Republic"],
        ["Latvia", "Latvia"],
        ["Lebanon", "Lebanon"],
        ["Lesotho", "Lesotho"],
        ["Liberia", "Liberia"],
        ["Libyan Arab Jamahiriya", "Libyan Arab Jamahiriya"],
        ["Liechtenstein", "Liechtenstein"],
        ["Lithuania", "Lithuania"],
        ["Luxembourg", "Luxembourg"],
        ["Macao", "Macao"],
        ["Madagascar", "Madagascar"],
        ["Malawi", "Malawi"],
        ["Malaysia", "Malaysia"],
        ["Maldives", "Maldives"],
        ["Mali", "Mali"],
        ["Malta", "Malta"],
        ["Marshall Islands", "Marshall Islands"],
        ["Martinique", "Martinique"],
        ["Mauritania", "Mauritania"],
        ["Mauritius", "Mauritius"],
        ["Mayotte", "Mayotte"],
        ["Mexico", "Mexico"],
        ["Monaco", "Monaco"],
        ["Mongolia", "Mongolia"],
        ["Montenegro", "Montenegro"],
        ["Montserrat", "Montserrat"],
        ["Morocco", "Morocco"],
        ["Mozambique", "Mozambique"],
        ["Myanmar", "Myanmar"],
        ["Namibia", "Namibia"],
        ["Nauru", "Nauru"],
        ["Nepal", "Nepal"],
        ["Netherlands", "Netherlands"],
        ["Netherlands Antilles", "Netherlands Antilles"],
        ["New Caledonia", "New Caledonia"],
        ["New Zealand", "New Zealand"],
        ["Nicaragua", "Nicaragua"],
        ["Niger", "Niger"],
        ["Nigeria", "Nigeria"],
        ["Niue", "Niue"],
        ["Norfolk Island", "Norfolk Island"],
        ["Northern Mariana Islands", "Northern Mariana Islands"],
        ["Norway", "Norway"],
        ["Oman", "Oman"],
        ["Pakistan", "Pakistan"],
        ["Palau", "Palau"],
        ["Palestinian Territory, Occupied", "Palestinian Territory, Occupied"],
        ["Panama", "Panama"],
        ["Papua New Guinea", "Papua New Guinea"],
        ["Paraguay", "Paraguay"],
        ["Peru", "Peru"],
        ["Philippines", "Philippines"],
        ["Pitcairn", "Pitcairn"],
        ["Poland", "Poland"],
        ["Portugal", "Portugal"],
        ["Puerto Rico", "Puerto Rico"],
        ["Qatar", "Qatar"],
        ["Reunion", "Reunion"],
        ["Romania", "Romania"],
        ["Russian Federation", "Russian Federation"],
        ["Rwanda", "Rwanda"],
        ["Samoa", "Samoa"],
        ["San Marino", "San Marino"],
        ["Sao Tome and Principe", "Sao Tome and Principe"],
        ["Saudi Arabia", "Saudi Arabia"],
        ["Senegal", "Senegal"],
        ["Serbia", "Serbia"],
        ["Seychelles", "Seychelles"],
        ["Sierra Leone", "Sierra Leone"],
        ["Singapore", "Singapore"],
        ["Slovakia", "Slovakia"],
        ["Slovenia", "Slovenia"],
        ["Solomon Islands", "Solomon Islands"],
        ["Somalia", "Somalia"],
        ["South Africa", "South Africa"],
        ["South Georgia and the South Sandwich Islands", "South Georgia and the South Sandwich Islands"],
        ["Spain", "Spain"],
        ["Sri Lanka", "Sri Lanka"],
        ["Sudan", "Sudan"],
        ["Suriname", "Suriname"],
        ["Svalbard and Jan Mayen", "Svalbard and Jan Mayen"],
        ["Swaziland", "Swaziland"],
        ["Sweden", "Sweden"],
        ["Switzerland", "Switzerland"],
        ["Syrian Arab Republic", "Syrian Arab Republic"],
        ["Taiwan, Province of China", "Taiwan, Province of China"],
        ["Tajikistan", "Tajikistan"],
        ["Tanzania, United Republic of", "Tanzania, United Republic of"],
        ["Thailand", "Thailand"],
        ["Timor-Leste", "Timor-Leste"],
        ["Togo", "Togo"],
        ["Tokelau", "Tokelau"],
        ["Tonga", "Tonga"],
        ["Trinidad and Tobago", "Trinidad and Tobago"],
        ["Tunisia", "Tunisia"],
        ["Turkey", "Turkey"],
        ["Turkmenistan", "Turkmenistan"],
        ["Turks and Caicos Islands", "Turks and Caicos Islands"],
        ["Tuvalu", "Tuvalu"],
        ["Uganda", "Uganda"],
        ["Ukraine", "Ukraine"],
        ["United Arab Emirates", "United Arab Emirates"],
        ["United Kingdom", "United Kingdom"],
        ["United States", "United States"],
        ["United States Minor Outlying Islands", "United States Minor Outlying Islands"],
        ["Uruguay", "Uruguay"],
        ["Uzbekistan", "Uzbekistan"],
        ["Vanuatu", "Vanuatu"],
        ["Venezuela", "Venezuela"],
        ["Viet Nam", "Viet Nam"],
        ["Virgin Islands, British", "Virgin Islands, British"],
        ["Virgin Islands, U.S.", "Virgin Islands, U.S."],
        ["Wallis and Futuna", "Wallis and Futuna"],
        ["Western Sahara", "Western Sahara"],
        ["Yemen", "Yemen"],
        ["Zambia", "Zambia"],
        ["Zimbabwe", "Zimbabwe"]
    ]
  end



end

