class WelcomeController < ApplicationController
  
  # GET /
  # GET /welcome/1
  # GET /welcome/1.json
  def index
    
    @catid = params[:catid]
    if @catid==nil
      @catid = 0.to_i
    else
      @catid = @catid.to_i
    end
    
    
    @pageindex = params[:pageindex].to_i
    if @pageindex==nil || @pageindex <= 1
      @pageindex = 1.to_i
    end
    if @catid > 0
      @links = Link.where("catid =?", params[:catid]).order("gmt_modified DESC, id desc").limit(2).offset((@pageindex-1)*2)
      @count = Link.where("catid =?", params[:catid]).count
    else
      @links = Link.order("gmt_modified DESC, id desc").limit(2).offset((@pageindex-1)*2)
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
      format.json { render json: @catid}
    end
  end

end
