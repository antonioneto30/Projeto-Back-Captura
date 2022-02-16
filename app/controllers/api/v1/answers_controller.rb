module api
    module v1
        class AnswersController < ApplicationController

          before_action: set_answer, only: [:show, :update, :destroy]

          def index
            @answers = Answer.all 
            render json: @answers
          end

          def show
            show json: @answer
          end

          def create
            @answer = Answer.new(answer_params)

        
        end
    end
end