class ProjetosController < ApplicationController
  before_action :set_projeto, only: [:show, :update, :destroy]

  # GET /projetos
  def index
    @projetos = Projeto.all

    render json: @projetos
  end

  # GET /projetos/1
  def show
    render json: @projeto
  end

  # POST /projetos
  def create
    @projeto = Projeto.new(projeto_params)

    if @projeto.save
      render json: @projeto, status: :created, location: @projeto
    else
      render json: @projeto.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /projetos/1
  def update
    if @projeto.update(projeto_params)
      render json: @projeto
    else
      render json: @projeto.errors, status: :unprocessable_entity
    end
  end

  # DELETE /projetos/1
  def destroy
    @projeto.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_projeto
      @projeto = Projeto.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def projeto_params
      params.require(:projeto).permit(:name)
    end
end
