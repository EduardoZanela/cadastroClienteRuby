class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user?, :except => [:index]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
   puts @map
    if params[:sort].to_s == 'name'
      @users = Kaminari.paginate_array(User.all.sort_by {|u| u.name.downcase }).page(params[:page]).per(10)
    elsif params[:sort].to_s == 'city'
      @users = Kaminari.paginate_array(User.all.sort_by {|u| u.city.downcase }).page(params[:page]).per(10)
    elsif params[:sort].to_s == 'country'
      @users = Kaminari.paginate_array(User.all.sort_by {|u| u.country.downcase }).page(params[:page]).per(5)
    else
      @users = Kaminari.paginate_array(User.all).page(params[:page]).per(10)
    end

  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'Usuario criado com sucesso.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'Usuario atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: '.' }
      format.json { head :no_content }
    end
  end

  def file
    @map = User.import(params[:file])
    message = @map["sucess"].to_s
    @map.delete("sucess")
    @map.each { |k, v| message += "Linha: #{k} erro: #{v} " }
    respond_to do |format|
      format.html{redirect_to users_url, notice: message }
    end
  end

  def export
    @users = User.all

    respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv, filename: "users-#{Date.today}.csv" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :city, :province, :country, :birth_date, :civil, :sex, :profession)
    end

end
