module Textoken
  # This module will be shared in options like, only_regexp and exclude_regexp
  module TokenizableOption
    attr_reader :base

    def tokenize(base)
      @base = base
      tokenize_condition
    end

    private

    def tokenize_condition
      Textoken.type_err('tokenize_condition method has to be implemented
        for Options.')
    end
  end
end
