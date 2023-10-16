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
  end

  # List of books...
  def list_books
    @books.map { |book| "Title: \"#{book.title}\", Author \"#{book.author}\"" }
  end

  # List of people...
  def list_people
    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  # Create a person...
  def create_person
    print 'Create a Student (1) or a Teacher (2)? [Input the desired number]: '
    option = gets.chomp
    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid option.'
    end
  end

  # Create a student...
  def create_student
    print 'Type Age: '
    age = gets.chomp.to_i
    print 'Type Name: '
    name = gets.chomp
    print 'Do you have parent permission? [Yes/No]: '
    permission = gets.chomp.downcase
    @people << if permission == 'yes'
                 Student.new(age, name: name, parent_permission: true)
               else
                 Student.new(age, name: name, parent_permission: false)
               end
    puts 'Student has been created successfully'
  end

  def create_teacher
    print 'Type Age: '
    age = gets.chomp.to_i
    print 'Type Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @people << Teacher.new(age, name: name, specialization: specialization)
    puts 'Teacher has been created successfully'
  end

  # Create a book...
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
    book = select_book
    person = select_person

    if book && person
      print 'Date (YYYY/MM/DD): '
      date = gets.chomp

      @rentals << Rental.new(date, book, person)
      puts 'Rental has been created successfully'
    else
      puts 'Error: You have made an invalid book or person selection.'
    end
  end

  # Helper method to select a book...
  def select_book
    puts 'Please select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end

    book_index = gets.chomp.to_i

    @books[book_index] if (0...@books.length).cover?(book_index)
  end

  # Helper method to select a person...
  def select_person
    puts 'Please select a person from the following list by number (not ID)'
    @people.each_with_index do |person, index|
      if person.is_a?(Student)
        puts "#{index}) [Student] Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
      elsif person.is_a?(Teacher)
        puts "#{index}) [Teacher] Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
      end
    end

    person_index = gets.chomp.to_i

    @people[person_index] if (0...@people.length).cover?(person_index)
  end

  # List all rentals for a given person ID
  def list_rentals_for_person
    print 'Enter the ID of the person: '
    person_id = gets.chomp.to_i

    person = @people.find { |p| p.id == person_id }

    if person
      rentals = @rentals.select { |rental| rental.person == person }
      if rentals.empty?
        puts 'No rentals found for this person.'
      else
        puts 'Rentals for the selected person:'
        rentals.each do |rental|
          puts "Date: #{rental.date}, Book: #{rental.book.title}"
        end
      end
    else
      puts 'Person not found with the given ID.'
    end
  end
end
