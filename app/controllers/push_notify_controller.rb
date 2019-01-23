class PushNotifyController < ApplicationController
  skip_before_action :verify_authenticity_token  

  def push
    token = params[:data][:token]
    client = Exponent::Push::Client.new
    # client = Exponent::Push::Client.new(gzip: true)  # for compressed, faster requests

    messages = []
    token.each do |t|
      messages << {
        to: t,
        body: 'test'
      }
    end
    a = client.publish messages
    puts a
  end
end
