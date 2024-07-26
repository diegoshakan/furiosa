class AnnouncementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_announcement, only: %i[ show edit update destroy ]

  def index
    @announcements = Announcement.all
  end

  def show
    @comments = @announcement.comments.includes(:user)
  end

  def new
    @announcement = Announcement.new
  end

  def edit
  end

  def create
    @announcement = current_user.announcements.new(announcement_params)

    if @announcement.save
      redirect_to announcement_url(@announcement), notice: "Announcement was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @announcement.update(announcement_params)
      redirect_to announcement_url(@announcement), notice: "Announcement was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @announcement.destroy!

    redirect_to announcements_url, notice: "Announcement was successfully destroyed."
  end

  private

  def set_announcement
    @announcement = Announcement.find(params[:id])
  end

  def announcement_params
    params.require(:announcement).permit(:title, :description, :code, :value, :category_id)
  end
end
