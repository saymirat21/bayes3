require 'nokogiri'
require 'open-uri'

links = %w[
https://www.kommersant.ru/doc/4120141
https://www.kommersant.ru/doc/4120381
https://www.kommersant.ru/doc/4120039
https://www.kommersant.ru/doc/4120933
https://www.kommersant.ru/doc/4124347
https://www.kommersant.ru/doc/4120140
https://www.kommersant.ru/doc/4124327
https://www.kommersant.ru/doc/4120047
https://www.kommersant.ru/doc/4120044
https://www.kommersant.ru/doc/4119524
https://www.kommersant.ru/doc/4119490
https://www.kommersant.ru/doc/4119489
https://www.kommersant.ru/doc/4119488
https://www.kommersant.ru/doc/4119378
https://www.kommersant.ru/doc/4119406
https://www.kommersant.ru/doc/4119128
https://www.kommersant.ru/doc/4119430
https://www.kommersant.ru/doc/4104678
https://www.kommersant.ru/doc/4120090
https://www.kommersant.ru/doc/4120053
https://www.kommersant.ru/doc/4120023
https://www.kommersant.ru/doc/4120020
https://www.kommersant.ru/doc/4119882
https://www.kommersant.ru/doc/4119523
https://www.kommersant.ru/doc/4119432
https://www.kommersant.ru/doc/4119401
https://www.kommersant.ru/doc/4109783
https://www.kommersant.ru/doc/4104291
https://www.kommersant.ru/doc/4103395
https://www.kommersant.ru/doc/4097184
https://www.kommersant.ru/doc/4082365
https://www.kommersant.ru/doc/4079649
https://www.kommersant.ru/doc/4074454
https://www.kommersant.ru/doc/4060434
https://www.kommersant.ru/doc/4045329
https://www.kommersant.ru/doc/4041377
https://www.kommersant.ru/doc/4020211
https://www.kommersant.ru/doc/4012232
https://www.kommersant.ru/doc/4119972
https://www.kommersant.ru/doc/4119957
https://www.kommersant.ru/doc/4119748
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
      #puts tag.content
      file.write("#{tag.text}\n")
    end
  end
  
  file.close
end


