require_relative 'app'  # Assuming that your application code is in 'app.rb'

def main
  puts 'Welcome to the School Library Management System'
  loop do
    puts "\nOptions:"
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List rentals for a person'
    puts '7. Quit'

    print 'Please select an option: '
    choice = gets.chomp.to_i

    case choice
    when 1
      list_books(books)
    when 2
      list_people(people)
    when 3
      print 'Enter the person type (student/teacher): '
      person_type = gets.chomp
      print 'Enter the person ID: '
      person_id = gets.chomp.to_i
      print 'Enter the person age: '
      person_age = gets.chomp.to_i
      print 'Enter the person name: '
      person_name = gets.chomp
      if person_type == 'student'
        print 'Enter the classroom: '
        classroom = gets.chomp
        create_person(person_type, person_id, person_age, person_name, classroom: classroom)
      elsif person_type == 'teacher'
        print 'Enter the specialization: '
        specialization = gets.chomp
        create_person(person_type, person_id, person_age, person_name, specialization: specialization)
      else
        puts 'Invalid person type.'
      end
    when 4
      print 'Enter the book title: '
      book_title = gets.chomp
      print 'Enter the book author: '
      book_author = gets.chomp
      create_book(book_title, book_author)
    when 5
      print 'Enter the rental date: '
      rental_date = gets.chomp
      print 'Enter the book title: '
      book_title = gets.chomp
      print 'Enter the person ID: '
      person_id = gets.chomp.to_i
      create_rental(rental_date, book_title, person_id, books, people)
    when 6
      print 'Enter the person ID to list rentals: '
      person_id = gets.chomp.to_i
      list_rentals(person_id, rentals)
    when 7
      puts 'Exiting the app. Goodbye!'
      break
    else
      puts 'Invalid option. Please choose a valid option.'
    end
  end
end

# Run the main method when this file is executed
main
