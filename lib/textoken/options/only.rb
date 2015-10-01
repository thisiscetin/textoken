module Textoken
  # This option object selects words in text via matching regexp
  # The public interface of this class is in ConditionalOption module
  class Only < Option
    include ConditionalOption

    def tokenize(base)
      base.text.each_with_index do |w, i|

      end
    end

    def regexp
      
    end
  end
end
