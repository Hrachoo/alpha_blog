class ArticlesController < ApplicationController
    before_action :find_article, except: [:new, :index]
    def index
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end

    def show
    end

    def new
        @article = Article.new
    end
    
    def create

        @article = Article.new(article_params)
        @article.user = User.first
        if @article.save
            flash[:notice] = "the article was created successfully"
            redirect_to articles_path
        else
            render "new", status: :unprocessable_entity
        end
    end

    def edit
    end
    
    def update

        if @article.update(article_params)
            flash[:notice] = "the article was updated successfully"
            redirect_to articles_path
        else
            render "edit", status: :unprocessable_entity
        end
    end

    def destroy

        if @article.destroy
            flash[:notice] = "the article was deleted successfully"
            redirect_to articles_path
        else
            flash[:alert] = "was not deleted"
        end
    end

    private

    def find_article
        @article = Article.find_by_id(params[:id])
    end
    def article_params
        params.require(:article).permit(:title, :description)
    end
end
