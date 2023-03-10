# frozen_string_literal: true

module Edir
  # Converter methods for parsed EDI
  module Convert
    # For each transaction set start/end, create a unique transaction set object with
    # the corrsponding segments.
    # For each functional group start/end, create a unique functional group object with
    # the corresponding transaction sets.
    # For each interchange start/end, create a unique interchange object with the corresponding
    # functional groups.
    def convert_document(segments)
      interchanges = partition_by_seg_types(segments: segments, seg_start: "ISA", seg_end: "IEA")
      interchanges.map do |inter|
        convert_interchange(inter)
      end
    end

    def convert_interchange(inter)
      func_groups = partition_by_seg_types(segments: inter[1..-2], seg_start: "GS", seg_end: "GE")
      converted_func_groups = func_groups.map do |func_group|
        convert_functional_group(func_group)
      end

      Edir::Interchange.new(
        header: inter.first,
        footer: inter.last,
        func_groups: converted_func_groups
      )
    end

    def convert_functional_group(func_group)
      transac_sets = partition_by_seg_types(segments: func_group[1..-2], seg_start: "ST", seg_end: "SE")
      converted_transac_sets = transac_sets.map do |transac_set|
        convert_transaction_set(transac_set)
      end

      Edir::FunctionalGroup.new(
        header: func_group.first,
        footer: func_group.last,
        transac_sets: converted_transac_sets
      )
    end

    def convert_transaction_set(transac_set)
      Edir::TransactionSet.new(
        header: transac_set.first,
        footer: transac_set.last,
        segments: transac_set[1..-2]
      )
    end

    def partition_by_seg_types(segments:, seg_start:, seg_end:)
      partitions = []
      while segments.length.positive?
        part_start = segments.find_index { |s| s.name == seg_start }
        part_end = segments.find_index { |s| s.name == seg_end }
        partitions << segments[part_start..part_end]
        segments = segments[part_end + 1..]
      end

      partitions
    end
  end
end
