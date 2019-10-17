require 'yaml'
require_relative 'import_articles'

words_frequencies = Hash.new

DICTIONARY.each do |category, words|
  progress_counter = 0
  words_amount = words.length
  words_frequencies[category] = Hash.new

  words.each do |word|
    occurrences_count = 1
    ARTICLES_SPLITTED[category].each do |article|
        occurrences_count += 1 if article.include?(word)
      end
   words_frequencies[category][word] = occurrences_count
   puts "#{category}: #{progress_counter} of #{words_amount}"
   progress_counter += 1
  end
end

words_frequencies.each do |category, frequencies|
  File.open("../yaml data/#{category}_words_frequencies.yaml", 'w') do |file|
    file.truncate(0)
    file.write(frequencies.to_yaml)
  end
end

