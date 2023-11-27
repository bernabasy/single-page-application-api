class InputDataController < ApplicationController
    before_action :set_input_data, only: [:show, :update, :destroy]
  
    def index
      input_data = InputData.all
      render json: input_data
    end
  
    def show
      render json: @input_data
    end
  
    def create
       @input_data = InputData.new(input_data_params)
     @input_data.agree_to_terms = params[:input_data][:agree_to_terms]
      if @input_data.save
        render json: @input_data, status: :created
      else
        render json: @input_data.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @input_data.update(input_data_params)
        render json: @input_data
      else
        render json: @input_data.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @input_data.destroy
      head :no_content
    end
  
    private
  
    def set_input_data
      @input_data = InputData.find(params[:id])
    end
  
    def input_data_params
        params.require(:input_data).permit(:name, sectors: [])
      end
end
