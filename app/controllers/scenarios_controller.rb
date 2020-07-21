class ScenariosController < ApplicationController
  before_action :set_scenario, only: [:show, :edit, :update, :destroy]
    include ScenariosHelper
    def new
      @scenario = Scenario.new
    end

    def index
      @scenarios = Scenario.all 
    end

    def show
    end

    def edit
    end

    def update
      respond_to do |format|
        if @scenario.update(scenario_params)
          format.html { redirect_to @scenario, notice: 'Scenario was successfully updated.' }
          # format.json { render :show, status: :ok, location: @scenario }
        # else
        #   format.html { render :edit }
        #   format.json { render json: @scan_image.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @scenario.destroy
      respond_to do |format|
        s3 = Aws::S3::Resource.new
        bucket_name = get_bucket_name(@scenario)
        bucket = s3.bucket(bucket_name)
        bucket.delete!
        format.html { redirect_to scenarios_url, notice: 'Scenario was successfully destroyed.' }
        # format.json { head :no_content }
      end
    end

    def create
      @scenario = Scenario.new(scenario_params)
      # @scenario.user_id = current_user.id
      @scenario.update_attribute(:user_id, current_user.id)
      puts @scenario
      if @scenario.save!
        @scenario.static_website.attach(params[:scenario][:static_website])
        website_name = @scenario.static_website.filename
        if @scenario.static_website.attached?
            Dir.mktmpdir do |dir|
              website_attachment_path = "#{dir}/#{website_name}"
              File.open(website_attachment_path, 'wb') do |file|
                file.write(@scenario.static_website.download)
              end 
              unzip_file(website_attachment_path, dir)
              File.delete(website_attachment_path) if File.exist?(website_attachment_path)
              puts "Dir:" + dir.to_s
              s3_link = return_new_bucket(dir, website_name, @scenario)
              @scenario.update_attribute(:link_to_scenario, s3_link.to_s)
              puts "My new website: #{website_attachment_path}"
            end
            flash[:success] = "AR scenario successfully uploaded"
            redirect_to root_path  
        end
      else 
        render 'new'
      end
    end
  
  
    private
      def set_scenario
        @scenario = Scenario.find(params[:id])
      end
      def scenario_params
        params.require(:scenario).permit(:title, :static_website)
      end
end
