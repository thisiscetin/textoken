module Textoken
  # xx
  class LessThan
    attr_reader :number, :findings

    def priority
      1
    end

    def initialize(value)
      check_value(value)
      @number = value
      @findings = Findings.new
    end

    def tokenize(base)
      base.text.each_with_index do |w, i|
        findings.push(i, w) if w.length < number
      end
      findings.result
    end

    private

    def check_value(value)
      return if value.class == Fixnum && value > 1
      Textoken.type_err "value #{value} is not permitted for
        less_than option it has to be 2 at least."
    end
  end
end
