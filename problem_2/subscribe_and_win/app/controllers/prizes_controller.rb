class PrizesController < ApplicationController
  before_action :set_prize, only: %i[show edit update destroy]

  def index
    @prizes = Prize.all
  end

  def new
    @conditions = Condition.all
    @prize = Prize.new
  end

  def create
    @prize = Prize.new(prize_params)
    if @prize.save
      redirect_to prize_path(@prize)
      flash[:success] = 'Successfully Created Prize'
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @prize.update(prize_params)
      redirect_to prize_path(@prize)
      flash[:success] = 'Successfully Updated Prize'
    else
      render 'edit'
    end
  end

  def destroy
    if @prize.destroy
      redirect_to prizes_path
      flash[:success] = 'Successfully deleted Prize items'
    else
      flash[:error] = 'Error in deleting Prize'
      render 'show'
    end
  end

  private

  def set_prize
    @prize = Prize.includes(:condition).find_by_id(params[:id])
  end

  def prize_params
    params.require(:prize).permit(:stock_count, :name, :condition_id)
  end
end
