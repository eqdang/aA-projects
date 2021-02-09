# json.extract! @gift, :description, :title, :guest

json.partial! 'api/gifts/gift', gift: @gift