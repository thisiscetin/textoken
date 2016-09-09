module Textoken
  # This is the last step in the process
  # Takes findings objects and makes finishing punctuation split
  # Does not split if base.dont_split is true
  class Tokenizer
    attr_reader :base, :result, :col

    def initialize(base)
      @base    = base
      @result  = []
      @col     = base.options.collection.length > 0 ? base.findings : base.text
    end

    def tokens
      return col if base.dont_split
      split_punctuations
      @result
    end

    private

    def split_punctuations
      col.each do |w|
        @result += Scanner.new(w, default_regexp).result || [w]
      end
    end

    # will be used for finding punctuations
    def default_regexp
      /[^[:word:]+]/
    end
  end
end
