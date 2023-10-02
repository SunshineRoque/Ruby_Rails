class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  def index
    @feedbacks = Feedback.order(created_at: :desc)
    @feedbacks = @feedbacks.where(name: params[:name]) if params[:name].present?
    @feedbacks = @feedbacks.where(email: params[:email]) if params[:email].present?
    @feedbacks = @feedbacks.where(subjetc: params[:subjetc]) if params[:subjetc].present?
    @feedbacks = @feedbacks.where(message: params[:message]) if params[:message].present?
    if params[:start_date].present? && params[:end_date].present?
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])
      @feedbacks = @feedbacks.where(created_at: start_date..end_date)
    end
    @feedbacks = @feedbacks.where(remarks: params[:remarks]) if params[:remarks].present?
  end

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.save
      flash[:notice] = 'Feedback created successfully'
      redirect_to feedbacks_path
    else
      flash.now[:alert] = 'Feedback create failed'
      render :new, status: :unprocessable_entity
    end

  end

  def show
  end

  def edit

  end

  def update
    if @feedback.update(feedback_params)
      flash[:notice] = 'Feedback updated successfully'
      redirect_to feedbacks_path
    else
      flash.now[:alert] = 'Feedback update failed'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @feedback.destroy
    flash[:notice] = 'Feedback deleted successfully'
    redirect_to feedbacks_path
  end

  private

  def set_feedback
    @feedback = Feedback.find(params[:id])
  end

  def feedback_params
    params.require(:feedback).permit(:name, :email, :subjetc, :message, :remarks)
  end
end




