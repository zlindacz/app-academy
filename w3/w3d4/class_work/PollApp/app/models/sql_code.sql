SELECT
  answer_choices.*, COUNT(responses.*) AS count
FROM
  questions
JOIN answer_choices
  ON questions.id = answer_choices.question_id
LEFT OUTER JOIN responses
  ON answer_choices.id = responses.answer_choice_id
GROUP BY
  answer_choices.id;




# count questions per poll
SELECT
  polls.title, COUNT(questions.*) AS questions_count,
    COUNT(user_responses.*) AS user_responses_count
FROM
  questions
JOIN
  polls
  ON polls.id = questions.poll_id
JOIN
  answer_choices
  ON questions.id = answer_choices.question_id
LEFT OUTER JOIN (
  SELECT
    responses.*
  FROM
    responses
  WHERE
    respondent_id = 1) AS user_responses
  ON user_responses.answer_choice_id = answer_choices.id
GROUP BY
  polls.id
HAVING
  questions_count = user_responses_count;
