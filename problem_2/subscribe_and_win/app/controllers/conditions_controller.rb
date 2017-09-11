class ConditionsController < ApplicationController
  def new
    @condition = Condition.new
  end

  def index
    @conditions = Condition.all
  end

  def create
    condition = Condition.new(condition_params)
    condition.save
    redirect_to conditions_path
  end

  private

  def condition_params
    params.require(:condition).permit(:name, decision_params: %i[rule value])
   end
end
