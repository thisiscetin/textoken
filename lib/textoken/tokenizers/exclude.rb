module Textoken
  # This class exclude user preference in result set. Anything passed as
  # an argument like exclude: 'numbers' will initialize this class
  class Exclude < Default
    def tokens
      values
    end
  end
end
