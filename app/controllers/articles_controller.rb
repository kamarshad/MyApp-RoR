class ArticlesController < ApplicationController
    
    http_basic_authenticate_with name: "Mohd Kamar Shad", password: "12345", except: [:index, :show]
    
   # List down all articles
    def index
        @articles = Article.all
    end
    
    # Show saved Article
    def show
        @article = Article.find(params[:id])
    end
    # create new article
    def new
        @article = Article.new
    end
    def edit
        @article = Article.find(params[:id])
    end

    # Create new article and save it
    def create
        @article = Article.new(article_params)
        if @article.save
            redirect_to @article
            else
            render 'new'
        end
    end
    
    def update
        @article = Article.find(params[:id])
        
        if @article.update(article_params)
            redirect_to @article
            else
            render 'edit'
        end
    end
    
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end
    
    private
    def article_params
        params.require(:article).permit(:title, :text)
    end
end
