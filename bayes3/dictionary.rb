require 'yaml'
require_relative 'import_articles'

words = DICTIONARY[:ham].concat(DICTIONARY[:spam]).uniq

File.open('../yaml data/dictionary.yaml', 'w') do |file|
  file.truncate(0)
  file.write(words.to_yaml)
end


