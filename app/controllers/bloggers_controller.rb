class BloggersController < ApplicationController

  before_action :set_blogger, only: [:index, :show]


  def index
    @bloggers = Blogger.all
  end

  def new
    @blogger = Blogger.new
  end

  def show
  end


  private

  def set_blogger
    @blogger = Blogger.find(params[:id])
  end



end
