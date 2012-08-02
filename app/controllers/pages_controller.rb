class PagesController < ApplicationController
  # GET api/pages.xml
  # GET api/pages.json
  def index
    @pages = Page.all
    respond_to do |format|
      format.json {render json: @pages}
      format.xml {render xml: @pages}
    end
  end

  # GET api/pages/published.json
  # GET api/pages/published.xml
  def published
    @pages = Page.published.order("published_on desc")
    respond_to do |format|
         format.json {render json: @pages}
         format.xml {render xml: @pages}
       end
  end

  # GET api/pages/unpublished.json
  # GET api/pages/unpublished.xml
  def unpublished
    @pages = Page.unpublished.order("published_on desc")
    respond_to do |format|
         format.json {render json: @pages}
         format.xml {render xml: @pages}
       end
  end

  # POST api/pages/:id/publish.json
  # POST api/pages/:id/publish.xml
  def publish
    if @page = Page.find_by_id(params[:id])
      @page.published_on = Time.now
      if @page.save
          head :no_content
      else
        respond_to do |format|
             format.json {render json: @page.errors, status: :unprocessable_entity}
             format.xml {render xml: @page.errors, status: :unprocessable_entity}
           end

        end
    end

  end


  # GET api/pages/:id/total_words.json
  # GET api/pages/:id/total_words.xml
  def total_words
    if @page = Page.find_by_id(params[:id])
      @total_words = @page.total_words
    else
      @total_words = 0
    end
    respond_to do |format|
             format.json {render json: @total_words}
             format.xml {render xml: @total_words}
           end
  end

  # GET /pages/id.xml
  # GET /pages/id.json
  def show
    if @page = Page.find_by_id(params[:id])
      @page = Page.find(params[:id])
    end
    respond_to do |format|
             format.json {render json: @page}
             format.xml {render xml: @page}
           end

  end


  # GET api/pages/new.json
  # GET api/pages/new.xml
  def new
    @page = Page.new

    respond_to do |format|
             format.json {render json: @page}
             format.xml {render xml: @page}
           end
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(params[:page])

    if @page.save
      respond_to do |format|
               format.json {render json: @page}
               format.xml {render xml: @page}
             end
    else
      respond_to do |format|
               format.json {render json: @page.errors, status: :unprocessable_entity }
               format.xml {render xml: @page.errors, status: :unprocessable_entity}
             end
    end
  end

  #GET api/pages/:id/edit.json
  #GET api/pages/:id/edit.xml
  def edit
    if @page = Page.find_by_id(params[:id])
      respond_to do |format|
                  format.json {render json: @page}
                  format.xml {render xml: @page}
                end
    end
  end

  # PATCH/PUT api/pages/1
  # PATCH/PUT api/pages/1.json
  def update
    if @page = Page.find_by_id(params[:id])
      @page = Page.find(params[:id])

      if @page.update_attributes(params[:page])
        head :no_content
      else
        respond_to do |format|
          format.json {render json: @page.errors, status: :unprocessable_entity }
          format.xml {render xml: @page.errors, status: :unprocessable_entity}
        end
      end
    end
  end

  # DELETE api/pages/1
  # DELETE api/pages/1.json
  def destroy
    if @page = Page.find_by_id(params[:id])
      @page.destroy
    end
    head :no_content
  end
end
