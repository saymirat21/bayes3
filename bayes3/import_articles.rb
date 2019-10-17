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
