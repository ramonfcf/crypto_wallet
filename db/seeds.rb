# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

coins = [
            {description:"Bitcoin",
            acronym: "BTC",
            url_image: "https://e7.pngegg.com/pngimages/261/204/png-clipart-bitcoin-bitcoin-thumbnail.png"
            },

            {
               description:"Etherium",
               acronym: "ETH",
               url_image: "https://img1.gratispng.com/20180410/juw/kisspng-ethereum-cryptocurrency-bitcoin-cash-tether-impact-5acceb0643a7c2.9049379315233789502771.jpg"
            },

            {
               description:"Dash",
               acronym: "DASH",
               url_image: "https://cryptologos.cc/logos/dash-dash-logo.png"
            }
]

coins.each do |coin|
   Coin.find_or_create_by!(coin)
end
