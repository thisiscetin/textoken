module Textoken
  # This option object picks words in text with more than length
  # of the option value
  class MoreThan
    attr_reader :number, :findings

    def priority
      2
    end

    def initialize(value)
      check_value(value)
      @number   = value
      @findings = Findings.new
    end

    def tokenize(base)
      base.text.each_with_index do |w, i|
        findings.push(i, w) if w.length > number
      end
      findings.result
    end

    private

    def check_value(value)
      return if value.class == Fixnum && value >= 0
      Textoken.type_err "value #{value} is not permitted for
        more_than option it has to be 0 at least."
    end
  end
end
