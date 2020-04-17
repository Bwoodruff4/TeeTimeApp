class Weather
    @@apikey = "843d9bfba1ebeb5f003112d73ff5072c"
    @@baseurl = "api.openweathermap.org/data/2.5/"

    def self.get_weather_data(latitude, longitude)
        @@url = @@baseurl + "weather?lat=#{latitude}&lon=#{longitude}&units=imperial&appid=#{@@apikey}"
        @@data = RestClient.get(@@url)
        @@weather_data = JSON.parse(@@data)
    end

end