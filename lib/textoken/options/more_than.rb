module Textoken
  # 2 duties;
  # i- initialize options object with user given options
  # ii- split-text
  # iii- return tokens
  class MoreThan < Option
    def priority
      1
    end
  end
end
