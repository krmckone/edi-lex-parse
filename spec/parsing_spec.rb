# frozen_string_literal: true

require_relative "./fixtures/segments_data"
require_relative "./fixtures/files_data"

tests = {
  segments: PARSER_SEGMENT_EXAMPLES,
  files: PARSER_FILE_EXAMPLES
}

# For adding a new segment test:
# 1. Add your segment file in the correct location (depending on segment type)
#    in spec/fixtures/segments. Ensure the file name follows the existing incremental pattern.
# 2. Add the expected parsed output (after calling elements on the segment object)
#    to spec/fixtures/segments_data.rb. Append to the array of any existing data for the
#    segment entry.
# For adding a new file test:
# 1. Add your file to spec/fixtures files. Follow the existing naming convention.
# 2. Add the expected parsed output (after calling elements on the document object)
#    to spec/fixtures/files_data. Append to the array of any existing data for the file type
#    endtry.
RSpec.describe Edir::Parsing do
  shared_examples "parsing data" do |test_number, file, expected_data|
    base_path = "spec/fixtures/"
    data = File.read("#{base_path}/#{file}")
    it "example #{test_number} parses correctly" do
      data = Edir::Parsing.parse(raw_edi: data)
      data = data.interchanges if data.is_a? Edir::Document
      # Flatten the first level beacuse we're using map here
      expect(data.map(&:elements_to_s).flatten(1)).to eq(expected_data)
    end
  end

  tests.each do |path_prefix, example_types|
    context path_prefix do
      example_types.each do |type, examples|
        describe type do
          examples.each_with_index do |expected, index|
            example_file = "#{path_prefix}/#{type.downcase}_example_#{index + 1}.txt"
            it_behaves_like "parsing data", index + 1, example_file, expected
          end
        end
      end
    end
  end
end
