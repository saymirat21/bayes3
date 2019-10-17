require 'nokogiri'
require 'open-uri'

links = %w[
https://www.vedomosti.ru/politics/news/2019/10/11/813515-ssha-napravyat
https://www.vedomosti.ru/business/news/2019/10/11/813465-na-iranskom-tankere
https://www.vedomosti.ru/economics/articles/2019/10/10/813418-zabastovka-subsidii-ekvador
https://www.vedomosti.ru/business/articles/2019/10/10/813411-treideri-nefti-60
https://www.vedomosti.ru/business/articles/2019/10/10/813372-putin-vpervie-2007-saudovskuyu
https://www.vedomosti.ru/business/articles/2019/10/10/813393-ataki-dronov
https://www.vedomosti.ru/finance/articles/2019/10/09/813327-gazprombank-s-artemom-dzyuboi
https://www.vedomosti.ru/business/articles/2019/10/10/813322-rosneft-neftegazholding
https://www.vedomosti.ru/economics/news/2019/10/09/813234-vsemirnii-bank
https://www.vedomosti.ru/economics/galleries/2019/10/07/813035-nasha-politika
https://www.vedomosti.ru/technology/news/2019/10/12/813528-priostanovila-vipusk-telegram
https://www.vedomosti.ru/politics/news/2019/10/11/813521-ssha-kitaya
https://www.vedomosti.ru/politics/news/2019/10/11/813520-posla
https://www.vedomosti.ru/finance/articles/2019/10/11/813506-kitai-obognal-ssha-publichnih
https://www.vedomosti.ru/politics/news/2019/10/11/813515-ssha-napravyat
https://www.vedomosti.ru/business/articles/2019/10/11/813513-bivshaya-supruga-deripaski
https://www.vedomosti.ru/politics/news/2019/10/11/813490-pavla-fuksa
https://www.vedomosti.ru/opinion/articles/2019/10/09/813202-otritsatelnii-stavki-vkladam
https://www.vedomosti.ru/economics/articles/2019/10/08/813068-20-let-stagnatsii
https://www.vedomosti.ru/finance/articles/2019/10/05/812922-irantsi-fondovom-spaseniya
https://www.vedomosti.ru/finance/articles/2019/10/03/812836-vigodno-investirovat
https://www.vedomosti.ru/finance/blogs/2019/10/01/812550-impichment-trampa-grozit-rinkam
https://www.vedomosti.ru/finance/articles/2019/10/11/813506-kitai-obognal-ssha-publichnih
https://www.vedomosti.ru/finance/articles/2019/10/11/813510-tsb-peredumal
https://www.vedomosti.ru/finance/articles/2019/10/05/812922-irantsi-fondovom-spaseniya
https://www.vedomosti.ru/economics/articles/2019/10/03/812813-ssha
https://www.vedomosti.ru/finance/articles/2019/09/19/811649-priruchit-investitsii
https://www.vedomosti.ru/finance/blogs/2019/09/19/811594-krizis-vseoruzhii
https://www.vedomosti.ru/finance/articles/2019/09/16/811300-rubl
https://www.vedomosti.ru/finance/blogs/2019/09/10/810917-rossiiskii-aktsii-burnomu
https://www.vedomosti.ru/business/news/2019/09/05/810575-thyssenkrupp-isklyuchena-dax
https://www.vedomosti.ru/politics/news/2019/09/04/810426-gonkonga-otozvat-ekstraditsii
https://www.vedomosti.ru/economics/articles/2019/09/03/810364-deshevaya-neft-ekonomiku-saudovskoi
https://www.vedomosti.ru/economics/articles/2019/08/23/809505-investori
https://www.vedomosti.ru/finance/articles/2019/08/23/809490-rubl-i-neft-podesheveli
https://www.vedomosti.ru/economics/articles/2019/08/19/809150-investori-ustali-neopredelennosti
https://www.vedomosti.ru/economics/news/2019/08/16/808979-gonkongskie-milliarderi-15
https://www.vedomosti.ru/economics/articles/2019/08/06/808237-kitai-torgovuyu-voinu
https://www.vedomosti.ru/finance/articles/2019/08/06/808201-dollar-evro
https://www.vedomosti.ru/finance/articles/2019/08/05/808074-rinok-ne-ispugalsya
https://www.vedomosti.ru/economics/articles/2019/08/04/808045-investori-ispugalis
https://www.vedomosti.ru/opinion/articles/2019/08/01/807902-ponizhenie-stavki
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


