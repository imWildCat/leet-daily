class Admin::LeetcodeUserCheckinsController < Admin::BaseController
  before_action :set_admin_leetcode_user_checkin, only: [:show, :edit, :update, :destroy]

  # GET /admin/leetcode_user_checkins
  # GET /admin/leetcode_user_checkins.json
  def index
    @admin_leetcode_user_checkins = LeetcodeUserCheckin.default_list.page(params[:page])
  end

  # GET /admin/leetcode_user_checkins/1
  # GET /admin/leetcode_user_checkins/1.json
  def show
  end

  # GET /admin/leetcode_user_checkins/new
  def new
    @admin_leetcode_user_checkin = LeetcodeUserCheckin.new
  end

  # GET /admin/leetcode_user_checkins/1/edit
  def edit
  end

  # POST /admin/leetcode_user_checkins
  # POST /admin/leetcode_user_checkins.json
  def create
    @admin_leetcode_user_checkin = LeetcodeUserCheckin.new(admin_leetcode_user_checkin_params)

    respond_to do |format|
      if @admin_leetcode_user_checkin.save
        format.html {redirect_to @admin_leetcode_user_checkin, notice: 'Leetcode user checkin was successfully created.'}
        format.json {render :show, status: :created, location: @admin_leetcode_user_checkin}
      else
        format.html {render :new}
        format.json {render json: @admin_leetcode_user_checkin.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /admin/leetcode_user_checkins/1
  # PATCH/PUT /admin/leetcode_user_checkins/1.json
  def update
    respond_to do |format|
      if @admin_leetcode_user_checkin.update(admin_leetcode_user_checkin_params)
        format.html {redirect_to admin_leetcode_user_checkins_path, notice: 'Leetcode user checkin was successfully updated.'}
        format.json {render :show, status: :ok, location: @admin_leetcode_user_checkin}
      else
        format.html {render :edit}
        format.json {render json: @admin_leetcode_user_checkin.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /admin/leetcode_user_checkins/1
  # DELETE /admin/leetcode_user_checkins/1.json
  def destroy
    @admin_leetcode_user_checkin.destroy
    respond_to do |format|
      format.html {redirect_to admin_leetcode_user_checkins_url, notice: 'Leetcode user checkin was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_leetcode_user_checkin
    @admin_leetcode_user_checkin = LeetcodeUserCheckin.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_leetcode_user_checkin_params
    params.require(:leetcode_user_checkin).permit(:finished_count)
  end
end
