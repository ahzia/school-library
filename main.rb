require './student'
require './teacher'
require './book'
require './rental'

def create_student(age, name)
  print('Has Parent Permission [y/n]:')
  permission = gets.chomp
  if permission == 'y'
    Student.new(age, name)
  else
    Student.new(age, name, parent_permission: false)
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
    @persons << create_student(age, name)
  when '2'
    @persons << create_teacher(age, name)
  else
    puts('Wrong Input')
    create_person
  end
  puts('Person Created succefully')
end

def create_book
  print('title:')
  title = gets.chomp
  print('Author:')
  author = gets.chomp
  @books << Book.new(title, author)
  puts('Book Created succefully')
end

def list_books
  i = 0
  @books.each do |book|
    puts("#{i}) title: #{book.title}, author: #{book.author}")
    i += 1
  end
end

def list_persons
  i = 0
  @persons.each do |person|
    if person.is_a?(Teacher)
      print '[Teacher] '
    else
      print '[Student] '
    end
    puts("#{i}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}")
    i += 1
  end
end

def person_object(id)
  @persons.each do |person|
    return person if person.id == id
  end
  nil
end

def print_rentals
  print('Person ID: ')
  id = gets.chomp.to_i
  person = person_object(id)
  if person.nil?
    puts('Wrong Id')
  elsif person.rentals == []
    puts('No rentals for this person')
  else
    person.rentals.each do |rent|
      puts("Date: #{rent.date}, Book: #{rent.book.title} by #{rent.book.title}")
    end
  end
end

def create_new_rental
  puts('Select a book from following list by number:')
  list_books
  book_index = gets.chomp.to_i
  puts('Select a person from following list by number:')
  list_persons
  person_index = gets.chomp.to_i
  print('Date: ')
  date = gets.chomp
  Rental.new(date, @persons[person_index], @books[book_index])
  puts('Rental created succefully')
end

def handle_input(number)
  case number
  when 1
    list_books
  when 2
    list_persons
  when 3
    create_person
  when 4
    create_book
  when 5
    create_new_rental
  when 6
    print_rentals
  else
    puts 'Thank you for using our APP - Writed by Ahzia'
    exit
  end
end

def print_message
  puts('please choose an option by entering a number:')
  puts('1 - List all books')
  puts('2 - List all people')
  puts('3 - Create a person')
  puts('4 - Create a book')
  puts('5 - Create a rental')
  puts('6 - List all rental for a given person id')
  puts('7 - Exit')
  number = gets.chomp.to_i
  handle_input(number)
  puts('')
  print_message
end

def main
  @books = []
  @persons = []
  puts('Welcome to School library App!')
  puts('')
  print_message
end

main
