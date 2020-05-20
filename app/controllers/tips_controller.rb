class TipsController < ApplicationController
  before_action :set_tip, only: [ :update, :destroy ]

  def index
    @tips = Tip.all

    render json: @tips
  end

  def create
    @tip = Tip.create(tip_params)
    @tip.run_calculations

    render json: @tip
  end

  def update
    @tip.update(tip_params)

    render json: @tip
  end

  def destroy
    @tip.destroy

    render json: { 'status': 'ok' }
  end

  private

  # DRY
  def set_tip
    @tip = Tip.find(params[:id])
  end

  # strong params
  def tip_params
    params.permit(:tip_percent, :total, :fees, :user_id, :service_rating, :exp_rating)
  end

end
