module AdminSection
  class GroupsController < AdminSectionController
    # load_and_authorize_resource
    before_action :set_group, only: [:show, :edit, :update, :destroy]

    def index
      @groups = Group.all
    end

    def show
    end

    def new
      @group = Group.new
    end

    def edit
    end

    def create
      @group = Group.new(group_params)

      respond_to do |format|
        if @group.save
          format.html { redirect_to admin_section_group_path(@group), notice: 'Group was successfully created.' }
          format.json { render :show, status: :created, location: admin_section_group_path(@group) }
        else
          format.html { render :new }
          format.json { render json: @group.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @group.update(group_params)
          format.html { redirect_to admin_section_group_path(@group), notice: 'Group was successfully updated.' }
          format.json { render :show, status: :ok, location: admin_section_group_path(@group) }
        else
          format.html { render :edit }
          format.json { render json: @group.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @group.destroy
      respond_to do |format|
        format.html { redirect_to admin_section_groups_url, notice: 'Group was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      def set_group
        @group = Group.find(params[:id])
      end

      def group_params
        params.require(:group).permit(:name, :institution_id)
      end
  end
end
