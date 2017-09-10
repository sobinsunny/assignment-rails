class AnagramChecker
  def initialize
    @input_file_data = File.read('input_data.txt').split("\n")
  end

  def check_anagrams
    parse_input_data
    fetch_anagrams.each do |anagram|
      puts anagram.join(',')
    end
    nil
  end

  def check_ananagrams
    parse_input_data
    featch_ananagrams.each do |ananagram|
      puts ananagram.join(',')
    end
    nil
  end

  private

  def parse_input_data
    @extracted_data_hash = {}
    @input_file_data.map do |word|
      anagram_key = create_key(word)
      if @extracted_data_hash.key?(anagram_key)
        @extracted_data_hash[anagram_key] << word
      else
        @extracted_data_hash[anagram_key] = [word]
      end
    end
    @extracted_data_hash
  end

  def fetch_anagrams
    @extracted_data_hash.select { |_key, value| value.size > 1 }.values
  end

  def featch_ananagrams
    @extracted_data_hash.select { |_key, value| value.size == 1 }.values
  end

  def create_key(string)
    string.downcase.tr(' ', '').chars.sort.join
  end
end
