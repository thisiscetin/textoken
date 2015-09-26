module Textoken
  # i- init options with factory
  # ii- sort option collection according to priority
  # iii- pass tokenize to collection one by one
  class Options
    attr_reader :options

    def initialize(opt)
      @options = []
      opt.each { |k, v| init_option(k, v) } if opt
      sort_options
    end

    def tokenize(arr)
      options.each do |opt|
        break if arr.nil? || arr.length == 0
        arr = opt.tokenize(arr)
      end
      arr
    end

    private

    def init_option(key, value)
      @options << Textoken::OptionFactory.build(key, value)
    end

    def sort_options
      @options.sort! { |a, b| a.priority <=> b.priority }
    end
  end
end
