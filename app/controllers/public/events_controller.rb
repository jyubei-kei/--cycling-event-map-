class Public::EventsController < ApplicationController
  before_action :authenticate_user!, only: [:join]
  before_action :set_event, only: [:show, :join]

  def index
    @events = Event.where(published: true).order(starts_at: :asc)
  end

  def show
    @aid_stations = @event.aid_stations
    @joined = user_signed_in? && current_user.participated_events.exists?(@event.id)
  end

  def join
    if current_user.participated_events.exists?(@event.id)
      # 参加済み → キャンセル
      current_user.participations.where(event: @event).destroy_all
      redirect_to event_path(@event), notice: "参加をキャンセルしました"
    else
      # 未参加 → 参加
      current_user.participations.create!(event: @event)
      redirect_to mypage_path, notice: "参加しました（マイページに追加しました）"
    end
  end

  private

  def set_event
    @event = Event.where(published: true).find(params[:id])
  end
end