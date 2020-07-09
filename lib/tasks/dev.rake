namespace :dev do
 
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
     
      show_spinner("Apagando o Banco de Dados...") { %x(rails db:drop) }
              
      show_spinner("Criando Banco de Dados...") {%x(rails db:create)}
     
      show_spinner("Realizando Migrações...") {%x(rails db:migrate)}
      
      %x(rails dev:add_mining_types)
      %x(rails dev:add_coins)
     

    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end

  #TASK add_coins
  desc "Cadastra as Moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando moedas...") do
      coins = [
        {
          description: 'Bitcoin',
          acronym: 'BTC',
          url_image:'https://toppng.com/uploads/preview/bitcoin-png-bitcoin-logo-transparent-background-11562933997uxok6gcqjp.png',
          mining_type: MiningType.find_by(acronym: 'PoW')
        },

        {
          description: 'Ethereum',
          acronym: 'ETH',
          url_image:'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png/600px-ETHEREUM-YOUTUBE-PROFILE-PIC.png',
          mining_type: MiningType.all.sample
        },

        {
          description: 'Dash',
          acronym: 'DASH',
          url_image:'https://www.zenithincome.com/uploads/currencies/icon/156518530383Dash-D-white_on_blue_circle.png',
          mining_type: MiningType.all.sample
        },
       
        {
          description: 'Iota',
          acronym: 'IOT',
          url_image:'https://faviconer.net/preloaders/871/Iota%20logo%20spinning.jpg',
          mining_type: MiningType.all.sample
        },
        
        {
          description: 'ZCash',
          acronym: 'ZEC',
          url_image:'https://z.cash/wp-content/uploads/2020/03/zcash-icon-fullcolor.png',
          mining_type: MiningType.all.sample
        }
      ]

      coins.each do|coin|
        sleep(0.5)
        Coin.find_or_create_by!(coin)
      end
    end
  end

  #TASK Mining_Type
  desc "Cadastra Tipos de Mineração"
  task add_mining_types: :environment do
    show_spinner("Cadastrando Tipos de Mineração...") do
      mining_types = [
        {description: "Proof of Stake", acronym: "PoS"},
        {description: "Proof of Capacity", acronym: "PoC"},
        {description: "Proof of Work", acronym: "PoW"}
      ]
      mining_types.each do|mining_type|
        sleep(0.3)
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end

  #Metodos Privados
  private
  def show_spinner(msg_start, msg_end = "Concluído com sucesso!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end

end
