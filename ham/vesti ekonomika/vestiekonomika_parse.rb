require 'nokogiri'
require 'open-uri'

links = %w[
https://www.vestifinance.ru/articles/126492
https://www.vestifinance.ru/articles/126484
https://www.vestifinance.ru/articles/126476
https://www.vestifinance.ru/articles/125856
https://www.vestifinance.ru/articles/120179
https://www.vestifinance.ru/articles/117501
https://www.vestifinance.ru/articles/115680
https://www.vestifinance.ru/articles/114055
https://www.vestifinance.ru/articles/113551
https://www.vestifinance.ru/articles/113349
https://www.vestifinance.ru/articles/113028
https://www.vestifinance.ru/articles/112519
https://www.vestifinance.ru/articles/112410
https://www.vestifinance.ru/articles/109666
https://www.vestifinance.ru/articles/107343
https://www.vestifinance.ru/articles/104878
https://www.vestifinance.ru/articles/106151
https://www.vestifinance.ru/articles/103091
https://www.vestifinance.ru/articles/96078
https://www.vestifinance.ru/articles/96062
https://www.vestifinance.ru/articles/95623
https://www.vestifinance.ru/articles/126404
https://www.vestifinance.ru/articles/125522
https://www.vestifinance.ru/articles/125444
https://www.vestifinance.ru/articles/122303
https://www.vestifinance.ru/articles/121505
https://www.vestifinance.ru/articles/118203
https://www.vestifinance.ru/articles/116962
https://www.vestifinance.ru/articles/116784
https://www.vestifinance.ru/articles/116080
https://www.vestifinance.ru/articles/111215
https://www.vestifinance.ru/articles/108282
https://www.vestifinance.ru/articles/106239
https://www.vestifinance.ru/articles/121509
https://www.vestifinance.ru/articles/121388
https://www.vestifinance.ru/articles/116273
https://www.vestifinance.ru/articles/115236
https://www.vestifinance.ru/articles/109536
https://www.vestifinance.ru/articles/98992
https://www.vestifinance.ru/articles/98991
]




nodes = [
'body .b-material h1',
'body .b-material .b-material-body'
]

links.each_with_index do |link, index|
  file = File.new("#{index}.txt", 'w')

  doc = Nokogiri::HTML(open(link), nil, Encoding::UTF_8.to_s)

  nodes.each do |node|
    doc.css(node).each do |tag|
      #puts tag.text
      file.write("#{tag.text}\n")
    end
  end
  
  file.close
end


