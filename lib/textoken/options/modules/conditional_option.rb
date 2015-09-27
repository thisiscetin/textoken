module Textoken
  module ConditionalOption
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

    def scan(regex, word)
      word.scan(regex)
    end
  end
end
