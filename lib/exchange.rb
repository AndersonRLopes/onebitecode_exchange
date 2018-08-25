require 'rest-client'
require 'json'
 
module Currency
  def self.exchange currency, currency_destination, quantity
    begin
      res = RestClient.get "http://data.fixer.io/api/latest?access_key=ccd30be170d2f4d57960b713c5aaae64"
      value = JSON.parse(res.body)['rates'][currency_destination]
      return (value * quantity).round(2)
    rescue
      return 'Problem in Conversion'
    end
  end
end