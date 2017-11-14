class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.string :code
      t.string :name
      t.boolean :all_operatings_availabe, default: false
      t.boolean :spreadsheet_available, default: false
      t.boolean :projects_editable, default: false
      t.boolean :user_role_editable, default: false

      t.timestamps
    end
  end
end
