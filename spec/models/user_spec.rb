require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザーのバリデーションチェック' do
    let(:user) {create(:user)}

    context "ユーザー新規登録（サインアップ）"
      it 'ユーザーを問題なく作成できる' do
        expect(user).to be_valid
        expect(user.errors).to be_empty
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

      # it 'パスワードの最小値文字数チェック' do
      #   ps_min_user = build(:user, password: "1", password_confirmation: "1")
      #   expect(ps_min_user.errors[:password]).to include("は6文字以上で入力してください")
      # end

      # it 'パスワードの最大値文字数チェック' do
      #   ps_max_user = build(:user, password: "a" * 21, password_confirmation: "a" * 21)
      #   expect(ps_max_user.errors[:password]).to include("は20文字以内で入力してください")
      # end
  end
end
