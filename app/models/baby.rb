class Baby < ApplicationRecord
  has_many :breastfeedings, dependent: :destroy

  def to_s
    id
  end

  def total
    Baby.includes(:breastfeedings).references(:breastfeedings).where("breastfeedings.baby_id = '#{id}'").sum(:milk)
  end
    
  def total_today
    Baby.includes(:breastfeedings).references(:breastfeedings).where("breastfeedings.baby_id = '#{id}'").where("breastfeedings.date = '#{Date.current}'").sum(:milk)
  end

  def last
    breastfeedings.maximum('date')
  end

  def time_today
    Baby.includes(:breastfeedings).references(:breastfeedings).where("breastfeedings.baby_id = '#{id}'").where("breastfeedings.date = '#{Date.current}'").sum(:time)
  end

  def times_today
    Baby.includes(:breastfeedings).references(:breastfeedings).where("breastfeedings.baby_id = '#{id}'").where("breastfeedings.date = '#{Date.current}'").count()
  end

end
