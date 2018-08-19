class JoinsController < ApplicationController
   
    
  def create
    join = current_user.joins.create(event_id: params[:event_id])
    redirect_to events_url, notice: "#{join.event.user.name}さんのイベントに参加しました"
  end

  def destroy
    join = current_user.joins.find_by(event_id: params[:event_id]).destroy
    redirect_to events_url, notice: "#{join.event.user.name}さんのイベントをキャンセルしました"
  end
  
end
