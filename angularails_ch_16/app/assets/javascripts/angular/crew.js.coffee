AngulaRails.factory "Crew", () ->
  self = {}
  self.crew = [
    id: 1
    name: "Kirk"
  ,
    id: 2
    name: "Spock"
  ,
    id: 3
    name: "McCoy"
  ]

  self.all = () ->
    self.crew

  self.find = (id) ->
    for c in self.crew
      if c.id == parseInt(id)
        return c
    null

  self.getPosition = (id) ->
    switch id
      when "1"
        "Captain"
      when "2"
        "Officer"
      when "3"
        "Doctor"

  self