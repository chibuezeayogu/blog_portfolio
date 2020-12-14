module DefaultPageContent
  extend ActiveSupport::Concern

  included do 
    before_action :set_title
  end

  def set_title
    @page_title = 'Blog Portfolio'
    @seo_keywords = 'Chibueze Ayogu Portfolio'
  end
end
