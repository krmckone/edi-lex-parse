# frozen_string_literal: true

module Edir
  # Data class for elements
  class Element
    attr_reader :value, :errors, :config

    def initialize(data)
      @value = data.to_s
    end

    def apply_config(config)
      @config = config
      @errors = []

      unless @value.length.between?(config["min"], config["max"])
        @errors << "Element too long. Must be between #{config[:min]} and #{config["max"]}, got #{@value.length}"
      end

      unless config["codes"].include?(@value)
        @errors << "Element value not supported. Must be one of #{config["codes"]}, got #{@value}"
      end

      self
    end

    def identifier
      @config["identifier"]
    end

    def name
      @config["name"]
    end

    def description
      @config["description"]
    end

    def type
      @config["type"]
    end

    def codes
      @config["codes"] = @config["codes"].map(&:to_s) if @config["codes"]
      @config["codes"]
    end

    def min
      @config["min"]
    end

    def max
      @config["max"]
    end

    def to_s
      "#<Edir::Element:\n  " \
        "#{identifier}\n  " \
        "#{name}\n  " \
        "#{description}\n  " \
        "#{type}\n  " \
        "Min #{min} / Max #{max}\n  " \
        "Value: #{@value}\n" \
        ">"
    end
  end
end
