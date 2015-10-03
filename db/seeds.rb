# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
p "-- create admin"
Admin.create(
  email: "admin@idobata.poli",
  password: "password"
)
p "done"


p "-- create a question "
Question.create(
  content: "内容",
  note: "テスト"
)
p "done"

p "-- create a category"
Category.create(
  name: "categoryテスト",
  content: "なんの"
)
p "done"

p "-- create a public_manifest"
PublicManifest.create(
  title: "タイトル",
  content: "コンテンツ",
  category_id: 2 
)
p "done"

# p "-- create a question_set"
# QuestionSet.create(
# 	title: "質問セット1",
# 	q1_id: 1,
# 	q2_id: 1,
# 	q3_id: 1,
# 	q4_id: 1,
# 	q5_id: 1,
# 	q6_id: 1,
# 	q7_id: 1,
# 	q8_id: 1,
# 	q9_id: 1,
# 	q10_id: 1,
# 	status: 1
# )
# p "done"

p "--create a Political Party"
PoliticalParty.create(
  name: "新党がんばり党",
  detail: "テスト用の党"
)
p "done"
