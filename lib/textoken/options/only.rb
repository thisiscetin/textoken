module Textoken
  # 2 duties;
  # i- initialize options object with user given options
  # ii- split-text
  # iii- return tokens
  class Only < Option
    def priority
      2
    end
  end
end
