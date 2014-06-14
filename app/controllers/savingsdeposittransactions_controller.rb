class SavingsdeposittransactionsController < ApplicationController

  def new
    @savingsdeposittransaction = Savingsdeposittransaction.new
    @savingsdeposittransaction.savingsdeposit_id =params[:id]
    #@savingsdeposit =@savingsdeposittransaction.savingsdeposits.build
  end

  
  def show
    @savingsdeposittransaction = Savingsdeposittransaction.find(params[:id])
    @savingsdeposit =Savingsdeposit.all

  end

  def create
  	@savingsdeposittransaction = Savingsdeposittransaction.new(params[:savingsdeposittransaction])
      if @savingsdeposittransaction.save
        flash[:success] = "Transaction made and awaiting for Manager approval"
        redirect_to savingsdeposits_path
      else
        flash[:error] = "Cannot do transaction"  
        render 'new'
      end
  end

  def edit
    @savingsdeposittransaction = Savingsdeposittransaction.find(params[:id])
  end

  def update
    @savingsdeposittransaction = Savingsdeposittransaction.find(params[:id])

      if @savingsdeposittransaction.update_attributes(params[:savingsdeposittransaction])
        flash[:success] = "Updated your transaction and awaiting for Manager approval"
        redirect_to savingsdeposittransaction_path(@savingsdeposittransaction)
      else
        flash[:alert] ="Fill the necessary fields"
        render 'edit'
      end
  end

  def destroy
    @savingsdeposittransaction = Savingsdeposittransaction.find(params[:id])
    @savingsdeposittransaction.destroy
    flash[:notice] = "Savings deposit transaction get Canceled"
    redirect_to savingsdeposits_path    
  end 

  def approve
    @savingsdeposittransaction = Savingsdeposittransaction.find(params[:id])
     if @savingsdeposittransaction.transaction_mode == 'Credit'
      @savingsdeposittransaction.savingsdeposit.current_balance += @savingsdeposittransaction.transaction_amount
    elsif @savingsdeposittransaction.transaction_mode == 'Debit'
      @savingsdeposittransaction.savingsdeposit.current_balance -= @savingsdeposittransaction.transaction_amount
    else
      :savingsdeposit
    end
    @savingsdeposittransaction.savingsdeposit.save
    @savingsdeposittransaction.update_attributes!(:status => 'approved')
    flash[:success] = "Approved your transaction"
    redirect_to savingsdeposits_path
  end

end
