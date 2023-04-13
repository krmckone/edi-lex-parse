# frozen_string_literal: true

RSpec.describe Edir::Converter do
  let(:segments) do
    %w[
      ISA GS ST ANY SE GE IEA
      ISA GS ST ANY SE GE IEA
    ].map { |name| Edir::Segment.new(name) }
  end

  describe "#convert_document" do
    it "takes segments describing a document and outputs the document object with interchanges" do
      document = Edir::Converter.convert_document(segments)
      expect(document.interchanges.length).to eq(2)
      document.interchanges.each do |interchange|
        expect(interchange).to be_a(Edir::Interchange)
        expect(interchange.segments.first.name).to eq("ISA")
        expect(interchange.segments.last.name).to eq("IEA")
      end
    end
  end

  describe "#convert_interchange" do
    it "takes segments describing an interchange and outputs the interchange object with func groups" do
      interchange = Edir::Converter.convert_interchange(segments[0..6])
      expect(interchange).to be_a(Edir::Interchange)
      interchange.func_groups.each do |func_group|
        expect(func_group).to be_a(Edir::FunctionalGroup)
        expect(func_group.segments.first.name).to eq("GS")
        expect(func_group.segments.last.name).to eq("GE")
      end
    end
  end

  describe "#convert_functional_group" do
    it "takes segments describing a functional group and outputs the functional group object with transac sets" do
      functional_group = Edir::Converter.convert_functional_group(segments[1..5])
      expect(functional_group).to be_a(Edir::FunctionalGroup)
      functional_group.transac_sets.each do |transac_set|
        expect(transac_set).to be_a(Edir::TransactionSet)
        expect(transac_set.segments.first.name).to eq("ST")
        expect(transac_set.segments.last.name).to eq("SE")
      end
    end
  end

  describe "#convert_transaction_set" do
    it "takes segments describing a transaction set and outputs the transaction set object" do
      transaction_set = Edir::Converter.convert_transaction_set(segments[2..4])
      expect(transaction_set).to be_a(Edir::TransactionSet)
      transaction_set.segments.each do |segment|
        expect(segment).to be_a(Edir::Segment)
        expect(segment.name).not_to eq(nil)
        expect(segment.name).not_to eq(nil)
      end
    end
  end

  describe "#partition_by_seg_types" do
    it "partitions by segment type ISA/IEA as expected" do
      expected = [
        segments[0..6],
        segments[7..]
      ]

      expect(
        Edir::Converter.partition_by_seg_types(
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
        Edir::Converter.partition_by_seg_types(
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
        Edir::Converter.partition_by_seg_types(
          segments: segments[2..-3],
          seg_start: "ST",
          seg_end: "SE"
        )
      ).to eq(expected)
    end
  end
end
