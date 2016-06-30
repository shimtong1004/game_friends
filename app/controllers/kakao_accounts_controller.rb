class KakaoAccountsController < ApplicationController
  before_action :set_kakao_account, only: [:show, :edit, :update, :destroy]
  protect_from_forgery :except => [:set_uniq_key, :set_user_id, :create_user_copy_account]

  # GET /kakao_accounts
  # GET /kakao_accounts.json
  def index
    game_id = params[:game_id]
    @kakao_accounts = KakaoAccount.where(game_id: game_id, is_true: true).order("id desc").limit(200)
    @account_ids = []
    @account_ids = UserCopyAccount.where(user_id: session[:user_id]).pluck(:account_id) if session[:user_id]
    @game_uniq_key = "#{SecureRandom.urlsafe_base64(nil, false)}-#{SecureRandom.urlsafe_base64(nil, false)}-#{SecureRandom.urlsafe_base64(nil, false)}"
  end
  
  def set_uniq_key
    user = User.create(game_uniq_key: params[:game_uniq_key])
    session[:user_id] = user.id
    render json: {user_id: user.id}
  end
  
  def set_user_id
    user = User.find_by_game_uniq_key(params[:game_uniq_key])
    session[:user_id] = user.id
    render json: {status: :ok}
  end
  
  def create_user_copy_account
    user = User.find_by_game_uniq_key(params[:game_uniq_key])
    copy_account = user.user_copy_accounts.where(account_id: params[:account_id])
    user.user_copy_accounts.create(account_id: params[:account_id]) if copy_account.blank?
    render json: {status: :ok}
  end

  # GET /kakao_accounts/1
  # GET /kakao_accounts/1.json
  def show
  end

  # GET /kakao_accounts/new
  def new
    @kakao_account = KakaoAccount.new
  end

  # GET /kakao_accounts/1/edit
  def edit
  end

  # POST /kakao_accounts
  # POST /kakao_accounts.json
  def create
    @kakao_account = KakaoAccount.new(kakao_account_params)

    respond_to do |format|
      if @kakao_account.save
        format.html { redirect_to @kakao_account, notice: 'Kakao account was successfully created.' }
        format.json { render :show, status: :created, location: @kakao_account }
      else
        format.html { render :new }
        format.json { render json: @kakao_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kakao_accounts/1
  # PATCH/PUT /kakao_accounts/1.json
  def update
    respond_to do |format|
      if @kakao_account.update(kakao_account_params)
        format.html { redirect_to @kakao_account, notice: 'Kakao account was successfully updated.' }
        format.json { render :show, status: :ok, location: @kakao_account }
      else
        format.html { render :edit }
        format.json { render json: @kakao_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kakao_accounts/1
  # DELETE /kakao_accounts/1.json
  def destroy
    @kakao_account.destroy
    respond_to do |format|
      format.html { redirect_to kakao_accounts_url, notice: 'Kakao account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kakao_account
      @kakao_account = KakaoAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kakao_account_params
      params.fetch(:kakao_account, {})
    end
end
