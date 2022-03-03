require_relative 'student'
require_relative 'teacher'

class App
  def initialize
    @books = []
    @people = []
  end

  def display_options
    puts "1 - List all books"
    puts "2 - List all people"
    puts "3 - Create a person"
    puts "4 - Create a book"
    puts "5 - Create a rental"
    puts "6 - List all rentals for a given person id"
    puts "7 - Exit"
    print "\nPlease type the number that represents the option of choice: "
  end

  def await_user_input
    gets.chomp
  end

  def add_student
    print "Age: "
    age = await_user_input.to_i
    print "Name: "
    name = await_user_input
    print "Has parent permission? [Y/N]: "
    parent_permission_option = await_user_input
    case parent_permission_option
    when "Y", "y"
      @people << Student.new(age, nil, name: name, parent_permission: true)
    when "N", "n"
      @people << Student.new(age, nil, name: name, parent_permission: false)
    else
      puts "Invalid option. Please try again.\n\n"
      return
    end
    puts "Student created successfully\n\n"
  end

  def run
    exit_status = false

    while(!exit_status)
      display_options()
      option = await_user_input

      case option
      when "1"
        puts "you chose 1"
      when "2"
        puts "\nList of people present in the school:"
      when "3"
        print "Do you want to create a student (1) or a teacher (2)? [Input the number]: "
        person_option = await_user_input

        case person_option
        when "1"
          add_student
        end
      when "7"
        exit_status = true
      else
        puts "Invalid option. Please try again.\n\n"
      end
    end
  end
end

def main
  app = App.new()
  app.run()
end

main()