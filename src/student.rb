require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(id, age, name: 'Unknown', parent_permission: true, classroom: 'Unknown')
    super(id, age, name: name, parent_permission: parent_permission)
    @classroom = classroom
    @courses = []
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
