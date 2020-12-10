class PortfoliosController < ApplicationController
  before_action :set_portfilio_item, only: %i[show edit update destroy]

  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
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

  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def portfolio_item_params
    params.require(:portfolio).permit(:title, :subtitle, :body,
        technologies_attributes: %i[name])
  end

  def set_portfilio_item
    @portfolio_item = Portfolio.find(params[:id])
  end
end
