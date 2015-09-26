module Textoken
  # xx
  class MoreThan < Option
    def priority
      2
    end

    def post_initialize
      validates_positive_numericality
    end

    def tokenize(text_arr)
      text_arr.select { |text| text.length > values }
    end
  end
end
