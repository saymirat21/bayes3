require 'nokogiri'
require 'open-uri'

links = %w[
https://www.rbc.ru/rbcfreenews/5da074509a7947ae991da175
https://www.rbc.ru/finances/11/10/2019/5da049c49a794798139619ea
https://www.rbc.ru/finances/11/10/2019/5da057459a79479f270afddf
https://www.rbc.ru/finances/11/10/2019/5da04ad99a794798894ef65a
https://www.rbc.ru/finances/11/10/2019/5da038fd9a7947920d125b60
https://www.rbc.ru/finances/11/10/2019/5da041639a794794b6d916ef
https://www.rbc.ru/finances/11/10/2019/5d9eff769a794718ce8a8096
https://www.rbc.ru/finances/11/10/2019/5d9f50929a794744068f571d
https://www.rbc.ru/rbcfreenews/5d9f29d39a79472de077a34a
https://www.rbc.ru/finances/10/10/2019/5d9f07399a79471c87b0546c
https://www.rbc.ru/finances/10/10/2019/5d9f02ca9a79471b5f06742c
https://www.rbc.ru/finances/10/10/2019/5d9eeb859a79470ed305347a
https://www.rbc.ru/rbcfreenews/5d9e0d779a7947501008abba
https://www.rbc.ru/finances/09/10/2019/5d9da13b9a794718ddfff4d7
https://www.rbc.ru/finances/09/10/2019/5d9da13b9a794718ddfff4d7
https://www.rbc.ru/finances/09/10/2019/5d9c8fd69a7947bbb137be40
https://www.rbc.ru/finances/08/10/2019/5d9c894c9a7947b7faa9b0a5
https://www.rbc.ru/finances/08/10/2019/5d9caa5d9a7947c7b2e5d718
https://www.rbc.ru/finances/08/10/2019/5d9b3be99a79473b83b824ed
https://www.rbc.ru/finances/07/10/2019/5d9b874f9a79475c84375ca0
https://www.rbc.ru/finances/07/10/2019/5d9b4be19a794744147ea22d
https://www.rbc.ru/finances/06/10/2019/5d9771ea9a7947a50c3e78d2
https://www.rbc.ru/business/11/10/2019/5da0814c9a7947b5beebfc72
https://www.rbc.ru/finances/11/10/2019/5da049c49a794798139619ea
https://www.rbc.ru/society/11/10/2019/5da01e6e9a794785cd4cd1e6
https://www.rbc.ru/economics/11/10/2019/5d9f0cfe9a7947211317f5c9
https://www.rbc.ru/economics/10/10/2019/5d9eee5d9a7947101c8505a8
https://kuban.rbc.ru/krasnodar/freenews/5d9ee8cb9a79470d9393a115
https://www.rbc.ru/rbcfreenews/5d9edba89a794708bad91711
https://kaliningrad.rbc.ru/kaliningrad/10/10/2019/5d9ed2769a794704ae0433a6
https://www.rbc.ru/politics/09/10/2019/5d9e3e7f9a79475f88f73a87
http://rbcplus.ru/news/5da07cca7a8aa9f82da065d0
https://www.rbc.ru/rbcfreenews/5d9dc2729a79472b5ce57626
https://pro.rbc.ru/news/5d8df48a9a79477158bf2211
https://www.rbc.ru/rbcfreenews/5d9b84bb9a79475bf8043210
http://kuban.rbcplus.ru/pressrelease/5d9b00647a8aa9ca130c3999
http://rostov.rbcplus.ru/pressrelease/5d9afec97a8aa9ca010db86b
https://pro.rbc.ru/news/5d8b41139a7947ce56514db3
http://rbcplus.ru/news/5d94bdf97a8aa9726f930f10
http://rostov.rbcplus.ru/pressrelease/5d9721e67a8aa99edaca590a
https://www.rbc.ru/rbcfreenews/5d95e06c9a79470aa5a8a5a9
https://www.rbc.ru/opinions/politics/02/10/2019/5d9302329a79478468be1314
https://www.rbc.ru/economics/01/10/2019/5d937a759a7947bb18f73ba0
https://www.rbc.ru/finances/01/10/2019/5d9369089a7947b39dd7ef68
]

nodes = [
'body .article__header__title span',
'body .article__text.article__text_free p'
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


