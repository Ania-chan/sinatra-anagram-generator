require 'csv'    
 
csv_text = File.read('db/dictionary2.csv')
dictionary_words = CSV.parse(csv_text)
dictionary_words.each do |row|
    Word.create!(text: row[0])
end

Word.all.each do |word|
    characters = word.text.chars
    alphabetized_characters = characters.sort
    word.letters = alphabetized_characters.join
    word.save
end