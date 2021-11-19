require 'date'
require './corrector'
class Person
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @correct_instance = Corrector.new
    @rentals = []
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end

  def validate_name
    @name = @correct_instance.correct_name(@name)
  end

  def rent(book)
    Rental.new(DateTime.now, self, book)
  end
end
