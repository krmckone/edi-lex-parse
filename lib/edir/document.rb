# frozen_string_literal: true

require "json"

module Edir
  # Data class for documents
  class Document
    attr_reader :interchanges

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

    def to_json(*)
      to_h.to_json
    end
  end
end
