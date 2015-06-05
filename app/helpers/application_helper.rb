module ApplicationHelper

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
        ["State", ""],
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

end

