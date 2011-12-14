class FeedbackItemsController < ApplicationController
before_filter :authenticate_admin!

# GET /feedback_items
  # GET /feedback_items.json
  def index
    @feedback_items = FeedbackItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @feedback_items }
    end
  end

  # GET /feedback_items/1
  # GET /feedback_items/1.json
  def show
    @feedback_item = FeedbackItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @feedback_item }
    end
  end

  # GET /feedback_items/new
  # GET /feedback_items/new.json
  def new
    @feedback_item = FeedbackItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @feedback_item }
    end
  end

  # GET /feedback_items/1/edit
  def edit
    @feedback_item = FeedbackItem.find(params[:id])
  end

  # POST /feedback_items
  # POST /feedback_items.json
  def create
    @feedback_item = FeedbackItem.new(params[:feedback_item])

    respond_to do |format|
      if @feedback_item.save
        format.html { redirect_to @feedback_item, notice: 'Feedback item was successfully created.' }
        format.json { render json: @feedback_item, status: :created, location: @feedback_item }
      else
        format.html { render action: "new" }
        format.json { render json: @feedback_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /feedback_items/1
  # PUT /feedback_items/1.json
  def update
    @feedback_item = FeedbackItem.find(params[:id])

    respond_to do |format|
      if @feedback_item.update_attributes(params[:feedback_item])
        format.html { redirect_to @feedback_item, notice: 'Feedback item was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @feedback_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedback_items/1
  # DELETE /feedback_items/1.json
  def destroy
    @feedback_item = FeedbackItem.find(params[:id])
    @feedback_item.destroy

    respond_to do |format|
      format.html { redirect_to feedback_items_url }
      format.json { head :ok }
    end
  end
  

end
