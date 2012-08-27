class Qr < ActiveRecord::Base
  include HTTParty

  belongs_to :user
  attr_accessible :data

  base_uri 'chart.googleapis.com'

  def generate(input)
  	options = {:chs => "150x150", :cht => "qr", :chl => :data}
  	response = self.class.get('/chart', :query => options)

  	logger.debug "****************"
    logger.debug "google chart response: "
  	logger.debug( "#{response.code} + #{response.message} + #{response.headers.inspect}" )
  	if(response.code.to_s == '200')
  		qr = response.body
      id = input
      f = File.new("app/assets/images/qr/#{id}.png", "w+b")
      logger.debug "writting to assets/images/qr/#{id}.png"
      f.print(qr)
      f.close
  	end
  	return qr
  end

end
