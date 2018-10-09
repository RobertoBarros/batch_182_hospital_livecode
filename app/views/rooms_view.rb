class RoomsView
  def ask_number
    puts "Enter the room number:"
    return gets.chomp.to_i
  end

  def ask_capacity
    puts "Enter the room capacity:"
    return gets.chomp.to_i
  end

  def list(rooms)
    system "clear"
    puts ("-" * 15) + 'Rooms List' + ("-" * 15)
    rooms.each do |room|
      patients = room.patients.map(&:name).join(', ')
      puts "Room Number #{room.number}: #{room.capacity} patients capacity | #{patients}"
    end
    puts ('-' * 30)
    puts "\n\n"
    puts 'Press enter to continue...'
    gets
  end
end