class ConditionsController < ApplicationController
  before_action :set_condition,only:[:destroy]
  def new
    @condition = Condition.new
  end

  def index
    @conditions = Condition.all
  end

  def create
    condition = Condition.new(condition_params)
    condition.save
    flash[:success] = 'Successfully Subscribed'
    redirect_to conditions_path
  end

  def destroy
    @condition.destroy
    flash[:success] = 'Successfully deleted'
    redirect_to conditions_path
  end

  private

  def condition_params
    params.require(:condition).permit(:name, decision_params: %i[rule value end start])
  end

  def set_condition
    @condition ||= Condition.find(params[:id])
  end

end
