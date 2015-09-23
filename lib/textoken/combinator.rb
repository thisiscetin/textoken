module Textoken
  # ss
  class Combinator
    attr_reader :tokenizers

    def initialize(tokenizers)
      @tokenizers = tokenizers
    end

    def intersections
      arr = []
      tokenizers.each { |t| arr << t.tokens }
      arr
    end
  end
end
