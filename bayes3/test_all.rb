require 'csv'
require 'yaml'
require_relative 'import_articles'


# ---- PROBABILITIES ----
keywords_probs = YAML.load_file('../yaml data/keywords_probs.yaml')
# ---- PROBABILITIES ----

# ---- COMPUTING ----   


[:spam, :ham].each do |category|
  counters = { spam: 0, ham: 0 }
  amounts = { spam: ARTICLES[:ham].length.to_f, ham: ARTICLES[:spam].length.to_f }
  
  prob_ham = (amounts[:ham]/(amounts[:ham] + amounts[:spam])).round(5)
  prob_spam = (amounts[:spam]/(amounts[:ham] + amounts[:spam])).round(5)

  ARTICLES[category].each do |article|
    article.gsub!(/Ё|ё/, 'е')
    article.downcase!
    
    sentence_occurrences = Hash.new

    keywords_probs.keys.each do |keyword|
      if article.match?(keyword)
        sentence_occurrences[keyword] = 1
      else
        sentence_occurrences[keyword] = 0
      end
    end

    sentence_probs = { ham: [],  spam: [] }
    
    sentence_occurrences.each do |word, occurrence|
      if occurrence == 1
       sentence_probs[:ham] << keywords_probs[word][0].join.to_f
       sentence_probs[:spam] << keywords_probs[word][1].join.to_f
      elsif occurrence == 0
       sentence_probs[:ham] << 1 - keywords_probs[word][0].join.to_f
       sentence_probs[:spam] << 1 - keywords_probs[word][1].join.to_f
      end
    end

    sentence_probs[:ham] = sentence_probs[:ham].reduce(:*)
    sentence_probs[:spam] = sentence_probs[:spam].reduce(:*)

    sentence_spam_prob = (sentence_probs[:spam]*prob_spam)/((sentence_probs[:ham]*prob_ham) + (sentence_probs[:spam]*prob_spam))
    sentence_ham_prob = (sentence_probs[:ham]*prob_ham)/((sentence_probs[:ham]*prob_ham) + (sentence_probs[:spam]*prob_spam))  

    if sentence_ham_prob > sentence_spam_prob
      counters[:ham] += 1 
    else
      counters[:spam] += 1 
    end
  end 

  puts "Категория #{category.upcase}"
  puts "Всего статей: #{amounts[category].to_i}"
  puts "Количество статей отнесенных к ham: #{counters[:ham]} (#{(counters[:ham]/amounts[category]).round(2)}%)"
  puts "Количество статей отнесенных к spam: #{counters[:spam]} (#{(counters[:spam]/amounts[category]).round(2)}%)"
  print "\n\n" 
end


# ---- COMPUTING ----
