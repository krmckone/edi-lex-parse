# frozen_string_literal: true

require_relative "./fixtures/segments_data"
require_relative "./fixtures/files_data"

tests = {
  segments: PARSER_SEGMENT_EXAMPLES,
  files: PARSER_FILE_EXAMPLES
}

RSpec.describe Edir::Parsing do
  shared_examples "parsing data" do |file, expected_data|
    base_path = "spec/fixtures/"
    data = File.read("#{base_path}/#{file}")
    it "parses correctly" do
      data = Edir::Parsing.parse(data)
      data = data.interchanges if data.is_a? Edir::Document
      # Flatten the first level beacuse we're using map here
      expect(data.map(&:elements).flatten(1)).to eq(expected_data)
    end
  end

  tests.each do |path_prefix, example_types|
    context path_prefix do
      example_types.each do |type, examples|
        describe type do
          examples.each_with_index do |expected, index|
            example_file = "#{path_prefix}/#{type.downcase}_example_#{index + 1}.txt"
            it_behaves_like "parsing data", example_file, expected
          end
        end
      end
    end
  end
end
