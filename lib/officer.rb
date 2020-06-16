class Officer < ActiveRecord::Base
    has_many :reports
    has_many :users, through: :reports 
    belongs_to :precinct
end