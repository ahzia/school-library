require './person'
class Student < Person
  attr_reader :classroom

  def classroom=(studentclass)
    @classroom = studentclass
    studentclass.students.push(self) unless studentclass.students.include?(self)
  end

  def initialize(age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
