module Textoken
  # This option object excludes words in text via matching regexp
  # Non-excluded words pushed to findings array
  class Exclude
    include ConditionalOption

    # base.text is raw tokens splitted with ' '
    # values are Regexps array to search
    # base.findings, Findings object for pushing matching tokens
    def tokenize(base)
      @base = base
      tokenize_if { |word, regexp| !word.match(regexp) }
    end
  end
end
