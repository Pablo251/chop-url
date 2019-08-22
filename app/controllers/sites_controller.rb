class SitesController < ApplicationController
  before_action :site_params, only: [:create, :go_to_url]
  before_action :find_match, only: :create

  # GET /sites
  def index
  end

  # GET /sites/1
  def show
  end

  # POST /sites
  def create
    hash_url_code = SecureRandom.hex(4)
    new_site = { full_url: @sent_url, short_url: hash_url_code, accessed_attempts: 1 }

    @site = Site.new(new_site)
    if @site.save
      SiteMetaCrawlerJob.perform_later @site
      render json: @site, status: :created, location: @site
    else
      render json: @site.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sites/1
  def update
  end

  # DELETE /sites/1
  def destroy
  end

  # GET: Redirect to the real URL
  def go_to_url
    url = Site.find_by_short_url(@sent_url).full_url

    redirect_to url, status: 301
  end

  # GET: Return the top 100 of the Shorted URLs
  def top_trending_sites
    top_100 = Site.all.order('accessed_attempts DESC').limit(100)

    render json: top_100, status: :created
  end  

  private
    # Only allow a trusted parameter "white list" through.
    def site_params
      permited_params = params.permit(:url)
      @sent_url = permited_params.fetch(:url).strip
    end

    # Try to find if the sent url was aready shorted and stored in the app
    def find_match
      site_match = Site.where(full_url: @sent_url).first

      if site_match.present?
        site_match.rate_site

        render json: site_match, status: :created, location: site_match
      end      
    end
end
