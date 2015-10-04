module Textoken
  # This module will be shared in options like, more_than and less_than
  module NumericOption
    attr_reader :number, :findings, :base

    def priority
      2
    end

    def initialize(value)
      validate_option_value(value)
      @number = value
      @findings = Findings.new
    end

    def tokenize_if(&code)
      base.text.each_with_index do |w, i|
        findings.push(i, w) if code.call(w)
      end
      findings.result
    end

    def validate(&code)
      return if code.call
      Textoken.type_err "value #{number} is not permitted for
        #{self.class.name} option."
    end
  end
end
