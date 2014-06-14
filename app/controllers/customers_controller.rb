class CustomersController < ApplicationController  
  
  def new
    @customer = Customer.new
    @folio =@customer.folios.build   
    @savingsdeposit =@customer.savingsdeposits.build 
  end

  def create
   @customer = Customer.new(params[:customer])
    if @customer.save
      flash[:success] = "Welcome to Ruby Benefit Fund!"
      redirect_to customer_path(@customer)
    else
      flash[:error] = "Customer not added"  
      render 'new'
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])

      if @customer.update_attributes(params[:customer])
        flash[:success] = "Updated the customer"
        redirect_to customers_path(@customer)
      else
        flash[:alert] ="Fill the necessary fields"
        render 'edit'
      end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    flash[:notice] = "Customer deleted"
    redirect_to customers_path    
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def index
    @customers = Customer.search(params[:search], params[:id])
    @customers = Customer.all

  end
end
