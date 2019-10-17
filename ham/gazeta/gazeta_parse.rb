require 'nokogiri'
require 'open-uri'

links = %w[
https://www.gazeta.ru/business/2019/10/11/12749198.shtml
https://www.gazeta.ru/business/2019/09/24/12684277.shtml
https://www.gazeta.ru/business/2019/09/07/12632845.shtml
https://www.gazeta.ru/business/2019/10/10/12747926.shtml
https://www.gazeta.ru/social/news/2019/09/20/n_13488907.shtml
https://www.gazeta.ru/social/news/2019/09/26/n_13512685.shtml
https://www.gazeta.ru/social/news/2019/07/17/n_13225417.shtml
https://www.gazeta.ru/social/news/2019/07/12/n_13204627.shtml
https://www.gazeta.ru/social/news/2019/06/25/n_13133503.shtml
https://www.gazeta.ru/social/news/2019/06/25/n_13218079.shtml
https://www.gazeta.ru/business/news/2019/10/08/n_13555663.shtml
https://www.gazeta.ru/business/news/2019/10/01/n_13531057.shtml
https://www.gazeta.ru/business/news/2019/10/01/n_13530313.shtml
https://www.gazeta.ru/business/news/2019/10/01/n_13529983.shtml
https://www.gazeta.ru/business/2019/10/01/12698815.shtml
https://www.gazeta.ru/business/news/2019/09/30/n_13525897.shtml
https://www.gazeta.ru/business/news/2019/09/30/n_13525759.shtml
https://www.gazeta.ru/business/news/2019/09/30/n_13525543.shtml
https://www.gazeta.ru/business/news/2019/07/31/n_13281337.shtml
https://www.gazeta.ru/comments/column/bovt/12652501.shtml
https://www.gazeta.ru/social/news/2019/09/19/n_13484611.shtml
https://www.gazeta.ru/business/news/2019/02/20/n_12660787.shtml
https://www.gazeta.ru/business/2019/02/06/12167863.shtml
https://www.gazeta.ru/business/2019/01/16/12130753.shtml
https://www.gazeta.ru/business/2019/01/17/12132235.shtml
https://www.gazeta.ru/business/news/2019/10/08/n_13555405.shtml
https://www.gazeta.ru/business/news/2019/10/05/n_13543867.shtml
https://www.gazeta.ru/business/news/2019/10/04/n_13541677.shtml
https://www.gazeta.ru/tech/news/2019/10/03/n_13537369.shtml
https://www.gazeta.ru/business/news/2019/10/10/n_13563134.shtml
https://www.gazeta.ru/business/pensionnyi_sovetnik/news/2019/10/01/n_13529815.shtml
https://www.gazeta.ru/business/news/2019/09/29/n_13521607.shtml
https://www.gazeta.ru/business/2019/09/19/12661141.shtml
https://www.gazeta.ru/business/news/2019/09/07/n_13435573.shtml
https://www.gazeta.ru/business/news/2019/09/06/n_13433599.shtml
https://www.gazeta.ru/business/2019/09/06/12631597.shtml
https://www.gazeta.ru/business/news/2019/09/05/n_13428631.shtml
https://www.gazeta.ru/business/news/2019/09/05/n_13428517.shtml
https://www.gazeta.ru/business/news/2019/09/05/n_13428289.shtml
https://www.gazeta.ru/business/news/2019/09/02/n_13412755.shtml
https://www.gazeta.ru/business/news/2017/04/22/n_9957599.shtml
https://www.gazeta.ru/business/news/2017/04/22/n_9956309.shtml
https://www.gazeta.ru/business/news/2017/04/19/n_9943349.shtml
https://www.gazeta.ru/business/news/2017/03/27/n_9846743.shtml
https://www.gazeta.ru/business/news/2017/03/17/n_9809003.shtml
https://www.gazeta.ru/business/news/2017/03/15/n_9798491.shtml
https://www.gazeta.ru/business/news/2017/03/06/n_9762077.shtml
https://www.gazeta.ru/business/news/2017/02/27/n_9733571.shtml
https://www.gazeta.ru/business/news/2017/02/15/n_9690275.shtml
]

nodes = [
'body .h_1.mb10',
'body .article_text.txt_1.pl20',
'article.article-text h1.article-text-header',
'div[itemprop="articleBody"].article-text-body p'
]

links.each_with_index do |link, index|
  file = File.new("#{index}.txt", 'w')

  doc = Nokogiri::HTML(open(link), nil)

  nodes.each do |node|
    doc.css(node).each do |tag|
      #puts tag.text
      file.write("#{tag.text}\n")
    end
  end
  
  file.close
end


