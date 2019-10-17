require 'nokogiri'
require 'open-uri'

links = %w[
https://kontur.ru/articles/4819
https://kontur.ru/articles/5636
https://kontur.ru/articles/5629
https://kontur.ru/articles/1083
https://kontur.ru/articles/4622
https://kontur.ru/articles/5459
https://kontur.ru/articles/5453
https://kontur.ru/articles/1233
https://kontur.ru/articles/4686
https://kontur.ru/articles/5406
https://kontur.ru/articles/5048
https://kontur.ru/articles/2946
https://kontur.ru/articles/4607
https://kontur.ru/articles/4715
https://kontur.ru/articles/5336
https://kontur.ru/articles/5179
https://kontur.ru/articles/5161
https://kontur.ru/articles/4827
https://kontur.ru/articles/4868
https://kontur.ru/articles/5045
https://kontur.ru/articles/4948
https://kontur.ru/articles/4966
https://kontur.ru/articles/4958
https://kontur.ru/articles/4955
https://kontur.ru/articles/4927
https://kontur.ru/articles/4864
https://kontur.ru/articles/4830
https://kontur.ru/articles/4667
https://kontur.ru/articles/4650
https://kontur.ru/articles/4633
https://kontur.ru/articles/4606
https://kontur.ru/articles/2909
https://kontur.ru/articles/2493
https://kontur.ru/articles/2420
https://kontur.ru/articles/1802
https://kontur.ru/articles/1789
https://kontur.ru/articles/1490
https://kontur.ru/articles/1340
https://kontur.ru/articles/1196
https://kontur.ru/articles/1126
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


