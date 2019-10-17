require 'nokogiri'
require 'open-uri'

links = %w[
https://www.finanz.ru/novosti/aktsii/siluanov-povyshenie-nalogov-uskorit-ekonomiku-v-blizhayshie-mesyacy-1028095346
https://www.finanz.ru/novosti/aktsii/minfin-peredumal-povyshat-nalogi-dlya-uekhavshikh-v-evropu-oligarkhov-1028586648
https://www.finanz.ru/novosti/aktsii/pravitelstvo-gotovit-novy-udar-po-malomu-biznesu-1028584710
https://www.finanz.ru/novosti/aktsii/minfin-obyavil-o-vvedenii-trekh-novykh-nalogov-1028570456
https://www.finanz.ru/novosti/aktsii/putin-poruchil-v-6-raz-podnyat-akcizy-na-vino-1028562261
https://www.finanz.ru/novosti/aktsii/nalog-na-vylov-ryby-povysyat-v-23-raza-1028555070
https://www.finanz.ru/novosti/aktsii/sbory-s-naseleniya-i-biznesa-v-byudzhet-uvelichat-eshche-na-2-2-trilliona-rubley-1028544753
https://www.finanz.ru/novosti/aktsii/cb-zapretit-bednym-pokupat-inostrannye-akcii-1028543935
https://www.finanz.ru/novosti/aktsii/minfin-nashel-novy-sposob-podnyat-zarplaty-chinovnikam-1028543784
https://www.finanz.ru/novosti/aktsii/minfin-planiruet-pereyti-na-novuyu-sistemu-nakopitelnykh-pensiy-s-2021-goda-1028529403
https://www.finanz.ru/novosti/aktsii/rossiyskikh-predprinimateley-nachnut-nakazyvat-za-chuzhoe-otmyvanie-1028515902
https://www.finanz.ru/novosti/aktsii/minfin-pridumal-dlya-rossiyan-garantirovanny-pensionny-produkt-1028506154
https://www.finanz.ru/novosti/aktsii/sbory-za-musor-s-biznesa-povysyat-v-62-raza-1028454957
https://www.finanz.ru/novosti/aktsii/putin-podpisal-zakon-ob-osvobozhdenii-ot-nds-bankovskikh-operaciy-s-dragocennymi-metallami-1028388878
https://www.finanz.ru/novosti/aktsii/pensionnye-vznosy-rossiyan-prokrutyat-v-banke-rosnefti-1028380965
https://www.finanz.ru/novosti/aktsii/pravitelstvo-anonsirovalo-plany-rezko-podnyat-sobiraemost-nalogov-s-naseleniya-1028377561
https://www.finanz.ru/novosti/aktsii/cb-reshil-ogranichit-vlozheniya-bankov-v-akcii-1028348168
https://www.finanz.ru/novosti/aktsii/putin-poruchil-prorabotat-snizhenie-nalogov-dlya-rosnefti-1028341648
https://www.finanz.ru/novosti/aktsii/pravitelstvo-gotovit-rezkoe-povyshenie-akcizov-na-vino-1028337409
https://www.finanz.ru/novosti/aktsii/minfin-rezko-povysil-plan-po-sboru-shtrafov-nds-i-naloga-na-pribyl-1028309283
https://www.finanz.ru/novosti/aktsii/v-gosdume-zayavili-o-nevozmozhnosti-razvivat-ekonomiku-bez-povysheniya-nalogov-1028295569
https://www.finanz.ru/novosti/aktsii/v-pravitelstve-anonsirovali-plany-izyat-eshche-2-trilliona-rubley-u-naseleniya-1028265866
https://www.finanz.ru/novosti/aktsii/verkhovny-sud-predlozhil-otmenit-srok-davnosti-po-nalogovym-prestupleniyam-1028259117
https://www.finanz.ru/novosti/aktsii/minfin-podgotovil-novy-zapret-na-inostrannye-tovary-1028228607
https://www.finanz.ru/novosti/aktsii/cb-nashel-v-rossii-tolko-dva-banka-s-somnitelnymi-operaciyami-1028220891
https://www.finanz.ru/novosti/aktsii/oligarkhov-snova-osvobodili-ot-otvetstvennosti-za-neuplatu-nalogov-i-vyvod-kapitala-1028208529
https://www.finanz.ru/novosti/aktsii/minfin-predlozhil-porezat-pensii-i-uvelichit-raskhody-na-policiyu-i-chinovnikov-1028206672
https://www.finanz.ru/novosti/aktsii/pyat-novykh-nalogov-poyavyatsya-v-rossii-s-2021-goda-1028083166
https://www.finanz.ru/novosti/aktsii/zhilishchny-rynok-rossii-podelyat-pod-trekh-krupnykh-zastroyshchikov-1028131292
https://www.finanz.ru/novosti/aktsii/sbory-s-naseleniya-i-biznesa-v-byudzhet-podskochili-pochti-na-20percent-1028033408
https://www.finanz.ru/novosti/aktsii/minfin-i-cb-gotovyat-banki-k-otklyucheniyu-ot-globalnoy-dollarovoy-sistemy-1028031589
https://www.finanz.ru/novosti/aktsii/cb-obyazal-banki-soobshchat-klientam-prichiny-otkaza-v-obsluzhivanii-1027994456
https://www.finanz.ru/novosti/aktsii/minstroy-rf-predlozhil-dosrochno-osvobodit-ot-izbytochnykh-razresheniy-novostroyki-s-eskrou-1028576645
https://www.finanz.ru/novosti/aktsii/komitet-gd-predlozhil-obsudit-reformu-stroyotrasli-na-parlamentskikh-slushaniyakh-v-noyabre-1028548452
https://www.finanz.ru/novosti/aktsii/minfin-gotov-rassmotret-nalog-na-dvizhimoe-i-nedvizhimoe-imushchestvo-so-snizheniem-stavki-1028586299
https://www.finanz.ru/novosti/aktsii/braziliya-mozhet-vvesti-nalog-na-operacii-po-bankovskim-kartam-tv-1028514855
https://www.finanz.ru/novosti/aktsii/gosduma-odobrila-snizhenie-nalogov-dlya-rosnefti-i-gazproma-1028516588
https://www.finanz.ru/novosti/aktsii/biznes-osvobodyat-ot-nalogov-v-50-municipalnykh-obrazovaniyakh-priangarya-iz-za-navodneniya-1028482805
https://www.finanz.ru/novosti/aktsii/bolshinstvo-nalogovykh-lgot-dlya-biznesa-okazalis-neeffektivnymi-izvestiya-1028471622
https://www.finanz.ru/novosti/aktsii/rossiyskie-stroykompanii-mogut-uchastvovat-v-proektakh-v-saudovskoy-aravii-minstroy-1028527799
https://www.finanz.ru/novosti/aktsii/minstroy-predlagaet-priravnyat-pai-v-zhsk-k-ipotechnym-zalogam-1028352129
https://www.finanz.ru/novosti/aktsii/glava-suzdalya-predlozhil-vvesti-turisticheskiy-nalog-dlya-istoricheskikh-poseleniy-i-gorodov-1028541460
]

nodes = [
'body .content h1.news_title',
'body .content .news_text'
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


