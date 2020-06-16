class Controller
    attr_accessor :user, :prompt

    def initialize()
      @prompt = TTY::Prompt.new
    end
    def main_menu
        system "clear"
        prompt.select("Welcome") do |menu|
            menu.choice "File or Edit a Report", -> { new_or_edit }
            menu.choice "Find information on an Officer", -> {  }
            menu.choice "Find statistics on a precinct", -> {  }
            menu.choice "Resources on Police Misconduct", -> {  }
        end
    end

    def new_or_edit
        prompt.select("Got it, which would you like to do?") do |menu|
            menu.choice "File a new report", -> { User.new_report }
            menu.choice "Edit a past report", -> { User.edit_report }
        end
    end
    

    def new_report
        puts "What would you like to name this report?"
        title = gets.chomp
        puts "On what day did the incident occur?"
        date = gets.chomp
        puts "What is the name of the officer involved in this incident?"
        officer_name = gets.chomp
        puts "Please write a short account of the incident in question."
        report = gets.chomp


        report_instance = self.create_report(title, date, officer_name, report)

        puts "Thank you, your report has been submitted. The submission ID is #{report_instance.id}." 
        prompt.select("If you need more information on police misconduct and accountability please check out our resources below.") do |menu|
            menu.choice "Resources on Police Misconduct", -> {  }  
            menu.choice "Exit", -> {  }
        end
    end

    def edit_report
        puts "What is your report id?"
        id = gets.chomp
        past_report = self.find_report(id)

        puts "#{past_report.report}"

        puts "Please enter your new submission."
        new_submission = gets.chomp
        past_report.report = new_submission
    end




end