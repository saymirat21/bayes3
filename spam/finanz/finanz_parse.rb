require 'nokogiri'
require 'open-uri'

links = %w[
https://www.finanz.ru/novosti/obligatsii/valyuta-iz-ofshorov-khlynula-v-rossiyskiy-gosdolg-1028589629
https://www.finanz.ru/novosti/aktsii/akcii-krupneyshego-devolopera-rossii-rukhnuli-posle-begstva-kiprskogo-vladelca-1028590132
https://www.finanz.ru/novosti/obligatsii/gosobligacii-rf-podskochili-posle-zayavleniya-nabiullinoy-o-snizhenii-stavki-1028589902
https://www.finanz.ru/novosti/valyuty/rossiya-mozhet-postavit-krest-na-idee-kriptorublya-1028589377
https://www.finanz.ru/novosti/lichnyye-finansy/vlasti-predlozhili-otpravlyat-pod-arest-roditeley-kuryashchikh-podrostkov-1028588938
https://www.finanz.ru/novosti/aktsii/cud-otkazalsya-privlech-odnokursnika-putina-k-otvetstvennosti-za-krakh-banka-1028588454
https://www.finanz.ru/novosti/valyuty/centrobanki-propishut-mirovoy-ekonomike-massovoe-snizhenie-stavok-1028586621
https://www.finanz.ru/novosti/aktsii/turciya-nachala-vtorzhenie-v-siriyu-1028587441
https://www.finanz.ru/novosti/aktsii/elektronnoy-pochtoy-v-rossii-razreshat-polzovatsya-tolko-po-pasportu-1028584891
https://www.finanz.ru/novosti/aktsii/vsemirny-bank-predskazal-rossii-begstvo-inostrannogo-biznesa-i-otstavanie-ot-mira-1028586504
https://www.finanz.ru/novosti/aktsii/tramp-rasshiril-cherny-spisok-kitayskikh-kompaniy-i-gotovit-zapret-na-investicii-1028583833
https://www.finanz.ru/novosti/aktsii/medvedev-poruchil-oreshkinu-srochno-nayti-recept-ekonomicheskogo-chuda-1028584258
https://www.finanz.ru/novosti/aktsii/putin-podnyal-zarplatu-sebe-medvedevu-i-silovikam-1028581551
https://www.finanz.ru/novosti/aktsii/germaniya-uvelichila-eksport-oruzhiya-do-rekorda-1028580026
https://www.finanz.ru/novosti/aktsii/vrachi-zayavili-o-nekhvatke-3-trillionov-rubley-na-kachestvennoe-zdravookhranenie-1028580851
https://www.finanz.ru/novosti/aktsii/za-kokain-v-dippochte-mida-otsidit-zavkhoz-1028577636
https://www.finanz.ru/novosti/aktsii/kak-zhestkiy-brexit-mozhet-stat-problemoy-dlya-mirovoy-ekonomiki-1028576999
https://www.finanz.ru/novosti/aktsii/rossiya-peredast-kitayu-protivoraketnye-tekhnologii-1028576555
https://www.finanz.ru/novosti/aktsii/v-irake-otklyuchili-internet-v-otvet-na-massovye-protesty-1028575702
https://www.finanz.ru/novosti/aktsii/rogozin-predrek-proval-novomu-kosmicheskomu-korablyu-ilona-maska-1028574051
https://www.finanz.ru/novosti/aktsii/csha-ispytali-mezhkontinentalnuyu-ballisticheskuyu-raketu-1028573340
https://www.finanz.ru/novosti/aktsii/tramp-udaril-tarifami-po-evrope-1028573260
https://www.finanz.ru/novosti/aktsii/eks-bankir-sberbanka-obnalichil-40-milliardov-cherez-pokupku-piva-1028573217
https://www.finanz.ru/novosti/aktsii/matvienko-anonsirovala-vstuplenie-uzbekistana-v-eaes-1028572347
https://www.finanz.ru/novosti/aktsii/zamglavy-aeroflota-zaderzhali-za-mnogomillionnoe-moshennichestvo-1028569870
https://www.finanz.ru/novosti/aktsii/putin-obyavil-geroem-rossii-glavu-rostekha-chemezova-1028569569
https://www.finanz.ru/novosti/aktsii/s&p-rossiyskie-banki-ne-nadyozhnee-uzbekskikh-1028567717
https://www.finanz.ru/novosti/aktsii/promyshlennost-rossii-rukhnula-rekordno-za-10-let-1028566203
https://www.finanz.ru/novosti/aktsii/v-rossiyskoy-nefti-snova-obnaruzhili-khlor-1028566402
https://www.finanz.ru/novosti/aktsii/rossiyskie-goskompanii-massovo-ukhodyat-v-ten-1028565462
https://www.finanz.ru/novosti/aktsii/csha-uzhestochili-sankcii-protiv-khozyaina-fabriki-trolley-i-chvk-vagnera-1028564866
https://www.finanz.ru/novosti/aktsii/tramp-zapodozril-gosizmenu-v-kongresse-1028562708
https://www.finanz.ru/novosti/aktsii/medvedev-otschital-dlya-veba-eshche-200-milliardov-rubley-iz-byudzheta-1028562578
https://www.finanz.ru/novosti/aktsii/banki-uoll-strit-sovetuyut-gotovitsya-k-obostreniyu-torgovoy-voyny-i-obvalu-yuanya-1028563379
https://www.finanz.ru/novosti/aktsii/gosduma-priznala-narisovannym-rost-rossiyskogo-vvp-1028559636
https://www.finanz.ru/novosti/aktsii/voennaya-prokuratura-priznala-obosnovannymi-repressii-v-sssr-1028558814
https://www.finanz.ru/novosti/aktsii/bill-klinton-2-0-chto-zhdet-uoll-strit-ot-impichmenta-trampa-1028556480
https://www.finanz.ru/novosti/aktsii/dlya-rossiyan-sozdadut-otdelnuyu-vikipediyu-za-2-milliarda-rubley-1028556657
https://www.finanz.ru/novosti/aktsii/v-gosdume-obvinili-banki-v-tormozhenii-malogo-biznesa-1028554886
https://www.finanz.ru/novosti/aktsii/top-menedzhera-estonskogo-banka-otmyvshego-$150-mlrd-iz-rossii-nashli-mertvym-1028552921
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


