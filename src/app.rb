require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'
require_relative 'base_decorator'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
    create_initial_data
  end
  # Create some initial data
  def create_initial_data
    # Create students
    student1 = Student.new(15, name: 'John', parent_permission: true)
    student2 = Student.new(16, name: 'Alice', parent_permission: true)

    # Create a teacher
    teacher1 = Teacher.new(35, name: 'Mr. Smith', specialization: 'Math')

    # Create books
    book1 = Book.new('Introduction to Ruby', 'John Rubyist')
    book2 = Book.new('Ruby on Rails Guide', 'Ruby Rails')

    # Create rentals
    rental1 = Rental.new('2023-10-12', book1, student1)
    rental2 = Rental.new('2023-10-10', book2, student2)

    # Add the created objects to your data
    @people.concat([student1, student2, teacher1])
    @books.concat([book1, book2])
    @rentals.concat([rental1, rental2])
  end

  # list of books..................
  def list_books
    puts(@books.map { |book| "Title: \"#{book.title}\", Author \"#{book.author}\"" })
  end

  # list of people..............
  def list_people
    puts(@people.map { |person| "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" })
  end

  # create person.................
def create_person
  print 'Create a Student (1) or a Teacher (2)? [Input the desired number]: '
  option = gets.chomp
  print 'Type Age: '
  age = gets.chomp.to_i  # Convert the input to an integer
  print 'Type Name: '
  name = gets.chomp
  case option
  when '1'
    print 'Do you have parent permission? [Yes/No]: '
    permission = gets.chomp.downcase
    if permission == 'yes'
      @people << Student.new(age, name: name, parent_permission: true)
    else
      @people << Student.new(age, name: name, parent_permission: false)
    end
  when '2'
    print 'Specialization: '
    specialization = gets.chomp
    @people << Teacher.new(age, name: name, specialization: specialization)
  end
  puts 'Person has been created successfully'
end

  # create book..............
  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Book has been created successfully'
  end
  # create rental.....................
def create_rental
  puts ' Please select a book from the following list by number'
  @books.each_with_index do |book, index|
    puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
  end
  book_index = gets.chomp.to_i

  puts 'Please select a person from the following list by number (not ID)'
  @people.each_with_index do |person, index|
    if person.is_a?(Student)
      puts "#{index}) [Student] Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
    elsif person.is_a?(Teacher)
      puts "#{index}) [Teacher] Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
    end
  end
  person_index = gets.chomp.to_i

  # Check if the selected book and person indices are valid
  if book_index >= 0 && book_index < @books.length && person_index >= 0 && person_index < @people.length
    print 'Date (YYYY/MM/DD): '
    date = gets.chomp

    @rentals << Rental.new(date, @books[book_index], @people[person_index])
    puts 'Rental has been created successfully'
  else
    puts 'Error: You have made invalid book or person selection.'
  end
end


  # create list_rentals..............

  def list_rentals
    print 'Person Id: '
    person_id = gets.chomp.to_i
    puts 'Rentals:'
    puts(@rentals.filter_map do |rental|
           if rental.person.id == person_id
             "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
           end
         end)
  end
end
