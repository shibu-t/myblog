class PostsController < ApplicationController
    def index
        @posts = Post.all.order(created_at: 'desc')
    end

    def show
        @post = Post.find(params[:id]) # :idはrouteの:id
    end

    def new
        @post = Post.new(params[:post])
        # @post = Post.new <- maybe abbreviation of Post.new(params[:post])
    end

    def create
        # @post = Post.new(params[:post]) <- no validation
        @post = Post.new(post_params)
        if @post.save
            redirect_to posts_path
        else
            #render plain:@post.errors.inspect
            render 'new'
        end
    end
    private 
        def post_params
            params.require(:post).permit(:title, :body)
        end
end
