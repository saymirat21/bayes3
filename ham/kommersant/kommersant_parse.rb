require 'nokogiri'
require 'open-uri'

links = %w[
https://www.kommersant.ru/doc/4120028
https://www.kommersant.ru/doc/4120265
https://www.kommersant.ru/doc/3896406
https://www.kommersant.ru/doc/3903194
https://www.kommersant.ru/doc/4117506
https://www.kommersant.ru/doc/3860833
https://www.kommersant.ru/doc/3771856
https://www.kommersant.ru/doc/3822105
https://www.kommersant.ru/doc/3931055
https://www.kommersant.ru/doc/3894788
https://www.kommersant.ru/doc/3896151
https://www.kommersant.ru/doc/3947946
https://www.kommersant.ru/doc/4089894
https://www.kommersant.ru/doc/3938461
https://www.kommersant.ru/doc/3945194
https://www.kommersant.ru/doc/4109895
https://www.kommersant.ru/doc/3945044
https://www.kommersant.ru/doc/3984479
https://www.kommersant.ru/doc/4012112
https://www.kommersant.ru/doc/4111082
https://www.kommersant.ru/doc/3771856
https://www.kommersant.ru/doc/4026956
https://www.kommersant.ru/doc/3896452
https://www.kommersant.ru/doc/3899182
https://www.kommersant.ru/doc/3903338
https://www.kommersant.ru/doc/3779038
https://www.kommersant.ru/doc/4032592
https://www.kommersant.ru/doc/3982106
https://www.kommersant.ru/doc/3814601
https://www.kommersant.ru/doc/3990128
https://www.kommersant.ru/doc/4059559
https://www.kommersant.ru/doc/3990111
https://www.kommersant.ru/doc/3967590
https://www.kommersant.ru/doc/4016001
https://www.kommersant.ru/doc/4004157
https://www.kommersant.ru/doc/3923333
https://www.kommersant.ru/doc/4017656
https://www.kommersant.ru/doc/3779038
https://www.kommersant.ru/doc/4074995
https://www.kommersant.ru/doc/4054239
https://www.kommersant.ru/doc/4067631
]

nodes = [
'header .text h2.article_name',
'.article_text_wrapper span.b-article__intro',
'.article_text_wrapper p.b-article__text'
]

links.each_with_index do |link, index|
  file = File.new("#{index}.txt", 'w')

  doc = Nokogiri::HTML(open(link), nil, Encoding::UTF_8.to_s)

  nodes.each do |node|
    doc.css(node).each do |tag|
      puts tag.content
      file.write("#{tag.text}\n")
    end
  end
  
  file.close
end


