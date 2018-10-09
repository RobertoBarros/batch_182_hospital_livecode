require_relative '../models/patient'

class PatientRepository
  def initialize(csv_file, room_repository)
    @room_repository = room_repository
    @csv_file = csv_file
    @patients = []
    load_csv
  end

  def add(patient)
    patient.id = @next_id
    @next_id += 1
    @patients << patient
    save_csv
  end

  def all
    @patients
  end

  def find(id)
    @patients.select { |patient| patient.id == id }.first
  end

  def load_csv
    CSV.foreach(@csv_file) do |row|
      patient = Patient.new(id: row[0].to_i, name: row[1], age: row[2].to_i)
      @patients << patient
      room_id = row[3].to_i
      if room_id > 0
        room = @room_repository.find(room_id)
        room.add_patient(patient)
      end

    end
    @next_id = @patients.empty? ? 1 : @patients.last.id + 1
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |file|
      @patients.each do |patient|
        file << [patient.id, patient.name, patient.age, patient.room.id]
      end
    end
  end

end