# frozen_string_literal: true

require "yaml"

module Edir
  # Provisions configuration for EDI structuring
  module Config
    module_function

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

    def load_config(type:, name: nil)
      valid_types = %w[element segment transaction_set]
      raise ArgumentError, "expected one of #{valid_types}, got '#{type}'" unless valid_types.include?(type)

      name ||= "**"
      file_paths = get_config_file_paths(type: type, name: name)
      file_paths.map do |path|
        YAML.load_file(path)
      end
    end

    def get_config_file_paths(type:, name:)
      base_path = File.expand_path("config/#{type}s/#{name}", __dir__)
      Dir["#{base_path}/*.yml"]
    end

    private_class_method :get_config_file_paths
  end
end
