class ChangesTy < ActiveRecord::Migration[6.0]
    def change
      change_column(:breastfeedings, :date, :date)
    end
end
