class Doctor
  attr_accessor :id
  attr_reader :name
  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
  end
end