require 'rails_helper'
require 'spec_helper'

RSpec.describe Trip, type: :model do
    let(:user) {create(:user)}
    let(:trip) {create(:trip)}

    before do
        visit new_user_session_path
        login(user)
    end

    describe '旅程新規作成' do
        context "新規作成の時に"
            it '旅程をエラーなく作成できること' do
                expect(trip).to be_valid
                expect(trip.errors).to be_empty
            end

            it 'タイトルの最大値文字数チェック(25字以内)' do
                trip = build( :trip, title: "a" * 26 )
                expect(trip).to be_invalid
                expect(trip.errors[:title]).to include("は25文字以内で入力してください")
            end

            it '全ての入力欄が空白の場合、エラー分を出すこと' do
                trip = build(:trip, title: "", destination: "", start_at: "")
                expect(trip).to be_invalid
                expect(trip.errors[:title]).to include("を入力してください")
                expect(trip.errors[:destination]).to include("を入力してください")
                expect(trip.errors[:start_at]).to include("を入力してください")
            end
    end

    # describe '旅程を編集' do
    #     context "旅程の一覧画面にて"
    #     let!(:user) {create(:user)}
    #     let!(:trip) {create(:trip)}

    #     before do
    #         visit trips_path
    #     end

    #     it '詳細画面に遷移出来ること' do
    #         click_link "詳細"
    #     end

    #     it '旅程を削除出来ること' do
    #         click_on "削除"
    #         expect(page).to have_content "旅程を削除しました"
    #         expect(trip).to be_invalid
    #     end
    # end
end
