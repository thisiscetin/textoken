module Textoken
  # This module will be shared in options like, more_than and less_than
  module NumericOption
    attr_reader :number, :findings

    def priority
      2
    end

    def initialize(value)
      check_value(value)
      @number = value
      @findings = Findings.new
    end
  end
end
