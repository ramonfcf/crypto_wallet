namespace :dev do
   desc "Configura o ambiente de desenvolvimento"
   task setup: :environment do
      if Rails.env.development?
         show_spinner("db:drop") do
            %x(rails db:drop)
         end

         show_spinner("db:create") { %x(rails db:create) }
         show_spinner("db:migrate") { %x(rails db:migrate) }
         show_spinner("coins") { %x(rails dev:add_coins) }
         show_spinner("mining types") { %x(rails dev:add_mining_type) }
      else
         puts "Você não está em ambiente de desenvolvimento."
      end
   end

   private
   
   def show_spinner(msg_start, msg_end = "Concluído com sucesso!")
      spinner = TTY::Spinner.new("[:spinner] Executando #{msg_start}...")
      yield
      spinner.success(msg_end)
   end

   desc "Cadastro de Moedas"
   task add_coins: :environment do
      coins = [
         {
         description:"Bitcoin",
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
   end

   desc "Cadastro Tipos de Mineração"
   task add_mining_type: :environment do
      mining_types = [
         {name: "Proof of Work", acronym: "PoW"},
         {name: "Proof of Stake", acronym: "PoS"},
         {name: "Proof of Capacity", acronym: "PoC"}
      ]

      mining_types.each do |mining|
         MiningType.find_or_create_by!(mining)
      end
   end
end
