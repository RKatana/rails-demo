class BooksController < ApplicationController
    # CRUD Function in this file 
    # index, create, show, update, destroy
    before_action :authenticate, except: [:index, :show]
    def index
        # http://127.0.0.1:3000/api/v1/books/?author=Katana
        @author = params[:author]
        if @author
            @book = Book.search_by_author(@author)
            render json: @book
        else
            @books = Book.all
            render json: @books
        end
        # @books = Book.all
        # render json: @books
    end

    def show
        # http://127.0.0.1:3000/api/v1/books/2
        # @book = Book.find_by(id: params[:id])
        @book = Book.find(params[:id])
        # json_response(@book)
        render json: @book, serializer: BookNoAuthSerializer
    end

    def create
        @book = Book.create!(book_params)
        json_response(@book, status = 201)
    end

    def update
        @book = Book.find(params[:id])
        @book.update(book_params)
        json_response(@book, status = 200)
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        json_response({message: "#{@book.title} deleted successfuly"}, status= 200)
    end

    
    private


    def book_params
        params.permit(:author, :title, :synposis)
    end
end
