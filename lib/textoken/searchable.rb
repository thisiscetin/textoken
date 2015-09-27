module Textoken
  # This class reads YAML file under searchables/values,
  # returns array of regexps representing values passed as an argument
  class Searchable
    attr_reader :values, :yaml

    def initialize(values)
      @values = values.split(',').map(&:strip)
      @yaml   = YAML.load_file('lib/textoken/regexps/option_values.yml')
      @regexs = []
    end

    def regexps
      match_keys
      @regexs
    end

    private

    def match_keys
      values.each do |v|
        Textoken.expression_err("#{v}: is not permitted.") unless yaml.key?(v)
        add_regexps(yaml[v])
      end
    end

    def add_regexps(arr)
      @regexs += arr
    end
  end
end
