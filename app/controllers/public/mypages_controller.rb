class Public::MypagesController < ApplicationController
  before_action :authenticate_user!

  def show
    @events = current_user
      .participated_events
      .where(published: true)
      .order(starts_at: :asc)
  end
end
