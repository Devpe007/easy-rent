class EquipamentsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_equipament, only: %i[show edit update destroy]

  def index
    @equipaments = Equipament.order(:name, :serial_number)
    authorize @equipaments
  end

  def show
    authorize @equipament
  end

  def new
    @equipament = Equipament.new
    authorize @equipament
  end

  def create
    @equipament = Equipament.new equipament_params
    authorize @equipament

    if @equipament.save
      redirect_to equipaments_path, notice: 'Equipamento cadastrado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @equipament
  end

  def update
    authorize @equipament

    if @equipament.update equipament_params
      redirect_to equipament_params, notice: 'Equipamento atualizado com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @equipament
  end

  private

  def equipament_params
    params.require(:equipament).permit(:name, :serial_number, :description)
  end

  def load_equipament
    @equipament = Equipament.find params[:id]
  end
end
