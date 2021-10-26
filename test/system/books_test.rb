# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'creating a Book' do
    visit books_url
    click_on '新規作成'

    fill_in 'タイトル', with: 'プロを目指す人のためのRuby入門'
    fill_in 'メモ', with: '名著です！！'
    click_on '登録する'
    assert_text '本が作成されました。'

    assert_text 'プロを目指す人のためのRuby入門'
    assert_text '名著です！！'

    click_on '戻る'
  end

  test 'updating a Book' do
    visit books_url
    click_on '編集'

    fill_in 'タイトル', with: 'オブジェクト指向でなぜつくるのか'
    fill_in 'メモ', with: '分かりやすくておすすめです！'
    click_on '更新する'
    assert_text '本が更新されました。'

    assert_text 'オブジェクト指向でなぜつくるのか'
    assert_text '分かりやすくておすすめです！'

    click_on '戻る'
  end

  test 'destroying a Book' do
    visit books_url
    page.accept_confirm do
      click_on '削除', match: :first
    end
    assert_text '本が削除されました。'

    assert_no_text 'Ruby超入門'
    assert_equal 0, Book.count
  end
end
