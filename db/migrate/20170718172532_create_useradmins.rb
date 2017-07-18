class CreateUseradmins < ActiveRecord::Migration[5.1]
  def change
    create_table :useradmins do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
