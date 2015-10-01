module Textoken
  # This is the last step in the process
  # Takes findings objects and makes finishing punctuation split
  # Does not split if base.dont_split is true
  class Tokenizer
    attr_reader :base, :result

    def initialize(base)
      @base     = base
      @result   = []
    end

    def tokens
      return base.findings.result if base.dont_split
      split_punctuations
      @result
    end

    private

    def split_punctuations
      base.findings.collection.each do |w|
        @result += Scanner.new(w[1], default_regexp).result
      end
    end

    # will be used for finding punctuations
    def default_regexp
      Regexp.new('\W+')
    end
  end
end
