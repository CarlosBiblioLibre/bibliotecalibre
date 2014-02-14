class BattlesController < ApplicationController
  #before_filter :authenticate_user!, except: [:noticia, :show]

  # GET /battles
  # GET /battles.json
  def index
    @battles = Battle.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @battles }
    end
  end

  # GET /battles/1
  # GET /battles/1.json
  def show
    @battle = Battle.find(params[:id])

    @og_description = @battle.content
    @og_title = @battle.title

    # TODO: ADD THIS!
    # @og_image = @battle.small_picture.url(:face)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @battle }
    end
  end

  # GET /battles/new
  # GET /battles/new.json
  def new
    @battle = Battle.new

    render layout: 'admin'
  end

  # GET /battles/1/edit
  def edit
    @battle = Battle.find(params[:id])

    render layout: 'admin'
  end

  # POST /battles
  # POST /battles.json
  def create
    @battle = Battle.new(params[:battle])

    @battle.book1_count = 0
    @battle.book2_count = 0

    respond_to do |format|
      if @battle.save
        format.html { redirect_to @battle, notice: 'Battle was successfully created.' }
        format.json { render json: @battle, status: :created, location: @battle }
      else
        format.html { render action: "new" }
        format.json { render json: @battle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /battles/1
  # PUT /battles/1.json
  def update
    @battle = Battle.find(params[:id])

    respond_to do |format|
      if @battle.update_attributes(params[:battle])
        format.html { redirect_to @battle, notice: 'Battle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @battle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /battles/1
  # DELETE /battles/1.json
  def destroy
    @battle = Battle.find(params[:id])
    @battle.destroy

    respond_to do |format|
      format.html { redirect_to battles_url }
      format.json { head :no_content }
    end
  end
end
