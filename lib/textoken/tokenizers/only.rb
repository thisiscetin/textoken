module Textoken
  # This class exclude user preference in result set. Anything passed as
  # an argument like only: 'dates' will initialize this class
  class Only < Default
    def tokens
      values
    end
  end
end
