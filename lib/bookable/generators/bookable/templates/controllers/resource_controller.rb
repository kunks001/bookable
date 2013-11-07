class <%=resource_name_camelize.singularize.pluralize%>Controller < ApplicationController

  def index
    @<%=resource_name_underscore.pluralize%> = <%=resource_name_camelize.singularize%>.all
  end

  def new
    @<%=resource_name_underscore.singularize%> = <%=resource_name_camelize.singularize%>.new
  end

  def create
    @<%=resource_name_underscore.singularize%> = <%=resource_name_camelize.singularize%>.create(<%=resource_name_underscore.singularize%>_params)
    if @<%=resource_name_underscore.singularize%>.save
      name = @<%=resource_name_underscore.singularize%>.name
      redirect_to <%=resource_name_underscore.pluralize%>_path
      flash[:notice] = "#{name} created"
    else
      render 'new'
      flash[:error] = "Unable to create <%=resource_name_underscore.singularize.gsub(/(_)/, ' ')%>. Please try again"
    end
  end

  def destroy
    @<%=resource_name_underscore.singularize%> = <%= resource_name_camelize.singularize%>.find(params[:id])
    @<%=resource_name_underscore.singularize%>.destroy
    redirect_to <%=resource_name_underscore.pluralize%>_path
  end

  def edit
    @<%=resource_name_underscore.singularize%> = <%=resource_name_camelize.singularize%>.find(params[:id])
  end

  def update
    @<%=resource_name_underscore.singularize%> = <%=resource_name_camelize.singularize%>.find(params[:id])
    @<%=resource_name_underscore.singularize%>.update <%=resource_name_underscore.singularize%>_params
    if @<%=resource_name_underscore.singularize%>.save
      flash[:notice] = "Your <%=resource_name_underscore.singularize.gsub(/(_)/, ' ')%> was updated succesfully"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

    def <%=resource_name_underscore.singularize%>_params
      params.require(:<%=resource_name_underscore.singularize%>).permit(:name, :delete)
    end

end
