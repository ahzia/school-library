require 'date'
require './rental'
class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def rent(person)
    Rental.new(DateTime.now, person, self)
  end
end
