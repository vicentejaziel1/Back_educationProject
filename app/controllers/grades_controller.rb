class GradesController < ApplicationController
  before_action :set_subject, only: [:index, :create, :submit]
  before_action :set_grade, only: [:show, :update, :destroy]

  # GET /grades
  def index
    puts current_user
    students = @subject.users.where(owner_type:'Student')

    @grades = students.map do |student|
      {
        id: student.id,
        name: student.owner.name + ' ' + student.owner.lastname,
        grades: @subject.assignments.map do |assignment|
                  {
                    assignment_id: assignment.id,
                    title: assignment.title,
                    note: assignment.grades.where(user_id: student.id)&.first&.note
                  }
                end
      }
    end
    render json: @grades
  end

  # GET /grades/1
  def show
    render json: @grade
  end

  # POST /grades
  # def create
  #   @grade = Grade.new(grade_params)
  #   @grade.student = current_user

  #   if @grade.save
  #     render json: @grade, status: :created
  #   else
  #     render json: @grade.errors, status: :unprocessable_entity
  #   end
  # end

  # PATCH/PUT /grades/1
  def update
    if @grade.update(grade_params)
      render json: @grade
    else
      render json: @grade.errors, status: :unprocessable_entity
    end
  end

  def submit
    assignment = Assignment.find_by_id(params[:assignment_id])
    @grade = Grade.new(grade_params)
    @grade.user_id = current_user.id
    @grade.assignment_id = assignment.id
    @grade.subject_id = @subject.id

    if @grade.save
      render json: @grade, status: :created
    else
      render json: @grade.errors, status: :unprocessable_entity
    end
  end

  def evaluate
    @grade.evaluated = true
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

  def set_subject
    @subject = Subject.find_by_id(params[:subject_id])
  end

  def set_grade
    @grade = Grade.find_by_id(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def grade_params
    params
      .require(:grade)
      .permit(:note,
              :comments)
  end
end
