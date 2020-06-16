class CreateOfficers < ActiveRecord::Migration[4.2]
    def change 
        create_table :officers do |t|
            t.string :name 
            t.integer :badge_number
            t.integer :precinct_id
        end 
    end 
end 