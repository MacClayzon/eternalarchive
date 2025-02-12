class ContributionsController < ApplicationController
  before_action :set_contribution, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  

  # GET /contributions
  def index
    if current_user.try(:admin?)
      @contributions = Contribution.all.reverse_order
    else
      redirect_to root_path 
    end
  end

  # GET /contributions/new
  def new
    if user_signed_in?
    @contribution = Contribution.new
    else
     redirect_to new_user_session_path
    end
end

  # GET /contributions/1/edit
  def edit
  end

  # POST /contributions
  def create
    @contribution = Contribution.new(contribution_params)
    @contribution.user_id = current_user.id

      if @contribution.save
        flash[:cont] = "Thank you for contributing, we are checking it out now!"
        redirect_to root_path
      else
          
          render :new 
      end
  end

  # PATCH/PUT /contributions/1
  def update
      if @contribution.update(contribution_params)
        redirect_to root_path
      else
         render :edit 
      end
  end

  # DELETE /contributions/1
  def destroy
    @contribution.destroy
      redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contribution
      @contribution = Contribution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contribution_params
      params.require(:contribution).permit(:contribution_url, :contribution_category, :user_id, :username, category_ids: [] )
    end
end
