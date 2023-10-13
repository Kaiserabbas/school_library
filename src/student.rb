require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name: 'Unknown', parent_permission: true, classroom: 'Unknown')
    super(age, name: name, parent_permission: parent_permission)
    @classroom = classroom
    @courses = []
    add_to_classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  private

  def add_to_classroom
    return if @classroom == 'Unknown'
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def of_age?
    @age >= 18
  end
end
