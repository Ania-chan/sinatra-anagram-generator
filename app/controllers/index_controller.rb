get '/' do
    erb :index
end

get '/anagrams/:word' do
    @word = params[:word]
    @anagrams = Word.find_anagrams(@word)
    erb :show
end

post '/' do
    @word = params[:word]
    if valid_input?(@word)
        redirect "/anagrams/#{@word}"
    else
        @error = "Please input a word thats 3 letters or less"
        erb :index
    end
end

def three_letters?(input)
    if input.length <= 3 
        true
    else 
        false
    end
end

def distinct_letters?(input)
    letter_array = input.chars
    unique_letters = letter_array.uniq
    if letter_array.length > unique_letters.length
        false
    else
        true
    end
end

def valid_input?(input)
    if three_letters?(input) && distinct_letters?(input)
        true
    else
        false
    end
end