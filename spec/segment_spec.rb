# frozen_string_literal: true

RSpec.describe Edir::Segment do
  describe "#to_h" do
    it "returns the segment in the expected hash representation" do
      segment = Edir::Segment.new(SEGMENTS.first)
      expected = {
        "B2" => {
          "e01" => "",
          "e02" => "SCAC",
          "e03" => "",
          "e04" => "124592j3",
          "e05" => "",
          "e06" => "CC"
        }
      }
      expect(segment.to_h).to eq(expected)
    end
  end
end
