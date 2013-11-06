class <%=resource_name_camelize.singularize.pluralize%>Controller < ApplicationController

  def index
    @<%=resource_name_underscore.pluralize%> = <%=resource_name_camelize.singularize%>.all
  end

  def new
    @<%=resource_name_underscore%> = <%=resource_name_camelize.singularize%>.new
  end

  def create
    @<%=resource_name_underscore%> = <%=resource_name_camelize.singularize%>.create(<%=resource_name_underscore%>_params)
    if @<%=resource_name_underscore%>.save
      name = @<%=resource_name_underscore%>.name
      redirect_to <%=resource_name_underscore.pluralize%>_path
      flash[:notice] = "#{name} created"
    else
      render 'new'
      flash[:error] = "Unable to create <%=resource_name_underscore%>. Please try again"
    end
  end

  def destroy
    @<%=resource_name_underscore%> = <%= resource_name_camelize.singularize%>.find(params[:id])
    @<%=resource_name_underscore%>.destroy
    redirect_to <%=resource_name_underscore.pluralize%>_path
  end

  def edit
    @<%=resource_name_underscore%> = <%=resource_name_camelize.singularize%>.find(params[:id])
  end

  def update
    @<%=resource_name_underscore%> = <%=resource_name_camelize.singularize%>.find(params[:id])
    @<%=resource_name_underscore%>.update <%=resource_name_underscore%>_params
    if @<%=resource_name_underscore%>.save
      flash[:notice] = "Your <%=resource_name_underscore.gsub(/(_)/, ' ')%> was updated succesfully"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

    def <%=resource_name_underscore%>_params
      params.require(:<%=resource_name_underscore%>).permit(:name, :delete)
    end

end
