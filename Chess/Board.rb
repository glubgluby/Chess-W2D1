require_relative 'Piece'
require_relative 'Errorfile'


class Board
    attr_reader :board

    def initialize
        @board = Board.newgame

    end

    def [](pos)
        x, y = pos
        board[x][y]
    end

    def []=(pos, piece)
        x, y = pos
        @board[x][y] = piece
    end

    def move_piece(start_pos, end_pos, color)
        ini_pos = self[start_pos]
        if ini_pos.is_a?(NullPiece)
            raise NoPieceThere 
        end
        unless ini_pos.valid_move?(end_pos)
            raise InvalidMove
        end
        self[end_pos] = ini_pos
        self[start_pos] = NullPiece.new
    end


    def self.newgame
        x = Array.new(8){Array.new(8)}
        p_rows = [0,1,7,6]
        x.map!.with_index do |row, idx|
            if p_rows.include?(idx)
                row.map!{|tile| Piece.new}
            else
                row.map!{|tile| NullPiece.new}
            end
        end
        x
    end
    
    def valid_pos?(pos)
        pos.all?{ |n| (0..7).to_a.include?(n)}
    end

    def add_piece(piece, pos)
    end
    def checkmate?(color)
    end
    def in_check?(color)
    end
    def find_king(color)
    end
    def pieces
    end
    def dup
    end

end

