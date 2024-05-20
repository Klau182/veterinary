class PetsController < ApplicationController
  before_action :set_pet, only: %i[ show edit update destroy ]
  before_action :validate_field_number, only: %i[ create update ]

  # GET /pets or /pets.json
  def index
    @pets = Pet.all
    @pets = current_user.pets
  end
   
  # GET /pets/1 or /pets/1.json
  def show
  end

  # GET /pets/new
  def new
    @pet = Pet.new
  end

  # GET /pets/1/edit
  def edit
  end

  # POST /pets or /pets.json
  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user

    respond_to do |format|
      if @pet.save
        format.html { redirect_to pet_url(@pet), notice: "Registro Creado Satisfactoriamente" }
        format.json { render :show, status: :created, location: @pet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end
     

      

  # PATCH/PUT /pets/1 or /pets/1.json
  def update
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to pet_url(@pet), notice: "Datos Mascota fueron actualizados." }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1 or /pets/1.json
  def destroy
    @pet.destroy

    respond_to do |format|
      format.html { redirect_to pets_url, notice: "Datos de la Mascota fueron Eliminados." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pet_params
      params.require(:pet).permit(:name, :specie, :weight, :height)
    end

    def validate_field_number
      pet_params = params[:pet]
      weight = pet_params[:weight].to_i
      height = pet_params[:height].to_i
    
      if weight < 0 || height < 0
        redirect_to pet_path, alert: "El peso y la altura deben ser mayores o iguales a cero."
      end
    end
end