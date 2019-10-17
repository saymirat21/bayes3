require 'nokogiri'
require 'open-uri'

links = %w{
https://www.klerk.ru/buh/news/491068/
https://www.klerk.ru/buh/news/491067/
https://www.klerk.ru/buh/news/491064/
https://www.klerk.ru/buh/news/491049/
https://www.klerk.ru/buh/news/491057/
https://www.klerk.ru/buh/news/491065/
https://www.klerk.ru/buh/news/491040/
https://www.klerk.ru/buh/news/491031/
https://www.klerk.ru/buh/news/491022/
https://www.klerk.ru/buh/news/490997/
https://www.klerk.ru/buh/news/490966/
https://www.klerk.ru/buh/news/490977/
https://www.klerk.ru/buh/news/490975/
https://www.klerk.ru/buh/news/490955/
https://www.klerk.ru/buh/news/490922/
https://www.klerk.ru/buh/news/490920/
https://www.klerk.ru/buh/news/490891/
https://www.klerk.ru/buh/news/490874/
https://www.klerk.ru/buh/news/490849/
https://www.klerk.ru/buh/news/490817/
https://www.klerk.ru/buh/news/490806/
https://www.klerk.ru/buh/news/490782/
https://www.klerk.ru/buh/news/490656/
https://www.klerk.ru/buh/news/490760/
https://www.klerk.ru/buh/news/490631/
https://www.klerk.ru/buh/news/490741/
https://www.klerk.ru/buh/news/490745/
https://www.klerk.ru/buh/news/490723/
https://www.klerk.ru/buh/news/490721/
https://www.klerk.ru/buh/news/490719/
https://www.klerk.ru/buh/news/490632/
https://www.klerk.ru/buh/news/490691/
https://www.klerk.ru/buh/news/490689/
https://www.klerk.ru/buh/news/490687/
https://www.klerk.ru/buh/news/490682/
https://www.klerk.ru/buh/news/490684/
https://www.klerk.ru/buh/news/490680/
https://www.klerk.ru/buh/news/490671/
https://www.klerk.ru/buh/news/490663/
https://www.klerk.ru/buh/news/490652/
}


nodes = [
'body main h1',
'body main .article__content p'
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


