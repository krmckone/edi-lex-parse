# frozen_string_literal: true

require_relative "converter"

module Edir
  # Top level parsing module
  # Edir::Parsing.parse(raw_edi)
  module Parsing
    extend Edir::Converter

    module_function

    def parse(raw_edi:, apply_config: false)
      # TODO: Figure out the segment/element separators dynamically
      segments = raw_edi.gsub("\n", "").gsub("\r", "").split("~")
      segments = segments.map do |segment|
        Edir::Segment.new(segment)
      end

      parsed = segments.length > 1 ? Edir::Converter.convert_document(segments) : segments
      apply_config ? Edir::Config.apply_config(parsed) : parsed
    end
  end
end
