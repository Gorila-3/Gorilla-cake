# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# カテゴリー追加


#管理者側追加
Admin.create(email: "admin@mail", password: "admin123")

# 注文履歴作成用データ



#Item.create(category_id: 1, name: "サンプル１", introduction: "説明１", price: 600)
#Item.create(category_id: 2, name: "サンプル2", introduction: "説明2", price: 1200)

#Order.create(customer_id: 7, payment_method: 0, name: "青山凱", address: "愛知県名古屋市", postal_code: 1231234, shipping_cost: 800, total_payment: 12000, status: 0)
#Order.create(customer_id: 7, payment_method: 0, name: "青山凱", address: "愛知県名古屋市", postal_code: 1231234, shipping_cost: 800, total_payment: 24000, status: 0)

#OrderDetail.create(order_id: 1, item_id: 20, amount: 10, price: 6000, making_status: 0)
#OrderDetail.create(order_id: 1, item_id: 21, amount: 5, price: 6000, making_status: 0)

#OrderDetail.create(order_id: 2, item_id: 20, amount: 20, price: 12000, making_status: 0)
#OrderDetail.create(order_id: 2, item_id: 21, amount: 10, price: 12000, making_status: 0)



