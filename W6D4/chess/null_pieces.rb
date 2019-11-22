require_relative "piece.rb"
require "singleton"

class NullPieces < Piece
    attr_reader :symbol
    include Singleton

    def initialize
        @symbol = " "
        @color = :N 
    end

    def moves
        return [] 
    end

    def symbol=sym
        sym = " "
    end

end