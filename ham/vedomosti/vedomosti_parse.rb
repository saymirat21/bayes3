require 'nokogiri'
require 'open-uri'

links = %w[
https://www.vedomosti.ru/finance/articles/2019/10/11/813526-protiv-ogranicheniya-sroka
https://www.vedomosti.ru/finance/articles/2019/10/11/813510-tsb-peredumal
https://www.vedomosti.ru/economics/articles/2019/10/11/813436-pravitelstvo-uzhestochit
https://taxes.vedomosti.ru/world/articles/chto-planiruet-nalogami
https://www.vedomosti.ru/economics/articles/2018/11/16/786604-nalog
https://www.vedomosti.ru/economics/articles/2019/10/10/813426-minfin
https://www.vedomosti.ru/economics/articles/2019/10/10/813313-oesr-sposob-nalogovuyu
https://www.vedomosti.ru/economics/articles/2019/10/09/813210-zakonoproekt-zaschite-investitsii
https://www.vedomosti.ru/economics/news/2019/10/07/813053-indeksatsiyu-nalogov
https://www.vedomosti.ru/economics/articles/2019/10/08/813126-zamglavi-fns-konstatirovala-visokuyu-dolyu-zarplat-ekonomike
https://www.vedomosti.ru/economics/articles/2019/10/06/812959-vlasti-ogranichit-nalogovogo
https://www.vedomosti.ru/economics/articles/2019/10/04/812870-siluanov
https://www.vedomosti.ru/technology/news/2019/10/03/812732-minfin
https://www.vedomosti.ru/economics/news/2019/09/30/812383-putin-osvobodil-ot-uplati-ndfl
https://www.vedomosti.ru/politics/news/2019/09/30/812369-putin-osvobodil-studentov
https://www.vedomosti.ru/politics/news/2019/02/06/793434-putin-osvobodit
https://www.vedomosti.ru/economics/articles/2018/11/28/787821-lichnii-kabinet-nalogoplatelschika-s-pereboyami
https://www.vedomosti.ru/economics/articles/2018/11/16/786604-nalog
https://www.vedomosti.ru/economics/articles/2018/08/03/777280-rossiya-spetsialistov-nalogom
https://www.vedomosti.ru/economics/articles/2018/07/12/775263-osvobodit-biznes-shtrafov
https://www.vedomosti.ru/economics/articles/2018/07/06/774782-nalog-perevoda
https://www.vedomosti.ru/economics/articles/2018/07/03/774432-ndfl
https://www.vedomosti.ru/economics/articles/2018/07/02/774420-povishenie-nds
https://www.vedomosti.ru/economics/news/2018/06/07/772102-putin-pryamaya-liniya
https://www.vedomosti.ru/economics/articles/2018/05/28/770872-povisit-nds
https://www.vedomosti.ru/economics/news/2018/05/25/770736-siluanov-obyasnil
https://www.vedomosti.ru/economics/news/2018/05/08/768930-medvedev-zayavil
https://www.vedomosti.ru/economics/articles/2018/05/04/768487-novii-nalog
https://www.vedomosti.ru/economics/articles/2018/04/18/767012-lgotnaya-stavka-nds
https://www.vedomosti.ru/economics/articles/2018/04/13/766582-biznes-angelam-ndfl
https://www.vedomosti.ru/economics/articles/2018/04/12/766451-regioni-naloga-pribil
https://www.vedomosti.ru/economics/news/2018/04/11/766362-medvedev-rasskazal-o-minusah-progressivnoi-shkali-ndfl
https://www.vedomosti.ru/economics/news/2019/09/02/810184-pensionnii-fond
https://www.vedomosti.ru/economics/articles/2019/08/30/810087-schetnaya-palata
https://www.vedomosti.ru/business/news/2019/02/25/794976-reisov
https://www.vedomosti.ru/politics/news/2019/02/15/794253-nalogov
https://www.vedomosti.ru/business/news/2019/02/11/793803-gosdumu
https://www.vedomosti.ru/auto/news/2019/02/06/793401-na
https://www.vedomosti.ru/economics/news/2018/03/30/755428-minstroi-predlozhil-vvesti-sistemnoe-obsledovanie-zhilih-domov-raz
https://www.vedomosti.ru/realty/news/2017/12/19/745761-minstroi-preferentsii-zastroischikov
https://www.vedomosti.ru/realty/articles/2017/12/15/745373-prodazhi-kvartir-novostroikah
https://www.vedomosti.ru/newspaper/articles/2017/11/29/743420-perestroika-pravil
https://www.vedomosti.ru/realty/news/2017/11/24/742988-nadzor-dolevim-stroitelstvom
https://www.vedomosti.ru/economics/articles/2017/11/09/741025-oblozhit-biznes-ekologicheskim-sborom
https://www.vedomosti.ru/realty/news/2017/10/26/739511-minstroi-otkaza-dolevogo-stroitelstva
https://www.vedomosti.ru/realty/articles/2017/10/23/738917-zakon-dolevom-stroitelstve
https://www.vedomosti.ru/realty/news/2017/10/11/737427-zakonoproekt-zhile-ekonomklassa-pervom-chtenii
]

nodes = [
'body h1.title',
'body div.b-document__body.b-social__layout-mutation p',
'.b-news-item__title.b-news-item__title_one h1',
'.b-news-item__text.b-news-item__text_one p'

]

links.each_with_index do |link, index|
  file = File.new("#{index}.txt", 'w')

  doc = Nokogiri::HTML(open(link))

  nodes.each do |node|
    doc.css(node).each do |tag|
      #puts tag.content
      file.write("#{tag.text}\n")
    end
  end
  
  file.close
end


