require 'sqlite3'
require 'singleton'

require_relative 'questions_likes.rb'
require_relative 'reply.rb'
require_relative 'question_follow'
require_relative 'user'

class QuestionsDatabase < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class Question

    attr_accessor :id, :title, :body, :author_id
    
    def initialize(options)
      @id = options['id']
      @title = options['title']
      @body = options['body']
      @author_id = options['author_id']
    end

    def self.find_by_id(id)
      question = QuestionsDatabase.instance.execute(<<-SQL, id)
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

    def self.find_by_author_id(author_id)
        author = QuestionsDatabase.instance.execute(<<-SQL, author_id)
        SELECT
          *
        FROM
          questions
        WHERE
          questions.author_id = ?
      SQL

        return nil unless author.length > 0
        Question.new(author[0])
    end

    def author
      author = QuestionsDatabase.instance.execute(<<-SQL, self.author_id)
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

    def replies
      replies = QuestionsDatabase.instance.execute(<<-SQL, self.id)
        SELECT
          *
        FROM
          replies
        WHERE
          replies.question_id = ?
      SQL

        return nil unless replies.length > 0
        replies.map { |reply| Reply.new(reply) }
    end

    def followers
      QuestionFollow.followers_for_question_id(self.id)
    end

    def self.most_followed(n)
        QuestionFollow.most_followed_questions(n)
    end

end