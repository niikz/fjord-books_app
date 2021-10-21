# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'creating a Report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: 'テスト初日の日報'
    fill_in '内容', with: 'テストむずかしい……'
    click_on '登録する'
    assert_text '日報が作成されました。'

    assert_text 'テスト初日の日報'
    assert_text 'テストむずかしい……'

    click_on '戻る'
    assert_text 'テスト初日の日報'
  end

  test 'updating a Report' do
    visit reports_url
    click_on '編集'

    fill_in 'タイトル', with: 'テスト2日目の日報'
    fill_in '内容', with: 'テスト楽しい！！！'
    click_on '更新する'
    assert_text '日報が更新されました。'

    assert_text 'テスト2日目の日報'
    assert_text 'テスト楽しい！！！'

    click_on '戻る'
    assert_text 'テスト2日目の日報'
  end

  test 'destroying a Report' do
    visit reports_url
    page.accept_confirm do
      click_on '削除', match: :first
    end
    assert_text '日報が削除されました。'

    assert_no_text 'MyString'
    assert_equal 0, Report.count
  end
end
