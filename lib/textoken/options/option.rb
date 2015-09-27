module Textoken
  # This class is inherited in every option object
  class Option
    attr_reader :values, :regexps

    def initialize(values)
      @values = values
      post_initialize
    end

    # in numeric options like more_than this method has to be overriden
    def post_initialize
      @regexps  = Searchable.new(values).regexps
      @findings = []
    end

    # should be implemented for every option class
    def priority
      Textoken.inheritence_err "priority for #{self.class} 
      should be implemented."
    end

    # should be implemented for every option class
    def tokenize(_text_arr)
      Textoken.inheritence_err "tokenize for #{self.class} 
      should be implemented."
    end
  end
end
