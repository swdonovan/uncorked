class SnoothService
  def initialize
    @conn = Faraday.new(:url => 'http://api.snooth.com/')
  end

  def all_wines
    response = @conn.get('/wines') do |req|
      req.params['akey'] = ENV['SNOOTH_API']
      req.params['q'] = 'wine'
      req.params['n'] = '100'
    end
    JSON.parse(response.body, symbolize_names: true)[:wines]
  end

  def self.return_all
    new.all_wines
  end
end
