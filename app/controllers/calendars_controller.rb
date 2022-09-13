class CalendarsController < ApplicationController
  def index
    
  end

  def new
    @calendar = Calendar.new
  end

  def create
    @calendar = Calendar.new(calendar_params)
    if @calendar.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def calendar_params
    params.require(:calendar).permit(:scheduled_date, :time_zone_id, :team_id).merge(user_id: current_user.id)
  end  

end
