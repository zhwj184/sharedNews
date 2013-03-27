class WelcomeController < ApplicationController
  
  # GET /
  # GET /welcome/1
  # GET /welcome/1.json
  def index
    
    @catid = params[:catid]
    @pageindex = params[:pageindex].to_i
    if !@pageindex
      @pageindex = 1.to_i
    end
    if @catid
      @links = Link.where("catid =?", params[:catid]).order("gmt_modified DESC, id desc").limit(2).offset((@pageindex-1)*2)
      @count = Link.where("catid =?", params[:catid]).count
    else
      @links = Link.all
      @count = Link.count
    end

    if @count % 2
      @totalpage = @count / 2 + 1
    else
      @totalpage = @count / 2 
    end

    @categories = Category.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories}
      format.json { render json: @links}
      format.json { render json: @count}
      format.json { render json: @totalpage}
      format.json { render json: @pageindex}
    end
  end

end
