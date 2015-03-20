module ApplicationHelper

  def show_field_error(model, field)
    s=""

    logger.error("FUCKING")
    logger.error(field)
    logger.error(model)

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
        ['State', ''],
        ['AL', 'AL'],
        ['AK', 'AK'],
        ['AZ', 'AZ'],
        ['AR', 'AR'],
        ['CA', 'CA'],
        ['CO', 'CO'],
        ['CT', 'CT'],
        ['DE', 'DE'],
        ['DC', 'DC'],
        ['FL', 'FL'],
        ['GA', 'GA'],
        ['HI', 'HI'],
        ['ID', 'ID'],
        ['IL', 'IL'],
        ['IN', 'IN'],
        ['IA', 'IA'],
        ['KS', 'KS'],
        ['KY', 'KY'],
        ['LA', 'LA'],
        ['ME', 'ME'],
        ['MD', 'MD'],
        ['MA', 'MA'],
        ['MI', 'MI'],
        ['MN', 'MN'],
        ['MS', 'MS'],
        ['MO', 'MO'],
        ['MT', 'MT'],
        ['NE', 'NE'],
        ['NV', 'NV'],
        ['NH', 'NH'],
        ['NJ', 'NJ'],
        ['NM', 'NM'],
        ['NY', 'NY'],
        ['NC', 'NC'],
        ['ND', 'ND'],
        ['OH', 'OH'],
        ['OK', 'OK'],
        ['OR', 'OR'],
        ['PA', 'PA'],
        ['PR', 'PR'],
        ['RI', 'RI'],
        ['SC', 'SC'],
        ['SD', 'SD'],
        ['TN', 'TN'],
        ['TX', 'TX'],
        ['UT', 'UT'],
        ['VT', 'VT'],
        ['VA', 'VA'],
        ['WA', 'WA'],
        ['WV', 'WV'],
        ['WI', 'WI'],
        ['WY', 'WY']
    ]
  end

end

