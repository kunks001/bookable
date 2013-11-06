class <%= file_name.capitalize %>sController < ApplicationController

  def index
    @<%= file_name %>s = <%= file_name.capitalize %>.all
  end

  def new
    @<%= file_name %> = <%= file_name.capitalize %>.new
  end

  def create
    @<%= file_name %> = <%= file_name.capitalize %>.create(<%= file_name %>_params)
    if @<%= file_name %>.save
      name = @<%= file_name %>.name
      redirect_to <%= file_name %>s_path
      flash[:notice] = "#{name} created"
    else
      render 'new'
      flash[:error] = "Unable to create <%= file_name %>. Please try again"
    end
  end

  def destroy
    @<%= file_name %> = <%= file_name.capitalize %>.find(params[:id])
    @<%= file_name %>.destroy
    redirect_to <%= file_name %>s_path
  end

  def edit
    @<%= file_name %> = <%= file_name.capitalize %>.find(params[:id])
  end

  def update
    @<%= file_name %> = <%= file_name.capitalize %>.find(params[:id])
    @<%= file_name %>.update <%= file_name %>_params
    if @<%= file_name %>.save
      flash[:notice] = 'Your <%= file_name %> was updated succesfully'
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

    def <%= file_name %>_params
      params.require(:<%= file_name %>).permit(:name, :delete)
    end

end
