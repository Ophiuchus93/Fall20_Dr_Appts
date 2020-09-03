class ApptsController < ApplicationController
  before_action :set_patient

  def index
    @appointments = @patient.appts.all
  end

  def new
    @appointment = @patient.appts.new
    @doctors = Doctor.all
  end

  def create
    @appointment = @patient.appts.new(appt_params)
    @doctors = Doctor.all

    if @appointment.save 
      redirect_to patient_appts_path(@patient)
    else
      render :new
    end
  end

  def destroy
    @appointment = @patient.appts.find(params[:id])
    @appointment.destroy
    redirect_to patient_appts_path(@patient)
  end

  private
    def set_patient
      @patient = Patient.find(params[:patient_id])
    end

    def appt_params
      params.require(:appt).permit(:doctor_id, :date)
    end
end
