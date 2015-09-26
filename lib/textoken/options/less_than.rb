module Textoken
  # 2 duties;
  # i- initialize options object with user given options
  # ii- split-text
  # iii- return tokens
  class LessThan < Option
    def priority
      1
    end

    def post_initialize
      validates_positive_numericality
    end

    def tokenize(text_arr)
      text_arr.select { |text| text.length < values }
    end
  end
end
