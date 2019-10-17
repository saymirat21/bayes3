require 'nokogiri'
require 'open-uri'

links = %w{
https://www.klerk.ru/buh/news/491069/
https://www.klerk.ru/buh/news/491063/
https://www.klerk.ru/buh/news/491053/
https://www.klerk.ru/buh/news/491065/
https://www.klerk.ru/buh/news/491042/
https://www.klerk.ru/buh/news/491037/
https://www.klerk.ru/buh/news/491034/
https://www.klerk.ru/buh/news/491032/
https://www.klerk.ru/buh/news/491030/
https://www.klerk.ru/buh/news/491024/
https://www.klerk.ru/buh/news/491021/
https://www.klerk.ru/buh/news/491019/
https://www.klerk.ru/buh/news/491029/
https://www.klerk.ru/buh/news/491011/
https://www.klerk.ru/buh/news/491009/
https://www.klerk.ru/buh/news/490979/
https://www.klerk.ru/buh/news/490980/
https://www.klerk.ru/buh/news/490890/
https://www.klerk.ru/buh/news/490897/
https://www.klerk.ru/buh/news/490973/
https://www.klerk.ru/buh/news/490969/
https://www.klerk.ru/buh/news/490961/
https://www.klerk.ru/buh/news/490959/
https://www.klerk.ru/buh/news/490914/
https://www.klerk.ru/buh/news/490960/
https://www.klerk.ru/buh/news/490947/
https://www.klerk.ru/buh/news/490949/
https://www.klerk.ru/buh/news/490933/
https://www.klerk.ru/buh/news/490924/
https://www.klerk.ru/buh/news/490885/
https://www.klerk.ru/buh/news/490921/
https://www.klerk.ru/buh/news/490919/
https://www.klerk.ru/buh/news/490918/
https://www.klerk.ru/buh/news/490915/
https://www.klerk.ru/buh/news/490916/
https://www.klerk.ru/buh/news/490910/
https://www.klerk.ru/buh/news/490913/
https://www.klerk.ru/buh/news/490895/
https://www.klerk.ru/buh/news/490872/
https://www.klerk.ru/buh/news/490864/
https://www.klerk.ru/buh/news/490863/
https://www.klerk.ru/buh/news/490866/
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


