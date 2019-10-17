require 'nokogiri'
require 'open-uri'

links = %w[
https://www.banki.ru/news/lenta/?id=10908061
https://www.banki.ru/news/lenta/?id=10908049
https://www.banki.ru/news/lenta/?id=10908048
https://www.banki.ru/news/lenta/?id=10908052
https://www.banki.ru/news/lenta/?id=10908041
https://www.banki.ru/news/lenta/?id=10908027
https://www.banki.ru/news/lenta/?id=10908025
https://www.banki.ru/news/lenta/?id=10908023
https://www.banki.ru/news/lenta/?id=10908012
https://www.banki.ru/news/lenta/?id=10907957
https://www.banki.ru/news/lenta/?id=10908016
https://www.banki.ru/news/lenta/?id=10908009
https://www.banki.ru/news/lenta/?id=10908004
https://www.banki.ru/news/lenta/?id=10907992
https://www.banki.ru/news/lenta/?id=10907991
https://www.banki.ru/news/lenta/?id=10907987
https://www.banki.ru/news/lenta/?id=10907978
https://www.banki.ru/news/lenta/?id=10907969
https://www.banki.ru/news/lenta/?id=10907956
https://www.banki.ru/news/lenta/?id=10907949
https://www.banki.ru/news/lenta/?id=10907946
https://www.banki.ru/news/lenta/?id=10907944
https://www.banki.ru/news/lenta/?id=10907924
https://www.banki.ru/news/lenta/?id=10907919
https://www.banki.ru/news/lenta/?id=10907911
https://www.banki.ru/news/lenta/?id=10907843
https://www.banki.ru/news/lenta/?id=10907905
https://www.banki.ru/news/lenta/?id=10907910
https://www.banki.ru/news/lenta/?id=10907897
https://www.banki.ru/news/lenta/?id=10907891
https://www.banki.ru/news/lenta/?id=10907864
https://www.banki.ru/news/lenta/?id=10907853
https://www.banki.ru/news/lenta/?id=10907844
https://www.banki.ru/news/lenta/?id=10907842
https://www.banki.ru/news/lenta/?id=10907825
https://www.banki.ru/news/lenta/?id=10907806
https://www.banki.ru/news/lenta/?id=10907754
https://www.banki.ru/news/lenta/?id=10907786
https://www.banki.ru/news/lenta/?id=10907769
https://www.banki.ru/news/lenta/?id=10907781
https://www.banki.ru/news/lenta/?id=10907771
https://www.banki.ru/news/lenta/?id=10907779
]

nodes = [
'body h1.header-h0',
'body main article p'
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


