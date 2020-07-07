require 'application_system_test_case'

class CoinsTest < ApplicationSystemTestCase
  setup { @coin = coins(:one) }

  test 'visiting the index' do
    visit coins_url
    assert_selector 'h1', text: 'Coins'
  end

  test 'creating a Coin' do
    visit coins_url
    click_on 'New Coin'

    fill_in 'Acronym', with: @coin.acronym
    fill_in 'Description', with: @coin.description
    fill_in 'Url imagem', with: @coin.url_imagem
    click_on 'Create Coin'

    assert_text 'Coin was successfully created'
    click_on 'Back'
  end

  test 'updating a Coin' do
    visit coins_url
    click_on 'Edit', match: :first

    fill_in 'Acronym', with: @coin.acronym
    fill_in 'Description', with: @coin.description
    fill_in 'Url imagem', with: @coin.url_imagem
    click_on 'Update Coin'

    assert_text 'Coin was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Coin' do
    visit coins_url
    page.accept_confirm { click_on 'Destroy', match: :first }

    assert_text 'Coin was successfully destroyed'
  end
end
