class AssignmentsController < ApplicationController
  before_action :set_subject, only: [:index, :create]
  before_action :set_assignment, only: [:show, :update, :destroy]

  # GET /assignments
  def index
    @assignments = Assignment.all
    render json: @assignments
  end

  # GET /assignments/1
  def show
    render json: @assignment
  end

  # POST /assignments
  def create
    @assignment = Assignment.new(assignment_params)

    @assignment.subject = @subject

    if @assignment.save
      render json: @assignment, status: :created
    else
      render json: @assignment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /assignments/1
  def update
    if @assignment.update(assignment_params)
      render json: @assignment
    else
      render json: @assignment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @assignment.destroy
  end

  #GET /assignments/1/grades
  def grades
    @grades = @subject.grades

    render json: @grades
  end

  private

  def set_subject
    @subject = Subject.find_by_id(params[:subject_id])
  end

  def set_assignment
    @assignment = Assignment.find_by_id(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def assignment_params
    params
      .require(:assignment)
      .permit(:title,
              :description,
              :percentage,
              :limit_date)
  end
end
