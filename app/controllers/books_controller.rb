class BooksController < ApplicationController

	def index
		@cur_page = params[:id].to_i || 1
		@per_page = 4

		@books = Book::all.limit(@per_page).offset((@cur_page.to_i - 1) * @per_page)
		config_pagination_button(@cur_page, @per_page)
	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)

		@book.save
		redirect_to @book
	end

	def show
		@book = Book::find(params[:id])
	end

	def next_page()
		@book = Book::all()
	end

	private 
	def book_params
		params.require(:book).permit(:title, :detail)
	end

	private 
	def config_pagination_button(cur_page, per_page)
		if @cur_page.to_i >= 2
			@prev_page = @cur_page.to_i - 1
		elsif 
			@prev_page = 1
		end

		@max_page = Book::all::size / @per_page

		if @cur_page < @max_page
			@next_page = @cur_page + 1
		elsif @cur_page == @max_page && Book::all::size % @per_page != 0
			@next_page = @cur_page + 1	
		elsif @cur_page == @max_page && Book::all::size % @per_page == 0
			@next_page = @cur_page
		end
	end

end
