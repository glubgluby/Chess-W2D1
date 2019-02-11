class Piece

    attr_reader :symbol

    def initialize()
        @symbol = :x
    end
    def valid_move?(pos)
        return true if pos.sum > 5
        false
    end

end

class NullPiece < Piece; end