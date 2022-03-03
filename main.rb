require_relative 'student'
require_relative 'teacher'
require_relative 'book'

class App
  def initialize
    @books = []
    @people = []
  end

  def display_options
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    print "\nPlease type the number that represents the option of choice: "
  end

  def await_user_input
    gets.chomp
  end

  def add_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_option = await_user_input

    case person_option.to_i
    when 1
      add_student
    when 2
      add_teacher
    end
  end

  def add_student
    print 'Age: '
    age = await_user_input.to_i
    print 'Name: '
    name = await_user_input
    print 'Has parent permission? [Y/N]: '
    parent_permission_option = await_user_input
    case parent_permission_option
    when 'Y', 'y'
      @people << Student.new(age, nil, name: name, parent_permission: true)
    when 'N', 'n'
      @people << Student.new(age, nil, name: name, parent_permission: false)
    else
      puts "Invalid option. Please try again.\n\n"
      return
    end
    puts "Student created successfully\n\n"
  end

  def add_teacher
    print 'Age: '
    age = await_user_input.to_i
    print 'Name: '
    name = await_user_input
    print 'Specialization: '
    specialization = await_user_input
    @people << Teacher.new(age, specialization, name: name)
    puts "Teacher created successfully\n\n"
  end

  def add_book
    print 'Title: '
    title = await_user_input
    print 'Author: '
    author = await_user_input
    @books << Book.new(title, author)
    puts "Book created successfully\n\n"
  end

  def add_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      print "#{index}) "
      p book
    end
    book_index = await_user_input.to_i

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      print "#{index}) "
      p person
    end
    person_index = await_user_input.to_i

    print 'Date: '
    date = await_user_input

    @books[book_index].add_book_rental(date, @people[person_index])
    puts "Rental created successfully\n\n"
  end

  def display_list(list)
    list.each do |item|
      p item
    end
    print "\n\n"
  end

  def display_rentals
    print 'ID of person: '
    person_id = await_user_input.to_i
    @people.find { |person| person.id == person_id }.rentals.each do |rental|
      p rental
    end
    print "\n\n"
  end

  def handle_user_input(input)
    case input
    when 1
      display_list(@books)
    when 2
      display_list(@people)
    when 3
      add_person
    when 4
      add_book
    when 5
      add_rental
    when 6
      display_rentals
    else
      puts "Invalid option. Please try again.\n\n"
    end
  end

  def run
    display_options
    input = await_user_input.to_i
    until input == 7
      handle_user_input(input)
      display_options
      input = await_user_input.to_i
    end
  end
end

def main
  app = App.new
  app.run
end

main
