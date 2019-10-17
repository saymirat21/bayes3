require 'nokogiri'
require 'open-uri'

links = %w[
https://rg.ru/2019/10/11/chto-rossii-i-rubliu-prineset-torgovaia-vojna-mezhdu-ssha-i-es.html
https://rg.ru/2019/10/10/nabiullina-somnevaetsia-v-preimushchestvah-nacionalnoj-kriptovaliuty.html
https://rg.ru/2019/10/10/nazvan-predel-oslableniia-rublia-do-vesny.html
https://rg.ru/2019/10/09/krupnye-banki-otkazyvaiutsia-ot-vkladov-v-evro.html
https://rg.ru/2019/10/09/zimoj-kurs-evro-probet-psihologicheski-vazhnuiu-otmetku.html
https://rg.ru/2019/10/08/reg-urfo/ekaterinburzhenka-vernula-kvartiru-kotoroj-lishilas-iz-za-igry-na-birzhe.html
https://rg.ru/2019/10/08/dollar-mozhet-okazatsia-pod-davleniem.html
https://rg.ru/2019/10/06/ekonomist-nazval-samuiu-bolshuiu-opasnost-dlia-rublia.html
https://rg.ru/2019/10/04/rubliu-predskazali-novuiu-volnu-oslableniia-k-dollaru.html
https://rg.ru/2019/09/27/do-kakih-predelov-mozhet-vzletet-dollar-i-upast-evro.html
https://rg.ru/2019/09/26/chto-budet-s-dollarom-iz-za-ugrozy-impichmenta-trampa.html
https://rg.ru/2019/09/29/v-kakom-statuse-dollar-vstretit-oktiabr.html
https://rg.ru/2019/09/29/chto-zhdet-vkladchikov-esli-vvedut-otricatelnye-stavki-po-valiutnym-depozitam.html
https://rg.ru/2019/09/30/chto-budet-s-rublem-na-etoj-nedele.html
https://rg.ru/2019/10/01/nazvan-glavnyj-autsajder-sredi-valiut-v-oktiabre.html
https://rg.ru/2019/10/01/sberbank-zapuskaet-perevody-za-rubezh-na-karty-visa-i-mastercard.html
https://rg.ru/2019/10/01/bank-rossii-uvelichil-doliu-dollara-v-rezervah-i-snizil-doliu-evro.html
https://rg.ru/2019/10/02/kurs-dollara-pojmal-volnu-rosta.html
https://rg.ru/2019/10/02/kitaj-vpervye-stal-liderom-po-inostrannym-investiciiam-cb-rossii.html
https://rg.ru/2019/10/03/bankiry-predlozhili-pri-oplate-tamozhennyh-poshlin-ne-ispolzovat-dollar.html
https://rg.ru/2019/10/08/avtosovetniki-pomogut-nachinaiushchim-investoram-na-fondovom-rynke.html
https://rg.ru/2019/10/08/rynku-ne-hvataet-kompleksnyh-blokchejn-reshenij.html
https://rg.ru/2019/10/03/nazvany-novye-perspektivy-nacvaliuty-i-padeniia-dollara-do-60-rublej.html
https://rg.ru/2019/10/03/fondovye-torgi-v-ssha-zavershilis-obvalom-kliuchevyh-indeksov.html
https://rg.ru/2019/09/25/rynok-akcij-ssha-snizilsia-iz-za-kitaia-i-ugrozy-impichmenta-trampu.html
https://rg.ru/2019/09/23/cb-predlozhil-ogranichit-vozmozhnosti-nekvalificirovannyh-investorov.html
https://rg.ru/2019/09/18/reg-urfo/uralskij-malyj-biznes-udvoit-privlechenie-sredstv-na-fondovom-rynke.html
https://rg.ru/2019/09/12/obemy-birzhevoj-torgovli-drevesinoj-mogut-vyrasti-v-tri-raza.html
https://rg.ru/2019/08/28/minekonomrazvitiia-sprognozirovalo-kurs-dollara-do-2024-goda.html
https://rg.ru/2019/10/10/reg-urfo/v-tobolske-u-zavodov-neftehimii-poselilis-zhivotnye-pticy-i-ryby.html
https://rg.ru/2019/10/09/miller-rekomendoval-ukraine-opredelitsia-s-obemom-zakupok-gaza-iz-rf.html
https://rg.ru/2019/10/08/reg-ufo/aksenov-rasskazal-o-grandioznyh-planah-chernomorneftegaza.html
https://rg.ru/2019/10/08/v-kremle-rasskazali-o-planah-moskvy-i-er-riiada-po-nefti.html
https://rg.ru/2019/10/08/cena-na-tranzit-gaza-cherez-ukrainu-dolzhna-byt-konkurentnoj.html
https://rg.ru/2019/10/07/novak-pro-neft-za-100-dollarov-za-barrel-mozhno-zabyt.html
https://rg.ru/2019/10/07/ekspert-rasschital-kursy-valiut-pri-cene-nefti-v-10-dollarov.html
https://rg.ru/2019/10/04/novak-ocenil-shansy-na-prokladku-severnogo-potoka-2-riadom-s-daniej.html
https://rg.ru/2019/10/04/kabmin-i-uchastniki-rynka-reshat-kak-usovershenstvovat-sistemu-kontrolia-kachestva-nefti.html
https://rg.ru/2019/10/04/gazprom-nazval-srok-zapuska-dvuh-nitok-tureckogo-potoka.html
https://rg.ru/2019/10/04/novak-rasskazal-o-cene-tranzita-gaza-cherez-ukrainu.html
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


