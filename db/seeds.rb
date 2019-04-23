# frozen_string_literal: true
categories = Category.create(
  [{ title: 'Ruby' },
   { title: 'HTML' },
   { title: 'Go' }]
)

tests = Test.create(
  [{ title: 'Ruby test for begginer', level: 0, category_id: categories[0].id },
   { title: 'Go test for begginer', level: 1, category_id: categories[1].id },
   { title: 'HTML test for middle', level: 0, category_id: categories[2].id },
   { title: 'Ruby test', level: 0, category_id: categories[0].id }]
)

users = User.create(
  [{ email: 'test1@test.ru', name: 'Dmitry', current_test: tests[0].id, },
   { email: 'test2@test.ru', name: 'Roman', current_test: tests[2].id }]
)

finished_tests = FinishedTest.create(
  [{ user_id: users[0].id, test_id: tests[2].id },
   { user_id: users[1].id, test_id: tests[0].id }
  ]
)

questions = Question.create(
  [{ body: 'what means ta g p?', test_id: tests[0].id, user_id: users[0].id },
   { body: 'what means hash?',  test_id: tests[0].id, user_id: users[1].id },
   { body: 'how many cycles in go?', test_id: tests[0].id, user_id: users[0].id }]
)

answers = Answer.create(
  [{ body: 'this mean a paragraph', correct: true, question_id: questions[1].id, author_id: users[0].id },
   { body: 'this mean  pair key-value', correct: true, question_id: questions[0].id, author_id: users[1].id },
   { body: 'one', correct: true, question_id: questions[2].id, author_id: users[0].id }]
)

