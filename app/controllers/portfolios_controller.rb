class PortfoliosController < ApplicationController
  before_action :set_portfilio_item, only: %i[show edit update destroy]

  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_items = Portfolio.new(portfolio_item_params)

    respond_to do |format|
      if @portfolio_items.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio items was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio_items }
      else
        format.html { render :new }
        format.json { render json: @portfolio_items.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def show; end

  def update
    respond_to do |format|
      if @portfolio_items.update(portfolio_item_params)
        format.html { redirect_to portfolios_path, notice: 'Record successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio_items }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_itemsg.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def portfolio_item_params
    params.require(:portfolio).permit(:title, :subtitle, :body, :main_image, :thumb_image)
  end

  def set_portfilio_item
    @portfolio_items = Portfolio.find(params[:id])
  end
end
