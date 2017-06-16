class AddColumnGenderToContact < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :gender, :integer
  end
end
