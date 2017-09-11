class SubscribersController < ApplicationController
  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      redirect_to check_prize_subscriber_path(@subscriber)
      flash[:success] = 'Successfully Subscribed'
    else
      render 'new'
    end
  end

  def check_prize
    @subscriber = Subscriber.find(params[:id])
    @prize_list = @subscriber.select_prizes
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:email).merge(created_on: Date.today)
    end
  end
