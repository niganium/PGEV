class FavoritesController < ApplicationController
  #after_action :create_notifications, only: [:create]
    
  def create
    favorite = current_user.favorites.create(event_id: params[:event_id])
    redirect_to events_url, notice: "#{favorite.event.user.name}さんのブログをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(event_id: params[:event_id]).destroy
    redirect_to events_url, notice: "#{favorite.event.user.name}さんのブログをお気に入り解除しました"
  end
   private
     #def create_notifications
       #return if @event.user.id == current_user.id
       #Notification.create(user_id: @event.user.id,
        #notified_by_id: current_user.id,
        #event_id: @event.id,
        #notified_type: 'お気に入り')
     #end
end
