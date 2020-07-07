# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cadsatrando as moedas......'

Coin.create!(
  description: 'Bitcoin',
  acronym: 'BTC',
  url_image:
    'https://toppng.com/uploads/preview/bitcoin-png-bitcoin-logo-transparent-background-11562933997uxok6gcqjp.png'
)
Coin.create!(
  description: 'Ethereum',
  acronym: 'ETH',
  url_image:
    'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png/600px-ETHEREUM-YOUTUBE-PROFILE-PIC.png'
)
Coin.create!(
  description: 'Dash',
  acronym: 'DASH',
  url_image:
    'https://www.zenithincome.com/uploads/currencies/icon/156518530383Dash-D-white_on_blue_circle.png'
)
puts 'Moedas cadastradas com sucesso!......'
