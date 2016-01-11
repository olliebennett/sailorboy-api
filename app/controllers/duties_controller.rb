class DutiesController < ApplicationController
  before_action :set_duty, only: [:show, :edit, :update, :destroy]

  # GET /duties
  def index
    @duties = Duty.all
  end

  # GET /duties/1
  def show
  end

  # POST /duties
  def create
    @duty = Duty.new(duty_params)

    respond_to do |format|
      if @duty.save
        format.html { redirect_to @duty, notice: 'Duty was successfully created.' }
        format.json { render :show, status: :created, location: @duty }
      else
        format.html { render :new }
        format.json { render json: @duty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /duties/1
  def update
    respond_to do |format|
      if @duty.update(duty_params)
        format.html { redirect_to @duty, notice: 'Duty was successfully updated.' }
        format.json { render :show, status: :ok, location: @duty }
      else
        format.html { render :edit }
        format.json { render json: @duty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /duties/1
  def destroy
    @duty.destroy
    respond_to do |format|
      format.html { redirect_to duties_url, notice: 'Duty was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_duty
    @duty = Duty.find(params[:id])
  end

  def duty_params
    params.require(:duty).permit(:date, :time, :name)
  end
end
