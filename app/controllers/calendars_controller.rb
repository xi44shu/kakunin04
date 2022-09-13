class CalendarsController < ApplicationController
  def index
    get_week    
    @team = Team.all
    @calendar = Calendar.where(scheduled_date: @todays_date..@todays_date + 6)

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

  def get_week
    # カレンダーに日付データ曜日を持たせる
    wdays = ['(日)','(月)','(火)','(水)','(木)','(金)','(土)']
    @todays_date = Date.today

    @week_days = []

    7.times do |x|

      wday_num = Date.today.wday + x
      if  wday_num >= 7
        wday_num = wday_num -7
      end

      today_days = { scheduled_date:(@todays_date + x), month: (@todays_date + x).month, date: (@todays_date + x).day, wday:  wdays[wday_num]}

      @week_days.push(today_days)
    end
  end


end
