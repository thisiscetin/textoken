module Textoken
  # Base class is responsible of sending text and options to related classes
  # as a message. Also combines response with Combinator class
  class Base
    attr_reader :options, :text, :tokenizers

    def initialize(text, options = nil)
      @text       = text
      @options    = options
      @tokenizers = []
    end

    def tokens
      return Default.new(text).tokens if options.nil?
      options.each { |k, v| tokenizers << init_tokenizer(k, v) }
      intersecting_tokens
    end

    private

    # this combination allows us to use many options together like
    # include: 'numbers', exclude: 'dates'
    def intersecting_tokens
      Combinator.new(tokenizers.map(&:tokens)).intersections
    end

    def init_tokenizer(klass_name, value)
      Textoken.const_get(klass_name.capitalize).new(text, value)
    rescue NameError
      expression_error("#{klass_name}: #{value} is not a valid option.")
    end

    def expression_error(msg)
      fail ExpressionError, msg
    end
  end
end
