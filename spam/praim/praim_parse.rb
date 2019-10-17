require 'nokogiri'
require 'open-uri'

links = %w[
https://1prime.ru/business/20191011/830400034.html
https://1prime.ru/business/20191011/830399795.html
https://1prime.ru/business/20191011/830399571.html
https://1prime.ru/business/20191011/830399715.html
https://1prime.ru/business/20191011/830399249.html
https://1prime.ru/business/20191011/830399179.html
https://1prime.ru/transport/20191011/830398631.html
https://1prime.ru/state_regulation/20191011/830398604.html
https://1prime.ru/transport/20191010/830398548.html
https://1prime.ru/state_regulation/20191010/830398510.html
https://1prime.ru/transport/20191010/830398502.html
https://1prime.ru/state_regulation/20191011/830400411.html
https://1prime.ru/state_regulation/20191011/830400238.html
https://1prime.ru/state_regulation/20191011/830400108.html
https://1prime.ru/state_regulation/20191011/830399488.html
https://1prime.ru/state_regulation/20191011/830399325.html
https://1prime.ru/state_regulation/20191011/830399283.html
https://1prime.ru/state_regulation/20191011/830399032.html
https://1prime.ru/Financial_market/20191011/830398649.html
https://1prime.ru/state_regulation/20191011/830398595.html
https://1prime.ru/state_regulation/20191011/830398586.html
https://1prime.ru/industry_and_energy/20191011/830398569.html
https://1prime.ru/state_regulation/20191010/830398540.html
https://1prime.ru/state_regulation/20191010/830398413.html
https://1prime.ru/state_regulation/20191010/830398430.html
https://1prime.ru/state_regulation/20191010/830398510.html
https://1prime.ru/state_regulation/20191010/830398522.html
https://1prime.ru/state_regulation/20191010/830398292.html
https://1prime.ru/state_regulation/20191010/830398280.html
https://1prime.ru/business/20191010/830398198.html
https://1prime.ru/state_regulation/20191010/830398108.html
https://1prime.ru/state_regulation/20191010/830397670.html
https://1prime.ru/state_regulation/20191010/830397649.html
https://1prime.ru/state_regulation/20191010/830397513.html
https://1prime.ru/state_regulation/20191010/830397505.html
https://1prime.ru/state_regulation/20191010/830397505.html
https://1prime.ru/state_regulation/20191010/830396652.html
https://1prime.ru/state_regulation/20191010/830396354.html
https://1prime.ru/state_regulation/20191010/830396200.html
https://1prime.ru/Financial_market/20191011/830400066.html
https://1prime.ru/Financial_market/20191011/830399200.html
https://1prime.ru/Financial_market/20191011/830398861.html
https://1prime.ru/Financial_market/20191011/830398649.html
https://1prime.ru/News/20191011/830398563.html
https://1prime.ru/Financial_market/20191010/830398313.html
https://1prime.ru/Financial_market/20191010/830397795.html
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


