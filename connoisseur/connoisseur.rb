require 'open-uri'
require 'json'

class htmlGenerator
	raw_response = open("http://lcboapi.com/products.json").read
	# puts raw_response.class #String

	product_data = JSON.parse(raw_response)#transformando em hash
	product = product_data["result"]
	# puts booze_data.class #It's a hash
	# puts booze_data["status"] #call the key and you have the value as a result

	# puts booze_data["result"] #key result
	# action = ARGV[0] #ARGV sao os parametros passados pelo terminal
					 #ex: ruby connoisseur arg1 arg2 --> ARGV[0] == arg1
					 #									 ARGV[1] == arg2

	def index
		print_header
		products.each do |product_hash| #key result
			puts "<div>"
			puts "<h1> #{product_hash['name']}</h1>" #JSON the keys are Strings and not Symbols
			puts "<p>#{product_hash['price_in_cents']}</p>"
			puts "<p>#{product_hash['primary_category']}</p>"
			puts "<p>#{product_hash['price_per_liter_of_alcohol_in_cents']}</p>"
			puts "</div>"
		end
		print_footer
	end	

  def print_header
    puts "<html>"
    puts "  <head>"
    puts "    <title>Connoisseur</title>"
    puts "    <link rel='stylesheet' href='normalize.css' type='text/css'>"
    puts "    <link rel='stylesheet' href='styles.css' type='text/css'>"
    puts "  </head>"
    puts "  <body>"
  end

  def print_footer
    puts "  </body>"
    puts "</html>"
  end

end
# puts ARGV.inspect #retorna a array criada quando se chama os metodos pelo terminal