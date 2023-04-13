# frozen_string_literal: true

require_relative "converter"

module Edir
  # Top level parsing module
  # Edir::Parsing.parse(raw_edi)
  module Parsing
    extend Edir::Converter

    module_function

    def parse(raw_edi)
      # TODO: Figure out the segment/element separators dynamically
      segments = raw_edi.gsub("\n", "").gsub("\r", "").split("~")
      segments = segments.map do |segment|
        Edir::Segment.new(segment)
      end

      if segments.length > 1
        convert_document(segments)
      else
        segments
      end
    end
  end
end
