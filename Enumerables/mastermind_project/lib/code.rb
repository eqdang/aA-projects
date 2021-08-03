class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

# PART 1

  def self.valid_pegs?(arr_of_chars)
    arr_of_chars.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase) }
  end

  def initialize(arr_of_chars)
    if Code.valid_pegs?(arr_of_chars)
      @pegs = arr_of_chars.map(&:upcase)
    else
      raise error
    end
  end

  def pegs
    @pegs
  end

  def self.random(length)
    random_pegs = []
    length.times { random_pegs << POSSIBLE_PEGS.keys.sample }
    Code.new(random_pegs)
  end

  def self.from_string(string)
    arr_of_chars = string.split("")
    arr_of_chars.map { |char| char = POSSIBLE_PEGS[char] }
    
    Code.new(arr_of_chars)
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

# PART 2

  def num_exact_matches(guess)
    count = 0 
    (0...guess.length).each do |i|
      count += 1 if guess[i] == self.pegs[i]
    end
    count
  end

  def num_near_matches(guess)
    count = 0
    (0...guess.length).each do |i|
      count += 1 if self.pegs.include?(guess[i]) && guess[i] != self.pegs[i]
    end
    count
  end

  def ==(guess)
    (0...guess.length).all? do |i|
        guess[i] == self.pegs[i]
    end
  end

end
