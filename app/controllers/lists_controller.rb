class ListsController < ApplicationController
  def index
    @lists = List.all
    @search = params["search"]
    if @search.present?
      @name = @search["name"]
      @lists = List.where(name: @name)
    end
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(list_params)

    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
