require 'nokogiri'
require 'open-uri'

links = %w[
https://www.gazeta.ru/science/2019/10/11_a_12749258.shtml
https://www.gazeta.ru/culture/news/2019/10/11/n_13566512.shtml
https://www.gazeta.ru/politics/news/2019/10/11/n_13566458.shtml
https://www.gazeta.ru/tech/news/2019/10/11/n_13566470.shtml
https://www.gazeta.ru/army/news/2019/10/11/13566416.shtml
https://www.gazeta.ru/army/news/2019/10/11/13566314.shtml
https://www.gazeta.ru/politics/news/2019/10/11/n_13566284.shtml
https://www.gazeta.ru/sport/news/2019/10/11/n_13566218.shtml
https://www.gazeta.ru/army/news/2019/10/11/13566278.shtml
https://www.gazeta.ru/business/news/2019/10/11/n_13566200.shtml
https://www.gazeta.ru/science/news/2019/10/11/n_13566152.shtml
https://www.gazeta.ru/social/news/2019/10/11/n_13566134.shtml
https://www.gazeta.ru/culture/news/2019/10/11/n_13566080.shtml
https://www.gazeta.ru/business/news/2019/10/11/n_13566074.shtml
https://www.gazeta.ru/culture/news/2019/10/11/n_13566062.shtml
https://www.gazeta.ru/business/2019/10/04/12737161.shtml
https://www.gazeta.ru/business/2019/02/26/12210469.shtml
https://www.gazeta.ru/business/2019/10/07/12742759.shtml
https://www.gazeta.ru/business/2019/10/10/12748898.shtml
https://www.gazeta.ru/infographics/trete_rozhdenie_rossiiskoi_alyuminievoi_promyshlennosti.shtml
https://www.gazeta.ru/prcom/2019/09/04/12626065.shtml
https://www.gazeta.ru/business/2019/10/10/12748178.shtml
https://www.gazeta.ru/business/2019/10/10/12748046.shtml
https://www.gazeta.ru/business/2019/10/10/12748484.shtml
https://www.gazeta.ru/business/2019/10/10/12747572.shtml
https://www.gazeta.ru/business/2019/10/09/12746576.shtml
https://www.gazeta.ru/business/2019/10/09/12746912.shtml
https://www.gazeta.ru/business/2019/10/09/12745579.shtml
https://www.gazeta.ru/business/2019/10/09/12746336.shtml
https://www.gazeta.ru/business/2019/10/09/12745519.shtml
https://www.gazeta.ru/business/2019/10/08/12744655.shtml
https://www.gazeta.ru/business/2019/10/08/12744211.shtml
https://www.gazeta.ru/business/2019/10/08/12743509.shtml
https://www.gazeta.ru/business/2019/10/07/12742933.shtml
https://www.gazeta.ru/business/2019/10/07/12742687.shtml
https://www.gazeta.ru/business/2019/10/07/12741697.shtml
https://www.gazeta.ru/business/2019/10/04/12736963.shtml
https://www.gazeta.ru/business/2019/10/05/12738703.shtml
https://www.gazeta.ru/business/2019/10/04/12738091.shtml
https://www.gazeta.ru/business/2019/10/04/12737791.shtml
https://www.gazeta.ru/business/2019/10/04/12737161.shtml
https://www.gazeta.ru/business/2019/10/04/12736483.shtml
https://www.gazeta.ru/business/2019/10/04/12736405.shtml
https://www.gazeta.ru/business/2019/10/03/12735607.shtml
]

nodes = [
'body .h_1.mb10',
'body .article_text.txt_1.pl20',
'article.article-text h1.article-text-header',
'div[itemprop="articleBody"].article-text-body p'
]

links.each_with_index do |link, index|
  file = File.new("#{index}.txt", 'w')

  doc = Nokogiri::HTML(open(link))

  nodes.each do |node|
    doc.css(node).each do |tag|
      #puts tag.content
      file.write("#{tag.content}\n")
    end
  end
  
  file.close
end


