folders = ['ham', 'spam']

folders.each do |folder|
  resulting_file = File.new("aggregated txt/#{folder}_aggregated.txt", 'a')
  resulting_file.truncate(0)

  inside_folders = Dir.entries("#{folder}").select{|folder| !folder.include?('.')} # Array of folders
  count_of_articles = 0

  inside_folders.each do |inside_folder|
  	txt_files = Dir.glob("#{folder}/#{inside_folder}/*.txt") # Array of txt files in an inside folder
	txt_files.each do |txt_file|
		file = File.open(txt_file, 'r')
		file_data = file.read
		file.close
                
		resulting_file.write(file_data, "\n")

		puts txt_file
		count_of_articles += 1
        end
  end
  resulting_file.close
  puts "#{count_of_articles} #{folder} articles were processed."	
end

total_file = File.new("aggregated txt/in_total.txt", 'a')
total_file.truncate(0)

folders.each do |folder|
  resulting_file = File.open("aggregated txt/#{folder}_aggregated.txt", 'r')
  file_data = resulting_file.read
  resulting_file.close

  total_file.write(file_data, "\n")
end

total_file.close
puts 'Total file composed.'





