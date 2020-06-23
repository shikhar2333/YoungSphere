class ScenariosController < ApplicationController
    # before_action :set_scenario
    include ScenariosHelper
    def new
      @scenario = Scenario.new
      puts @scenario
    end
    def create
      @scenario = Scenario.new(scenario_params)
      @scenario.user_id = current_user.id
      puts @scenario
      if @scenario.save!
        @scenario.static_website.attach(params[:scenario][:static_website])
        website_name = @scenario.static_website.filename
        puts "Status:" + @scenario.static_website.attached?.to_s
        if @scenario.static_website.attached?
            Dir.mktmpdir do |dir|
              website_attachment_path = "#{dir}/#{website_name}"
              File.open(website_attachment_path, 'wb') do |file|
                file.write(@scenario.static_website.download)
              end 
              unzip_file(website_attachment_path, dir)
              File.delete(website_attachment_path) if File.exist?(website_attachment_path)
              puts "Dir:" + dir.to_s
              return_new_bucket(dir, website_name, @scenario)
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
      # def set_scenario
      #   @scenario = Scenario.find(params[:id])
      # end
      def scenario_params
        params.require(:scenario).permit(:title, :static_website)
      end
end
