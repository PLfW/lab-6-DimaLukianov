module AdminSection
  class LessonsController < AdminSectionController
    before_action :set_lesson, only: [:show, :edit, :update, :destroy]

    def index
      @lessons = Lesson.all
    end

    def show
    end

    def new
      @lesson = Lesson.new
    end

    def edit
    end

    def create
      @lesson = Lesson.new(lesson_params)

      respond_to do |format|
        if @lesson.save
          format.html { redirect_to admin_section_lesson_path(@lesson), notice: 'Lesson was successfully created.' }
          format.json { render :show, status: :created, location: admin_section_lesson_path(@lesson) }
        else
          format.html { render :new }
          format.json { render json: @lesson.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @lesson.update(lesson_params)
          format.html { redirect_to admin_section_lesson_path(@lesson), notice: 'Lesson was successfully updated.' }
          format.json { render :show, status: :ok, location: admin_section_lesson_path(@lesson) }
        else
          format.html { render :edit }
          format.json { render json: @lesson.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @lesson.destroy
      respond_to do |format|
        format.html { redirect_to admin_section_lessons_url, notice: 'Lesson was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_lesson
        @lesson = Lesson.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def lesson_params
        params.require(:lesson).permit(:day, :lesson_number, :odd_week,
          :subgroup, :lesson_type, :classroom, :user_id, :subject_id, :group_id)
      end
  end
end
