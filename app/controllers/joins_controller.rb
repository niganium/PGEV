class JoinsController < ApplicationController
    #after_action :create_notifications, only: [:create]
    
  def create
    join = current_user.joins.create(event_id: params[:event_id])
    redirect_to events_url, notice: "#{join.event.user.name}さんのイベントに参加しました"
  end

  def destroy
    join = current_user.joins.find_by(event_id: params[:event_id]).destroy
    redirect_to events_url, notice: "#{join.event.user.name}さんのイベントをキャンセルしました"
  end
   private
    #通知用
     #def create_notifications
       #return if @event.user.id == current_user.id
       #Notification.create(user_id: @event.user.id,
        #notified_by_id: current_user.id,
        #event_id: @event.id,
        #notified_type: '参加')
     #end
end
