class Baby < ApplicationRecord
  has_many :breastfeedings, dependent: :destroy

  def to_s
    id
  end

  def total
    Baby.includes(:breastfeedings).references(:breastfeedings).where("breastfeedings.baby_id = '#{id}'").sum(:milk)
  end

end
