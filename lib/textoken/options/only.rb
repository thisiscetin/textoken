module Textoken
  # This option object selects words in text via matching regexp
  # The public interface of this class is in ConditionalOption module
  class Only < Option
    include ConditionalOption

    private

    def find_words(text, regex)
      text.each { |w| @findings += scan(regex, w) }
    end
  end
end
