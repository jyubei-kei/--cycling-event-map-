class Admin::CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event
  before_action :set_course, only: %i[edit update destroy]

  def index
    @courses = @event.courses.order(created_at: :desc)
  end

  def new
    @course = @event.courses.build
  end

  def create
    @course = @event.courses.build(course_params)
    if @course.save
        redirect_to admin_event_courses_path(@event), notice: "コースを作成しました。"
    else
        render :new, status: :unprocessable_entity
    end
end

  def edit; end

  def update
    if @course.update(course_params)
      redirect_to admin_event_courses_path(@event), notice: "コースを更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @course.destroy
    redirect_to admin_event_courses_path(@event), notice: "コースを削除しました。"
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_course
    @course = @event.courses.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :description, :route_url)
  end
end
