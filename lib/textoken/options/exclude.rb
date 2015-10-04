module Textoken
  # This option object excludes words in text via matching regexp
  # Non-excluded words pushed to findings array
  class Exclude
    include ConditionalOption

    # base.text is raw tokens splitted with ' '
    # values are Regexps array to search
    # base.findings, Findings object for pushing matching tokens
    def tokenize(base)
      regexps.each do |r|
        base.text.each_with_index do |t, i|
          findings.push(i, t) unless t.match(r)
        end
      end
      findings.result
    end
  end
end
