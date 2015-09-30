module Textoken
  # This class reads YAML file under searchables/values,
  # returns array of regexps representing values passed as an argument
  class Searcher
    attr_reader :values, :yaml

    def initialize(values)
      @values   = check_and_init_values(values)
      @yaml     = load_file
      @regexps  = []
    end

    def regexps
      match_keys
      @regexps
    end

    private

    def check_and_init_values(values)
      values.split(',').map(&:strip)
    rescue
      Textoken.expression_err("#{values} are not supported. Correct format,
        has to be 'numbers' or 'numbers, dates, phones'")
    end

    def load_file
      YAML.load_file("#{GEM_ROOT}/lib/textoken/regexps/option_values.yml")
    end

    # here we do check for option values user supplied
    # option values has to be declared at option_values.yml
    def match_keys
      values.each do |v|
        Textoken.expression_err("#{v}: is not permitted.") unless yaml.key?(v)
        add_regexps(yaml[v])
      end
    end

    def add_regexps(arr)
      @regexps += arr
    end
  end
end
