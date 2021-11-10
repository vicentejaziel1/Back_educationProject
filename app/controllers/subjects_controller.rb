class SubjectsController < ApplicationController
	before_action :set_professor, only: [:index, :create]
  before_action :set_subject, only: [:show, :update, :destroy]

  # GET /subjects
  def index
    @subjects = Subject.where(professor_id: @professor)
    render json: @subjects, root: root
  end

  # GET /professor/professor_id/subjects/1
  def show
    render json: @subject, root: root
  end

  # POST /professor/professor_id/subjects
  def create
    @subject = Subject.new(subject_params)
    @subject.professor = Professor.find_by_id(@professor)

    if @subject.save
      render json: @subject, status: :created
    else
      render json: @subject.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /professor/professor_id/subjects/1
  def update
    if @subject.update(subject_params)
      render json: @subject
    else
      render json: @subject.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @subject.destroy
  end

  private

  def set_professor
    #@professor = Current.user.owner
  end

  def set_subject
    @subject = Subject.find_by_id(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def subject_params
    params
      .require(:subject)
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
