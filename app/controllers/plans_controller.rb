class PlansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_plan, only: [:show, :edit, :update, :destroy]

  # GET /plans
  # GET /plans.json
  def index
    #@plans = Plan.all
    if defined?(current_user)
      if defined?(current_user.id) && current_user.id != ""
        @plans =  Plan.where(user_id: current_user.id)
      end
    end
  end 
  
  # GET /plans/1
  # GET /plans/1.json
  def show
    @plan = Plan.find(params[:id])
    #@terms = Term.all
    #@TC = TermCourse.all
    #@courses = Course.all
  end

  # GET /plans/new
  def new
    @plan = Plan.new
    3.times do
      term = @plan.terms.build
      term.term_courses.build
    end
    
  end

  # GET /plans/1/edit
  def edit
    @plan = Plan.find(params[:id])
    #@plan.terms.build
    #@terms = Term.all
    #@TC = TermCourse.all
    #@courses = Course.al
  end

  # POST /plans
  # POST /plans.json
  def create
    @plan = Plan.new(plan_params)
    @plan.user_id = current_user.id
    
    respond_to do |format|
      if @plan.save
        format.html { redirect_to @plan, notice: 'Plan was successfully created.' }
        format.json { render :show, status: :created, location: @plan }
      else
        format.html { render :new }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plans/1
  # PATCH/PUT /plans/1.json
  def update
    respond_to do |format|
      if @plan.update(plan_params)
        format.html { redirect_to @plan, notice: 'Plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @plan }
      else
        format.html { render :edit }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.json
  def destroy
    @plan.destroy
    respond_to do |format|
      format.html { redirect_to plans_url, notice: 'Plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plan_params 
      params.require(:plan).permit(:name, :user_id, 
        :terms_attributes => [:id, :year, :semester, :_destroy, 
         :term_courses_attributes => [:id, :course_id, :term_id, :_destroy ] ]
        )
    end
end
