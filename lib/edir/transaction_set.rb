# frozen_string_literal: true

module Edir
  # Data class for a transaction set
  class TransactionSet
    def initialize(header:, footer:, segments:)
      @header = header
      @footer = footer
      @segments = segments
    end

    def segments
      [@header] + @segments + [@footer]
    end

    def elements
      segments.map(&:elements)
    end
  end
end
