class GameService
  def self.create_game(data)
    body = { name: data[:name],
             game_type: data[:game_type],
             description: data[:description],
             min_age: data[:min_age],
             duration: data[:duration],
             image: data[:image]
            }

    conn = Faraday.new("#{ENV['BACKEND_URL']}/api/v1/games")

    response = conn.post do |request|
      request.body = body
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
