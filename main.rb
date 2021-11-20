require './student'
require './teacher'
def create_student(age, name)
  print('Has Parent Permission [y/n]:')
  permission = gets.chomp
  if permission == 'y'
    Student.new(age, name)
  else
    Student.new(age, name, false)
  end
end

def create_teacher(age, name)
  print('Specialization:')
  specialization = gets.chomp
  Teacher.new(age, specialization, name)
end

def create_person
  print('Do you want to create a student(1) or a Teacher (2) [Input the number]:')
  input = gets.chomp
  print('age:')
  age = gets.chomp
  print('Name:')
  name = gets.chomp
  case input
  when '1'
    create_student(age, name)
  when '2'
    create_teacher(age, name)
  else
    puts('Wrong Input')
    create_person
  end
end

def handle_input
  puts('please choose an option by entering a number:')
  puts('1 - List all books')
  puts('2 - List all people')
  puts('3 - Create a person')
  puts('4 - List all people')
  puts('5 - Create a rental')
  puts('6 - List all rental for a given person id')
  puts('7 - Exit')
  number = gets.chomp
  puts(number)
  case number
  when '1'
  when '2'
  when '3'
    create_person
    puts('Person Created succefully')
    handle_input
  when '4'
  when '5'
  when '6'
  when '7'
  else
    puts('wrong number')
  end
end

def main
  puts('Welcome to School library App!\n')
  handle_input
end

main
