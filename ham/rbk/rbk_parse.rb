require 'nokogiri'
require 'open-uri'

links = %w[
https://www.rbc.ru/rbcfreenews/5da06b309a7947ab0a986deb
https://www.rbc.ru/finances/10/10/2019/5d9f649b9a79474be7eda2ca
https://www.rbc.ru/finances/10/10/2019/5d9f41659a79473bc8adf6b0
https://www.rbc.ru/finances/08/10/2019/5d9c487d9a7947974bf35a15
https://www.rbc.ru/finances/07/10/2019/5d9adc669a79470bc0bd6028
https://www.rbc.ru/finances/07/10/2019/5d98a2339a7947fa7b35f10c
https://www.rbc.ru/economics/11/10/2019/5da05d139a7947a4548aefbc
https://www.rbc.ru/economics/11/10/2019/5d9ef0f59a794711a69ff9f3
https://www.rbc.ru/economics/09/10/2019/5d9da90b9a79471e25e59ca6
https://www.rbc.ru/economics/08/10/2019/5d9ba8389a7947655550478b
https://www.rbc.ru/economics/07/10/2019/5d9b0ba79a7947228f4ce0e6
https://perm.rbc.ru/perm/freenews/5da052529a79479c6f1e5d39
https://www.rbc.ru/economics/04/10/2019/5d97150f9a79477ade3931a2
https://kuban.rbc.ru/krasnodar/freenews/5d947fcd9a7947141a50c652
https://www.rbc.ru/economics/01/10/2019/5d92269e9a79473b460293c4
https://www.rbc.ru/politics/30/09/2019/5d9122e79a79475bb3fa7138
https://www.rbc.ru/rbcfreenews/5d90fb7e9a79475373f59954
https://www.rbc.ru/business/10/10/2019/5d9f67a19a79474ced3ae9dc
https://ufa.rbc.ru/ufa/01/10/2019/5d9307c19a7947865dd71811
https://www.rbc.ru/rbcfreenews/5d9ee9bc9a79470dd189e3f1
https://nsk.rbc.ru/nsk/09/10/2019/5d9d7a509a7947077a97638a
https://nsk.rbc.ru/nsk/30/09/2019/5d91c1419a794708c20ffee7
https://rt.rbc.ru/tatarstan/20/09/2019/5d8470149a79471605feb3b6
https://www.rbc.ru/rbcfreenews/5d8a1fb89a794768e8f349c9
https://www.rbc.ru/finances/24/09/2019/5d89fea99a794757c2c21836
https://ufa.rbc.ru/ufa/04/10/2019/5d970d2e9a7947773f5ae438
https://www.rbc.ru/rbcfreenews/5d8da4459a79474a625fb724
https://www.rbc.ru/rbcfreenews/5d8d02969a794783bda26c35
http://rostov.rbcplus.ru/pressrelease/5d9ecfc17a8aa90133b014ff
http://rbcplus.ru/news/5d8debb37a8aa9389332a92a
https://perm.rbc.ru/perm/freenews/5da052529a79479c6f1e5d39
https://perm.rbc.ru/perm/freenews/5d837ffd9a79474a1e97662c
https://perm.rbc.ru/perm/freenews/5d8342b99a79472acf255ed9
https://perm.rbc.ru/perm/freenews/5d81fd599a7947b24652336e
https://perm.rbc.ru/perm/freenews/5d81e3779a7947a59b1f7cdf
https://perm.rbc.ru/perm/freenews/5d80b2849a79473a864f3a81
https://perm.rbc.ru/perm/freenews/5d8082ae9a79472565f76d42
https://perm.rbc.ru/perm/freenews/5d7b30e49a7947867231e81b
https://perm.rbc.ru/perm/freenews/5d6f467c9a79474ecf737b25
https://perm.rbc.ru/perm/freenews/5d67a6b89a7947bd23c4266b
https://perm.rbc.ru/perm/freenews/5d5b82b29a794704997832ed
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


