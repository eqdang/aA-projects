json.pokemon do
    json.extract! @pokemon, :id, :name, :attack, :defense, :moves, :poke_type, :image_url, :item_ids
end

json.items @pokemon.items do |item|
    # json.id item.id
    json.set! item.id do
        json.extract! item, :id, :name, :pokemon_id, :price, :happiness, :image_url
    end
end


# json.guests @party.guests do |guest|
#   json.name guest.name
#   json.gifts do
#     json.array! @guest.gifts, :title, :description
#   end
# end

