ARTICLES = Hash.new

[:ham, :spam].each do |folder|
  ARTICLES[folder] = []

  inside_folders = Dir.entries("../#{folder}").select{|folder| !folder.include?('.')}

  inside_folders.each do |inside_folder|
  	txt_files = Dir.glob("../#{folder}/#{inside_folder}/*.txt") # Array of txt files in an inside folder
	txt_files.each do |txt_file|
		file = File.open(txt_file, 'r')
		ARTICLES[folder] << file.read
		file.close
	end
  end
end

ARTICLES.each do |category, category_articles| 
  category_articles.each do |article|
    article.gsub!(/Ё|ё/, 'е')
    article.downcase!
  end
end

ARTICLES_SPLITTED = Hash.new

ARTICLES.each do |category, category_articles|
  ARTICLES_SPLITTED[category] = []

  category_articles.each do |category_article|
    category_article_splitted = category_article.split(/[^а-я]/)
    category_article_splitted.delete_if { |word| word.empty? }
    ARTICLES_SPLITTED[category] << category_article_splitted
  end
end

DICTIONARY = Hash.new

ARTICLES_SPLITTED.each do |category, category_articles_splitted|
  DICTIONARY[category] = category_articles_splitted.flatten.uniq
end


### ### ### ### ### ###

KEYWORDS = [
	/\bизмен.{0,6}|обнов.{0,6}\b/,
	/\bввест.{0,4}|введен.{0,4}\b/,
	/\bобсу(д|жд).*\b/,
	/\bсмогут\b/,
	/\bпридется\b/,
	/\bпланир.{0,4}\b/,
	/\bнамере.{0,4}\b/,
	/\bпредлаг.{0,4}|предлож.{0,6}\b/,
	/\bотмен.{0,6}\b/,
	/\bпереход.{0,6}\b/,
	/\bиде.{0,4}|инициатив.{0,4}\b/,
	/\bплат.{0,6}\b/,
	/\bуплат.{0,4}\b/,



	/\bминфин.{0,3}|министерств.{0,4}\ финансов\b/,
	/\bминэк.{0,4}|министерств.{0,4}\ экономического|минэконом.{0,10}\b/,
	/\bминстро.{0,4}|министерств.{0,4}\ строительства\b/,
	/\bфнс|ифнс|федеральн.{0,4}\ налог.{0,4}\ служб.{0,4}\b/,
	/\bгд|госдум.{0,4}|государственн.{0,4}\ дум.{0,4}\b/,



	/\bналог.{0,4}\b/,
	/\bсбор.{0,4}\b/,
	/\bпен.{0,4}\b/,
	/\bстрахов.{0,4}\ взнос.{0,4}\b/,
	/\bльгот.{0,4}\b/,
	/\bвыплат.{0,4}\b/,
	/\bфз|федеральн.{0,4}\ закон.{0,4}\b/,
	/\bзакон.{0,4}\b/,
	/\bзаконопроект.{0,4}\b/,
	/\bкодекс.{0,4}\b/,
	/\bнк|налого.{0,4}\ кодекс.{0,4}\b/,
	/\bндс|налог.{0,4}\ на\ добавленн.{0,4}\b/,
	/\b.{0,3}ндфл.{0,4}\b/,
	/\bзарплат.{0,4}|заработн.{0,4}\ плат.{0,4}\b/,
	/\bфизлиц.*|физ*.\ лиц.*\b/,
	/\bставк.{0,4}\b/,
	/\bпоправ.{0,4}|правк.{0,4}\b/,
	/\bпроект.{0,4}\b/,
	/\bиндекс.{0,4}\b/,
	/\bкадастр.{0,4}\b/,
	/\bзастройщик.{0,4}\b/,
	/\bпроектн.{0,4}\ финансиров.{0,6}\b/,
	/\bэскроу.*\b/,



	/\bкитай\b/,
	/\bвалют.{0,6}\b/,
	/\bсша|америк.*|соединенн.{1,3}\ штат.{1,3}\ америк.{1,3}\b/

]

