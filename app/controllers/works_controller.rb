class WorksController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:index, :show]
    def index
        if user_signed_in?
        @works = Work.where(user_id: current_user.id)
        else
        @works = Work.all
        end
        render :index
    end

    def show
        @work = Work.find(params[:id])
        render :show
    end

    def new
        @work = Work.new
    end

    def create
        @work = Work.new(work_params.merge(user_id: current_user.id))

        if @work.save
            flash[:notice] = "Successfully created work."
            redirect_to index_url
        else
            flash[:error] = "Couldn't create work"
        end
    end
    def edit
        @work = Work.find(params[:id])
    end
    def update
        @work = Work.find(params[:id])
        if @work.update(work_params)
            redirect_to @work
          else
            render :edit, status: :unprocessable_entity
          end
    end
    def destroy
        @work = Work.find(params[:id])
        @work.destroy
        
        redirect_to root_path, status: :see_other
      end
    private
    def work_params
        params.require(:work).permit(:title, :description,:duration)
    end
   
    
    private
    def require_login
      unless user_signed_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to index_path # halts request cycle
      end
    end
end
