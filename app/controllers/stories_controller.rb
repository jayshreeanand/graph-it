class StoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_story, only: [:show, :edit, :update, :destroy]

  def index
    @stories = current_user.stories.all
    @story = Story.new
  end

  def show
  end

  def explore
    @stories = Story.where.not(user: current_user).order(created_at: :asc)
  end

  def new
    @story = Story.new
  end

  def edit
    @uploader = Story.new.attachment
    # @uploader.success_action_redirect = new_user_url
  end

  def create
    @story = Story.new(story_param)
    @story.user_id = current_user.id

    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'Story was successfully created.' }
        format.json { render :show, status: :created, location: @story }
      else
        format.html { render :new }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @story.update(story_param)
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
        format.json { render :show, status: :ok, location: @story }
      else
        format.html { render :edit }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to stories_url, notice: 'Story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_story
    @story = Story.find(params[:id])
  end

  def story_param
    params.require(:story).permit(:title, :description, :user_id, :attachment, :location, :latitude, :longitude)
  end
end
