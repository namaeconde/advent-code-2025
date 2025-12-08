class Printer
  def get_paper_rolls(filename = 'paper_rolls.txt')
    file_data = File.read(filename)
    paper_rolls_matrix = file_data.split("\n")
    paper_rolls_matrix
  end

  def get_accessible_rolls(paper_rolls_matrix)
    accessible_rolls = []
    paper_rolls_matrix.each_with_index do |paper_rolls_row, i|
      rolls = paper_rolls_row.split("")
      rolls.each_with_index do |roll, j|
        if roll == "@"
          # Check all adjacent rolls
          adjacent_positions = [[i-1, j], [i+1, j], [i, j-1], [i, j+1], [i-1, j-1], [i-1, j+1], [i+1, j-1], [i+1, j+1]]
          neighboring_count = 0
          adjacent_positions.each do |pos|
            x = pos[0]
            y = pos[1]
            if x >= 0 && x < paper_rolls_matrix.length && y >= 0 && y < rolls.length
              adjacent_roll = paper_rolls_matrix[x].split("")[y]
              if adjacent_roll == "@"
                neighboring_count += 1
              end
            end
          end
          if neighboring_count < 4
            accessible_rolls << [i, j]
          end
        end
      end
    end
    accessible_rolls
  end

  def remove_accessible_rolls(accessible_rolls, paper_rolls_matrix)
    accessible_rolls.each do |pos|
      x = pos[0]
      y = pos[1]
      rolls = paper_rolls_matrix[x].split("")
      rolls[y] = "x"
      paper_rolls_matrix[x] = rolls.join
    end
    paper_rolls_matrix
  end

  def remove_all_accessible_rolls(filename = 'paper_rolls.txt')
    paper_rolls_matrix = get_paper_rolls(filename)
    accessible_rolls = get_accessible_rolls(paper_rolls_matrix)
    all_accessible_rolls = accessible_rolls
    while accessible_rolls.length > 0
      puts "Removing #{accessible_rolls.length} rolls of paper"
      paper_rolls_matrix = remove_accessible_rolls(accessible_rolls, paper_rolls_matrix)
      accessible_rolls = get_accessible_rolls(paper_rolls_matrix)
      all_accessible_rolls += accessible_rolls
    end
    all_accessible_rolls.length
  end
end