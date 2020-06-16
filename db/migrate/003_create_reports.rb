class CreateReports < ActiveRecord::Migration[4.2]
    def change 
        create_table :reports do |t|
            t.string :title
            t.string :date 
            t.integer :officer_id
            t.integer :user_id
            t.text :report
        end 
    end
end