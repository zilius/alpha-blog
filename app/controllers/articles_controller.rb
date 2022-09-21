class ArticlesController < ApplicationController

    def show
        @article = Article.find(params[:id])
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        # rails 7 needs to set status
        redirect_to articles_path, status: :see_other
    end

    def index
        @articles = Article.all()
    end

    def new
        @article = Article.new()
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title, :description))
            flash[:notice] = "Article was updated successfully"
            redirect_to @article
        else
            render 'edit'
        end
    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description))

        if @article.save()
            flash[:notice] = "Created"
            redirect_to @article
            # redirect_to article_path(@article.id)
        else
            render 'new'
        end
    end

end