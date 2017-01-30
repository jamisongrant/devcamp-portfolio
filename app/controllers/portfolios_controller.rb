class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
  layout "portfolio"
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all

  def index
   @portfolio_items = Portfolio.by_position
  end

  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end

    render nothing: true
  end

  def angular
   @angular_portfolio_items = Portfolio.angular
  end

  def new
   @portfolio_item = Portfolio.new
  end

  def create
   @portfolio_item = Portfolio.new(portfolio_params)

   if @portfolio_item.save
     redirect_to portfolios_path, notice: "Portolio item was successfully created."
   else
     render :new
   end
  end

  def show
  # @portfolio_item = Portfolio.find(params[:id])
  end

  def edit
  # @portfolio_item = Portfolio.find(params[:id])
  # 3.times { @portfolio_item.technologies.build }

  end

  def update
   
   if @portfolio_item.update(portfolio_params)
     redirect_to portfolios_path
   else
     render :edit
   end  
  end

  def destroy
   @portfolio_item.destroy
   redirect_to portfolios_path
  end

  private

  def set_portfolio
   @portfolio_item = Portfolio.find(params[:id])
  end

  def portfolio_params
   params.require(:portfolio).permit(:title, 
                                     :subtitle,
                                     :body, 
                                     :main_image,
                                     :thumb_image,
                                     technologies_attributes: [:id, :name, :_destroy]
                                     )
  end

end


