@wines.each do |wine|
  json.set! wine.name, nil
end
json.set! "Not Found add your own...", "/add-a-wine"
