class CreatePoliceOfficers < ActiveRecord::Migration[5.2]
    def change 
        create_table :police_officers do |t|
            t.string :name 
            t.integer :badge_number
            t.integer :police_department_id
        end 
    end 
end 