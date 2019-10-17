require 'nokogiri'
require 'open-uri'

links = %w[
https://rg.ru/2019/10/10/reg-ufo/meriia-astrahani-soglasilas-snizit-grabitelskij-nalog-na-imushchestvo.html
https://rg.ru/2019/10/10/reg-pfo/putin-dopustil-vozmozhnost-nalogovyh-lgot-sportivnym-organizaciiam.html
https://rg.ru/2019/10/09/deputaty-predlozhili-ne-vvodit-novye-nalogi-v-konce-goda.html
https://rg.ru/2019/10/09/podohodnyj-nalog-dlia-inostrancev-i-rossiian-sravniaiut.html
https://rg.ru/2019/10/09/trebovaniia-dlia-podkliucheniia-kompanij-k-nalogovomu-monitoringu-sniziatsia.html
https://rg.ru/2019/10/09/siluanov-novye-kriterii-priznaniia-grazhdan-rezidentami-eshche-ne-priniaty.html
https://rg.ru/2019/10/08/v-2020-godu-nalog-na-samozaniatyh-mogut-rasprostranit-na-vsiu-stranu.html
https://rg.ru/2019/10/08/ctudentov-i-postradavshih-ot-stihii-osvobodili-ot-ndfl.html
https://rg.ru/2019/10/08/v-gosdume-predlozhili-ne-vvodit-novye-nalogi-v-konce-goda.html
https://rg.ru/2019/10/08/reg-pfo/fns-rasskazala-o-sposobah-legalizacii-seryh-dohodov.html
https://rg.ru/2019/10/08/reg-szfo/v-pomore-snizili-nalogovuiu-stavku-dlia-socialno-znachimogo-biznesa.html
https://rg.ru/2019/10/07/nalogi-dlia-malogo-biznesa-v-2020-godu-vyrastut-pochti-na-5-procentov.html
https://rg.ru/2019/10/07/mishustin-rasskazal-o-tom-kak-rossiiane-budut-platit-nalogi-v-budushchem.html
https://rg.ru/2019/10/07/reg-pfo/vveli-shtrafy-za-griby-zapret-na-neboskreby-i-doplatu-dlia-kino.html
https://rg.ru/2019/10/04/siluanov-predlozhil-ogranichit-perechen-professij-dlia-samozaniatyh.html
https://rg.ru/2019/10/04/matvienko-predlozhila-vvesti-nalog-dlia-samozaniatyh-vo-vseh-regionah-s-2020-goda.html
https://rg.ru/2019/10/03/korrespondent-rg-protestiroval-novyj-sposob-priumnozheniia-kapitala.html
https://rg.ru/2019/10/03/reg-ufo/v-krymu-ustroiat-nalogovye-kanikuly-dlia-otelej.html
https://rg.ru/2019/10/03/minfin-predlozhil-izmenit-podhod-k-sboru-nalogov-s-internet-gigantov.html
https://rg.ru/2019/10/11/mintrud-predlozhil-izmenit-usloviia-vyplaty-posobiia-po-uhodu-za-rebenkom.html
https://rg.ru/2019/10/10/zarplaty-i-pensii-voennyh-sobiraiutsia-proindeksirovat.html
https://rg.ru/2019/10/08/negosudarstvennye-pensii-razreshat-poluchat-na-piat-let-ranshe.html
https://rg.ru/2019/10/01/strahovshchiki-i-npf-nachnut-operativno-poluchat-dannye-o-smerti-klientov.html
https://rg.ru/2019/09/30/pensionnye-nakopleniia-dengi-s-osobennoj-iuridicheskoj-prirodoj.html
https://rg.ru/2019/09/30/mintrud-obiavil-ob-indeksacii-pensij-s-1-ianvaria.html
https://rg.ru/2019/09/26/v-minstroe-ocenili-perehod-na-proektnoe-finansirovanie.html
https://rg.ru/2019/10/01/kak-izmenitsia-nalogooblozhenie-bogatyh-rossiian.html
https://rg.ru/2019/10/01/sobkory-rg-zaglianuli-v-koshelek-segodniashnego-studenta.html
https://rg.ru/2019/10/01/minfin-predlozhil-izmenit-nalogooblozhenie-bogatyh-rossiian.html
https://rg.ru/2019/09/30/nekotorye-dohody-rossiian-osvobodili-ot-ndfl.html
https://rg.ru/2019/09/30/minzdrav-predlozhil-obnulit-nalogi-na-nedvizhimost-dlia-medorganizacij.html
https://rg.ru/2019/10/10/kabmin-izmenit-proceduru-kadastrovoj-ocenki-nedvizhimosti.html
https://rg.ru/2019/09/19/reg-pfo/ulianovskie-deputaty-predlagaiut-izmenit-poriadok-perechisleniia-ndfl.html
https://rg.ru/2019/09/04/reg-urfo/uralskij-biznes-predlozhil-vvesti-lgoty-po-nalogu-na-neprodannye-kvartiry.html
https://rg.ru/2019/09/01/u-rossiian-poiavitsia-vozmozhnost-uzakonit-samovolno-zaniatuiu-zemliu.html
https://rg.ru/2019/09/24/gd-odobrila-osvobozhdenie-ot-ndfl-vyplat-postradavshim-pri-chs.html
https://rg.ru/2019/09/24/reg-szfo/schetnaia-palata-predlozhila-optimizirovat-nenalogovye-platezhi-biznesa.html
https://rg.ru/2019/09/24/fns-primenit-risk-orientirovannyj-podhod-k-totalizatoram-i-bukmekeram.html
https://rg.ru/2019/09/19/nalogovye-vychety-pozvoliat-rossiianam-vernut-iz-biudzheta-200-mld-rublej.html
https://rg.ru/2019/09/19/platit-nalogi-i-obshchatsia-s-nalogovikami-stanet-proshche.html
https://rg.ru/2019/09/19/reg-pfo/ulianovskie-deputaty-predlagaiut-izmenit-poriadok-perechisleniia-ndfl.html
https://rg.ru/2019/09/11/fns-narashchivaet-postupleniia-pri-sokrashchenii-nalogovyh-proverok.html
]

nodes = [
'body h1.b-material-head__title',
'body .b-material-wrapper__lead',
'body .b-material-wrapper__text p'
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


