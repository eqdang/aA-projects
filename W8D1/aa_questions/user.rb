require_relative 'questions_db.rb'

class User

    attr_accessor :fname, :lname, :id

    def initialize(options)
      @id = options['id']
      @fname = options['fname']
      @lname = options['lname']
    end

    def self.find_by_id(id)
      user = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
          *
        FROM
          users
        WHERE
          users.id = ?
      SQL

      User.new(user[0])
    end

    def self.find_by_name(fname, lname)
        user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
            SELECT *
            FROM users
            WHERE fname = ? AND lname = ?
        SQL
        
        return nil unless user.length > 0
        User.new(user[0])
    end 

    def authored_questions
      questions = QuestionsDatabase.instance.execute(<<-SQL, self.id)
        SELECT
          *
        FROM
          questions
        WHERE
          questions.id = ?
      SQL

        return nil unless questions.length > 0
        questions.map { |question| Question.new(question) }
    end

    def followed_questions
      QuestionFollow.followed_questions_for_user_id(self.id)
    end

end