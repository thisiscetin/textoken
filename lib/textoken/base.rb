module Textoken
  # ff
  class Base
    attr_reader :options, :text, :tokenizers

    def initialize(text, options = nil)
      @text       = text
      @options    = options
      @tokenizers = []
    end

    def tokens
      return Default.new(self).tokens if options.nil?
      options.each { |k, v| tokenizers << init_tokenizer(k, v) }
      intersecting_tokens
    end

    private

    def intersecting_tokens
      Combinator.new(tokenizers).intersections
    end

    def init_tokenizer(klass_name, value)
      Textoken.const_get(klass_name.capitalize).new(self, value)
    rescue NameError
      expression_error("#{klass_name}: #{value} is not a valid option.")
    end

    def expression_error(msg)
      fail ExpressionError, msg
    end
  end
end
