module Textoken
  # This option object selects words in text via matching regexp
  # The public interface of this class is in ConditionalOption module
  class Only < Option
    include ConditionalOption

    # base.text is raw tokens splitted with ' '
    # values are Regexps array to search
    # base.findings, Findings object for pushing matching tokens
    def tokenize(base)
      base.text.each_with_index do |w, i|
        base.findings.push(i, w)
      end
    end
  end
end
