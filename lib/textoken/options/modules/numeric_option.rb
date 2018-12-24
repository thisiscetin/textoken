module Textoken
  # This module will be shared in options like, more_than and less_than
  module NumericOption
    include TokenizableOption

    attr_reader :number, :findings

    def priority
      2
    end

    def initialize(value)
      @number = value
      @findings = Findings.new
      validate_option_value
    end

    private

    def tokenize_if(&code)
      base.text.each_with_index do |w, i|
        findings.push(i, w) if code.call(w)
      end
      findings.result
    end

    def validate(&code)
      return if number.class == Integer && code.call(number)
      Textoken.expression_err "value #{number} is not permitted for
        #{self.class.name} option."
    end
  end
end
