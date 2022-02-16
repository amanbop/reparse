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


    def split_term_before(term_to_split, separator )
        first_term=term_to_split.split(separator).first.strip
    end

    def split_term_after(term_to_split, separator )
        first_term=term_to_split.split(separator).last.strip
    end

    def load_search_terms

         search_terms_file_path = File.expand_path('../../search_terms/', __FILE__)
         search_terms = []
         puts "search_terms_file_path : " + search_terms_file_path
        Dir.foreach(search_terms_file_path) do |filename|
            next if filename == '.' or filename == '..'
            filepath = "#{search_terms_file_path}/#{filename}"
            temp_search_terms = File.readlines(filepath).map{|x| x.strip}
            temp_search_terms.each_with_index do |v,k|
                # puts "#{k} : #{v}"
                if v.include?('(')

                    separator='('
                    # puts "#{k} : #{v}"
                    new_term_before_separator = split_term_before(v,separator)
                    # puts "new_term_before_separator:#{new_term_before_separator}"
                    temp_search_terms[k]=new_term_before_separator
                    # puts "#{k} : #{temp_search_terms[k]}"
                    new_term_after_separator=split_term_after(v,separator)

                    separator=')'
                    new_term_after_separator=split_term_before(new_term_after_separator,separator)
                    # puts "new_term_after_separator:#{new_term_after_separator}"
                    temp_search_terms.push(new_term_after_separator)
                    # puts temp_search_terms.last
                end
                if v.include?('–')
                    
                    separator='–'
                    # puts "#{k} : #{v}"
                    new_term_before_separator = split_term_before(v,separator)
                    # puts "new_term_before_separator:#{new_term_before_separator}"
                    temp_search_terms[k]=new_term_before_separator
                    # puts "#{k} : #{temp_search_terms[k]}"
                    new_term_after_separator=split_term_after(v,separator)

                    separator='–'
                    new_term_after_separator=split_term_before(new_term_after_separator,separator)
                    # puts "new_term_after_separator:#{new_term_after_separator}"
                    temp_search_terms.push(new_term_after_separator)
                    # puts temp_search_terms.last
                end
            end #temp_search_terms.each_with_index do |v,k|
            search_terms = search_terms + temp_search_terms
        end #Dir.foreach(search_terms_file_path) do |filename|
        # puts File.expand_path('../../search_terms/*.txt', __FILE__)
        # puts Dir[File.expand_path('../../search_terms/*.txt', __FILE__)].to_s
        # Dir[File.expand_path('../../search_terms/*.txt', __FILE__)].each do |file|
        #     puts File.basename(file,".txt")
        #   end
        search_terms.each_with_index{|v,k| puts "#{k} : #{v}" }
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
