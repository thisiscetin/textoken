module Textoken
  # xx
  class Exclude < Option
    def priority
      3
    end

    def tokenize(text_arr)
      regexps.each do |r|
        find_words(text_arr, Regexp.new(r))
      end
      @findings
    end

    private

    def find_words(text_arr, regex)
      text_arr.each { |w| @findings << w if scan(regex, w).empty? }
    end

    def scan(regex, word)
      word.scan(regex)
    end
  end
end
