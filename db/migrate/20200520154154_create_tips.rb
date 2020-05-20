class CreateTips < ActiveRecord::Migration[6.0]
  def change
    create_table :tips do |t|
      t.integer :tip_percent
      t.decimal :tip_amount, precision: 10, scale: 2, default: 0.0
      t.decimal :total, precision: 10, scale: 2, default: 0.0
      t.decimal :fees, precision: 10, scale: 2, default: 0.0
      t.decimal :grand_total, precision: 10, scale: 2, default: 0.0
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :service_rating
      t.integer :exp_rating

      t.timestamps
    end
  end
end
