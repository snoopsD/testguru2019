users = User.create(
  [{ email: 'test1@test.ru', name: 'Dmitry' },
   { email: 'test2@test.ru', name: 'Roman' }]
)

categories = Category.create(
  [{ title: 'Backend' },
   { title: 'Frontend' }]
)

tests = Test.create(
  [{ title: 'Ruby test for begginer', level: 1, category: categories[0], creator: users[0] },
   { title: 'HTML test for middle', level: 1, category: categories[1], creator: users[0] },
   { title: 'JS test for middle', level: 3, category: categories[1], creator: users[0] }]
)

questions = Question.create(
  [{ body: 'What means tag p?', test: tests[1] },
   { body: 'What means sybmol?', test: tests[0] },
   { body: 'What means hash?', test: tests[0] },
   { body: 'What means array?', test: tests[0] },
   { body: 'What are tags?', test: tests[1] },
   { body: 'How do you insert a comment in HTML', test: tests[1] },
   { body: 'How show log in console?', test: tests[2] },
   { body: 'What would be the result of 2+5+”3″?', test: tests[2] },
   { body: 'What is NaN in JavaScript?', test: tests[2] }]
)

answers = Answer.create(
  [{ body: 'this mean a paragraph', correct: true, question: questions[0], author_id: users[0] },
   { body: 'this mean an break', correct: false, question: questions[0], author_id: users[0] },
   { body: 'variable name prefixed with a colon', correct: true, question: questions[1], author_id: users[0] },
   { body: 'variable name like a string', correct: false, question: questions[1], author_id: users[0] },
   { body: 'dictionary-like collection of unique keys and their values', correct: true, question: questions[2], author_id: users[0] },
   { body: 'ordered, integer-indexed collections of any object', correct: false, question: questions[2], author_id: users[0] },
   { body: 'ordered, integer-indexed collections of any object', correct: true, question: questions[3], author_id: users[0] },
   { body: 'not ordered, integer-indexed collections of any object', correct: false, question: questions[3], author_id: users[0] },
   { body: 'tags provide the directions or recipes for the visual content', correct: true, question: questions[4], author_id: users[0] },
   { body: 'tags its strings for HTML document', correct: false, question: questions[4], author_id: users[0] },
   { body: '<!-- -->', correct: true, question: questions[5], author_id: users[0] },
   { body: '//', correct: false, question: questions[5], author_id: users[0] },
   { body: 'console.log', correct: true, question: questions[6], author_id: users[0] },
   { body: 'log.console', correct: false, question: questions[6], author_id: users[0] },
   { body: '73', correct: true, question: questions[7], author_id: users[0] },
   { body: '10', correct: false, question: questions[7], author_id: users[0] },
   { body: 'Null a Number', correct: false, question: questions[8], author_id: users[0] },
   { body: 'Not a Number', correct: true, question: questions[8], author_id: users[0] }]
)

badges = Badge.create([
  { title: 'Complete successfully frontend test', img_url: "https://img.icons8.com/dusk/64/000000/prize.png", rule: 'category_complete', value: 'Frontend' },
  { title: 'Complete for the first try', img_url: "https://img.icons8.com/bubbles/64/000000/prize.png", rule: 'first_try_complete', value: '' },
  { title: 'Complete the 1-st level test', img_url: "https://img.icons8.com/color/64/000000/prize.png", rule: 'level_complete', value: '1' }
])
