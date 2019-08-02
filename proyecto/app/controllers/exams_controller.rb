class ExamsController < ApplicationController
before_action :set_pharmacy
  before_action :set_pharmacy_exam, only: [:show, :update, :destroy]

  # GET /pharmacies/:pharmacy_id/exams
  def index
    json_response(@pharmacy.exams)
  end

  # GET /pharmacies/:pharmacy_id/exams/:id
  def show
    json_response(@exam)
  end

  # POST /pharmacies/:pharmacy_id/exams
  def create
    @pharmacy.exams.create!(exam_params)
    json_response(@pharmacy, :created)
  end

  # PUT /pharmacies/:pharmacy_id/exams/:id
  def update
    @exam.update(exam_params)
    head :no_content
  end

  # DELETE /pharmacies/:pharmacy_id/exams/:id
  def destroy
    @exam.destroy
    head :no_content
  end

  def filtro
      @valores=params.permit(:valor1, :valor2)
  @resultado=[]
  for exam in @temp_pharmacy do
    resultado.push(exams) if params[:valor1]<exams.costo<params[:valor2]
  end
  json_response(@resultado)
  end

  private

  def exam_params
    params.permit(:indicacion, :muestra, :costo, :tiempo, :resultado, :tipo)
  end

  def set_pharmacy
    @pharmacy = Pharmacy.find_by!(id: params[:pharmacy_id])
  end

  def set_pharmacy_exam
    @exam = @pharmacy.exams.find_by!(id: params[:id]) if @pharmacy
  end

end
