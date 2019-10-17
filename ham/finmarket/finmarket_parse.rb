require 'nokogiri'
require 'open-uri'

links = %w[
http://www.finmarket.ru/main/article/5095170
http://www.finmarket.ru/main/article/5092566
http://www.finmarket.ru/main/article/5091683
http://www.finmarket.ru/main/article/5089851
http://www.finmarket.ru/main/article/5088838
http://www.finmarket.ru/main/article/5087967
http://www.finmarket.ru/main/article/5087889
http://www.finmarket.ru/main/article/5087103
http://www.finmarket.ru/main/article/5087041
http://www.finmarket.ru/main/article/5087005
http://www.finmarket.ru/news/5091128
http://www.finmarket.ru/news/5084891
http://www.finmarket.ru/news/5077225
http://www.finmarket.ru/main/news/5074663
http://www.finmarket.ru/news/5040196
http://www.finmarket.ru/news/5025360
http://www.finmarket.ru/news/5080656
http://www.finmarket.ru/news/4951537
http://www.finmarket.ru/news/4943310
http://www.finmarket.ru/news/4930954
http://www.finmarket.ru/news/4863895
http://www.finmarket.ru/news/4851334
http://www.finmarket.ru/main/article/4518251
http://www.finmarket.ru/news/4480802
http://www.finmarket.ru/news/4479504
http://www.finmarket.ru/news/4919145
http://www.finmarket.ru/main/article/4853586
http://www.finmarket.ru/news/4846651
http://www.finmarket.ru/news/4814306
http://www.finmarket.ru/news/4793294
http://www.finmarket.ru/news/4787455
http://www.finmarket.ru/news/4772743
http://www.finmarket.ru/news/4769296
http://www.finmarket.ru/news/4727417
http://www.finmarket.ru/news/4714903
http://www.finmarket.ru/news/4669883
http://www.finmarket.ru/news/4668541
http://www.finmarket.ru/news/4643499
http://www.finmarket.ru/news/4598616
http://www.finmarket.ru/main/article/4575973
http://www.finmarket.ru/main/article/4556849
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


