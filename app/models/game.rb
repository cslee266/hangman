class Game < ApplicationRecord
  def self.get_domains
    url = "https://od-api.oxforddictionaries.com/api/v1/domains/en"
    response = open(url, "app_id" => ENV["APP_ID"], "app_key" => ENV["APP_KEY"]).read
    json_data = JSON.load(response)["results"]
    domains = []
    json_data.each do |domain|
      if !(domain[1]["en"].scan(/\s/).any?)
        domains << domain[1]["en"]
      end
    end
    domains
  end

  def self.get_words(category)
  	url = "https://od-api.oxforddictionaries.com:443/api/v1/wordlist/en/domains=#{category}"
  	response = open(url, "app_id" => ENV["APP_ID"], "app_key" => ENV["APP_KEY"]).read
  	json_data = JSON.load(response)["results"]
  	words = []
  	json_data.each do |result|
    	  if result["word"] =~ /[a-z]+\s*[a-z]*/ && result["word"].length >= 6 && result["word"].length <= 10
      	words << result["word"]
    	  end
  	end
  	words
  end

  def self.check_for_special_char(word)
    @space, @quote, @dash, @comma = nil, nil, nil, nil
  	word.scan(/\s/) { |space| @space = [word.index(space), " "] }
  	word.scan(/'/) { |quote| @quote = [word.index(quote), "'"] }
  	word.scan(/-/) { |dash| @dash = [word.index(dash), "-"] }
    word.scan(/,/) { |comma| @comma = [word.index(comma), ","] }
  	special_char = [@space, @quote, @dash, @comma]
  	special_char.any? { |x| !(x.nil?) } ? special_char : false
  end

  def self.generate_blanks(selected_word)
	  blanks = []
  	selected_word.size.times { blanks << "_" }
    check = Game.check_for_special_char(selected_word)
  	  if check
        check.each do |x|
        	if x
        	  blanks[x[0]] = x[1]
          end
        end
  	  end
  	blanks
  end

  def self.replace(blanks, word, letter)
    position = word.indices(letter)
      position.each do |pos|
        blanks[pos] = letter.upcase
      end
    blanks
  end
end
