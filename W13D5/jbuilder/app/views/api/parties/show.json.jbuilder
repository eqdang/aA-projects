json.extract! @party, :name, :location

json.guests @party.guests do |guest|
    # json.array! @party.guests, :name, :age, :favorite_color
    # json.array! @guest.gifts, :description, :title
    # json.gifts do
    #     json.array! @guest.gifts, :title, :description
    # end
    json.name guest.name
    json.gifts guest.gifts, :title, :description
end

# json.gifts do
#    json.array! @guest.gifts, :description, :title
# end