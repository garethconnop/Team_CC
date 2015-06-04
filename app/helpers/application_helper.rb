module ApplicationHelper
	def active(path)
    "active" if current_page?(path)
  end

  def markdown(content)
  	renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
  	options = {
  		autolink: true,
      underline: true,
      disable_indented_code_blocks: true,
      no_intra_emphasis: true
  	}
  	Redcarpet::Markdown.new(renderer, options).render(content).html_safe
  end
end
