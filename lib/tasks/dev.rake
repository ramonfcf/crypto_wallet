namespace :dev do
   desc "Configura o ambiente de desenvolvimento"
   task setup: :environment do
      if Rails.env.development?
         spinner = TTY::Spinner.new("[:spinner] Executando db:drop...")
         %x(rails db:drop)
         spinner.success("Concluído com sucesso!")

         spinner = TTY::Spinner.new("[:spinner] Executando db:create...")
         %x(rails db:create)
         spinner.success("Concluído com sucesso!")

         spinner = TTY::Spinner.new("[:spinner] Executando db:migrate...")
         %x(rails db:migrate)
         spinner.success("Concluído com sucesso!")

         spinner = TTY::Spinner.new("[:spinner] Executando db:seed...")
         %x(rails db:seed)
         spinner.success("Concluído com sucesso!")
      else
         puts "Você não está em ambiente de desenvolvimento."
      end
   end
end
