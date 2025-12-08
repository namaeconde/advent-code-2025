class Cafeteria
  def get_ingredient_data(filename = 'ingredients.txt')
    ranges = []
    ids = []
    
    file_data = File.read(filename)
    ingredients_data = file_data.split("\n")

    ingredients_data.each do |data|
      if data.include?("-")
        parts = data.split("-")
        start_range = parts[0].to_i
        end_range = parts[1].to_i
        ranges << [start_range, end_range]
      elsif data.length > 0
        ids << data.to_i
      end
    end
    
    return ranges, ids
  end

  def count_fresh(filename = 'ingredients.txt')
    ranges, ids = get_ingredient_data(filename)
    fresh_count = 0

    ids.each do |id|
      ranges.each do |range|
        if range[0] <= id && id <= range[1]
          fresh_count += 1
          break
        end
      end
    end
    fresh_count
  end

  def new_fresh_count(filename = 'ingredients.txt')
    ranges = get_ingredient_data(filename)
    # sort ranges by start of range
    sorted_ranges = ranges[0].sort_by { |range| range[0] }
    puts "Sorted ranges: #{sorted_ranges}"
    # merge overlapping ranges
    merged_ranges = []
    sorted_ranges.each do |current_range|
      puts "merged_ranges[-1][1], #{merged_ranges[-1][1]}" unless merged_ranges.empty?
      if merged_ranges.empty? || merged_ranges[-1][1] < current_range[0]
        merged_ranges << current_range
      else
        merged_ranges[-1][1] = [merged_ranges[-1][1], current_range[1]].max
      end
    end
    puts "Merged ranges: #{merged_ranges}"
    
    fresh_count = 0
    merged_ranges.each do |range|
      fresh_count += (range[1] - range[0] + 1)
    end
    fresh_count
  end
end