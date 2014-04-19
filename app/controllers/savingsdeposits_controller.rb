class SavingsdepositsController < ApplicationController
  
  #load_and_authorize_resource
  #load_and_authorize_resource :nested => :savingsdeposit

  autocomplete :customer, :first_name, :display_value => :first_name, :full => true
   
	def new
    @savingsdeposit = Savingsdeposit.new    
	end

	def create
    @savingsdeposit = Savingsdeposit.new(params[:savingsdeposit])
      if @savingsdeposit.save
        flash[:success] = "Successfully created savingsdeposit account!"
        redirect_to savingsdeposits_path
      else
        flash[:error] = "Cannot open savingsdeposit account"  
        render 'new'
      end
  end
  
  def edit
    @savingsdeposit = Savingsdeposit.find(params[:id])
  end

  def update
    @savingsdeposit = Savingsdeposit.find(params[:id])
    
      if @savingsdeposit.update_attributes(params[:savingsdeposit])
        flash[:success] = "Updated your savingsdeposit account"
        redirect_to savingsdeposits_path(@savingsdeposit)
      else
        flash[:alert] ="Cannot open savingsdeposit"
        render 'edit'
      end
  end

  def destroy
    @savingsdeposit = Savingsdeposit.find(params[:id])
    @savingsdeposit.destroy
    flash[:notice] = "savingsdeposit account deleted"
    redirect_to savingsdeposits_path    
  end	

  def show
    @savingsdeposit = Savingsdeposit.find(params[:id])    
    @customer = Customer.all
    @savingsdeposittransactions = Savingsdeposittransaction.all
  end

  def index            
    @savingsdeposit = Savingsdeposit.all
    @customers = Customer.all
  end 

  def pending
    @savingsdeposit = Savingsdeposit.all
    @customer = Customer.all
    @savingsdeposittransactions = Savingsdeposittransaction.all
  end

  def approve
    @savingsdeposit = Savingsdeposit.find(params[:id])
    @customer = Customer.all
    @savingsdeposittransactions = Savingsdeposittransaction.all
  end

end
