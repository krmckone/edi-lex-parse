# frozen_string_literal: true

require_relative "./fixtures/segments_data"
require_relative "./fixtures/files_data"

tests = {
  segments: PARSER_SEGMENT_EXAMPLES,
  files: PARSER_FILE_EXAMPLES
}

RSpec.describe Edir::Parser do
  shared_examples "parsing data" do |file, expected_data|
    base_path = "spec/fixtures/"
    data = File.read("#{base_path}/#{file}")
    it "parses correctly" do
      data = Edir::Parser.new.parse(data)
      expect(data.map(&:elements)).to eq([expected_data])
    end
  end

  tests.each do |path_prefix, example_types|
    context path_prefix do
      example_types.each do |type, examples|
        describe type do
          examples.each_with_index do |expected, index|
            example_file = "#{path_prefix}/#{type.downcase}_example_#{index + 1}.txt"
            it_behaves_like "parsing data", example_file, expected
          end
        end
      end
    end
  end

  describe "#partition_by_seg_types" do 
    let(:segments) do
      [
        double(name: "ISA"),
        double(name: "GS"),
        double(name: "ST"),
        double(name: "ANY"),
        double(name: "SE"),
        double(name: "GE"),
        double(name: "IEA"),
        double(name: "ISA"),
        double(name: "GS"),
        double(name: "ST"),
        double(name: "ANY"),
        double(name: "SE"),
        double(name: "GE"),
        double(name: "IEA")
      ]
    end

    it "partitions by segment type ISA/IEA as expected" do
      expected = [
        segments[0..6],
        segments[7..]
      ]

      expect(
        Edir::Parser.new.partition_by_seg_types(
          segments: segments,
          seg_start: "ISA",
          seg_end: "IEA"
        )
      ).to eq(expected)
    end

    it "partitions by segment type GS/GE as expected" do
      expected = [
        segments[1..5],
        segments[8..-2]
      ]

      expect(
        Edir::Parser.new.partition_by_seg_types(
          segments: segments[1..-2],
          seg_start: "GS",
          seg_end: "GE"
        )
      ).to eq(expected)
    end

    it "partitions by segment type ST/SE as expected" do
      expected = [
        segments[2..4],
        segments[9..-3]
      ]

      expect(
        Edir::Parser.new.partition_by_seg_types(
          segments: segments[2..-3],
          seg_start: "ST",
          seg_end: "SE"
        )
      ).to eq(expected)
    end
  end
end
