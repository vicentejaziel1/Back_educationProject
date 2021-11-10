class GradesController < ApplicationController
  before_action :set_grade, only: [:show, :update, :destroy]

  # GET /grades
  def index
    @grades = Grade.all
    render json: @grades, root: root
  end

  # GET /grades/1
  def show
    render json: @grade, root: root
  end

  # POST /grades
  def create
    @grade = Grade.new(grade_params)

    if @grade.save
      render json: @grade, status: :created
    else
      render json: @grade.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /grades/1
  def update
    if @grade.update(grade_params)
      render json: @grade
    else
      render json: @grade.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @grade.destroy
  end

  private

  def set_grade
    @grade = Grade.find_by_id(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def grade_params
    params
      .require(:grade)
      .permit(:name,
              :lastname,
              :matriname,
              :relationship,
              :email,
              :phone_number,
              :phone_number_extension,
              :mobile_number,
              :receives_email)
  end
end
