module MiscHelper
  
  # this method calculates the time difference in exact hours and minutes
  def custom_distance_of_time(from_time, to_time)
    time_until = (to_time - from_time).round
    time_in_minutes = time_until / 60
    time_in_hours = 0
    if time_in_minutes < 10
      return "#{time_in_hours}.0#{time_in_minutes.to_i} hrs."
    else
      #if time_in_minutes >= 60
      time_in_hours = (time_in_minutes / 60).round
      time_in_minutes = time_in_minutes % 60
      time_in_minutes = time_in_minutes > 9 ? time_in_minutes.to_s : '0'+time_in_minutes.to_s
      return "#{time_in_hours}.#{time_in_minutes} hrs."
    end
  end
  
  def current_financial_week
    #Date.today.cweek returns weeks elapsed from beginning of year i.e 1st Jan
    week_converter = 1.week.seconds #604800 #60*60*24*7
    time_now = Time.now

    start_of_year = time_now.beginning_of_year
    end_of_first_quarter = start_of_year.end_of_quarter

    if time_now <= end_of_first_quarter
      last_year_second_quarter_start = time_now.last_year.beginning_of_year.end_of_quarter.tomorrow
      last_year_end = last_year_second_quarter_start.end_of_year

      last_year_three_quarters_weeks = (last_year_end - last_year_second_quarter_start) / week_converter
      return last_year_three_quarters_weeks.to_i + Date.today.cweek
    else
      first_quarter_weeks = (end_of_first_quarter - start_of_year) / week_converter
      return Date.today.cweek - first_quarter_weeks.to_i
    end
  end
    
end
