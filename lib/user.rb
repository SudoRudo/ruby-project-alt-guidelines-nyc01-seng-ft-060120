class User < ActiveRecord::Base
    has_many :reports
    has_many :officers, through: :reports 


    def create_report(title, date, officer_name, report)
        officer = Officer.find_by(name: "#{officer_name}")
        Report.create(title: title, date: date, officer_id: officer.id, user_id: self.id, report: report)
    end

    def find_report(id)
        Report.find(id)
    end

    
end