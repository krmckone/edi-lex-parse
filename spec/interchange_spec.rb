# frozen_string_literal: true

RSpec.describe Edir::Interchange do
  def build_interchange
    header = Edir::Segment.new(
      [
        "ISA", "*",
        "00", "*",
        "", "*",
        "00", "*",
        "", "*",
        "ZZ", "*",
        "SHIPPER", "*",
        "02", "*",
        "SCAC", "*",
        "230309", "*",
        "1640", "*",
        "U", "*",
        "00401", "*",
        "000340000", "*",
        "O", "*",
        "P", "*",
        "`"
      ]
    )
    footer = Edir::Segment.new(
      [
        "IEA", "*",
        "1", "*",
        "000340000"
      ]
    )
    Edir::Interchange.new(
      header: header,
      footer: footer,
      func_groups: [build_func_group]
    )
  end

  def build_func_group
    header = Edir::Segment.new(
      [
        "GS", "*",
        "SM", "*",
        "SHIPPER", "*",
        "SCAC", "*",
        "20230309", "*",
        "1620", "*",
        "80", "*",
        "X", "*",
        "004010"
      ]
    )
    footer = Edir::Segment.new(
      [
        "GE", "*",
        "1", "*",
        "80"
      ]
    )
    Edir::FunctionalGroup.new(
      header: header,
      footer: footer,
      transac_sets: [build_transac_set]
    )
  end

  def build_transac_set
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
    Edir::TransactionSet.new(header: header, footer: footer, segments: segments)
  end

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
