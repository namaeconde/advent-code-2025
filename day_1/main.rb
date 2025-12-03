class SecretEntrance
  $start_dial = 50
  $dial_to_count = 0

  def get_rotations(filename = 'rotations.txt')
    file_data = File.read(filename)
    rotations = file_data.split("\n")
    rotations
  end

  def rotate_secret_dial(filename = 'rotations.txt')
    rotations = get_rotations(filename)
    count = 0
    current_dial = $start_dial
    rotations.each do |rotation|
      direction = if rotation.start_with?('L') then -1 else 1 end
      distance = rotation[1..-1].to_i
      current_dial = (current_dial + direction * distance) % 100

      if current_dial == $dial_to_count
        count += 1
      end
    end
    count
  end

  def additional_rotation(filename = 'rotations.txt')
    rotations = get_rotations(filename)
    count = 0
    current_dial = $start_dial
    rotations.each do |rotation|
      direction = if rotation.start_with?('L') then -1 else 1 end
      distance = rotation[1..-1].to_i
      
      # loop 1 to distance
      (1..distance).each do |step|
        # rotate dial 
        current_dial = current_dial + direction
        current_dial = 99 if current_dial === -1
        current_dial = 0 if current_dial === 100

        # count every time it passes 0
        if current_dial == $dial_to_count
          count += 1
        end
      end
    end
    count
  end
end