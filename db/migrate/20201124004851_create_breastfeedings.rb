class CreateBreastfeedings < ActiveRecord::Migration[6.0]
  def change
    create_table :breastfeedings do |t|
      t.datetime :date
      t.integer :milk
      t.integer :time
      t.belongs_to :baby, null: false, foreign_key: true

      t.timestamps
    end
  end
end
