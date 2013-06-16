require 'open-uri'
require 'json'

class HtmlGenerator
	def initialize

	raw_response = open("http://lcboapi.com/products?q=tequila").read
	# puts raw_response.class #String

	product_data = JSON.parse(raw_response)#transformando em hash
	@products = product_data["result"]
	# puts @products
	# puts booze_data.class #It's a hash
	# puts booze_data["status"] #call the key and you have the value as a result

	# puts booze_data["result"] #key result
	# action = ARGV[0] #ARGV sao os parametros passados pelo terminal
					 #ex: ruby connoisseur arg1 arg2 --> ARGV[0] == arg1
					 #									 ARGV[1] == arg2
		
	end

	def index
		print_header
		@products.each do |product_hash| #key result
			puts "    <div class='product_container'>"
			puts "       <h1> #{product_hash['name']}</h1>" #JSON the keys are Strings and not Symbols
			puts "    <div>"
			puts "       <img src='#{product_hash['image_thumb_url']}'/>"
			puts "    </div>"
			puts "    <div class='bubble'>"
			puts "       <p><strong>Serving suggestion<br /></strong> #{product_hash['serving_suggestion']}</p>"
			puts "       <p><strong>Tasting notes<br /></strong> #{product_hash['tasting_note']}</p>"
			puts "       <p><strong>Price<br /> </strong>$#{(product_hash['price_in_cents']).to_f/100}</p>"
			puts "       <p><strong>Price per liter<br /></strong> $#{(product_hash['price_per_liter_of_alcohol_in_cents']).to_f/100}</p>"
			puts "    </div>"
			puts "    </div>"
		end
		print_footer
	end	

  def print_header
    puts "<html>"
    puts "  <head>"
    puts "    <title>Connoisseur</title>"
    puts "    <link rel='stylesheet' href='style.css' type='text/css'>"
    puts "		<link href='http://fonts.googleapis.com/css?family=Doppio+One' rel='stylesheet' type='text/css'>"
    puts "  </head>"
    puts "  <body>"
    puts "    <div id = 'wrapper'>"
    puts "		<div class='title'><h1>It's tequila time!<br /></h1></div>"
  end

  def print_footer
  	puts "    </div>"
    puts "  </body>"
    puts "</html>"
  end

end

generate = HtmlGenerator.new

puts generate.index
# puts ARGV.inspect #retorna a array criada quando se chama os metodos pelo terminal