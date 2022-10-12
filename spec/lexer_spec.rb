# frozen_string_literal: true

require_relative "./fixtures/segments_data"
require_relative "./fixtures/files_data"

tests = {
  segments: LEXER_SEGMENT_EXAMPLES,
  files: LEXER_FILE_EXAMPLES
}

RSpec.describe Edir::Lexer do
  shared_examples "lexing data" do |file, expected_tokens|
    base_path = "spec/fixtures/"
    data = File.read("#{base_path}/#{file}")
    it "tokenizes correctly" do
      tokens = Edir::Lexer.new.lex_str(data)
      expect(tokens).to eq(expected_tokens)
    end
  end

  tests.each do |path_prefix, example_types|
    context path_prefix do
      example_types.each do |type, examples|
        describe type do
          examples.each_with_index do |expected, index|
            example_file = "#{path_prefix}/#{type.downcase}_example_#{index + 1}.txt"
            it_behaves_like "lexing data", example_file, expected
          end
        end
      end
    end
  end
end
