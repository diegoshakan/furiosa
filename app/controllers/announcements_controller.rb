class AnnouncementsController < ApplicationController
  before_action :set_announcement, only: %i[ show edit update destroy ]
  # skip_before_action :authenticate_user!
  def index
    @announcements = current_user.announcements
  end

  def show
  end

  def new
    @announcement = Announcement.new
  end

  def edit
  end

  def create
    @announcement = Announcement.new(announcement_params)
    @announcement.user = current_user

    respond_to do |format|
      if @announcement.save
        format.html { redirect_to announcement_url(@announcement), notice: "Announcement was successfully created." }
        format.json { render :show, status: :created, location: @announcement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @announcement.update(announcement_params)
        format.html { redirect_to announcement_url(@announcement), notice: "Announcement was successfully updated." }
        format.json { render :show, status: :ok, location: @announcement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @announcement.destroy

    respond_to do |format|
      format.html { redirect_to announcements_url, notice: "Announcement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_announcement
      begin
        @announcement = Announcement.where(user: current_user).find(params[:id])
      rescue StandardError => e
        respond_to do |format|
          format.html { redirect_to announcements_url, notice: "Você não possui este anúncio." }
          format.json { head :no_content }
        end
      end
    end

    def announcement_params
      params.require(:announcement).permit(:title, :code, :description, :value, :user_id, :category_id, images: [])
    end
end
