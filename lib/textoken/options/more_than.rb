module Textoken
  # This option object picks words in text with more than length
  # of the option value
  class MoreThan
    include NumericOption

    def tokenize(base)
      @base = base
      tokenize_if { |word| word.length > number }
    end

    private

    def validate_option_value(value)
      validate { value.class == Fixnum && value >= 0 }
    end
  end
end
