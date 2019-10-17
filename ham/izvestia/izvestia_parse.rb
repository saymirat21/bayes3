require 'nokogiri'
require 'open-uri'

links = %w[
https://iz.ru/930865/inna-grigoreva-ekaterina-vinogradova-pavel-panov/nalogov-tri-goda-zhdut-biznesu-propisali-garantii-dlia-krupnykh-proektov
https://iz.ru/930907/2019-10-10/v-rf-gotoviat-reformu-individualnykh-investitcionnykh-nakoplenii
https://iz.ru/929418/ekaterina-vinogradova/lgoty-strogogo-rezhima-biznes-protiv-ogranichenii-dlia-samozaniatykh
https://iz.ru/929477/mariia-perevoshchikova/novyi-schet-za-god-novostroiki-podorozhali-pochti-na-12
https://iz.ru/929664/2019-10-07/minek-predlozhil-uvelichit-nalogi-na-malyi-biznes-s-2020-goda
https://iz.ru/929590/2019-10-07/v-minekonomrazvitiia-sozdali-departament-po-reguliatornoi-gilotine
https://iz.ru/929251/anna-kaledina/kopit-dat-rossiianam-sozdadut-usloviia-dlia-formirovaniia-vtoroi-pensii
https://iz.ru/929253/2019-10-06/v-rossii-primut-normativnuiu-bazu-dlia-razvitiia-negosudarstvennoi-pensii
https://iz.ru/928827/2019-10-04/opora-rossii-vystupila-protiv-ogranichenii-spiska-professii-dlia-samozaniatykh
https://iz.ru/928621/2019-10-04/matvienko-predlozhila-rasprostranit-nalog-dlia-samozaniatykh-na-vsiu-stranu
https://iz.ru/927313/2019-10-01/minfin-uzhestochit-nalogooblozhenie-bogatykh-rossiian
https://iz.ru/924246/anna-kaledina/schet-i-vychet-nalogovuiu-vyplatu-klientam-npf-khotiat-uvelichit-vtroe
https://iz.ru/924265/2019-09-22/v-rossii-predlozhili-povysit-nalogovuiu-vyplatu-klientam-npf
https://iz.ru/918445/2019-09-06/minfin-vystupil-za-vzimanie-naloga-s-voditelei-blablacar
https://iz.ru/883699/2019-05-30/v-rossii-nekotorye-vidy-sotcvyplat-osvobodiat-ot-uplaty-ndfl
https://iz.ru/883544/2019-05-30/siluanov-predlozhil-uravniat-stavki-ndfl-dlia-rossiian-i-inostrantcev
https://iz.ru/869768/2019-04-19/iarovaia-predlozhila-osvobodit-studentov-ot-uplaty-naloga-s-matpomoshchi
https://iz.ru/868160/2019-04-15/profsoiuzy-budut-dobivatsia-osvobozhdeniia-maloimushchikh-ot-uplaty-ndfl
https://iz.ru/868094/anna-ivushkina/soglashenie-ne-vorobei-profsoiuzy-trebuiut-vycheta-na-nizkie-zarplaty
https://iz.ru/868082/2019-04-15/opora-rossii-vystupila-za-otmenu-ndfl-dlia-maloobespechennykh-grazhdan
https://iz.ru/925860/2019-09-26/minstroi-razreshil-stroit-piatietazhnye-shkoly
https://iz.ru/923359/dmitrii-grinkevich/dialogovyi-kodeks-schetnaia-palata-protiv-perenosa-platezhei-v-nk
https://iz.ru/918065/aleksandr-volobuev/podorozhnyi-nalog-uchastnikam-blablacar-grozit-uplata-ndfl
https://iz.ru/913994/2019-08-25/minfin-priznal-66-nalogovykh-preferentcii-neeffektivnymi
https://iz.ru/904316/dmitrii-grinkevich/razvolnovalis-platu-za-radiochastoty-predlagaiut-sdelat-nalogom
https://iz.ru/904330/2019-07-29/sbory-za-ispolzovanie-radiochastot-predlozhili-peredat-fns
https://iz.ru/898216/2019-07-11/schetnaia-palata-predlozhila-usovershenstvovat-nalog-na-roskosh
https://iz.ru/892361/dmitrii-grinkevich/oblozhili-predlogami-biznes-ispugalsia-posadok-za-nalogovye-narusheniia
https://iz.ru/889935/dmitrii-grinkevich/nalog-na-kanikuly-chastnyi-sektor-khotiat-oblozhit-kurortnym-sborom
https://iz.ru/883753/iaroslav-kabakov/odinakovyi-podokhod
https://iz.ru/880102/2019-05-20/v-minfine-otkazalis-podderzhivat-otmenu-nds-dlia-internet-magazinov
https://iz.ru/880022/pavel-panov/ostrovnoi-instinkt-nalogovye-lgoty-na-kurilakh-rasshiriat
https://iz.ru/875640/sergei-izotov-irina-badmaeva/iz-teni-vykhodiat-v-polden-samozaniatye-gotovy-k-uplate-nalogov
https://iz.ru/874061/2019-04-30/v-gosdume-raskritikovali-ideiu-vvesti-edinyi-sbor-za-zarubezhnye-posylki
https://iz.ru/863288/2019-04-02/ekspert-nazval-davleniem-na-biznes-ideiu-sdelat-nenalogovye-platezhi-nalogami
https://iz.ru/863047/2019-04-02/minfin-vystupil-za-vvedenie-gostinichnogo-sbora-dlia-turistov
https://iz.ru/860214/2019-03-25/minek-predlozhil-obedinit-ekologicheskie-platezhi-v-odin-fond
https://iz.ru/841831/dmitrii-grinkevich/nenalogovyi-vychet-vedomstvam-zapretiat-vvodit-novye-sbory-dlia-biznesa
https://iz.ru/929418/ekaterina-vinogradova/lgoty-strogogo-rezhima-biznes-protiv-ogranichenii-dlia-samozaniatykh
https://iz.ru/922617/2019-09-17/v-gosdume-podderzhali-proekt-ob-elektronnykh-trudovykh-knizhkakh
https://iz.ru/921474/2019-09-14/v-pfr-rasskazali-v-kakikh-sluchaiakh-mogut-snizit-pensiiu
https://iz.ru/916790/2019-09-02/v-gosdume-prokommentirovali-ideiu-pfr-o-novom-poriadke-vyplaty-pensii
https://iz.ru/916618/2019-09-02/pfr-predlozhil-peresmotret-mekhanizm-vyplat-pensii

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


