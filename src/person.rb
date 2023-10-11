require 'Nameable'

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
