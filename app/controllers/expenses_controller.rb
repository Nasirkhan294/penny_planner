class ExpensesController < ApplicationController
  def index
    @user = current_user
    @expenses = @user.expenses.includes(:group)
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @expense = Expense.new
  end

  def create
    @user = current_user
    @expense = @user.expenses.build(expense_params)

    respond_to do |format|
      format.html do
        if @expense.save
          redirect_to expenses_path, notice: 'Expenses created successfully.'
        else
          render :new
          flash.now[:alert] = 'Expense could not be added. Please try again.'
        end
      end
    end
  end

  def destroy
    @user = current_user
    @expense = Expense.find(params[:id])
    @expense.destroy
    redirect_to expenses_path, notice: 'Expense deleted successfully.'
  end

  private

  def expense_params
    params.require(:expense).permit(:author_id, :name, :amount, :group_id)
  end
end
