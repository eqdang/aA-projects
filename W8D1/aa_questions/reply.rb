require_relative 'questions_db.rb'

class Reply

    attr_accessor :id, :question_id, :body, :parent_reply, :reply_user_id

    def initialize(options)
      @id = options['id']
      @question_id = options['question_id']
      @body = options['body']
      @parent_reply = options['parent_reply']
      @reply_user_id = options['reply_user_id']
    end
    
    def self.find_by_id(id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
          *
        FROM
          replies
        WHERE
          replies.id = ?
      SQL

      return nil unless reply.length > 0
      Reply.new(reply[0])
    end 

    def self.find_by_question_id(question_id)
      question_id = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT
          *
        FROM
          replies
        WHERE
          replies.question_id = ?
      SQL

        return nil unless question_id.length > 0
        question_id.map { |question| Reply.new(question) }
    end

    def authored_replies
      replies = QuestionsDatabase.instance.execute(<<-SQL, self.id)
        SELECT
          *
        FROM
          replies
        WHERE
          replies.reply_user_id = ?
      SQL

        return nil unless replies.length > 0
        replies.map { |reply| Reply.new(reply) }
    end

    def author
    author = QuestionsDatabase.instance.execute(<<-SQL, self.reply_user_id)
        SELECT
          *
        FROM
          users
        WHERE
          users.id = ?
      SQL

        return nil unless author.length > 0
        User.new(author[0])
    end

    def question
      question = QuestionsDatabase.instance.execute(<<-SQL, self.question_id)
        SELECT
          *
        FROM
          questions
        WHERE
          questions.id = ?
      SQL

        return nil unless question.length > 0
        Question.new(question[0])
    end

    def parent_reply_
      reply = QuestionsDatabase.instance.execute(<<-SQL, self.parent_reply)
        SELECT
          *
        FROM
          replies
        WHERE
          replies.id = ?
      SQL

        return nil unless reply.length > 0
        Reply.new(reply[0])
    end

    def children_replies
      children = QuestionsDatabase.instance.execute(<<-SQL, self.id)
        SELECT
          *
        FROM
          replies
        WHERE
          replies.parent_reply = ?
      SQL

        return nil unless children.length > 0
        Reply.new(children[0])
    end

  end