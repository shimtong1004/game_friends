class KakaoAccountsController < ApplicationController
  before_action :set_kakao_account, only: [:show, :edit, :update, :destroy]

  # GET /kakao_accounts
  # GET /kakao_accounts.json
  def index
    # game_id = params[:game_id]
    # @kakao_accounts = KakaoAccount.where(game_id: game_id).order("id desc")
    @games = Game.all
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
