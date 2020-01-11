require 'csv'
require 'yaml'
require_relative 'import_articles'


# ---- PROBABILITIES ----
keywords_probs = YAML.load_file('../yaml data/keywords_probs.yaml')
# ---- PROBABILITIES ----


# ---- SENTENCE ----
sentence = '
Центральный банк и Министерство финансов разработали новую систему добровольных пенсионных накоплений — гарантированный пенсионный план (ГПП). Законопроект презентовали первый зампред ЦБ Сергей Швецов и замминистра финансов Алексей Моисеев. Об этом сообщает «РИА Новости» 29 октября.

ГПП даст возможность жителям России самостоятельно финансировать свою негосударственную пенсию при стимулирующей поддержке государства. Согласно новой системе, пенсионный взнос, который не превышает 6% от зарплаты, освобождается от налога на доход физлиц.


Гибридный продукт: Минфин и ЦБ согласовали проект «второй пенсии»
Новый пенсионный план будет представлен на обсуждение на следующей неделе
Отмечается, что в систему собраны характеристики нескольких продуктов. Например, депозита, так как он защищен гарантией Агентства по страхованию вкладов, и доверительного управления, «где средствами управляют профессионалы и за счет профессионального подхода к управлению длинными деньгами может быть получена доходность, превышающая доходность простых инструментов, того же самого депозита», рассказал Швецов.

«Мы хотим дать возможность гражданам иметь продукт, который позволит им накопить на пенсию таким образом, чтобы это было, с одной стороны, доходно, с другой стороны — гарантированно, с третьей стороны — чтобы инфраструктура была организована таким образом, чтобы не возникало споров между гражданами и пенсионными фондами, и чтобы всегда был ответ на вопрос, кто в этих спорах прав, кто виноват», — заявил Моисеев.






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
