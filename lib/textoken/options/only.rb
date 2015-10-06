module Textoken
  # This option object selects words in text via matching regexp
  # regexp should be defined in option_values.yml
  class Only
    include ConditionalOption

    # base.text is raw tokens splitted with ' '
    # values are Regexps array to search
    # base.findings, Findings object for pushing matching tokens
    def tokenize(base)
      @base = base
      tokenize_if { |word, regexp| word.match(regexp) }
    end
  end
end
