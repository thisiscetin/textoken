module Textoken
  # This option object picks words in text with more than length
  # of the option value
  class MoreThan
    include NumericOption

    private

    def tokenize_condition
      tokenize_if { |word| word.length > number }
    end

    def validate_option_value(value)
      validate { value.class == Fixnum && value >= 0 }
    end
  end
end
