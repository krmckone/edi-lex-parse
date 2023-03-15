# frozen_string_literal: true

RSpec.describe Edir::TransactionSet do
  describe "#to_h" do
    it "returns the transaction set in the expected hash representation" do
      segments = [
        [
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
        ],
        [
          "GS", "*",
          "00", "*",
          "00", "*",
          "", "*",
          "09", "*",
          "ZZ", "*",
          "U", "*",
          "0", "*"
        ]
      ].map { |e| Edir::Segment.new(e) }
      transaction_set = Edir::TransactionSet.new(header: [], footer: [], segments: segments)
      expected = [
        {
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
        },
        {
          "GS" => {
            "e01" => "00",
            "e02" => "00",
            "e03" => "",
            "e04" => "09",
            "e05" => "ZZ",
            "e06" => "U",
            "e07" => "0"
          }
        }
      ]
      expect(transaction_set.to_h).to eq(expected)
    end
  end
end
