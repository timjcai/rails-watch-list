class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to list_path(@list.id)
  end

  def destroy
    #get list
    @list = List.find(params[:id])
    #alert - are you sure?
    @list.destroy
    #redirect to listspath
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
