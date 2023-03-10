# frozen_string_literal: true

module Edir
  # Data class for segments
  class Segment
    attr_reader :elements, :name, :raw_data

    def initialize(data)
      @raw_data = data
      @name = data.first
      build_elements
    end

    def build_elements
      @elements = []
      position = 0
      @raw_data[1..].each do |element|
        if separator?(element)
          position += 1
        else
          @elements.push([element, position])
        end
      end
    end

    def get_element(position)
      @elements.detect { |e| e[1] == position }
    end

    def separator?(element)
      element =~ /[*|]/
    end
  end
end
