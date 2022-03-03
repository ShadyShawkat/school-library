class App
  def display_options
    puts "1 - List all books"
    puts "2 - List all people"
    puts "3 - Create a person"
    puts "4 - Create a book"
    puts "5 - Create a rental"
    puts "6 - List all rentals for a given person id"
    puts "7 - Exit"
  end

  def run
    display_options()
  end
end

def main
  app = App.new()
  app.run()
end

main()