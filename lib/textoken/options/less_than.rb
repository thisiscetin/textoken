module Textoken
  # This option object picks words in text with less than length
  # of the option value
  class LessThan
    include NumericOption

    private

    def tokenize_condition
      tokenize_if { |word| word.length < number }
    end

    def validate_option_value
      validate { |value| value > 1 }
    end
  end
end
