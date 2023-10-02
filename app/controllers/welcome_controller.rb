class WelcomeController < ApplicationController

  def index; end

  def about; end

  def contact
    @feedback = Feedback.new
  end
end