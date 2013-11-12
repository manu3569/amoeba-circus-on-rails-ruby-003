class AmoebasController < ApplicationController
  before_action :set_amoeba, only: [:show, :edit, :update, :destroy, :split]
  before_action :set_talents, only: [:new, :edit]
  before_action :set_acts, only: [:new, :edit]
  # GET /amoebas
  # GET /amoebas.json
  def index
    @amoebas = Amoeba.all
  end

  # GET /amoebas/1
  # GET /amoebas/1.json
  def show
  end

  # GET /amoebas/new
  def new
    @amoeba = Amoeba.new
  end

  # GET /amoebas/1/edit
  def edit
  end

  # POST /amoebas
  # POST /amoebas.json
  def create
    @amoeba = Amoeba.new(amoeba_params)

    respond_to do |format|
      if @amoeba.save
        format.html { redirect_to @amoeba, notice: 'Amoeba was successfully created.' }
        format.json { render action: 'show', status: :created, location: @amoeba }
      else
        format.html { render action: 'new' }
        format.json { render json: @amoeba.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /amoebas/1
  # PATCH/PUT /amoebas/1.json
  def update
    respond_to do |format|
      if @amoeba.update(amoeba_params)
        format.html { redirect_to @amoeba, notice: 'Amoeba was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @amoeba.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /amoebas/1
  # DELETE /amoebas/1.json
  def destroy
    @amoeba.destroy
    respond_to do |format|
      format.html { redirect_to amoebas_url }
      format.json { head :no_content }
    end
  end

  def split
    if @amoeba.split(split_params[:amoeba_1], split_params[:amoeba_2])
      redirect_to amoebas_url, notice: "#{@amoeba.name} will live on in his two children."
    else
      flash.now[:error] = "#{@amoeba.name} couldn't split."
      render :show
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_amoeba
      @amoeba = Amoeba.find(params[:id])
    end

    def set_talents
      @talents = Talent.all.map {|t| [t.name.humanize, t.id]}
    end

    def set_acts
      @acts = Act.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def amoeba_params
      params.require(:amoeba).permit(:name, :generation, :talent_id, :"act_ids" => [])
    end
    def split_params
      params.require(:amoeba).permit(:amoeba_1, :amoeba_2)
    end
end
