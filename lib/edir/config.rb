# frozen_string_literal: true

require "yaml"

module Edir
  # Provisions configuration for EDI structuring
  module Config
    module_function

    def apply_document_config(document)
      interchanges = document.interchanges.map { |interchange| apply_interchange_config(interchange) }
      Edir::Document.new(interchanges: interchanges)
    end

    def apply_interchange_config(interchange)
      header = apply_segment_config(interchange.header)
      func_groups = interchange.func_groups.map { |func_group| apply_func_group_config(func_group) }
      footer = apply_segment_config(interchange.footer)
      Edir::Interchange.new(header: header, footer: footer, func_groups: func_groups)
    end

    def apply_func_group_config(func_group)
      header = apply_segment_config(func_group.header)
      transac_sets = func_group.transac_sets.map { |transac_set| apply_transac_set_config(transac_set) }
      footer = apply_segment_config(func_group.footer)
      Edir::FunctionalGroup.new(header: header, footer: footer, transac_sets: transac_sets)
    end

    def apply_transac_set_config(transac_set)
      header = apply_segment_config(transac_set.header)
      segments = transac_set.segments.map { |segment| apply_segment_config(segment) }
      footer = apply_segment_config(transac_set.footer)
      Edir::TransactionSet.new(header: header, footer: footer, segments: segments)
    end

    def apply_segment_config(segment)
      elements = segment.elements.map { |element| apply_element_config(element) }
    end

    def apply_element_config(config, element)
      element.apply_config(config)
    end

    # TODO: Right now there's only default configs. How do we differentiate between the
    # default and a non-default/custom config?

    def load_element_config(name:)
      load_config(type: "element", name: name)
    end

    def load_segment_config(name:)
      load_config(type: "segment", name: name)
    end

    def load_transaction_set_config(name:)
      load_config(type: "transaction_set", name: name)
    end

    def load_element_configs
      load_config(type: "element")
    end

    def load_segment_configs
      load_config(type: "segment")
    end

    def load_transaction_set_configs
      load_config(type: "transaction_set")
    end

    def load_config(type:, name: nil, version: "default")
      valid_types = %w[element segment transaction_set]
      raise ArgumentError, "expected one of #{valid_types}, got '#{type}'" unless valid_types.include?(type)

      name ||= "**"
      file_paths = get_config_file_paths(type: type, name: name, version: version)
      file_paths.map do |path|
        YAML.load_file(path)
      end
    end

    def get_config_file_paths(type:, name:, version:)
      version ||= "*"

      base_path = File.expand_path("config/#{type}s/#{name}", __dir__)
      Dir["#{base_path}/#{version}.yml"]
    end

    private_class_method :get_config_file_paths
  end
end
