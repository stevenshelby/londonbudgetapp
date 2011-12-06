class CategoryController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    
    if @category.save
      #save the budget to the database
      redirect_to @category
    else
      #error saving the site
      render 'new'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destory
  end

  def show
    @category = Category.find(params[:id])
  end

  def index
    @category = Category.all
  end
end
