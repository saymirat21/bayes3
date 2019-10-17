require 'nokogiri'
require 'open-uri'

links = %w[
https://1prime.ru/state_regulation/20191009/830393596.html
https://1prime.ru/state_regulation/20191009/830393498.html
https://1prime.ru/state_regulation/20191009/830391583.html
https://1prime.ru/state_regulation/20191003/830376272.html
https://1prime.ru/nalogy/20190914/830322600.html
https://1prime.ru/News/20190913/830319364.html
https://1prime.ru/business/20190906/830305319.html
https://1prime.ru/finance/20190903/830292414.html
https://1prime.ru/state_regulation/20190826/830267156.html
https://1prime.ru/state_regulation/20190419/829911051.html
https://1prime.ru/nalogy/20190415/829892926.html
https://1prime.ru/state_regulation/20190402/829856693.html
https://1prime.ru/state_regulation/20190330/829851192.html
https://1prime.ru/state_regulation/20190330/829851527.html
https://1prime.ru/state_regulation/20190301/829766767.html
https://1prime.ru/state_regulation/20190220/829737107.html
https://1prime.ru/state_regulation/20190206/829688453.html
https://1prime.ru/state_regulation/20190115/829611739.html
https://1prime.ru/state_regulation/20181208/829521507.html
https://1prime.ru/state_regulation/20181206/829514473.html
https://1prime.ru/state_regulation/20181120/829456838.html
https://1prime.ru/state_regulation/20181113/829432515.html
https://1prime.ru/state_regulation/20181025/829370768.html
https://1prime.ru/state_regulation/20181009/829310931.html
https://1prime.ru/state_regulation/20180913/829227601.html
https://1prime.ru/nalogy/20180822/829148992.html
https://1prime.ru/state_regulation/20180817/829138860.html
https://1prime.ru/state_regulation/20180810/829112875.html
https://1prime.ru/state_regulation/20180804/829094604.html
https://1prime.ru/state_regulation/20180803/829094563.html
https://1prime.ru/state_regulation/20180803/829094548.html
https://1prime.ru/state_regulation/20180803/829094192.html
https://1prime.ru/state_regulation/20180731/829075145.html
https://1prime.ru/state_regulation/20180724/829055987.html
https://1prime.ru/state_regulation/20180718/829040356.html
https://1prime.ru/state_regulation/20180709/829010190.html
https://1prime.ru/state_regulation/20180705/829002024.html
https://1prime.ru/state_regulation/20191010/830395132.html
https://1prime.ru/business/20190805/830217715.html
https://1prime.ru/state_regulation/20191001/830368225.html
https://1prime.ru/state_regulation/20190929/830363780.html
https://1prime.ru/state_regulation/20190930/830367578.html
]

nodes = [
'body header h1.article-header__title',
'body .article-body__content p'
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


