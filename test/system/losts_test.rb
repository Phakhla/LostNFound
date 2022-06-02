# frozen_string_literal: true

require 'application_system_test_case'

class LostsTest < ApplicationSystemTestCase
  setup do
    @lost = losts(:one)
  end

  test 'visiting the index' do
    visit losts_url
    assert_selector 'h1', text: 'Losts'
  end

  test 'should create lost' do
    visit losts_url
    click_on 'New lost'

    fill_in 'Date', with: @lost.date
    fill_in 'Detail', with: @lost.detail
    fill_in 'Location', with: @lost.location
    fill_in 'Name', with: @lost.name
    fill_in 'Reward', with: @lost.reward
    fill_in 'Time', with: @lost.time
    fill_in 'Types', with: @lost.types
    click_on 'Create Lost'

    assert_text 'Lost was successfully created'
    click_on 'Back'
  end

  test 'should update Lost' do
    visit lost_url(@lost)
    click_on 'Edit this lost', match: :first

    fill_in 'Date', with: @lost.date
    fill_in 'Detail', with: @lost.detail
    fill_in 'Location', with: @lost.location
    fill_in 'Name', with: @lost.name
    fill_in 'Reward', with: @lost.reward
    fill_in 'Time', with: @lost.time
    fill_in 'Types', with: @lost.types
    click_on 'Update Lost'

    assert_text 'Lost was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Lost' do
    visit lost_url(@lost)
    click_on 'Destroy this lost', match: :first

    assert_text 'Lost was successfully destroyed'
  end
end
