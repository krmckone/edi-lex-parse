# frozen_string_literal: true

RSpec.describe Edir::Segment do
  describe "#to_h" do
    it "returns the segment in the expected hash representation" do
      elements = [
        "ISA", "*",
        "00", "*",
        "00", "*",
        "", "*",
        "09", "*",
        "005070479ff", "*",
        "ZZ", "*",
        "U", "*",
        "0", "*",
        "T", "*",
        "^"
      ]
      segment = Edir::Segment.new(elements)
      expected = {
        "ISA" => {
          "e01" => "00",
          "e02" => "00",
          "e03" => "",
          "e04" => "09",
          "e05" => "005070479ff",
          "e06" => "ZZ",
          "e07" => "U",
          "e08" => "0",
          "e09" => "T",
          "e10" => "^"
        }
      }
      expect(segment.to_h).to eq(expected)
    end
  end
end
