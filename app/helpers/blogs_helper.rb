module BlogsHelper
  def gravatar_helper user
    image_tag "https://gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}?d=retro", width: 40
  end

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code,language).div
    end
  end

  def markdown(text)
    coderayified = CodeRayify.new(filter_html: true, hard_wrap: true)

    options = {
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      autolink: true,
      lax_html_blocks: true,
    }

    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe
  end

  def font_blog_awesome action
    case action
    when "delete" then fa_icon "trash"
    when "edit" then fa_icon "pencil-square-o"
    when "draft" then fa_icon "eye-slash"
    when "published" then fa_icon "eye"
    end
  end

  def blog_status_color blog
    'color: red;' if blog.draft?
  end
end