require "sqlite3"
require "singleton"

class QuestionsDatabase < SQLite3::Database

include Singleton

def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class User

    attr_accessor :fname, :lname
    attr_reader :id

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM users")
        data.map { |datum| User.new(datum) }
    end

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
            id = ?
        SQL
        return nil unless user.length > 0

        User.new(user.first)
    end

    def self.find_by_name(fname, lname)
        user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
        SELECT
            *
        FROM
            users
        WHERE
            fname = ? 
            AND lname = ?
        SQL
        return nil unless user.length > 0

        User.new(user.first)
    end

    def authored_questions
        Question.find_by_author_id(self.id)
    end

    def authored_replys
        Reply.find_by_user_id(self.id)
    end

    def followed_questions
        QuestionFollow.followed_questions_for_user_id(id)
    end

    def average_karma
        id = self.id
        karma = QuestionsDatabase.instance.execute(<<-SQL, id)
            
        SELECT
            count_likes.author_id, count_of_likes / count_of_posts AS average_karma
        FROM (
            SELECT
                question_id, count_of_likes, author_id
            FROM 
                questions
            JOIN (
                SELECT 
                    question_id, COUNT(*) AS count_of_likes
                FROM 
                    question_likes
                GROUP BY
                    question_id
            ) ON question_id = questions.id
        ) AS count_likes  
        JOIN (
            SELECT
                author_id, COUNT(*) AS count_of_posts
            FROM 
                questions
            GROUP BY
                author_id
        ) AS count_posts ON count_likes.author_id = count_posts.author_id
        WHERE 
            count_likes.author_id = ?
        SQL

        karma.first['average_karma']
    end
end

class Question 
    attr_accessor :title, :body, :author_id
    attr_reader :id

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
        data.map { |datum| Question.new(datum) }
    end

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
            id = ?
        SQL
        return nil unless question.length > 0

        Question.new(question.first)
    end

    def self.find_by_author_id(author_id)
        question = QuestionsDatabase.instance.execute(<<-SQL, author_id)
        SELECT
            *
        FROM
            questions
        WHERE
            author_id = ?
        SQL
        return nil unless question.length > 0

        question.map {|quest| Question.new(quest)}
    end

    def author
        User.find_by_id(self.author_id)
    end

    def replies
        Reply.find_by_question_id(id)
    end

    def followers
        QuestionFollow.followers_for_question_id(id)
    end
    
    def self.most_followed(n)
        QuestionFollow.most_followed_questions(n)
    end
    
end

class QuestionFollow
    attr_accessor :question_id, :user_id
    attr_reader :id

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
        data.map { |datum| QuestionFollow.new(datum) }
    end

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @user_id = options['user_id']
    end

    def self.find_by_id(id)
        question_follows = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT 
            *
        FROM
            question_follows
        WHERE
            id = ?
        SQL
        return nil unless question_follows.length > 0

        QuestionFollow.new(question_follows.first)
    end

    def self.followers_for_question_id(question_id)
        users = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT
            * 
        FROM
            question_follows
        JOIN
            users ON question_follows.user_id = users.id
        WHERE
            question_id = ?
        SQL
        return nil unless users.length > 0

        users.map { |u| User.new(u)}
    end

    def self.followed_questions_for_user_id(user_id)
        questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
        SELECT 
            *
        FROM 
            question_follows
        JOIN
            questions ON question_follows.question_id = questions.id
        WHERE
            question_follows.user_id = ?
        SQL

        return nil unless questions.length > 0
        questions.map {|q| Question.new(q)}
    end

    def self.most_followed_questions(n)
        questions = QuestionsDatabase.instance.execute(<<-SQL, n)
        SELECT 
            *
        FROM 
            question_follows
        JOIN
            questions ON question_follows.question_id = questions.id
        GROUP BY
            question_id
        ORDER BY
            COUNT(user_id) DESC
        LIMIT ?
        SQL

        return nil unless questions.length > 0
        questions.map {|q| Question.new(q)}
    end
end


class QuestionLike
    attr_accessor :question_id, :user_id
    attr_reader :id

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")
        data.map { |datum| QuestionLike.new(datum) }
    end

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @user_id = options['user_id']
    end

    def self.find_by_id(id)
        question_likes = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT 
            *
        FROM
            question_likes
        WHERE
            id = ?
        SQL
        return nil unless question_likes.length > 0

        QuestionLike.new(question_likes.first)
    end
end


class Reply
    attr_accessor :question_id, :body, :user_id, :parent_reply_id
    attr_reader :id

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
        data.map { |datum| Reply.new(datum) }
    end

    def initialize(options)
        @id = options['id']
        @body = options['body']
        @user_id = options['user_id']
        @question_id = options['question_id']
        @parent_reply_id = options['parent_reply_id']
    end

    def self.find_by_id(id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT 
            *
        FROM
            replies
        WHERE
            id = ?
        SQL
        return nil unless reply.length > 0

        Reply.new(reply.first)
    end


    def self.find_by_user_id(id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT 
            *
        FROM
            replies
        WHERE
            user_id = ?
        SQL
        return nil unless reply.length > 0

        reply.map { |rep| Reply.new(rep) }    
    end

    def self.find_by_question_id(id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT 
            *
        FROM
            replies
        WHERE
            question_id = ?
        SQL
        return nil unless reply.length > 0

        reply.map { |rep| Reply.new(rep) }
    end

    def author
        User.find_by_id(self.user_id)
    end

    def question
        Question.find_by_id(self.question_id)
    end

    def parent_reply
        Reply.find_by_id(self.parent_reply_id)
    end
    
    def child_replies
        our_id = id
        reply = QuestionsDatabase.instance.execute(<<-SQL, our_id)
        SELECT 
            *
        FROM
            replies
        WHERE
            parent_reply_id = ?
        SQL
        return nil unless reply.length > 0

        reply.map { |rep| Reply.new(rep) }
    end
end