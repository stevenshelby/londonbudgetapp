class BudgetController < ApplicationController
  def new
    @budget = Budget.new
  end

  def create
    
    uploaded_io = params[:budget][:upload]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'w') do |file|
      file.write(uploaded_io.read.force_encoding('utf-8'))
    end

    @budget = Budget.new(:budget_types_id => params[:budget][:budget_type].to_i, :year =>params[:budget][:year].to_i, :filename => uploaded_io.original_filename)
    @budget.save
    c = Category.create_if_not_exists(@budget.filename, nil, @budget.id)
    c.save

    c.import_csv(@budget.filename)
    @budget.category_id = c.id

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
    redirect_to @budget.category
  end


  def index
    @budgets = Budget.all
  end
end
