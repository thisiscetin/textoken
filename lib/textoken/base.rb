module Textoken
  # Base class is responsible of sending text and options to related classes
  # as a message. Also combines response with Combinator class
  class Base
    attr_reader :text, :tokenizers

    def initialize(text, opt = nil)
      @text       = text
      @tokenizers = []
      opt.each { |k, v| tokenizers << init_tokenizer(k, v) } if opt
    end

    def tokens
      return Default.new(text).tokens if tokenizers.empty?
      Textoken.intersection(tokens_array)
    end

    private

    def tokens_array
      tokenizers.map(&:tokens)
    end

    def init_tokenizer(klass_name, value)
      Textoken.const_get(klass_name.capitalize).new(text, value)
    rescue NameError
      Textoken.expression_error("#{klass_name}: #{value} is not a valid.")
    end
  end
end
