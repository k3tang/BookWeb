class BooksController < ApplicationController

    before_action :require_logged_in


    def get_books
        url = " "
        response = RestClient.get(url)
        @books = JSON.parse(response.body)
        render :books
    end 

    def new
        @book = Book.new
        render :new
    end 

    def create
        @book = Book.new(book_params)
        @book.user_id = params[:user_id]
        if @book.save
        else
            flash[:errors] = ['Did you forget a field?']
        end 
         redirect_to user_url(@book.user_id)
    end 

    def edit
        @book = Book.find_by(id: params[:id])
        render :edit
    end 

    def update
        @book = Book.find_by(id: params[:id])
        if @book.update(book_params)
             redirect_to user_url(@book.user_id)
        else
            flash[:errors] = ["Missing a field?"]
            render :edit
        end 
        
    end 

    def destroy
        @book = current_user.books.find_by(id: params[:id])
        if @book && @book.destroy
        redirect_to user_url(@book.user_id)
        end
    end 

    private
    def book_params
        params.require(:book).permit(:title, :author)
    end 
end
