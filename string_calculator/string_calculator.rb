class StringCalculator
  DEFAULT_DELIMITER = ','
  FIXED_DELIMITER = "\n"

  def add(input)
    delimiters_part, number_part = split_input(input)
    numbers = number_part.split(delimiter_regexp(delimiters_part)).map(&:to_i)
    check_input_is_valid(numbers)
    remove_numbers_major_1000(numbers)
    numbers.inject(0) { |sum, number| sum + number.to_i }
  end

  private

  def split_input(input)
    input.start_with?('//') ? input.gsub(/^\/\//, '').split("\n", 2) : [nil, input]
  end

  def delimiter_regexp(delimiter_part)
    /[#{delimiters_from_input(delimiter_part).map { |d| Regexp.escape d }.join('|')}]/
  end

  def delimiters_from_input(delimiter_part)
    [FIXED_DELIMITER, delimiter_part ? extract_delimiters(delimiter_part) : DEFAULT_DELIMITER].flatten
  end

  def extract_delimiters(delimiter_part)
    delimiters = delimiter_part.scan(/\[([^\]]+)\]/).flatten
    delimiters.any? ? delimiters : delimiter_part
  end

  def remove_numbers_major_1000(numbers)
    numbers.delete_if { |n| n > 1000 }
  end

  def check_input_is_valid(numbers)
    negatives = numbers.select { |n| n < 0 }
    raise RuntimeError.new("negatives not allowed: #{negatives.join(', ')}") if negatives.any?
  end
end
