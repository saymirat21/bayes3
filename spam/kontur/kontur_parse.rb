require 'nokogiri'
require 'open-uri'

links = %w[
https://kontur.ru/articles/4970
https://kontur.ru/articles/5654
https://kontur.ru/articles/5653
https://kontur.ru/articles/2884
https://kontur.ru/articles/2945
https://kontur.ru/articles/5651
https://kontur.ru/articles/5414
https://kontur.ru/articles/5650
https://kontur.ru/articles/4164
https://kontur.ru/articles/4872
https://kontur.ru/articles/5648
https://kontur.ru/articles/1091
https://kontur.ru/articles/2877
https://kontur.ru/articles/5647
https://kontur.ru/articles/5644
https://kontur.ru/articles/5635
https://kontur.ru/articles/5642
https://kontur.ru/articles/5630
https://kontur.ru/articles/5641
https://kontur.ru/articles/5639
https://kontur.ru/articles/5633
https://kontur.ru/articles/5632
https://kontur.ru/articles/4795
https://kontur.ru/articles/5631
https://kontur.ru/articles/5627
https://kontur.ru/articles/5628
https://kontur.ru/articles/5626
https://kontur.ru/articles/1830
https://kontur.ru/articles/5623
https://kontur.ru/articles/5620
https://kontur.ru/articles/2549
https://kontur.ru/articles/5617
https://kontur.ru/articles/4551
https://kontur.ru/articles/5618
https://kontur.ru/articles/5616
https://kontur.ru/articles/5615
https://kontur.ru/articles/5613
https://kontur.ru/articles/5612
https://kontur.ru/articles/5611
https://kontur.ru/articles/5609
https://kontur.ru/articles/5607
https://kontur.ru/articles/4804
https://kontur.ru/articles/5608
]

nodes = [
'body h1.article-announce__title',
'body h1.article-announce__desc',
'section.content-block p'
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


