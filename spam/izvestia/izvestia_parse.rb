require 'nokogiri'
require 'open-uri'

links = %w[
https://iz.ru/931050/2019-10-11/putin-usomnilsia-v-sposobnostiakh-zelenskogo-obespechit-razvod-sil-v-donbasse
https://iz.ru/930979/2019-10-11/turtciia-unichtozhila-228-kurdskikh-boitcov-na-severe-sirii
https://iz.ru/930978/2019-10-11/ovechkin-vyshel-na-chetvertoe-mesto-v-istorii-nkhl-po-golam-v-bolshinstve
https://iz.ru/930977/2019-10-11/sotrudniki-fsb-i-mvd-perekryli-nelegalnyi-kanal-vyvoda-deneg-za-rubezh
https://iz.ru/930982/2019-10-11/sinoptiki-rasskazali-o-pogode-v-moskve-na-11-oktiabria
https://iz.ru/930977/2019-10-11/sotrudniki-fsb-i-mvd-perekryli-nelegalnyi-kanal-vyvoda-deneg-za-rubezh
https://iz.ru/931047/2019-10-11/mid-irana-zaiavil-o-silnom-zagriaznenii-ekologii-posle-ataki-na-tanker
https://iz.ru/931048/2019-10-11/gensek-nato-prizval-turtciiu-k-sderzhannosti
https://iz.ru/931038/2019-10-11/lukashenko-prizval-podumat-o-bezopasnosti-rossii-i-belorussii-vo-vremia-uchenii-nato
https://iz.ru/931035/2019-10-11/taksist-v-peterburge-napal-na-klienta-za-slishkom-dolgoe-ozhidanie
https://iz.ru/931034/2019-10-11/emelianenko-zaiavil-o-zavershenii-karery-posle-poedinka-v-moskve
https://iz.ru/931032/2019-10-11/v-britanii-vypustili-pervuiu-bankovskuiu-kartu-iz-18-karatnogo-zolota
https://iz.ru/930659/2019-10-10/minenergo-ssha-sprognozirovalo-padenie-tcen-na-neft
https://iz.ru/930670/2019-10-10/v-belorussii-otcenili-poteri-ot-nalogovogo-manevra-za-dva-goda-v-800-mln
https://iz.ru/930470/dmitrii-migunov/neft-ne-nuzhna-kogda-spros-na-chernoe-zoloto-perestanet-rasti
https://iz.ru/930879/roza-almakunova/torg-uzhe-ne-tot-kreditory-iurlitc-bankrotov-zachastuiu-ostaiutsia-ni-s-chem
https://iz.ru/930761/valerii-kodachigov/zapiratsia-bespolezno-75-tys-kodov-ot-moskovskikh-podezdov-popali-v-set
https://iz.ru/930919/2019-10-10/panelnaia-khrushchevka-okazalas-samym-bolshim-biznes-tcentrom-moskvy
https://iz.ru/930658/natalia-ilina/slivaite-kody-v-utechke-personalnykh-dannykh-vinovaty-sami-polzovateli
https://iz.ru/930670/2019-10-10/v-belorussii-otcenili-poteri-ot-nalogovogo-manevra-za-dva-goda-v-800-mln
https://iz.ru/930659/2019-10-10/minenergo-ssha-sprognozirovalo-padenie-tcen-na-neft
https://iz.ru/930470/dmitrii-migunov/neft-ne-nuzhna-kogda-spros-na-chernoe-zoloto-perestanet-rasti
https://iz.ru/930344/tatiana-bochkareva/rabota-bez-prikrytiia-pochti-80-bankov-ne-vyderzhat-khakerskoi-ataki
https://iz.ru/930331/valerii-kodachigov/poluvirtualnaia-realnost-predlozhena-skhema-legalizatcii-esim-v-rossii
https://iz.ru/930372/2019-10-09/ekspert-otcenil-pozitcii-na-rynke-novoi-kompanii-aliexpress-russia
https://iz.ru/930308/2019-10-09/naftogaz-vystupil-protiv-prodleniia-kontrakta-na-tranzit-gaza-cherez-ukrainu
https://iz.ru/930312/pavel-panov/eda-na-vyezd-dmitrii-medvedev-otkryl-forum-zolotaia-osen
https://iz.ru/930239/2019-10-09/alibaba-i-mailru-group-sozdali-sovmestnoe-predpriiatie
https://iz.ru/930230/2019-10-09/ekspert-nazval-spravedlivym-prognoz-vsemirnogo-banka-po-ekonomike-rf
https://iz.ru/930199/2019-10-09/sovfed-utverdil-zakon-ob-ispolnenii-federalnogo-biudzheta-za-proshlyi-god
https://iz.ru/930149/2019-10-09/vsemirnyi-bank-ponizil-prognoz-rosta-rossiiskoi-ekonomiki
https://iz.ru/930128/2019-10-09/v-seti-sravnili-stoimost-produktov-v-rossii-i-na-ukraine
https://iz.ru/930091/2019-10-09/rossiian-predupredili-o-riske-pereboev-s-postavkami-importnoi-vody
https://iz.ru/929531/dmitrii-grinkevich-natalia-ilina/sbor-sliva-banki-obvinili-istochnik-novostei-ob-utechkakh-v-predvziatosti
https://iz.ru/929963/2019-10-08/banki-obvinili-istochnik-novostei-ob-utechkakh-v-predvziatosti
https://iz.ru/930000/inna-grigoreva-tatiana-bochkareva/tochka-obscheta-klienty-banka-postradali-ot-utechek-v-bilaine
https://iz.ru/929916/2019-10-08/rossiia-i-turtciia-podpisali-soglashenie-o-raschetakh-i-platezhakh-v-natcvaliutakh
https://iz.ru/929910/2019-10-08/avtodilery-poprosili-putina-ne-dopuskat-povysheniia-utilsbora
https://iz.ru/929674/dmitrii-migunov/postoiu-na-kraiu-kogda-globalnaia-ekonomika-rukhnet-vniz
https://iz.ru/929565/evgeniia-pertceva-aleksandr-volobuev/prosrochennoe-delo-riteilery-prosiat-lgoty-za-besplatnuiu-razdachu-produktov
https://iz.ru/929545/valerii-kodachigov/iphone-po-oseni-schitaiut-apple-vernulas-v-troiku-liderov-prodazh-smartfonov
https://iz.ru/929649/2019-10-08/nazvany-vakansii-v-regionakh-rossii-s-zarplatoi-ot-200-tys-rublei
https://iz.ru/929638/2019-10-07/mintrans-rasskazal-poriadok-zapuska-zhd-dvizheniia-po-krymskomu-mostu
https://iz.ru/929620/2019-10-07/ekspert-nazval-uslovie-dlia-rosta-tcen-na-neft-do-100-za-barrel
https://iz.ru/927982/aleksandr-antonovich/razdeliai-i-ispolzui
]

nodes = [
'body h1.m-t-10',
'body .text-article__inside div[itemprop="articleBody"]',
'.text-article__inside div[itemprop="description"] p'
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


