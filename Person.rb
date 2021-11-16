class Person
  attr_accessor :name, :age, :id
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end
  private
  def is_of_age?
    if @age >= 18
      return true
    else
      return false
    end

  end
  def can_use_services?
    return is_of_age? || @parent_permission
  end
end
