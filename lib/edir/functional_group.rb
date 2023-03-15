# frozen_string_literal: true

module Edir
  # Data class for functional groups
  class FunctionalGroup
    attr_reader :transac_sets

    def initialize(header:, footer:, transac_sets:)
      @header = header
      @footer = footer
      @transac_sets = transac_sets
    end

    def segments
      [@header] + @transac_sets.map(&:segments) + [@footer]
    end

    def elements
      segments.map(&:elements)
    end

    def to_h
      {
        **@header.to_h,
        "transaction_sets" => @transac_sets.map(&:to_h),
        **@footer.to_h
      }
    end
  end
end
