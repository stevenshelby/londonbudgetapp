class BudgetController < ApplicationController
  def new
    @budget = Budget.new
  end

  def create
    
    uploaded_io = params[:budget][:upload]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'w') do |file|
      file.write(uploaded_io.read.force_encoding('utf-8'))
    end

    @budget = Budget.new(:name => params[:budget][:name], :year => params[:budget][:year], :filename => uploaded_io.original_filename)
    @budget.save
    c = Category.create_if_not_exists(@budget.filename, nil, @budget.id)
    c.save

    c.import_csv(@budget.filename)
    @budget.category = c

    if @budget.save
      #save the budget to the database
      redirect_to @budget
    else
      #error saving the site
      render 'new'
    end
  end

  def destroy
    @budget = Budget.find(params[:id])
    @budget.destory
  end

  def show
    @budget = Budget.find(params[:id])
    #@points = @budget.category.children
    #@points = [4,5,6,7,8,9,10]
    #@second = [1,2,45,3]
    redirect_to @budget.category
  end


  def index
    @budgets = Budget.all
  end
end
