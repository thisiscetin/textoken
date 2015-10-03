module Textoken
  # Scanner finds tokens in a word with regexp
  # If word does not match regexp returns an empty Array
  class Scanner
    attr_reader :word, :regexp

    def initialize(word, regexp)
      @word       = word
      @regexp     = regexp
      check_types
    end

    def result
      scan = word.scan(regexp)
      scan.length > 0 ? partition(scan, word) : []
    end

    private

    def partition(scan, word)
      scan.each do |p|
        word = word.gsub(p, ' ' + p + ' ')
      end
      word.split(' ')
    end

    def check_types
      return if word.is_a?(String) && regexp.is_a?(Regexp)
      Textoken.type_err("#{regexp} should be Regexp and #{word}
        has to be a string.")
    end
  end
end
