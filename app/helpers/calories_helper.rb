module CaloriesHelper
  def calories_chart_data( start = 4.weeks.ago )
    gained_number_by_day = current_user.calories.where(type_gained: true).number_grouped_by_day(start)
    burned_number_by_day = current_user.calories.where(type_gained: false).number_grouped_by_day(start)
    (start.to_date..Date.today).map do |date|
      {
        date: date,
        gained_number: gained_number_by_day[date].try(:first).try(:total_calories) || 0,
        burned_number: burned_number_by_day[date].try(:first).try(:total_calories) || 0
      }
    end
  end

  def calories_chart_data_user( start = 4.weeks.ago, user )
    gained_number_by_day = user.calories.where(type_gained: true).number_grouped_by_day(start)
    burned_number_by_day = user.calories.where(type_gained: false).number_grouped_by_day(start)
    (start.to_date..Date.today).map do |date|
      {
        date: date,
        gained_number: gained_number_by_day[date].try(:first).try(:total_calories) || 0,
        burned_number: burned_number_by_day[date].try(:first).try(:total_calories) || 0
      }
    end
  end
end
