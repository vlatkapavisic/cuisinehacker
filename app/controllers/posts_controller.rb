class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_posts, only: [:index, :archive]
  before_action :authenticate_user!, except: [:show, :archive]

  def index
  end

  def archive
  end

  def show
    # Quick hack code. If I wanted to do this properly, I'd extract it to a service object.
    instagram_response = HTTParty.get("https://graph.facebook.com/v10.0/instagram_oembed?url=#{@post.photo_url}&access_token=#{ENV['FACEBOOK_ACCESS_TOKEN']}")
    @photo_html = JSON.parse(instagram_response.body)['html']
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: 'Post was successfully edited.'
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: 'Post was successfully deleted.'
  end

  private

    def set_post
      @post = Post.friendly.find(params[:id])
    end

    def set_posts
      @posts = Post.order(created_at: :desc)
    end

    def post_params
      params.require(:post).permit(:title, :content, :photo_url)
    end
end
