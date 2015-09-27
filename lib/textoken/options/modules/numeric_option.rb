module Textoken
  module NumericOption
    def priority
      2
    end

    def post_initialize
      validates_positive_numericality
    end

    private

    def validates_positive_numericality
      return if values.class == Fixnum && values > 0
      Textoken.type_err "values #{values} is not permitted for #{self.class.name}"
    end
  end
end