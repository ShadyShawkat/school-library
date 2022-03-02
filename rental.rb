class Rental
  attr_accessor :date
  attr_reader :book
  attr_reader :person

  def initialize(date, book, person)
    @date, @book, @person = date, book, person
    book.rentals << self unless book.rentals.include?(self)
    person.rentals << self unless person.rentals.include?(self)
  end
end