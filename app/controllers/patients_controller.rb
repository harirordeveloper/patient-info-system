class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  def index
    @patients = Patient.all
  end

  def show
  end

  def new
    @patient = Patient.new
  end

  def edit
  end

  def create
    @patient = Patient.new(patient_params)
    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @patient.update(patient_params)
        @patient.medical_records.attach(params[:patient][:medical_records]) if params[:patient][:medical_records].present?
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def medical_record
    @record = ActiveStorage::Blob.find_signed(params[:id])
    @patient = @record.attachments.first.record
    if @record.present?
      @record.attachments.first.purge_later
    end
    respond_to do |format|
     format.html { redirect_to edit_patient_path(@patient), notice: 'Patient was successfully created.' }
    end
  end

  def upload

  end

  def bulk_upload
    Patient.import(params[:patient_records])
    redirect_to root_path
  end

  private
    def set_patient
      @patient = Patient.friendly.find(params[:id])
    end

    def patient_params
      params.require(:patient).permit(:name, :email, :gender, :dob, :marital_status)
    end
end
