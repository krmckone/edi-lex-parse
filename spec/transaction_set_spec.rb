# frozen_string_literal: true

RSpec.describe Edir::TransactionSet do
  describe "#to_h" do
    it "returns the transaction set in the expected hash representation" do
      header = Edir::Segment.new(
        [
          "ST", "*",
          "204", "*",
          "79902"
        ]
      )
      footer = Edir::Segment.new(
        [
          "SE", "*",
          "925", "*",
          "79902"
        ]
      )
      segments = [
        [
          "B2", "*",
          "", "*",
          "SCAC", "*",
          "", "*",
          "124592j3", "*",
          "", "*",
          "CC"
        ],
        [
          "B2A", "*",
          "00", "*",
          "LT"
        ]
      ].map { |e| Edir::Segment.new(e) }
      transaction_set = Edir::TransactionSet.new(header: header, footer: footer, segments: segments)
      expected = [
        {
          "ST" => {
            "e01" => "204",
            "e02" => "79902"
          }
        },
        {
          "B2" => {
            "e01" => "",
            "e02" => "SCAC",
            "e03" => "",
            "e04" => "124592j3",
            "e05" => "",
            "e06" => "CC"
          }
        },
        {
          "B2A" => {
            "e01" => "00",
            "e02" => "LT"
          }
        },
        {
          "SE" => {
            "e01" => "925",
            "e02" => "79902"
          }
        }
      ]
      pp transaction_set.segments
      expect(transaction_set.to_h).to eq(expected)
    end
  end
end
