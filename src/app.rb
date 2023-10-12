require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'

# Create some initial data
student1 = Student.new(1, 16, name: 'Alice', classroom: 'Class A')
student2 = Student.new(2, 17, name: 'Bob', classroom: 'Class B')
teacher1 = Teacher.new(3, 35, name: 'Mr. Smith', specialization: 'Math')
book1 = Book.new('Introduction to Ruby', 'John Rubyist')
book2 = Book.new('Ruby on Rails Guide', 'Ruby Rails')
rental1 = Rental.new('2023-10-12', book1, student1)
rental2 = Rental.new('2023-10-10', book2, student2)

people = [student1, student2, teacher1]
books = [book1, book2]
rentals = [rental1, rental2]

def list_books(books)
  puts 'List of Books:'
  books.each do |book|
    puts "#{book.title} by #{book.author}"
  end
end

def list_people(people)
  puts 'List of People:'
  people.each do |person|
    puts "#{person.class}: #{person.name} (ID: #{person.id})"
  end
end

def create_person(type, id, age, name, classroom: nil, specialization: nil)
  if type == 'student'
    student = Student.new(id, age, name: name, classroom: classroom)
    puts "Created Student: #{student.name} (ID: #{student.id})"
  elsif type == 'teacher'
    teacher = Teacher.new(id, age, name: name, specialization: specialization)
    puts "Created Teacher: #{teacher.name} (ID: #{teacher.id})"
  else
    puts 'Invalid person type.'
  end
end

def create_book(title, author)
  book = Book.new(title, author)
  puts "Created Book: #{book.title} by #{book.author}"
end

def create_rental(date, book_id, person_id, books, people)
  book = books.find { |b| b.title == book_id }
  person = people.find { |p| p.id == person_id }

  if book.nil? || person.nil?
    puts 'Invalid book or person ID.'
    return
  end

  rental = Rental.new(date, book, person)
  puts "Created Rental: #{book.title} by #{book.author} to #{person.name} (ID: #{person.id})"
end

def list_rentals(person_id, rentals)
  person_rentals = rentals.select { |r| r.person.id == person_id }
  if person_rentals.empty?
    puts "No rentals found for person with ID: #{person_id}"
  else
    puts "List of Rentals for Person ID #{person_id}:"
    person_rentals.each do |rental|
      puts "#{rental.date}: #{rental.book.title} by #{rental.book.author}"
    end
  end
end

# Example usage
list_books(books)
list_people(people)
create_person('student', 4, 15, 'Eve', classroom: 'Class C')
create_book('Advanced Ruby Programming', 'Ruby Guru')
create_rental('2023-10-14', 'Introduction to Ruby', 1, books, people)
list_rentals(1, rentals)
