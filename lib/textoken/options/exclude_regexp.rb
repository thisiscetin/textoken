module Textoken
  # This class is responsible of searching text with user given
  # regexp value, and exclude findings from the result
  class ExcludeRegexp < Exclude
    include RegexpOption
  end
end
