require 'nokogiri'
require 'open-uri'

links = %w[
https://www.glavbukh.ru/news/30379-sudy-otkazyvayut-kompaniyam-v-vozmeshchenii-rashodov-po-uhodu-za-rebenkom
https://www.glavbukh.ru/news/30375-buhsoft-2020---programma-s-zashchitoy-ot-oshibok
https://www.glavbukh.ru/news/30372-proverte-bezopasnuyu-dolyu-vychetov-po-nds
https://www.glavbukh.ru/news/30370-kak-sdat-4-fss-za-9-mesyatsev-i-ne-zaputatsya-v-forme
https://www.glavbukh.ru/news/30362-9-oktyabrya-posledniy-den-chtoby-uvedomit-fss
https://www.glavbukh.ru/news/30358-kak-schitat-nds-esli-net-akta-sdachi-priemki-rabot
https://www.glavbukh.ru/news/30356-46-gotovyh-poyasneniy-dlya-fns-i-pfr
https://www.glavbukh.ru/news/30354-pereproverte-vychety-v-6-ndfl
https://www.glavbukh.ru/news/30355-kogda-nado-probivat-cheki-pri-beznalichnoy-oplate
https://www.glavbukh.ru/news/30352-buhsoft-2020---teper-s-zashchitoy-ot-oshibok
https://www.glavbukh.ru/news/30349-kak-rabotodatelyu-provodit-attestatsiyu-rabotnikov
https://www.glavbukh.ru/news/30346-kak-oformit-chek-pri-postoplate-instruktsiya-ot-fns
https://www.glavbukh.ru/news/30343-podskazki-dlya-4-fss-za-9-mesyatsev
https://www.glavbukh.ru/news/30339-rabotnik-prosit-perechislit-zarplatu-na-schet-tretego-litsa-chto-delat-rabotodatelyu
https://www.glavbukh.ru/news/30328-kakie-poyasneniya-ifns-ne-vprave-trebovat-s-kompaniy
https://www.glavbukh.ru/news/30324-sverka-s-fns-avtomatizatsiya-protsessa-v-servise-buhsoft-otchetnost
https://www.glavbukh.ru/news/30319-buhmars-2020
https://www.glavbukh.ru/news/30320-podskazki-kak-spisyvat-spornye-rashody-na-uproshchenke
https://www.glavbukh.ru/news/30310-chem-ogranicheny-uderjaniya-iz-zarplaty-rabotnika
https://www.glavbukh.ru/news/30311-fns-rassekretila-svedeniya-o-dohodah
https://www.glavbukh.ru/news/30308-v-rossii-vyrosla-dobycha-gaza
https://www.glavbukh.ru/news/30301-kak-bez-oshibok-oformit-peredachu-prava-podpisi-rukovoditelya
https://www.glavbukh.ru/news/30276-mojno-li-spisat-zatraty-po-dokumentam-kotorye-direktor-podpisal-v-otpuske
https://www.glavbukh.ru/news/30287-sudy-nichem-ne-pomogut-esli-ifns-zatyagivaet-s-resheniem
https://www.glavbukh.ru/news/30278-proverochnyy-list-po-buhuchetu-ot-minfina-i-jurnala-glavbuh
https://www.glavbukh.ru/news/30280-kak-perechislit-zarplatu-na-bankovskuyu-kartu-po-novym-pravilam
https://www.glavbukh.ru/news/30275-kak-glavbuhu-sohranit-chest-i-svoi-dengi
https://www.glavbukh.ru/news/30273-udobnaya-pamyatka-po-otpuskam-kotoruyu-stoit-razdat-personalu
https://www.glavbukh.ru/news/30271-minfin-nazval-usloviya-dlya-primeneniya-uproshchenki-v-2020-godu
https://www.glavbukh.ru/news/30269-buhsoft-prinyal-uchastie-v-vserossiyskom-nalogovom-forume
https://www.glavbukh.ru/news/30266-za-chto-shtrafuyut-lichno-buhgaltera
https://www.glavbukh.ru/news/30260-obrazets-dokumenta-dlya-bystrogo-poiska-nalogovyh-nedoimok-i-pereplat
https://www.glavbukh.ru/news/30254-chem-riskuet-organizatsiya-i-ip-narushaya-pravila-raboty-s-kkt
https://www.glavbukh.ru/news/30251-buhgalterskie-videoblogi-kotorymi-zasmatrivayutsya-desyatki-tysyach-vashih-kolleg
https://www.glavbukh.ru/news/30250-fns-predlojila-sudyam-inache-vzglyanut-na-delo-buhgaltera-ahmadeevoy
https://www.glavbukh.ru/news/30246-universalnaya-pamyatkadlya-korrektirovochnyh-schetov-faktur
https://www.glavbukh.ru/news/30242-pfr-rasskazal-chego-jdat-ot-perehoda-na-elektronnye-trudovye-knijki
https://www.glavbukh.ru/news/30239-obraztsy-dokumentov-dlya-komandirovki-chtoby-izbejat-sporov-s-inspektorami
https://www.glavbukh.ru/news/30228-kak-pokupatelyu-otrazit-keshbek-v-nalogovom-uchete
https://www.glavbukh.ru/news/30227-sud-razreshil-predprinimatelyam-ne-sdavat-szv-staj
]

nodes = [
'h1[itemprop="headline name"]',
'div[itemprop="articleBody"] p'
]

links.each_with_index do |link, index|
  file = File.new("#{index}.txt", 'w')

  doc = Nokogiri::HTML(open(link), nil)

  nodes.each do |node|
    doc.css(node).each do |tag|
      #puts tag.content
      file.write("#{tag.text}\n")
    end
  end
  
  file.close
end


