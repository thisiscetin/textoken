module Textoken
  # 2 duties;
  # i- initialize options object with user given options
  # ii- split-text
  # iii- return tokens
  class Option
    attr_reader :values

    def initialize(values)
      @values = values
      post_initialize
    end

    def post_initialize
      nil
    end

    # should be implemented for every option class
    def priority
      error "priority for #{self.class} should be implemented."
    end

    # should be implemented for every option class
    def tokenize(_text_arr)
      error "tokenize for #{self.class} should be implemented."
    end

    def validates_positive_numericality
      return if values.class == Fixnum && values > 0
      type_error "values #{values} is not permitted for #{self.class.name}"
    end

    private

    def error(msg)
      fail InheritenceError, msg
    end

    def type_error(msg)
      fail TypeError, msg
    end
  end
end
