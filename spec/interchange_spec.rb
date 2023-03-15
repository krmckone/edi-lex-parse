# frozen_string_literal: true

RSpec.describe Edir::Interchange do
  describe "#to_h" do
    it "returns the functional group in the expected hash representation" do
      interchange = build_interchange
      expected = {
        "ISA" => {
          "e01" => "00",
          "e02" => "",
          "e03" => "00",
          "e04" => "",
          "e05" => "ZZ",
          "e06" => "SHIPPER",
          "e07" => "02",
          "e08" => "SCAC",
          "e09" => "230309",
          "e10" => "1640",
          "e11" => "U",
          "e12" => "00401",
          "e13" => "000340000",
          "e14" => "O",
          "e15" => "P",
          "e16" => "`"
        },
        "functional_groups" => [
          {
            "GS" => {
              "e01" => "SM",
              "e02" => "SHIPPER",
              "e03" => "SCAC",
              "e04" => "20230309",
              "e05" => "1620",
              "e06" => "80",
              "e07" => "X",
              "e08" => "004010"
            },
            "transaction_sets" => [
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
            ],
            "GE" => {
              "e01" => "1",
              "e02" => "80"
            }
          }
        ],
        "IEA" => {
          "e01" => "1",
          "e02" => "000340000"
        }
      }
      pp interchange.to_h
      pp expected
      expect(interchange.to_h).to eq(expected)
    end
  end
end
