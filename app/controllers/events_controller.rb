class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :login_check, only: [:new, :show, :edit, :update, :destroy]

  def confirm
    @event = Event.new(event_params)
    
    @event.user_id = current_user.id
    render :new if @event.invalid?
  end

  def index
    @q = Event.ransack(params[:q])
    @events = @q.result
  end
  
  
  
  def show
    @favorite = current_user.favorites.find_by(event_id: @event.id)
    @join = current_user.joins.find_by(event_id: @event.id)
    @comments = @event.comments.includes(:user).all
    @comment  = @event.comments.build(user_id: current_user.id) if current_user
  end

  def new
    if params[:back]
      @event = Event.new(event_params)
      @event.image.retrieve_from_cache! params[:cache][:image]
    else
      @event = Event.new
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice:"投稿を削除しました！"
  end

  def update
    if @event.update(event_params)
      redirect_to events_path, notice: "投稿を編集しました！"
    else
      render 'edit'
    end
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    @event.image.retrieve_from_cache!  params[:cache][:image]
    if @event.save
      redirect_to events_path, notice: "投稿しました！"
      NoticeMailer.notice_mailer(@event).deliver
    else
      render 'new'
    end
  end

  private
    def event_params
      params.require(:event).permit(:title, :content, :image, :image_cache, :etag_list, :area)
    end
   
    def set_event
      @event = Event.find(params[:id])
    end

    def login_check
      if !current_user
        render("/sessions/new")
      end
    end

end
