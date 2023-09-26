class GoalsController < ApplicationController

  def index 
    @goals = Goal.all

    @q = Wishlist.ransack(params[:q])
    @wishlist_items = @q.result(distinct: true)
  end




def new
  puts "Wish ID: #{params[:wish_id]}" # print wish id

  @goal = Goal.new(wish_id: params[:wish_id])

  @wishlist = Wishlist.find_by(id: params[:wish_id])

  if @wishlist
    # wish found
    puts "Wishlist found: #{@wishlist.inspect}" 
  else 
    puts "No wishlist found for ID #{params[:wish_id]}"
  end

  @user_wishes = current_user.wishes
  
  if params[:wish_id]
    @wishlist = current_user.wishlists.find(params[:wish_id])
  end
end
  
  

  def create
    @goal = Goal.new(goal_params)
    
    if @goal.save!
      @goal.reload
      
      if @goal.valid?
        render turbo_stream: turbo_stream.append("goal_form", @goal), status: :created
      else
        puts @goal.errors.full_messages # Add this line for debugging
        render turbo_stream: turbo_stream.replace("goal_form", partial: "goals/form", locals: { goal: @goal }), status: :unprocessable_entity
      end
    else
      puts @goal.errors.full_messages # Add this line for debugging
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
