class Lobby
  def get_batteries(filename = 'batteries.txt')
    file_data = File.read(filename)
    batteries = file_data.split("\n")
    batteries
  end

  def get_highest_joltage(filename = 'batteries.txt')
    batteries = get_batteries(filename)
    high_joltages = []
    batteries.each do |battery|
      banks = battery.split("")
      current_highest = 0
      p1 = 0
      p2 = 1
      while p2 < banks.length
        bank = "#{banks[p1]}#{banks[p2]}".to_i
        if bank > current_highest
          current_highest = bank
        end

        if banks[p2] > banks[p1]
          p1 = p2
          p2 += 1
        else
          p2 += 1
        end
      end
      high_joltages << current_highest
    end
    high_joltages
  end

  def get_additional_joltage(filename = 'batteries.txt')
    batteries = get_batteries(filename)
    high_joltages = []
    batteries.each do |battery|
      banks = battery.split("").map(&:to_i)
      puts "banks: #{banks}"
      remaining = 12
      curr_index = 0
      curr_highest = 0
      digits = []
      while remaining > 0
        puts "remaining: #{remaining}"
        while banks.length - curr_index >= remaining
          puts "curr_index #{banks[curr_index]} vs curr_highest #{banks[curr_highest]}"
          if banks[curr_index] > banks[curr_highest]
            curr_highest = curr_index
          end
          curr_index += 1
          puts "what's left to check: #{banks.length - curr_index}"
        end
        digits << banks[curr_highest]
        remaining-= 1
        curr_index = curr_highest + 1
        curr_highest = curr_index
      end
      high_joltages << digits.join.to_i
    end
    high_joltages
  end
end