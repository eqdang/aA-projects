require_relative 'questions_db.rb'

class QuestionFollow

    attr_accessor :id, :questions_id, :user_id

    def initialize(options)
      @id = options['id']
      @questions_id = options['questions_id']
      @user_id = options['user_id']
    end
     
    def self.find_by_id(id)
      question_follow = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
          *
        FROM
          question_follows
        WHERE
          question_follows.id = ?
      SQL
    
      return nil unless question_follow.length > 0
      QuestionFollow.new(question_follow[0])
     end 

     def self.followers_for_question_id(question_id)
      follower = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT
          *
        FROM
          users
        JOIN
          question_follows ON question_follows.user_id = users.id
        JOIN
          questions ON questions.id = question_follows.questions_id
        WHERE
          questions.id = ?
      SQL

        return nil unless follower.length > 0
        follower.map { |follow| User.new(follow) }
     end

     def self.followed_questions_for_user_id(user_id)
      question = QuestionsDatabase.instance.execute(<<-SQL, user_id)
        SELECT
          *
        FROM
          questions
        JOIN
          question_follows ON question_follows.questions_id = questions.id
        JOIN
          users ON question_follows.user_id = users.id
        WHERE
          questions.author_id = ?
      SQL

        return nil unless question.length > 0
        question.map { |quest| Question.new(quest) }
     end

     def self.most_followed_questions(n)
      question = QuestionsDatabase.instance.execute(<<-SQL, n)
        SELECT
          *, COUNT(users.id) AS COUNT
        FROM
          questions
        JOIN
          question_follows ON question_follows.questions_id = questions.id
        JOIN
          users ON question_follows.user_id = users.id
        GROUP BY
          questions.id
        ORDER BY
          COUNT Desc
        LIMIT
          ?
      SQL

        return nil unless question.length > 0
        question.map { |quest| Question.new(quest) }
     end

end
