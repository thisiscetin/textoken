module Textoken
  # This option object excludes words in text via matching regexp
  # Non-excluded words pushed to findings array
  # The public interface of this class is in ConditionalOption module
  class Exclude < Option
    include ConditionalOption
    
    private

    def find_words(text_arr, regex)
      text_arr.each { |w| @findings << w if scan(regex, w).empty? }
    end
  end
end
