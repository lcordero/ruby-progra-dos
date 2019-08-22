class ExamsController < ApplicationController
before_action :set_pharmacy
  before_action :set_pharmacy_exam, only: [:show, :update, :destroy, :filtro]

  # GET /pharmacies/:pharmacy_id/exams
  def index
     tem_pharmacy=@pharmacy.attributes.merge({:exams => @pharmacy.exams})
    json_response(tem_pharmacy)
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
   
  def filtroexamenes
	  @resultado=[]
	  @temp_pharmacy=Pharmacy.find_by!(id: params[:pharmacy_id])
	  @preciocomparador1=params.permit[:costomayor]
	  @preciocomparador2=params.permit[:costomenor]
	if params[:costomenor].to_i > params[:costomayor].to_i
   		 @resultado = ["Ingrese el costo con su respectivo orden"]

    		json_response(@resultado)

	else 
		for exam in @temp_pharmacy.exams do
			@resultado.push(exam) if params[:costomenor].to_i < exam.costo &&  exam.costo < params[:costomayor].to_i
    	end
        json_response(@resultado)
      end
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
