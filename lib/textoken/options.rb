module Textoken
  # Creates collection array, checks basic hash format.
  # Responds to collection as an array of options sorted by
  # priority. Does not raise an exception when options are nil
  class Options
    attr_reader :options

    def initialize(opt)
      @options = opt
      @collection = []
      check_options_format
    end

    def collection
      options.each { |k, v| init_option(k, v) } if options
      sort_collection
      @collection
    end

    private

    def check_options_format
      return if options.nil? || options.is_a?(Hash)
      Textoken.expression_err("#{options} is not a valid format, you can use;
        Textoken('Alfa beta.', exclude: 'dates, phones', more_than: 3)")
    end

    def init_option(key, value)
      @collection << Textoken::OptionFactory.build(key, value)
    end

    def sort_collection
      @collection.sort! { |a, b| a.priority <=> b.priority }
    end
  end
end
