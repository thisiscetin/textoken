module Textoken
  # Finds matching regexps and splits them
  # When a matching regexps found the word gets splitted by space
  # Words Array merges splitted array
  class Split < Option
    def priority
      1
    end

    def tokenize(text_arr)
      regexps.each do |r|
        text_arr = match_and_update(text_arr, Regexp.new(r))
      end
      text_arr
    end

    private

    def match_and_update(t, regexp)
      t.each_with_index do |w, i|
        matching = w.index(regexp)
        t = replace_word(t, i, push_and_split(w, matching)) if matching
      end
    end

    def replace_word(text, i, new_words)
      text.delete_at(i)
      new_words.reverse_each { |w| text.insert(i, w) }
      text
    end
    
    def push_and_split(word, index)
      word.insert(index, ' ').split(' ')
    end
  end
end
