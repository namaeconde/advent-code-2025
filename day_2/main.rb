class GiftShop

  def get_product_ids(filename = 'product_ids.txt')
    file_data = File.read(filename)
    product_ids = file_data.split(",")
    product_ids
  end

  def filter_invalid_ids(filename = 'product_ids.txt')
    product_id_ranges = get_product_ids(filename)
    invalid_ids = []
    product_id_ranges.each do |product_id_range|
      range_parts = product_id_range.split("-")
      start_id = range_parts[0].to_i
      end_id = range_parts[1].to_i

      (start_id..end_id).each do |product_id|
        if product_id > 10
          str = product_id.to_s
          first_half = str[0..(str.length / 2 - 1)]
          second_half = str[(str.length / 2)..-1]
          if first_half == second_half
            invalid_ids << product_id
          end
        end
      end
    end
    invalid_ids
  end

  def additional_invalid_ids(filename = 'product_ids.txt')
    product_id_ranges = get_product_ids(filename)
    invalid_ids = []
    product_id_ranges.each do |product_id_range|
      range_parts = product_id_range.split("-")
      start_id = range_parts[0].to_i
      end_id = range_parts[1].to_i

      (start_id..end_id).each do |product_id|
        if product_id > 10
          str = product_id.to_s
          # Check if the string is composed of a repeating pattern
          found_pattern = false
          (1..str.length/2).each do |pattern_length|
            if str.length % pattern_length == 0
              pattern = str[0...pattern_length]
              if str == pattern * (str.length / pattern_length)
                found_pattern = true
                break
              end
            end
          end
          invalid_ids << product_id if found_pattern
        end
      end
    end
    invalid_ids
  end
end