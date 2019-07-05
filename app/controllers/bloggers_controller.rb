class BloggersController < ApplicationController

  before_action :set_blogger, only: [:show, :destroy]
  before_action :blogger_params, only: [:create]


  def index
    @bloggers = Blogger.all
  end

  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.new(blogger_params)
    if @blogger.save
      redirect_to blogger_path(@blogger)
    else
      flash.clear
      flash[:bio_message] = @blogger.errors.messages[:bio]
      flash[:name_message] = @blogger.errors.messages[:name]
      flash[:age_message] = @blogger.errors.messages[:age]
      render :new
    end
  end


  def destroy

    @blogger.destroy
    @blogger.posts.destroy

    redirect_to @blogger
  end


  private

    def set_blogger
      @blogger = Blogger.find(params[:id])
    end

    def blogger_params
      params.require(:blogger).permit(:name, :age, :bio)
    end



end
