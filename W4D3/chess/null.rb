require "singleton"
require_relative "peices.rb"

class NullPiece < Piece
    include Singleton
    attr_reader :sym

    def initialize
        @sym = " "
    end

    def empty?
        true
    end

    
end