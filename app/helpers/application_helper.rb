module ApplicationHelper
  def locale
    I18n.locale == :en ? "Inglês Americano" : "Português do Brasil"
  end

  def data_br(data_us)
    data_us.strftime('%d/%m/%Y')
  end

  def nome_aplicacao
    'CRYPTO WALLET APP'
  end
end 
