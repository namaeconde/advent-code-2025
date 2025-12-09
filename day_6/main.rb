class TrashCompactor
  def get_worksheet(filename = 'worksheet.txt')
    file_data = File.read(filename)
    worksheet = file_data.split("\n")

    # get last line worksheet
    operations = worksheet[-1].split(" ")

    # remove last line from worksheet
    data = []
    worksheet[0..-2].each do |line|
      line = line.strip.split(" ").map!(&:to_i)
      data << line
    end
    return data, operations
  end

  def get_rtl_worksheet(filename = 'worksheet.txt')
    file_data = File.read(filename)
    worksheet = file_data.split("\n") 

    operations = []
    indexes = []
    worksheet[-1].split("").each_with_index do |op, index|
      if op != " "
        operations << op
        indexes << index-2
      end
    end
    indexes << worksheet[-1].length-1
    # Remove first index
    indexes.shift

    rtl_worksheet = []
    indexes.each_with_index do |i, idx|
      start_idx = i
      end_idx = idx > 0 ? indexes[idx-1]+1 : -1
      numbers = []
      while start_idx > end_idx
        digits = ""
        worksheet[0..-2].each do |line|
          digits = digits + line[start_idx]
        end
        start_idx -= 1
        numbers << digits.to_i
      end
      rtl_worksheet << numbers
    end
    return rtl_worksheet, operations
  end

  def get_grand_total(filename = 'worksheet.txt')
    data, operations = get_worksheet(filename)
    results = []
    data.each do |numbers|
      numbers.each_with_index do |num, index|
        case operations[index]
        when "*"
          results[index] = results[index].nil? ? num : results[index] * num
        when "+"
          results[index] = results[index].nil? ? num : results[index] + num
        else
          results << num
        end
      end
    end
    puts "Results: #{results}"
    results.sum
  end

  def get_rtl_grand_total(filename = 'worksheet.txt')
    rtl_data, operations = get_rtl_worksheet(filename)
    results = []
    operations.each_with_index do |op, index|
      numbers = rtl_data[index]
      numbers.each do |num|
        case op
        when "*"
          results[index] = results[index].nil? ? num : results[index] * num
        when "+"
          results[index] = results[index].nil? ? num : results[index] + num
        else
          break
        end
      end
      puts "Numbers: #{numbers} with operation #{op}"
      puts "Results #{results}"
    end
    results.sum
  end 
end