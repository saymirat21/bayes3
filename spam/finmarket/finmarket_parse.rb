require 'nokogiri'
require 'open-uri'

links = %w[
http://www.finmarket.ru/currency/news/5095046
http://www.finmarket.ru/currency/news/5095236
http://www.finmarket.ru/shares/news/5095235
http://www.finmarket.ru/currency/news/5095215
http://www.finmarket.ru/bonds/news/5095194
http://www.finmarket.ru/news/5095208
http://www.finmarket.ru/currency/news/5095211
http://www.finmarket.ru/currency/news/5095175
http://www.finmarket.ru/news/5095050
http://www.finmarket.ru/bonds/news/5095195
http://www.finmarket.ru/news/5095164
http://www.finmarket.ru/bonds/news/5095155
http://www.finmarket.ru/bonds/news/5095176
http://www.finmarket.ru/currency/news/5095168
http://www.finmarket.ru/database/news/5095047
http://www.finmarket.ru/database/news/5095151
http://www.finmarket.ru/news/5095133
http://www.finmarket.ru/news/5095130
http://www.finmarket.ru/bonds/news/5095112
http://www.finmarket.ru/bonds/news/5095114
http://www.finmarket.ru/bonds/news/5095113
http://www.finmarket.ru/database/news/5095049
http://www.finmarket.ru/database/news/5095042
http://www.finmarket.ru/news/5095045
http://www.finmarket.ru/currency/news/5095052rrency/news/5095053
http://www.finmarket.ru/bonds/news/5094976
http://www.finmarket.ru/shares/news/5095022
http://www.finmarket.ru/shares/news/5095022
http://www.finmarket.ru/bonds/news/5094976
http://www.finmarket.ru/bonds/news/5094974
http://www.finmarket.ru/shares/news/5094994
http://www.finmarket.ru/currency/news/5094979
http://www.finmarket.ru/currency/news/5094980
http://www.finmarket.ru/currency/news/5094978
http://www.finmarket.ru/news/5094955
http://www.finmarket.ru/news/5094948
http://www.finmarket.ru/news/5094932
http://www.finmarket.ru/news/5094931
http://www.finmarket.ru/bonds/news/5094918
http://www.finmarket.ru/bonds/news/5094910
http://www.finmarket.ru/bonds/news/5094907
]


nodes = [
'body h1.title',
'body .content .body[itemprop="articleBody"]'
]

links.each_with_index do |link, index|
  file = File.new("#{index}.txt", 'w')

  doc = Nokogiri::HTML(open(link))

  nodes.each do |node|
    doc.css(node).each do |tag|
      #puts tag.content
      file.write("#{tag.text}\n")
    end
  end
  
  file.close
end


