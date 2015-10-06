module Textoken
  # This module will be shared in options like, only_regexp and exclude_regexp
  module RegexpOption
    include ConditionalOption

    def initialize(value)
      @regexps  = [Regexp.new(value)]
      @findings = Findings.new
    end
  end
end
