class Thank < ActiveRecord::Base
  
  belongs_to :user
  
  def self.filter(params)
    thanks = self.where('')
    if params[:date]
      date = Date.parse(params[:date])
      thanks = where(:date_at => (date.beginning_of_day)..(date.end_of_day))
    end
    thanks
  end
  
end
