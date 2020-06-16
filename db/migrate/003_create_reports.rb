class CreateReports < ActiveRecord::Migration[5.2]
    def change 
        create_table :reports do |t|
            t.string :title_of_report
            t.string :date 
            t.integer :police_offcer_id
            t.integer :user_id
            t.text :report 
        end 
    end
end 