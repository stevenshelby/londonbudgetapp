class FeedbacksController < ApplicationController
  before_filter :authenticate_admin!, :except => [:new,:create,:show]

  # GET /feedbacks
  # GET /feedbacks.json
  def index
    @feedbacks = Feedback.all
    @topics = Topic.all

    for topic in @topics
      if @topicstats
        @topicstats = @topicstats + [[FeedbackItem.where(:topic_id => topic.id).sum(:position).to_f / @feedbacks.length,  FeedbackItem.where(:topic_id => topic.id).sum(:percentage).to_f / @feedbacks.length, topic.id]]
      else
         @topicstats = [[FeedbackItem.where(:topic_id => topic.id).sum(:position).to_f / @feedbacks.length,  FeedbackItem.where(:topic_id => topic.id).sum(:percentage).to_f / @feedbacks.length, topic.id]]
      end    
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @feedbacks }
    end
  end

  # GET /feedbacks/1
  # GET /feedbacks/1.json
  def show
    @feedback = Feedback.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @feedback }
    end
  end

  # GET /feedbacks/new
  # GET /feedbacks/new.json
  def new
    @feedback = Feedback.new
    @topics = Topic.all.shuffle
    @p_range = -5..5
    priority = 0
    for topic in @topics do
        priority = priority + 1
        @feedback.feedback_items.build(:topic => topic, :position => priority, :percentage => 0)        
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @feedback }
    end
  end

  # GET /feedbacks/1/edit
  def edit
    @feedback = Feedback.find(params[:id])
  end

  # POST /feedbacks
  # POST /feedbacks.json
  def create
  
    @feedback = Feedback.new(params[:feedback])
    
    respond_to do |format|
      if @feedback.save
        format.html { redirect_to @feedback, notice: 'Feedback was successfully created.' }
        format.json { render json: @feedback, status: :created, location: @feedback }
      else
        format.html { render action: "new" }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /feedbacks/1
  # PUT /feedbacks/1.json
  def update
    @feedback = Feedback.find(params[:id])

    respond_to do |format|
      if @feedback.update_attributes(params[:feedback])
        format.html { redirect_to @feedback, notice: 'Feedback was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedbacks/1
  # DELETE /feedbacks/1.json
  def destroy
    @feedback = Feedback.find(params[:id])
    @feedback.destroy

    respond_to do |format|
      format.html { redirect_to feedbacks_url }
      format.json { head :ok }
    end
  end
  
end
