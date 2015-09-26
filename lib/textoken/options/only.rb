module Textoken
  # xx
  class Only < Option
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

    def find_words(text, regex)
      text.each { |w| @findings += scan(regex, w) }
    end

    def scan(regex, word)
      word.scan(regex)
    end
  end
end
