module Textoken
  # Inits options, findings and responds to tokens
  # Does not raise error when text or options are nil
  # Splits the text and makes it ready for other operations
  class Base
    attr_reader :text, :options, :findings

    def initialize(text, opt = nil)
      @text     = initial_split(text)
      @options  = Options.new(opt)
      @findings = Findings.new
    end

    def tokens
      Tokenizer.new(self).tokens
    end

    private

    def initial_split(text)
      text ? text.split(' ') : []
    end
  end
end
