require 'nokogiri'
require 'open-uri'

links = %w[
https://www.vestifinance.ru/articles/126503
https://www.vestifinance.ru/articles/126495
https://www.vestifinance.ru/articles/126493
https://www.vestifinance.ru/articles/126490
https://www.vestifinance.ru/articles/126475
https://www.vestifinance.ru/articles/126479
https://www.vestifinance.ru/articles/126468
https://www.vestifinance.ru/articles/126462
https://www.vestifinance.ru/articles/126458
https://www.vestifinance.ru/articles/126456
https://www.vestifinance.ru/articles/126446
https://www.vestifinance.ru/articles/126454
https://www.vestifinance.ru/articles/126445
https://www.vestifinance.ru/articles/126429
https://www.vestifinance.ru/articles/126426
https://www.vestifinance.ru/articles/126424
https://www.vestifinance.ru/articles/126425
https://www.vestifinance.ru/articles/126416
https://www.vestifinance.ru/articles/126405
https://www.vestifinance.ru/articles/126396
https://www.vestifinance.ru/articles/126405
https://www.vestifinance.ru/articles/126372
https://www.vestifinance.ru/articles/126377
https://www.vestifinance.ru/articles/126371
https://www.vestifinance.ru/articles/126361
https://www.vestifinance.ru/articles/126460
https://www.vestifinance.ru/articles/126456
https://www.vestifinance.ru/articles/126447
https://www.vestifinance.ru/articles/126453
https://www.vestifinance.ru/articles/126444
https://www.vestifinance.ru/articles/126429
https://www.vestifinance.ru/articles/126398
https://www.vestifinance.ru/articles/126372
https://www.vestifinance.ru/articles/126506
https://www.vestifinance.ru/articles/126504
https://www.vestifinance.ru/articles/126493
https://www.vestifinance.ru/articles/126489
https://www.vestifinance.ru/articles/126486
https://www.vestifinance.ru/articles/126478
https://www.vestifinance.ru/articles/126468
https://www.vestifinance.ru/articles/126451
https://www.vestifinance.ru/articles/126450
https://www.vestifinance.ru/articles/126456
]

nodes = [
'body .b-material h1',
'body .b-material .b-material-body'
]

links.each_with_index do |link, index|
  file = File.new("#{index}.txt", 'w')

  doc = Nokogiri::HTML(open(link), nil, Encoding::UTF_8.to_s)

  nodes.each do |node|
    doc.css(node).each do |tag|
      #puts tag.text
      file.write("#{tag.text}\n")
    end
  end
  
  file.close
end


