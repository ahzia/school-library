require './person'
class teacher < person
  def initialize(age, name = 'Unknown', parent_permission: true, specialization)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    return true
  end
end
