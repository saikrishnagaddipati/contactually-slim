class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.string :company_name
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
