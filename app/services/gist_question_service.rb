class GistQuestionService
  attr_reader :response

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
  end

  def call
    @response = @client.create_gist(gist_params)
  end

  def success?
    @client.last_response.status == 201 if @client.last_response
  end

  private

  def gist_params
    {
      "description": " #{I18n.t('gist_description')} #{@test.title} ",
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      },
      public: true
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

end
