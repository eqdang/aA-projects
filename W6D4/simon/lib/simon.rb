class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    self.take_turn until game_over == true
    if game_over == true
      self.game_over_message
      self.reset_game
    end
  end

  def take_turn
    if self.game_over == false
      show_sequence
      require_sequence
      round_success_message
    end
    self.sequence_length += 1
  end

  def show_sequence
    self.add_random_color
    puts @seq
  end

  def require_sequence
    input = gets.chomp
  end

  def add_random_color
    self.seq << COLORS.sample
  end

  def round_success_message
    puts "round successful"
  end

  def game_over_message
    game_over = true
    puts "game over"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end
