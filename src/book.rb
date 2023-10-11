class Book
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, book)
    Rental.new(date, self, book)
    @rentals << rental
    rental
  end
end
