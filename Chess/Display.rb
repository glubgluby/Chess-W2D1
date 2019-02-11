require_relative 'Board'
require_relative "Piece"
require 'colorize'
require_relative "Cursor"

class Display
    attr_reader :cursor

    def initialize
        @board = Board.new
        @cursor = Cursor.new([0,0], @board)
    end

    def board
        @board.board
    end

    # def cursor?
    #     curr_cursor = cursor.cursor_pos
    # end

    def render
        board.each do |row|
            row.each do |tile|
                if tile == board[cursor.cursor_pos.first][cursor.cursor_pos.last]
                    if tile.is_a?(NullPiece)
                        print '[ ]'.red
                    else
                        print "[#{tile.symbol}]".red
                    end
                else
                    nullcheck(tile)
                end
            end
            puts
        end
        nil
    end

    def nullcheck(tile)
        if tile.is_a?(NullPiece)
            print '[ ]'
        else
            print "[#{tile.symbol}]"
        end
    end


end