# frozen_string_literal: true

RSpec.describe Edir::Lexer do
  shared_examples "lexing data" do |file, expected_tokens|
    base_path = "spec/fixtures/"
    data = File.read("#{base_path}/#{file}")
    it "tokenizes correctly" do
      tokens = subject.lex_str(data)
      expect(tokens).to eq(expected_tokens)
    end
  end

  describe "ISA" do
    expected_tokens = [
      [:SEGSTART, "ISA"], [:ELEMSEP, "*"],
      [:ELEM, "00"], [:ELEMSEP, "*"],
      [:ELEMSEP, "*"], [:ELEM, "00"],
      [:ELEMSEP, "*"], [:ELEMSEP, "*"],
      [:ELEM, "09"], [:ELEMSEP, "*"],
      [:ELEM, "005070479ff"], [:ELEMSEP, "*"],
      [:ELEM, "ZZ"], [:ELEMSEP, "*"],
      [:ELEM, "X0000X0"], [:ELEMSEP, "*"],
      [:ELEM, "931001"], [:ELEMSEP, "*"],
      [:ELEM, "1020"], [:ELEMSEP, "*"],
      [:ELEM, "U"], [:ELEMSEP, "*"],
      [:ELEM, "00401"], [:ELEMSEP, "*"],
      [:ELEM, "000952061"], [:ELEMSEP, "*"],
      [:ELEM, "0"], [:ELEMSEP, "*"],
      [:ELEM, "T"], [:ELEMSEP, "*"],
      [:ELEM, "^"],
      [:SEGEND, "~"]
    ]
    file = "isa/isa_example_1.txt"

    it_behaves_like "lexing data", file, expected_tokens
  end

  describe "GS" do
    expected_tokens = [
      [:SEGSTART, "GS"], [:ELEMSEP, "*"],
      [:ELEM, "AA"], [:ELEMSEP, "*"],
      [:ELEM, "64GVCAJ68Y"], [:ELEMSEP, "*"],
      [:ELEM, "2L0CIJM03G"], [:ELEMSEP, "*"],
      [:ELEM, "20220920"], [:ELEMSEP, "*"],
      [:ELEM, "084151"], [:ELEMSEP, "*"],
      [:ELEM, "598951"], [:ELEMSEP, "*"],
      [:ELEM, "T"], [:ELEMSEP, "*"],
      [:ELEM, "004010"],
      [:SEGEND, "~"]
    ]
    file = "gs/gs_example_1.txt"

    it_behaves_like "lexing data", file, expected_tokens
  end

  describe "ST" do
    expected_tokens = [
      [:SEGSTART, "ST"], [:ELEMSEP, "*"],
      [:ELEM, "204"], [:ELEMSEP, "*"],
      [:ELEM, "386417176"],
      [:SEGEND, "~"]
    ]
    file = "st/st_example_1.txt"

    it_behaves_like "lexing data", file, expected_tokens
  end

  describe "B2" do
    expected_tokens = [
      [:SEGSTART, "B2"], [:ELEMSEP, "*"],
      [:ELEMSEP, "*"], [:ELEMSEP, "*"],
      [:ELEMSEP, "*"], [:ELEMSEP, "*"],
      [:ELEMSEP, "*"], [:ELEM, "11"],
      [:SEGEND, "~"]
    ]
    file = "b2/b2_example_1.txt"

    it_behaves_like "lexing data", file, expected_tokens
  end

  describe "B2A" do
    expected_tokens = [
      [:SEGSTART, "B2A"], [:ELEMSEP, "*"],
      [:ELEM, "00"],
      [:SEGEND, "~"]
    ]
    file = "b2a/b2a_example_1.txt"

    it_behaves_like "lexing data", file, expected_tokens
  end
end
