class HomeController < ApplicationController
  def index
    if params[:search].present?
      @schedule = Lesson.search params[:search]
    elsif current_user
      @lessons = current_user.group.lessons
    end
  end
end
