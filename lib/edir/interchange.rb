# frozen_string_literal: true

module Edir
  # Data class for interchanges
  class Interchange
    attr_reader :func_groups

    def initialize(header:, footer:, func_groups:)
      @header = header
      @footer = footer
      @func_groups = func_groups
    end

    def segments
      [@header] + @func_groups.map(&:segments).flatten + [@footer]
    end

    def elements
      segments.map(&:elements)
    end

    def to_h
      @header.to_h.merge(
        {
          "functional_groups" => @func_groups.map(&:to_h).flatten
        }
      ).merge(@footer.to_h)
    end
  end
end
