module Textoken
  # This module will be shared in options like, only and exclude
  module ConditionalOption
    attr_reader :regexps, :findings

    def priority
      1
    end

    def initialize(values)
      @regexps  = Searcher.new(values).regexps
      @findings = Findings.new
    end
  end
end
