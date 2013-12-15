module TasksHelper
  def normilize_event_date(start, ends, all_day)
    if start.utc == ends.utc or all_day
      "#{shortening_date start, all_day}"
    else
      "#{t '.between'} #{shortening_date start, all_day} #{t '.and'} #{shortening_date ends, all_day}"
    end
  end
  
  private
    
    def shortening_date(date, all_day)
      format = ""
      format += "%e#{t '.date_s'}"  unless date.strftime("%V%Y") == Date.today.strftime("%V%Y")
      format += " %A" unless date.strftime("%a %B") == Date.today.strftime("%a %B")
      format += " %B" unless date.strftime("%B") == Date.today.strftime("%B")
      format += " %Y" unless date.strftime("%Y") == Date.today.strftime("%Y")
      if all_day
        format += " #{t '.all_day'}"
      else
        format += " #{t '.today_at'}"  if date.strftime("%e %a %B %Y") == Date.today.strftime("%e %a %B %Y")
        unless date.strftime("%M").to_i == 0
          format += " %k:%M"
        else
          format += " %k #{t '.hours'}"
        end
      end
      date.strftime(format)
    end
end
