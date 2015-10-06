module Textoken
  # This class is responsible of searching text with user given
  # regexp value, and add findings to the result
  class OnlyRegexp < Only
    include RegexpOption
  end
end
