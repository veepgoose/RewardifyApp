class GoalsController < ApplicationController

  def index 
    @goals = Goal.all

    @q = Wishlist.ransack(params[:q])
    @wishlist_items = @q.result(distinct: true)
  end


  def new
    @goal = Goal.new
    @wishlist_item = Wishlist.find(params[:wishlist_item_id]) if params[:wishlist_item_id]
    @user_wishes = current_user.wishes
  end
  

  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(
            "goal-container", # Replace with the actual DOM element ID
            partial: "goals/goal",
            locals: { goal: @goal }
          )
        end
        format.html { redirect_to dashboard_path, notice: "Goal created successfully" }
      end
    else
      render :new
    end
  end
  

  private

  def goal_params
    params.require(:goal).permit(:wishlist_id, :target_date, :target_days_per_week, :target_hours_per_day)
  end
  

  def show
    @goal = Goal.find(params[:id])
  end
  

  def edit
    @goal = Goal.find(params[:id])
  end
  

  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      redirect_to @goal, notice: "Goal updated successfully"
    else
      render :edit
    end
  end
  

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    redirect_to goals_path, notice: "Goal deleted successfully"
  end
  
end
