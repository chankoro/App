require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
 test "rootページにアクセスできる" do
    visit root_path
    click_on "Sign in"
    assert_text("App")
  end

  test "新規登録というリンクがある" do
    visit root_path
    click_on "Sign in"
    assert_text("新規登録")
  end

  test "新規登録をクリックするとユーザー登録ページにいける" do
    visit root_path
    click_on "新規登録"
    assert_equal(current_path, new_user_path)
  end

  test "新規登録ができる" do
    visit new_user_path
    fill_in("user[family]", with: "テスト")
    fill_in("user[name]", with: "ネーム")
    fill_in("user[email]", with: "example@example.com")
    fill_in("user[password]", with: "PassworD1234")
    fill_in("user[password_confirmation]", with: "PassworD1234")
    page.save_screenshot "tmp/screenshots/#{Time.now.strftime("%Y%m%d%H%M%S%L")}.png"
    click_on "登録"
    page.save_screenshot "tmp/screenshots/#{Time.now.strftime("%Y%m%d%H%M%S%L")}.png"
    assert_text("ユーザー作成に成功しました")
  end

  test "Sign inページにいくとユーザー登録という文字が表示されている" do
    visit root_path
    click_on "Sign in"
    assert_text("ユーザー登録")
  end
end
