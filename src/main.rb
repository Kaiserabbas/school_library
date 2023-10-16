require_relative 'app'

class Main
  MENU = "Please choose an option by entering a desired number:\n\
  1 - List all books\n\
  2 - List all people \n\
  3 - Create a person\n\
  4 - Create a book\n\
  5 - Create a rental\n\
  6 - List all rentals for a given person ID\n\
  7 - Exit".freeze

  def initialize
    @app = App.new
  end

  def run
    puts "Welcome to School Library App\n\n"
    get = 0
    while get != 7
      puts MENU
      get = gets.chomp.to_i
      handle_option(get)
    end
    puts 'Thank you for using this app!'
  end

  private

  def handle_option(option)
    case option
    when 1
      @app.list_books
    when 2
      @app.list_people
    when 3
      @app.create_person
    when 4
      @app.create_book
    when 5
      @app.create_rental
    when 6
      @app.list_rentals_for_person
    end
  end
end

Main.new.run