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

    def find_past_reports
        submissions = Report.all.each do |report|
            report.user == self.name
        end

        # i = 0

        # while i < Report.all.length do
        #     if Report.all[i][:user].name == current_user.name
        # end

        puts "These are all the reports associated with this user"
        puts " "
        submissions.each do |submission|
            puts "#{submission.id}) re: Officer #{submission.officer.name}:"
            puts "\"#{submission.report}\""
            puts "#{submission.date}"
            puts "================================="
        end
        puts " "
    end

    
end