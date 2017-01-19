class QuotesController < ApplicationController
	def index
		@quote = Quote.order("RANDOM()").first
	end
#The def index line above tells us what we need
#to go to the index page and what it does on the 
#Index page. It is the action that is being done.
#It communicates with the Quote Model that we created
#and pulls a random Quote from the database (Quote Model)
	def new
		@quote = Quote.new
	end

#the new page tells us to create a new.html.erb file.
#It is the new page and tells us to create a new Quote in the
#database Quote

	def create
		@quote = Quote.create(quote_params)
			if @quote.invalid?
				flash[:error] = '<strong>Could not save</strong> the data you entered is invalid.'
			end
		redirect_to root_path
	end

	def about
	end

	private

	def quote_params
		params.require(:quote).permit(:saying, :author)
	end
end
#The quote_params part is what actually pulls the values of saying and author
#from the quotes form. Without the quote_params, we wouldn't know what the user
#entered into the form, and we'd store empty records in our database. 
#In addition to helping us suck the values out of the form, 
#the params.require(:quote).permit(:saying, :author) also makes sure that our form 
#is secure, and no evil hackers can inject anything else 
#(we only permit ":saying" and ":author") into our database - 
#which is always a good thing.