class PaymongoService
  include HTTParty
  require 'uri'
  require 'net/http'
  require 'base64'
  require 'dotenv/load'

  def initialize(amount, description, remarks)
    @amount = amount * 100
    @description = description
    @remarks = remarks
  end

  def create_payment_link
    url = URI("https://api.paymongo.com/v1/links")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
  
    request = Net::HTTP::Post.new(url)
    request["accept"] = 'application/json'
    request["content-type"] = 'application/json'
    request["authorization"] = "Basic #{Base64.strict_encode64("#{ENV['PAYMONGO_SECRET_KEY']}:")}" # Use ENV variable for key
    request.body = {
      data: {
        attributes: {
          amount: @amount,
          description: @description,
          remarks: @remarks
        }
      }
    }.to_json
  
    response = http.request(request)
    Rails.logger.info "Paymongo API Response: #{response.body}" # Log the response body
    JSON.parse(response.body) # Ensure you're parsing the JSON response
  end
  
end
