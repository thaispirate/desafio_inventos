class AddStatusToBugs < ActiveRecord::Migration[5.1]
  def change
    add_column :bugs, :status, :string
  end
end
