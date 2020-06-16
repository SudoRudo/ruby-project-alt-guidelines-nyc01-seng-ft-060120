class CreatePrecincts < ActiveRecord::Migrations[4.2]
    def change 
        create_table :precincts do |t|
            t.string :precinct_name 
            t.string :location
        end 
    end 
end 