# require "byebug"
require_relative 'tic_tac_toe.rb'

class TicTacToeNode
  attr_reader :board, :prev_move_pos
  attr_accessor :next_mover_mark

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board 
    @next_mover_mark = next_mover_mark 
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(current_player_mark)
    if self.board.over? && self.board.winner == swap_mark(current_player_mark)
      return true
    elsif self.board.over? && self.board.winner != swap_mark(current_player_mark)
      return false
    end
    
    if current_player_mark == self.next_mover_mark && 
      self.children.all? { |child| child.losing_node?(current_player_mark) } ||
      current_player_mark != self.next_mover_mark && 
      self.children.any? {|child| child.losing_node?(current_player_mark) } 
      return true 
    else
      false
    end
  end

  def winning_node?(current_player_mark)
    if self.board.over? && self.board.winner == current_player_mark
      return true
    elsif self.board.over? && self.board.winner != current_player_mark
      return false
    end
    
    if current_player_mark == self.next_mover_mark && 
      self.children.any? { |child| child.winning_node?(current_player_mark) } ||
      current_player_mark != self.next_mover_mark && 
      self.children.all? {|child| child.winning_node?(current_player_mark) }
      return true 
    else
      false
    end
  end

  def swap_mark(mark = self.next_mover_mark)
    if mark == :x
      :o
    else
      :x
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children = []
    (0..2).each do |idx1|
      (0..2).each do |idx2|
        pos = [idx1, idx2]
        if board.empty?(pos)
          new_board = board.dup
          new_board[pos] = next_mover_mark
          children << TicTacToeNode.new(new_board, self.swap_mark, pos)
        end
      end
    end
    children
  end
end
