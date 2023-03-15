# frozen_string_literal: true

require "edir"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

INTERCHANGE_HEADER = [
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
].freeze

INTERCHANGE_FOOTER = [
  "IEA", "*",
  "1", "*",
  "000340000"
].freeze

FUNC_GROUP_HEADER = [
  "GS", "*",
  "SM", "*",
  "SHIPPER", "*",
  "SCAC", "*",
  "20230309", "*",
  "1620", "*",
  "80", "*",
  "X", "*",
  "004010"
].freeze

FUNC_GROUP_FOOTER = [
  "GE", "*",
  "1", "*",
  "80"
].freeze

TRANSAC_SET_HEADER = [
  "ST", "*",
  "204", "*",
  "79902"
].freeze

TRANSAC_SET_FOOTER = [
  "SE", "*",
  "925", "*",
  "79902"
].freeze

SEGMENTS = [
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
].freeze

def build_document
  Edir::Document.new(interchanges: [build_interchange])
end

def build_interchange
  header = Edir::Segment.new(INTERCHANGE_HEADER)
  footer = Edir::Segment.new(INTERCHANGE_FOOTER)
  Edir::Interchange.new(
    header: header,
    footer: footer,
    func_groups: [build_func_group]
  )
end

def build_func_group
  header = Edir::Segment.new(FUNC_GROUP_HEADER)
  footer = Edir::Segment.new(FUNC_GROUP_FOOTER)
  Edir::FunctionalGroup.new(
    header: header,
    footer: footer,
    transac_sets: [build_transac_set]
  )
end

def build_transac_set
  header = Edir::Segment.new(TRANSAC_SET_HEADER)
  footer = Edir::Segment.new(TRANSAC_SET_FOOTER)
  segments = SEGMENTS.map { |e| Edir::Segment.new(e) }
  Edir::TransactionSet.new(header: header, footer: footer, segments: segments)
end
