require 'csv'
require 'yaml'
require_relative 'import_articles'


# ---- PROBABILITIES ----
keywords_probs = YAML.load_file('../yaml data/keywords_probs.yaml')
# ---- PROBABILITIES ----


# ---- SENTENCE ----
sentence = '
Путин освободил от уплаты НДФЛ несколько категорий россиян
Пострадавшим в результате стихийных бедствий и терактов налог разрешили не платить

Президент России Владимир Путин подписал закон, который освобождает от уплаты налога на доходы физических лиц (НДФЛ) сразу несколько категорий россиян. Документ опубликован на портале правовой информации.

Платить налог больше не будут пострадавшие в результате стихийных бедствий, терактов и других чрезвычайных ситуаций. Послабление распространяется и на семьи пострадавших.

Кроме того, от НДФЛ освобождаются доходы россиян, которые сдавали в аренду свое жилье пострадавшим при терактах, ЧС и стихийных бедствиях, если оплата производилась в пределах сумм, полученных ими для аренды из госбюджета.

Накануне стало известно, что от НДФЛ освободили также студентов и аспирантов, получающих материальную помощь в размере не более 4 тыс. руб. в год. Речь идет о деньгах, которые выплачивают вузы или колледжи.

Ранее глава правительства Дмитрий Медведев неоднократно говорил, что кабмин не рассматривает вопрос об изменении ставки НДФЛ для россиян. В прошлом году, отвечая на предложение ввести прогрессивный подоходный налог, он заявил, что такая инициатива сильно ударит по среднему классу и никаких предварительных решений на этот счет не существует.
'
sentence.gsub!(/Ё|ё/, 'е')
sentence.downcase!
# ---- SENTENCE ----


# ---- COMPUTING ----   
amount_of_ham =  ARTICLES[:ham].length.to_f
amount_of_spam = ARTICLES[:spam].length.to_f

prob_ham = (amount_of_ham/(amount_of_ham + amount_of_spam)).round(5)
prob_spam = (amount_of_spam/(amount_of_ham + amount_of_spam)).round(5)

sentence_occurrences = Hash.new

keywords_probs.keys.each do |keyword|
  if sentence.match?(keyword)
    sentence_occurrences[keyword] = 1
  else
    sentence_occurrences[keyword] = 0
  end
end

sentence_probs = { ham: [],  spam: [] }

sentence_occurrences.each do |word, occurrence|
  if occurrence == 1
   sentence_probs[:ham] << keywords_probs[word][0].join.to_f
   sentence_probs[:spam] << keywords_probs[word][1].join.to_f
  elsif occurrence == 0
   sentence_probs[:ham] << 1 - keywords_probs[word][0].join.to_f
   sentence_probs[:spam] << 1 - keywords_probs[word][1].join.to_f
  end
end

sentence_probs[:ham] = sentence_probs[:ham].reduce(:*)
sentence_probs[:spam] = sentence_probs[:spam].reduce(:*)

sentence_spam_prob = (sentence_probs[:spam]*prob_spam)/((sentence_probs[:ham]*prob_ham) + (sentence_probs[:spam]*prob_spam))
sentence_ham_prob = (sentence_probs[:ham]*prob_ham)/((sentence_probs[:ham]*prob_ham) + (sentence_probs[:spam]*prob_spam))

puts "SPAM PROBABILITY: #{sentence_spam_prob}"
puts "HAM PROBABILITY: #{sentence_ham_prob}"        
# ---- COMPUTING ----

