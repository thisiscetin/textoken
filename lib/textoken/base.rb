module Textoken
  # i- initialize options object with user given options
  # ii- split-text
  # iii- return tokens
  class Base
    attr_reader :text, :options

    def initialize(text, opt = nil)
      @text     = initial_split(text)
      @options  = Options.new(opt) if opt
    end

    def tokens
      return text if options.nil?
      options.tokenize(text)
    end

    private

    def initial_split(text)
      text.split(' ')
    end
  end
end
