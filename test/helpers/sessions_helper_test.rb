require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

  def setup
    # ユーザーを作成してcookieへ保存
    @user = users(:michael)
    remember(@user)
  end

  # テストユーザーがログインしていることを確認
  test "current_user returns right user when session is nil" do
    assert_equal @user, current_user
    assert is_logged_in?
  end

  # ユーザーの記憶ダイジェストが記憶トークンと正しく対応していない場合に現在のユーザーがnilになるかどうかをチェック
  # 2.カレントユーザーがnilであること
  test "current_user returns nil when remember digest is wrong" do
    @user.update_attribute(:remember_digest, User.digest(User.new_token))
    assert_nil current_user
  end
end