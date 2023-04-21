# frozen_string_literal: true

module Edir
  # Data class for segments
  class Segment
    attr_reader :elements, :raw_data

    def initialize(data)
      @raw_data = data
      @raw_elements = @raw_data.split("*")
      build_elements
    end

    def build_elements
      @elements = []
      @raw_elements[1..].each_with_index do |element, index|
        @elements.push([Edir::Element.new(element.strip), index + 1])
      end
    end

    def name
      @raw_elements.first
    end

    def get_element(position)
      @elements.detect { |_, p| p == position }
    end

    def elements_to_s
      @elements.map { |e, p| [e.value, p] }
    end

    def to_h
      {
        name => @elements.to_h { |e| ["e#{e.last.to_s.rjust(2, "0")}", e.first.value] }
      }
    end

    def to_s
      "#<Edir::Segment #{@name} #{@elements}>"
    end
  end
end
