class Patient

  attr_accessor :id, :room
  attr_reader :name, :age

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @age = attributes[:age]
  end

end
