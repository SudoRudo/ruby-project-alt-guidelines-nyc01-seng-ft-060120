require_relative '../config/environment'

controller_instance = Controller.new()
controller_instance.user = User.new()
controller_instance.main_menu

puts "hello world"