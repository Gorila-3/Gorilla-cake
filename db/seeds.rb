# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# カテゴリー追加
#Category.create(name: "ケーキ")
#Category.create(name: "クッキー")

# 商品追加
#Item.create(category_id: 1, name: "いちごケーキ", introduction: "いちごが乗ったケーキです", price: 600, is_active: true)
#Item.create(category_id: 1, name: "チョコケーキ", introduction: "チョコまみれのケーキです", price: 700, is_active: true)
#Item.create(category_id: 2, name: "チョコクッキー", introduction: "チョコで埋め尽くされたクッキーです", price: 200, is_active: true)

#管理者側追加
Admin.create(email: "admin@mail", password: "admin123")


# 顧客側追加
Customer.create(last_name: "山田", first_name: "一郎", last_name_kana: "ヤマダ", first_name_kana: "イチロウ", postal_code: "1111111", address: "愛知県", telephone_number: "11122223333", email: "itirou@email", password: "12345678", is_deleted: false)
Customer.create(last_name: "田中", first_name: "二郎", last_name_kana: "タナカ", first_name_kana: "ジロウ", postal_code: "2222222", address: "東京都", telephone_number: "44455556666", email: "zirou@email", password: "12345678", is_deleted: false)
Customer.create(last_name: "佐藤", first_name: "三郎", last_name_kana: "サトウ", first_name_kana: "サブロウ", postal_code: "3333333", address: "大阪府", telephone_number: "77788889999", email: "saburou@email", password: "12345678", is_deleted: false)


# customer1 = Customer.create(last_name: "山田", first_name: "一郎", last_name_kana: "ヤマダ", first_name_kana: "イチロウ", postal_code: "1111111", address: "愛知県", telephone_number: "11122223333", email: "itirou@email", password: "12345678", is_deleted: false)
# customer1.save!
# customer2 = Customer.create(last_name: "田中", first_name: "二郎", last_name_kana: "タナカ", first_name_kana: "ジロウ", postal_code: "2222222", address: "東京都", telephone_number: "44455556666", email: "zirou@email", password: "12345678", is_deleted: false)
# customer2.save!
# customer3 = Customer.create(last_name: "佐藤", first_name: "三郎", last_name_kana: "サトウ", first_name_kana: "サブロウ", postal_code: "3333333", address: "大阪府", telephone_number: "77788889999", email: "saburou@email", password: "12345678", is_deleted: false)
# customer3.save!