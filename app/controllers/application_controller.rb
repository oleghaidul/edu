class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, :alert => exception.message
  end

  helper_method :yt_client

  
  def yt_client
    @yt_client ||= YouTubeIt::Client.new(:username => "oleghaidul@gmail.com", :password => "123@Fclcz", :dev_key => "AI39si4XUtMEqXcn-5JUfCKXQKenTWQwiLlYUJOviU5XHyCgEDrVQ56C84DzP6aoteqiP-edT42l_Zd3pn1_pMsOPX-SQMyYfA")
  end
  
end
