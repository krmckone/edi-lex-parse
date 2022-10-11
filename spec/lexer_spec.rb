# frozen_string_literal: true

require_relative "./fixtures/lexer_data"

RSpec.describe Edir::Lexer do
  shared_examples "lexing data" do |file, expected_tokens|
    base_path = "spec/fixtures/segments"
    data = File.read("#{base_path}/#{file}")
    it "tokenizes correctly" do
      tokens = Edir::Lexer.new.lex_str(data)
      expect(tokens).to eq(expected_tokens)
    end
  end

  LEXER_DATA.each do |segment, examples|
    describe segment do
      examples.each_with_index do |expected, index|
        example_file = "#{segment.downcase}/#{segment.downcase}_example_#{index + 1}.txt"
        it_behaves_like "lexing data", example_file, expected
      end
    end
  end
end
