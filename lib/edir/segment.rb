# frozen_string_literal: true

module Edir
  # Data class for segments
  class Segment
    attr_reader :elements, :name, :raw_data

    def initialize(data)
      @raw_data = data
      @raw_elements = @raw_data.split("*")
      @name = @raw_elements.first
      build_elements
    end

    def build_elements
      @elements = []
      @raw_elements[1..].each_with_index do |element, index|
        @elements.push([element.strip, index + 1])
      end
    end

    def get_element(position)
      @elements.detect { |e| e[1] == position }
    end

    def separator?(element)
      element =~ /[*|]/
    end

    def to_h
      {
        @name => @elements.to_h { |e| ["e#{e.last.to_s.rjust(2, "0")}", e.first] }
      }
    end

    def to_s
      "#<Edir::Segment #{@name}  #{@elements}>"
    end
  end
end
