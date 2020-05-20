class TipsController < ApplicationController

  def index
    @tips = Tip.all

    render json: @tips
  end

  def create
    @tip = Tip.create(tip_params)

    render json: @tip
  end

  def destroy
    @tip = Tip.find(params[:id])

    render json: { 'status': 'ok' }
  end

  private

  # strong params
  def tip_params
    params.permit(:tip_percent, :total, :fees, :user_id)
  end

end
