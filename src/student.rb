require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(id, age, name: 'Unknown', parent_permission: true, classroom: 'Unknown')
    super(id, age, name: name, parent_permission: parent_permission)
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

    @classroom.add_student(self) if @classroom.is_a?(Classroom)
  end

  def of_age?
    @age >= 18
  end
end
