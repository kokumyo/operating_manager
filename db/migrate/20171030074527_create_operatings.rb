class CreateOperatings < ActiveRecord::Migration[5.1]
  def change
    create_table :operatings do |t|
      t.integer :user_id
      t.integer :year
      t.integer :month
      t.integer :day
      t.integer :num
      t.integer :project_id
      t.float :time
      t.text :summary

      t.timestamps
    end
  end
end
