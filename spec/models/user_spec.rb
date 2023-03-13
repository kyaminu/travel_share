require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  let(:user) {create(:user)}
  
  describe 'サインアップのバリデーションチェック' do
    context "ユーザー新規登録（サインアップ）"
      it 'ユーザーを問題なく作成できる' do
        expect(user).to be_valid
        expect(user.errors).to be_empty
      end

      it 'ユーザーを作成した際に、デフォルトのプロフ画像が充てられている' do
        expect(user.image).to be_valid
        expect(user.image) == "app/images/default_image.png"
      end

      it 'アドレスとパスワードが空欄の場合、エラー分を出す' do
        user = build(:user, email: "", password: "")
        expect(user).to be_invalid
        expect(user.errors[:email]).to include("を入力してください")
        expect(user.errors[:password]).to include("を入力してください")
      end

      it '確認用パスワードが空欄の場合、エラー分を出す' do
        user = build(:user, password_confirmation: "")
        expect(user).to be_invalid
        expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end

      it '既に使われているアドレスは無効になる' do
        user_2 = build(:user, email: user.email, password: "password", password_confirmation: "password")
        expect(user).to be_valid
        expect(user_2).to be_invalid
        expect(user_2.errors[:email]).to include("はすでに存在します")
      end

      it 'パスワードの最小値文字数をチェック(6字以上)' do
        ps_min_user = build(:user, password: "1", password_confirmation: "1")
        expect(ps_min_user).to be_invalid
        expect(ps_min_user.errors[:password]).to include("は6文字以上で入力してください")
      end

      it 'パスワードの最大値文字数チェック(128字以内)' do
        ps_max_user = build(:user, password: "a" * 129, password_confirmation: "a" * 129)
        expect(ps_max_user).to be_invalid
        expect(ps_max_user.errors[:password]).to include("は128文字以内で入力してください")
      end
  end

  describe '新規登録後' do
    context "ユーザー編集機能"
    it 'プロフィール画像の変更' do
      visit new_user_session_path
      login(user)
      click_on 'Profile'
      attach_file 'user_image', "app/assets/images/home-image.png"
      click_on '更新'
      expect(page).to have_selector("img[src$='home-image.png']")
    end
  end
end