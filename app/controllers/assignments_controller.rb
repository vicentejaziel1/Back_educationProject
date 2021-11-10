class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :update, :destroy]

  # GET /assignments
  def index
    @assignments = Assignment.all
    render json: @assignments, root: root
  end

  # GET /assignments/1
  def show
    render json: @assignment, root: root
  end

  # POST /assignments
  def create
    @assignment = Assignment.new(assignment_params)

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

  private

  def set_assignment
    @assignment = Assignment.find_by_id(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def assignment_params
    params
      .require(:assignment)
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
