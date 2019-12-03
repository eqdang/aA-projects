require_relative 'questions_db.rb'

class QuestionsLike
    
    attr_accessor :id, :like_user_id, :liked_question_id
    
    def initialize(options)
      @id = options['id']
      @like_user_id = options['like_user_id']
      @liked_question_id = options['liked_question_id']
    end
    
    def self.find_by_id(id)
      question_like = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
          *
        FROM
          questions_likes
        WHERE
          questions_likes.id = ?
      SQL

      return nil unless question_like.length > 0
      QuestionsLike.new(question_like[0])
     end 

    def self.likers_for_question_id(question_id)
      liker = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT
          *
        FROM
          users
        JOIN
          questions_likes ON questions_likes.like_user_id = users.id
        JOIN
          questions ON questions.id = questions_likes.liked_question_id
        WHERE
          questions.id = ?
      SQL

        return nil unless liker.length > 0
        liker.map { |like| User.new(like) }
     end   

     def self.num_likes_for_question_id(question_id)
      liker = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT
          COUNT(*)
        FROM
          users
        JOIN
          questions_likes ON questions_likes.like_user_id = users.id
        JOIN
          questions ON questions.id = questions_likes.liked_question_id
        WHERE
          questions.id = ?
      SQL
     end 

     def self.liked_questions_for_user_id(user_id)
      questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
        SELECT
          *
        FROM
          questions
        JOIN
          questions_likes ON questions_likes.liked_question_id = questions.id
        JOIN
          users ON users.id = questions_likes.like_user_id
        WHERE
          users.id = ?
      SQL

        return nil unless questions.length > 0
        questions.map { |question| Question.new(question) }
     end   
end