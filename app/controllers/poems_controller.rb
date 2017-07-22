class PoemsController < ApplicationController
  def index
    @poems=Poem.all
  end

  def show
    #binding.pry
    @poem=Poem.find(params[:id])
    #render json: @poem
  end
end
