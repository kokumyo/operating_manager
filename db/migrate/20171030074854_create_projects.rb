class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.boolean :period_flag, default: true
      t.integer :begin_year
      t.integer :begin_month
      t.integer :end_year
      t.integer :end_month
      t.boolean :flag, default: true
      t.integer :order

      t.timestamps
    end
  end
end
