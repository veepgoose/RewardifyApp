class GoalsController < ApplicationController

  def index 
    @goals = Goal.all

    @q = Wishlist.ransack(params[:q])
    @wishlist_items = @q.result(distinct: true)
  end


  def new
    @goal = Goal.new
    @user_wishes = current_user.wishes
    # Optionally, you can set @wishlist_item based on a specific user's wishlist item
    if params[:wishlist_item_id]
      @wishlist_item = current_user.wishes.find(params[:wishlist_item_id]).wishlist
    end
  end
  
  

  def create
    @goal = Goal.new(goal_params)
    
    if @goal.save
      # Check if the goal is valid and has an id
      if @goal.valid?
        render turbo_stream: turbo_stream.append("goal_form", @goal), status: :created
      else
        render turbo_stream: turbo_stream.replace("goal_form", partial: "goals/form", locals: { goal: @goal }), status: :unprocessable_entity
      end
    else
      render turbo_stream: turbo_stream.replace("goal_form", partial: "goals/form", locals: { goal: @goal }), status: :unprocessable_entity
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
