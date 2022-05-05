namespace :dev do
   desc "Configura o ambiente de desenvolvimento"
   task setup: :environment do
      if Rails.env.development?
         show_spinner("db:drop") do
            %x(rails db:drop)
         end

         show_spinner("db:create") { %x(rails db:create) }
         show_spinner("db:migrate") { %x(rails db:migrate) }
         show_spinner("dp:seed") { %x(rails db:seed) }
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
end
