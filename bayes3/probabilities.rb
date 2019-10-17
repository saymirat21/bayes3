require 'yaml'
require_relative 'import_articles'

keywords_probs = Hash.new

KEYWORDS.each do |keyword|
  keywords_probs[keyword] = [ [],[] ]
end

[:ham, :spam].each_with_index do |category, index|
  KEYWORDS.each do |keyword|
    counter = 0
      ARTICLES[category].each do |article|
        counter += 1 if article.match?(keyword)
      end
    keywords_probs[keyword][index] << (counter/(ARTICLES[category].length.to_f)).round(5)
    end
end

File.open('../yaml data/keywords_probs.yaml', 'w') do |file|
  file.truncate(0)
  file.write(keywords_probs.to_yaml)
end

