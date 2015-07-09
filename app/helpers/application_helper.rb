module ApplicationHelper
  def show_json(obj)
    %(<pre>#{JSON.pretty_generate(obj)}</pre></code>).html_safe unless obj.blank?
  end
end
