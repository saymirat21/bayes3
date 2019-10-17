require 'nokogiri'
require 'open-uri'

links = %w[
https://www.glavbukh.ru/news/30378
https://www.glavbukh.ru/news/30377
https://www.glavbukh.ru/news/30376-minfin-razreshil-prinimat-k-vychetu-nds-bez-scheta-faktury
https://www.glavbukh.ru/news/30374-mintrud-menyaet-usloviya-vyplaty-posobiy
https://www.glavbukh.ru/news/30373-buhgalteram-dobavyat-raboty
https://www.glavbukh.ru/news/30371-minfin-pridumal-dlya-rossiyan-novyy-nalog
https://www.glavbukh.ru/news/30369-novyy-shtraf-dlya-rabotodateley-v-50-000-rub-ot-mintruda
https://www.glavbukh.ru/news/30367-mintrud-ponizil-projitochnyy-minimum
https://www.glavbukh.ru/news/30366-sroki-otchetnosti-sdvinuli-i-utverdili-novyy-rsv
https://www.glavbukh.ru/news/30364-dlya-kakih-nalogov-1-oktyabrya-izmenilis-pravila
https://www.glavbukh.ru/news/30363-izmenili-uchet-rashodov-osnovnyh-sredstv-na-usn
https://www.glavbukh.ru/news/30361-deputatam-zapretyat-prinimat-novye-zakony-o-nalogah-i-vznosah
https://www.glavbukh.ru/news/30360-fns-utverdila-novuyu-formu-rascheta-po-vznosam
https://www.glavbukh.ru/news/30357-glavbuhov-teper-sudyat-naravne-s-direktorami
https://www.glavbukh.ru/news/30356-46-gotovyh-poyasneniy-dlya-fns-i-pfr
https://www.glavbukh.ru/news/30353-s-1-yanvarya-2020-goda-nalog-na-imushchestvo-vyrastet
https://www.glavbukh.ru/news/30350-v-rossii-vvedut-novyy-nalogovyy-rejim
https://www.glavbukh.ru/news/30347-s-7-oktyabrya-minfin-vvel-v-deystvie-novyy-dokument
https://www.glavbukh.ru/news/30348-ustanovili-limity-na-inostrannyh-rabotnikov-v-2020-godu
https://www.glavbukh.ru/news/30344-s-2020-goda-vyrastut-nalogi-dlya-malogo-biznesa
https://www.glavbukh.ru/news/30345-teper-nalogom-oblagayutsya-vse-pomeshcheniya
https://www.glavbukh.ru/news/30342-minfin-poobeshchal-kompensirovat-rashody-po-ipoteke
https://www.glavbukh.ru/news/30341-vseh-buhgalterov-rossii-osvobodili-ot-rascheta-posobiy-a-rabotodateley-ot-perechisleniya-etih
https://www.glavbukh.ru/news/30337-fns-razreshila-vesti-biznes-ne-ukazannyy-v-egryul
https://www.glavbukh.ru/news/30336-nalogoviki-ne-smogut-vzyskat-s-kompanii-ili-ip-dolgi-do-3000-rubley
https://www.glavbukh.ru/news/30333-envd-i-patent-otmenyayut-s-1-yanvarya-2020
https://www.glavbukh.ru/news/30332-srochnaya-novost-dlya-vseh-buhgalterov-v-2020-godu-izmenilis-imushchestvennye-nalogi
https://www.glavbukh.ru/news/30326-v-2020-godu-vlasti-razreshili-platit-ndfl-za-schet-edinogo-nalogovogo-plateja
https://www.glavbukh.ru/news/30322-v-2020-godu-deystvuyut-novye-pravila-uplaty-torgovogo-sbora
https://www.glavbukh.ru/news/30321-chinovniki-pridumali-novyy-millionnyy-shtraf-dlya-kompaniy
https://www.glavbukh.ru/news/30315-minfin-kardinalno-pomenyaet-rabotu-buhgalterov-za-tri-goda
https://www.glavbukh.ru/news/30317-v-2020-godu-izmenyatsya-koeffitsienty-deflyatory
https://www.glavbukh.ru/news/30313-putin-i-izmenil-pravila-sdachi-rascheta-po-vznosam
https://www.glavbukh.ru/news/30303-nalogovyy-kodeks-menyaet-privychnuyu-otchetnost-32-vajnye-pravki
https://www.glavbukh.ru/news/30295-izmenilis-pravila-sdachi-otchetnosti-po-ndfl-dlya-kompaniy-s-obosobkami
https://www.glavbukh.ru/news/30294-putin-osvobodil-studentov-ot-ndfl
https://www.glavbukh.ru/news/30293-rabotnik-prosit-perechislyat-zarplatu-tretemu-litsu-kakie-dokumenty-sostavit
https://www.glavbukh.ru/news/30290-novyy-poryadok-vzyskaniya-dolgov
https://www.glavbukh.ru/news/30282-s-29-sentyabrya-v-rossii-novyy-dokument-dlya-priema-na-rabotu
https://www.glavbukh.ru/news/30284-postradavshie-ot-teraktov-poluchili-osvobojdenie-ot-ndfl
https://www.glavbukh.ru/news/30277-mintrud-nevygodno-menyaet-usloviya-dlya-vyplat-posobiy-po-uhodu-za-rebenkom
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
      puts tag.text
      file.write("#{tag.text}\n")
    end
  end
  
  file.close
end


