module Textoken
  # Inits options, findings and responds to tokens
  # Does not raise error when text or options are nil
  # Splits the text and makes it ready for other operations
  class Base
    attr_reader :text, :dont_split, :findings, :options

    def initialize(text, opt = nil)
      @text     = initial_split(text)
      @options  = Options.new(opt)
    end

    def tokens
      options.collection.each do |option|
        if @findings.nil?
          @findings = option.tokenize(self)
        else
          @findings &= option.tokenize(self)
        end
      end

      Tokenizer.new(self).tokens
    end

    def words
      # tokenize options but do not make the last split
      @dont_split = true
      tokens
    end

    private

    def initial_split(text)
      text ? text.split(' ') : []
    end
  end
end
