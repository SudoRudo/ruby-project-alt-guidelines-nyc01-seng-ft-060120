class Controller
    attr_accessor :user, :prompt

    def initialize()
      @prompt = TTY::Prompt.new
    end

    prompt.select("Welcome") do |menu|
        menu.choice "File or Edit a Report", -> { prompt.select("Got it, which would you like to do?") }
        menu.choice "Find information on an Officer", -> {  }
        menu.choice "Find statistics on a precinct" -> {  }
        menu.choice "Resources on Police Misconduct" -> {  }
    end

    prompt.select("Got it, which would you like to do?") do |menu|
        menu.choice "File a new report", -> { User.new_report }
        menu.choice "Edit a past report", -> { User. }
    end

    def new_report
        Puts "What would you like to name this report?"
        title = gets.chomp
        Puts "On what day did the incident occur?"
        date = gets.chomp
        Puts "What is the name of the officer involved in this incident?"
        officer_name = gets.chomp
        Puts "Please write a short account of the incident in question."
        report = gets.chomp


        report_instance = self.create_report(title, date, officer_name, report)

        Puts "Thank you, your report has been submitted. The submission ID is #{report_instance.id}." 
        prompt.select("If you need more information on police misconduct and accountability please check out our resources below.") do |menu|
            menu.choice "Resources on Police Misconduct" -> {  }  
            menu.choice "Exit" -> {  }
        end
    end

end