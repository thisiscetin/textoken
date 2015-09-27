module Textoken
  # This option validates positive numericality
  # Removes words in text_arr with a length condition
  # Validation and post_initialization held in NumbericOption module
  class MoreThan < Option
    include NumericOption

    def tokenize(text_arr)
      text_arr.select { |text| text.length > values }
    end
  end
end
