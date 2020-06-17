class Controller
    attr_accessor :user, :prompt

    @current_user = nil

    def initialize()
      @prompt = TTY::Prompt.new
    end

    def main_menu
        system "clear"
        Logo.logo

        puts " "
        puts "Please enter your name" 
        puts "(If you'd like to stay anonymous press return)"

        entry = gets.chomp

        if entry != ""
            name = entry
        else
            name = "Anonymous"
        end

        @current_user = User.create(name: name)

        self.welcome
    end

    def welcome
        puts " "
        prompt.select("Welcome #{@current_user.name}") do |menu|
            menu.choice "File or Edit a Report", -> { self.new_or_edit }
            menu.choice "See your past submissions", -> { self.past_submissions }
            menu.choice "Find information on an Officer", -> { self.find_officer }
            menu.choice "Find information on a Precinct", -> { self.find_precinct }
            menu.choice "Resources on Police Misconduct", -> { Resources.links }
        end
    end



    def new_or_edit
        puts " "
        prompt.select("Got it, what would you like to do?") do |menu|
            menu.choice "File a new report", -> { self.new_report }
            menu.choice "Edit a past report", -> { self.edit_report }
        end
    end
    

    def new_report
        puts " "
        puts "What would you like to name this report?"
        title = gets.chomp
        puts " "
        puts "On what day did the incident occur?"
        date = gets.chomp
        puts " "
        puts "What is the name of the officer involved in this incident?"
        officer_name = gets.chomp
        puts " "
        puts "Please write a short account of the incident in question."
        report = gets.chomp

        officer = Officer.find_or_create_by(name: officer_name)

        report_instance = self.user.create_report(title, date, officer.name, report)
        
        system "clear"

        puts "Thank you, your report has been submitted. Your submission ID is #{report_instance.id}." 
        prompt.select("If you need more information on police misconduct and accountability please check out our resources below.") do |menu|
            menu.choice "Resources on Police Misconduct", -> { Resources.links }  
            menu.choice "Exit", -> {  }
        end
    end

    def edit_report
        puts " "
        puts "What is your report id?"
        id = gets.chomp
        past_report = Report.find(id)

        puts " "

        puts "Here is your previous submission:"
        puts "\'#{past_report.report}\'"
        
        puts " "

        puts "Please enter your new submission."
        new_submission = gets.chomp
        past_report.report = new_submission
        
        system "clear"

        puts "Thank you, your report has been submitted. Your submission ID is #{past_report.id}." 
        prompt.select("If you need more information on police misconduct and accountability please check out our resources below.") do |menu|
            menu.choice "Resources on Police Misconduct", -> { Resources.links }  
            menu.choice "Exit", -> {  }
        end
    end

    def past_submissions
        @current_user.find_past_reports
        self.welcome
    end

    def find_officer 
        prompt.select "How would you like to find the officer?" do |menu|
            menu.choice "by name", -> {self.officer_by_name} 
            menu.choice "by badge", -> {self.officer_by_badge}
        end 
    end 

    def officer_by_badge 
        puts " "
        puts "Enter officer's badge number"
        badge_num = gets.chomp 

        of = Officer.find_by(badge_number: badge_num)

        of_reports = Report.all.each do |report|
            report.officer == of  
        end 
        
        puts "These are the user reports relating to officer #{of.name}"
        of_reports.each do |report|
            puts " "
            puts "#{report.report} by #{report.user.name} on #{report.date}"
            puts "____________________________________________________"
        end 
        

    end 

    def officer_by_name
        puts " "
        puts "Enter officer's first name"
        first_name = gets.chomp 
        puts "Enter officer's last name"
        last_name = gets.chomp 
        
        name = "#{first_name} #{last_name}"

        of = Officer.find_by(name: name)

        of_reports = Report.all.each do |report|
            report.officer == of  
        end 

        puts " "
        puts " "
        puts "These are the user reports relating to officer #{of.name}"
        of_reports.each do |report|
            puts " "
            puts "#{report.report} by #{report.user.name} on #{report.date}"
            puts "____________________________________________________"
        end 
        
    end 
    def find_precinct 
        puts " "
        puts "What is the Police Precinct you are looking for?"
        puts "Enter the number and ending:: Example '52nd', '1st' etc." 
        num = gets.chomp

        p_num = num + " Police precinct"

        pf = Precinct.find_by(name: p_num )

        puts " "
        puts " "
        puts "Here is the information for #{pf}"
        puts " "
        puts "#{pf.name} located in #{pf.location}"
        puts "____________________________________________________"     
    end 


end
