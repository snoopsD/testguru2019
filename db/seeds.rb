# frozen_string_literal: true

categories = Category.create(
  [{ title: 'Ruby' },
   { title: 'HTML' },
   { title: 'Go' }]
)

tests = Test.create(
  [{ title: 'Ruby test for begginer', level: 0, category: categories[0] },
   { title: 'Go test for begginer', level: 1, category: categories[1] },
   { title: 'HTML test for middle', level: 0, category: categories[2] },
   { title: 'Ruby test', level: 0, category: categories[0] }]
)

users = User.create(
  [{ email: 'test1@test.ru', name: 'Dmitry' },
   { email: 'test2@test.ru', name: 'Roman' }]
)

finished_tests = FinishedTest.create(
  [{ user: users[0], test: tests[2] },
   { user: users[1], test: tests[0] }]
)

questions = Question.create(
  [{ body: 'what means ta g p?', test: tests[0] },
   { body: 'what means hash?', test: tests[0] },
   { body: 'how many cycles in go?', test: tests[0] }]
)

answers = Answer.create(
  [{ body: 'this mean a paragraph', correct: true, question: questions[1], author_id: users[0] },
   { body: 'this mean  pair key-value', correct: true, question: questions[0], author_id: users[1] },
   { body: 'one', correct: true, question: questions[2], author_id: users[0] }]
)
