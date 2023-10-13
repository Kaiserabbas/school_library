class Teacher < Person
  attr_accessor :specialization

  def initialize(age, name: 'Unknown', parent_permission: true, specialization: 'Unknown')
    super(age, name: name, parent_permission: parent_permission)
    @specialization = specialization
    @courses_taught = []
  end

  def can_use_services?
    true
  end
end
