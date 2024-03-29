class FindingsController < ApplicationController
  before_filter :authenticate_user!, except: [:map, :show, :new, :new_with_code, :create]
  # index  edit  update destroy map show new new_with_code create
  # GET /findings
  # GET /findings.json
  def index
    @findings = Finding.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @findings }
    end
  end

  def map
    @findings = Finding.all
  end

  def emails
    @emails = {}
    Finding.all.map do |f|
      if f.username
        @emails[f.username] = f.email
      end
    end
  end

  # GET /findings/1
  # GET /findings/1.json
  def show
    @finding = Finding.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @finding }
    end
  end

  # GET /findings/new
  # GET /findings/new.json
  def new
    @finding = Finding.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @finding }
    end
  end

  def new_with_code
    @finding = Finding.new
    @finding.book = Book.find_by_code(params[:code]) if params[:code].present?

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @finding }
    end
  end

  # GET /findings/1/edit
  def edit
    @finding = Finding.find(params[:id])
  end


  # POST /findings
  # POST /findings.json
  def create
    @finding = Finding.new(params[:finding])

    respond_to do |format|
      if @finding.save
        format.html { redirect_to @finding, notice: 'Los datos han sido ingresados. ¡Muchas gracias!' }
        format.json { render json: @finding, status: :created, location: @finding }
      else
        format.html { render action: "new" }
        format.json { render json: @finding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /findings/1
  # PUT /findings/1.json
  def update
    @finding = Finding.find(params[:id])

    respond_to do |format|
      if @finding.update_attributes(params[:finding])
        format.html { redirect_to @finding, notice: 'Los datos han sido ingresados. ¡Muchas gracias!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @finding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /findings/1
  # DELETE /findings/1.json
  def destroy
    @finding = Finding.find(params[:id])
    @finding.destroy

    respond_to do |format|
      format.html { redirect_to findings_url }
      format.json { head :no_content }
    end
  end
end
