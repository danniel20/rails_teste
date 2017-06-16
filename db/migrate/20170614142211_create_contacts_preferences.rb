class CreateContactsPreferences < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts_preferences do |t|
      t.references :contact, foreign_key: true
      t.references :preference, foreign_key: true
    end
  end
end
