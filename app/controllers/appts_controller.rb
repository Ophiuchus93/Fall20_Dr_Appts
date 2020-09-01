class ApptsController < ApplicationController
  before_action :set_patient

  def index
    @appointments = @patient.appointments.all
  end

  def new
    @appointment = @patient.appointments.new
    @doctors = Doctor.all
  end

  def create
    @appointment = @patient.appointments.new(appt_params)
    @doctors = Doctor.all

    if @appointment.save
      redirect_to patient_appts_path(@patient)
    else
      render :new
  end

  def destroy
    @appointment = @patient.appointments.find(params[:id])
    @appointment.destroy
    redirect_to patient_appts_path(@patient)
  end

  private
    def set_patient
      @patient = Patient.find(params[:patient_id])
    end

    def appt_params
      params.require(:appointment).permit(:doctor_id, :date)
    end
end
