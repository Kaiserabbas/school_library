require_relative 'nameable'
require_relative 'base_decorator'
require_relative 'trimmer_decorator'
require_relative 'capitalize_decorator'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @id = generate_random_id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(date, book)
    Rental.new(date, self, book)
    @rentals << rental
    rental
  end

  def correct_name
    @name
  end

  def generate_random_id
    rand(1000..9999) # Generates a random 4-digit ID
  end

  def can_use_services?
    @age >= 18 || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end

person = Person.new(22, name: 'Maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
