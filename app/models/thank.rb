class Thank < ActiveRecord::Base
  
  belongs_to :user
  validates :what, :length => { :in => 1..20 }
  validates :message, :length => { :in => 1..140 }
  
  def self.filter(params)
    thanks = self.where('')
    if params[:date]
      date = Date.parse(params[:date])
      thanks = where(:date_at => (date.beginning_of_day)..(date.end_of_day))
    end
    thanks
  end
  
  # def to_json_with_ext
  #   {
  #     :id => self.id,
  #     :date_at => self.date_at,
  #     :what => self.what,
  #     :message => self.message,
  #     :user_id => self.user_id,
  #     # :total_count => Thank.where(:user_id => self.user_id).count,
  #     # :date_count 
  #   }.to_json
  # end
  # alias_method_chain :to_json, :ext
  
end
