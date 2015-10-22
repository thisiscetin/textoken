module Textoken
  # This module will be shared in options like, only and exclude
  module ConditionalOption
    include TokenizableOption

    attr_reader :regexps, :findings, :base

    def priority
      1
    end

    def initialize(values)
      @regexps  = Searcher.new(values).regexps
      @findings = Findings.new
    end

    private

    def tokenize_if(&block)
      regexps.each do |r|
        base.text.each_with_index do |w, i|
          findings.push(i, w) if block.call(w, r)
        end
      end
      findings.result
    end
  end
end
