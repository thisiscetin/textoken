module Textoken
  # 2 duties;
  # i- initialize options object with user given options
  # ii- split-text
  # iii- return tokens
  class Split < Option
    def priority
      2
    end
  end
end
