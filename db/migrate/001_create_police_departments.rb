class CreatePoliceDepartments < ActiveRecord::Migrations[5.2]
    def change 
        create_table :police_departments do |t|
            t.string :precinct_name 
            t.string :location
        end 
    end 
end 