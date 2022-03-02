class Rental
  attr_accessor :date
  attr_reader :book

  def initialize(date, book)
    @date, @book = date, book
  end
end