class AuthorsController < ApplicationController
    before_action :authenticate, except: [:index, :show, :create]
    def index 
        @authors = Author.all
        json_response(@authors)
    end

    def show
        @author = Author.find(params[:id])
        json_response(@author)
       
    end

    def create
        @author = Author.create!(author_params)
        json_response(@author, status = 201)
    end

    def update
        @author = Author.find(params[:id])
        @author.update(author_params)
        json_response(@author, status = 200)
    end

    def destroy
        @author = Author.find(params[:id])
        @author.destroy
        json_response({message: "#{@author.name} deleted successfuly"}, status= 204)
    end

    
    private


    def author_params
        params.permit(:name, :email, :password)
    end
end
