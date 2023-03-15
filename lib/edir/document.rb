# frozen_string_literal: true

module Edir
  # Data class for documents
  class Document
    def initialize(interchanges:)
      @interchanges = interchanges
    end

    def segments
      @interchanges.map(&:segments).flatten
    end

    def elements
      segments.map(&:elements)
    end

    def to_h
      {
        "interchanges" => @interchanges.map(&:to_h).flatten
      }
    end
  end
end
