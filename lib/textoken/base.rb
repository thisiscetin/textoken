module Textoken
  # Inits options and responds to tokens
  # Default option for Textoken is split: 'punctuations'
  class Base
    attr_reader :text, :options

    def initialize(text, opt = nil)
      @text     = initial_split(text)
      @options  = Options.new(init_options(opt))
    end

    def tokens
      return text if options.nil?
      options.tokenize(text)
    end

    private

    # by default splits punctuations
    def init_options(opt)
      opt ? def_option.merge!(opt) : def_option
    end

    def def_option
      { split: 'punctuations' }
    end

    def initial_split(text)
      text.split(' ')
    end
  end
end
