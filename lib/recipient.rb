class Recipient
  PARAMS = 'SLACK_API_TOKEN'

  attr_reader :slack_id, :name

  def initialize
    @slack_id = []
    @name = []
  end

  def self.get(url, params)
    HTTParty.get(url, query: {token: ENV[params]})
  end

  def send_message(message)

  end

  def details
    raise NotImplementedError, 'Implement me in a child class!'
  end

  def self.list_all
    raise NotImplementedError, 'Implement me in a child class!'
  end

end