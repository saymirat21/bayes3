require 'nokogiri'
require 'open-uri'

links = %w{
https://www.banki.ru/news/lenta/?id=10908044
https://www.banki.ru/news/lenta/?id=10908014
https://www.banki.ru/news/lenta/?id=10907982
https://www.banki.ru/news/lenta/?id=10907963
https://www.banki.ru/news/lenta/?id=10907961
https://www.banki.ru/news/lenta/?id=10907950
https://www.banki.ru/news/lenta/?id=10907940
https://www.banki.ru/news/lenta/?id=10907866
https://www.banki.ru/news/lenta/?id=10907859
https://www.banki.ru/news/lenta/?id=10907856
https://www.banki.ru/news/lenta/?id=10907848
https://www.banki.ru/news/lenta/?id=10907837
https://www.banki.ru/news/lenta/?id=10907812
https://www.banki.ru/news/lenta/?id=10907801
https://www.banki.ru/news/lenta/?id=10907776
https://www.banki.ru/news/lenta/?id=10907727
https://www.banki.ru/news/lenta/?id=10907706
https://www.banki.ru/news/lenta/?id=10907696
https://www.banki.ru/news/lenta/?id=10907618
https://www.banki.ru/news/lenta/?id=10907550
https://www.banki.ru/news/lenta/?id=10907496
https://www.banki.ru/news/lenta/?id=10907471
https://www.banki.ru/news/lenta/?id=10907408
https://www.banki.ru/news/lenta/?id=10907415
https://www.banki.ru/news/lenta/?id=10907354
https://www.banki.ru/news/lenta/?id=10907326
https://www.banki.ru/news/lenta/?id=10907291
https://www.banki.ru/news/lenta/?id=10907289
https://www.banki.ru/news/lenta/?id=10907287
https://www.banki.ru/news/lenta/?id=10907273
https://www.banki.ru/news/lenta/?id=10907265
https://www.banki.ru/news/lenta/?id=10907235
https://www.banki.ru/news/lenta/?id=10907200
https://www.banki.ru/news/lenta/?id=10907199
https://www.banki.ru/news/lenta/?id=10907180
https://www.banki.ru/news/lenta/?id=10907086
https://www.banki.ru/news/lenta/?id=10907072
https://www.banki.ru/news/lenta/?id=10906990
https://www.banki.ru/news/lenta/?id=10906984
}

nodes = [
'body h1.header-h0',
'body main article p'
]

links.each_with_index do |link, index|
  file = File.new("#{index}.txt", 'w')

  doc = Nokogiri::HTML(open(link), nil, Encoding::UTF_8.to_s)

  nodes.each do |node|
    doc.css(node).each do |tag|
      #puts tag.content
      file.write("#{tag.text}\n")
    end
  end
  
  file.close
end


