class Video < ActiveRecord::Base

  belongs_to :lesson

  scope :completes,   where(:is_complete => true)
  scope :incompletes, where(:is_complete => false)

  def self.yt_session
    @yt_session ||= YouTubeIt::Client.new(:username => "oleghaidul@gmail.com", :password => "123@Fclcz", :dev_key => "AI39si4XUtMEqXcn-5JUfCKXQKenTWQwiLlYUJOviU5XHyCgEDrVQ56C84DzP6aoteqiP-edT42l_Zd3pn1_pMsOPX-SQMyYfA")
  end

  def self.delete_video(video)
    yt_session.video_delete(video.yt_video_id)
    video.destroy
      rescue
        video.destroy
  end

  def self.update_video(video, params)
    yt_session.video_update(video.yt_video_id, video_options(params))
    video.update_attributes(params)
  end

  def self.token_form(params, nexturl)
    yt_session.upload_token(video_options(params), nexturl)
  end

  def self.delete_incomplete_videos
    self.incompletes.map{|r| r.destroy}
  end

  private

    def self.video_options(params)
      opts = {:title => params[:title],
             :description => params[:description],
             :category => "People",
             :keywords => ["test"]}
      params[:is_unpublished] == "1" ? opts.merge(:private => "true") : opts
    end
end
