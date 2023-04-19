# frozen_string_literal: true

RSpec.describe Edir::Config do
  shared_examples "loads config" do |type, name|
    it "loads the config file(s) as expected" do
      path_name = name.nil? ? "**" : name
      base_paths_expected = File.expand_path("../lib/edir/config/#{type}s/#{path_name}", __dir__)
      Dir["#{base_paths_expected}/*.yml"]
      expected = Dir["#{base_paths_expected}/*.yml"].map { |path| YAML.load_file(path) }
      expect(Edir::Config.load_config(type: type, name: name)).to eq(expected)
    end
  end

  describe ".load_config" do
    it "raises for incorrect config types" do
      valid_types = %w[element segment transaction_set]
      expect do
        Edir::Config.load_config(type: "invalid")
      end.to raise_error(ArgumentError, "expected one of #{valid_types}, got 'invalid'")
    end

    it_behaves_like "loads config", "transaction_set", "204"
    it_behaves_like "loads config", "segment", nil
  end

  describe ".load_segment_config" do
    it_behaves_like "loads config", "segment", "st"
  end

  describe ".load_segment_configs" do
    it_behaves_like "loads config", "segment", nil
  end

  describe ".load_transaction_set_config" do
    it_behaves_like "loads config", "transaction_set", "204"
  end

  describe ".load_transaction_set_configs" do
    it_behaves_like "loads config", "transaction_set", nil
  end

  describe ".load_element_config" do
    it_behaves_like "loads config", "element", 143
  end

  describe ".load_element_configs" do
    it_behaves_like "loads config", "element", nil
  end
end
