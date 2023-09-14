class GroupsController < ApplicationController
  def index
    @user = current_user
    @groups = @user.groups.order(:name)
  end

  def show
    @group = Group.find(params[:id])
    @expenses = @group.expenses.order('created_at DESC')
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)

    respond_to do |format|
      format.html do
        if @group.save
          redirect_to groups_path notice: 'Category created successfully.'
        else
          render :new
          flash.now[:alert] = 'Category could not be added. Please try again.'
        end
      end
    end
  end

  def destroy
    @user = current_user
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path, notice: 'Category deleted successfully.'
  end

  private

  def group_params
    params.require(:group).permit(:name, :image)
  end
end
