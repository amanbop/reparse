# frozen_string_literal: true

require_relative "reparse/version"

module Reparse
  class Error < StandardError; end
  class Reparse

    attr_accessor :input_text, :word_scrub_list, :punctuation_scrub_list
  
    
    def parse
        
        check_input_text

        set_word_scrub_list
    
        set_punc_scrub_list

        remove_punc_marks

        word_list = remove_scrub_words

        word_hash = count_words(word_list)

    end

    private

    def check_input_text

        if @input_text.nil?
            puts 'No text given to parse'
            return
        else
            @scrubbed_text = @input_text
        end
    end

    def set_word_scrub_list

        default_words_scrub_list = ['and','the','of','for','in','to','is','with','a','an','on','our']    

        if  @word_scrub_list.nil? 
            @words_scrub_list =  default_words_scrub_list 
        else 
            @words_scrub_list = (default_words_scrub_list + @word_scrub_list).uniq
        end

    end

    def set_punc_scrub_list

        default_punctuations_scrub_list = [';',':',',','.','(',')','[',']',"'",'"']

        if   @punctuation_scrub_list.nil?
            @punctuations_scrub_list =  default_punctuations_scrub_list
       else
            @punctuations_scrub_list = (default_punctuations_scrub_list + @punctuation_scrub_list).uniq
       end
    end

    def remove_punc_marks

        # Remove puncuation marks from the text
        @punctuations_scrub_list.each do |punc_mark|
            @scrubbed_text = @scrubbed_text.gsub(punc_mark, '')
        end
    end    
    
    def remove_scrub_words

        # Split text into a list of words
        word_list = @scrubbed_text.split(' ')

        # Remove the words to scrub from the list of words
        @words_scrub_list.each do |word|
            word_list.delete(word.upcase)
            word_list.delete(word.downcase)
            word_list.delete(word.capitalize)
        end
        return word_list
    end       
    
    def count_words(word_list)
        word_hash = {}

        #Count and collect the words in a hash
        word_list.each do |word|
            if word_hash[word].nil? 
                word_hash[word] = 1
            else
                word_hash[word] = word_hash[word].to_i + 1
            end
        end

        # Sort the word hash in descending order
        word_count =  word_hash.sort_by{ |k, v| v }.reverse.to_h 

    end        

  end

end
