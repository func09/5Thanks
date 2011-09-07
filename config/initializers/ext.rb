module ThisMonth
  def this_month?
    ((Date.today.beginning_of_month)..(Date.today.end_of_month)).include?(self.to_date)
  end
end

class Date
  include ThisMonth
end
class DateTime
  include ThisMonth
end
class Time
  include ThisMonth
end
