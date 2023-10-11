require_relative 'Nameable'
require_relative 'base-decorator'
require_relative 'trimmer-decorator'
require_relative 'capitalize-decorator'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name: 'Unknown', parent_permission: true)
    @id = generate_random_id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
  
  def correct_name
    name
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
