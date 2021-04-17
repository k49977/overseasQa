class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]

  # GET /questions or /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1 or /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions or /questions.json
  def create
    @question = Question.new(question_params)
    
    save_image_local

    if @question.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/")
    else
      render("questions/new")
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    @question = Question.find_by(id: params[:id])

    save_image_local
    
    if @question.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/questions/#{@question.id}")
    else
      render("questions/edit")
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: "Question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:content,:user_id,:image_name)
    end

    def save_image_local
      if params[:image_name]
        time = Time.now
        @question.image_name=time.strftime('%Y%m%d%H%M%S') + '.jpg'
        image=params[:image_name]
        File.binwrite("public/#{@question.image_name}",image.read)
      end
    end
end
