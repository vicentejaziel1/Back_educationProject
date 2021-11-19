class AdvicesController < ApplicationController
    before_action : set_users, only: [:index, :create, :submit]
    before_action : set_advice, only: [:show, :update, :destroy]

    #GET /advices
    def index
        @advices = Advice.all
        render json: @advices
    end

    # GET /advices/1
    def show
        render json: @advices
    end

    #POST /advices
    def create
        @advices = Advice.new(advice_params)

        @advice.user = @user

        if @advice.save
            render json: @advice, status: :created
        else
            render json: @advice.errors, status: :unprocessable_entity
        end
    end

    #PATCH/PUT /advices/1
    def update
        if @advice.update(advice_params)
            render json: @advice
        else
            render json: @advice.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @advice.destroy
    end

    private
    
    def set_advice
        @advice = Advice.find_by_id(params[:id])
    end

    def set_assignment
        @assigment = User.find_by_id(params[:user_id])
    end

    #Only allow a trusted parameter "white list" through
    def advice_params
        params
          .require(:advice)
          .permit(:title,
                  :content,
                  :id_user,
                  :date_time)
      end
end
