class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    # puts params[:feedback]

    if @feedback.save
      redirect_to contact_path, notice: 'Feedback submitted successfully!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :email, :subjetc, :message)
  end
end
