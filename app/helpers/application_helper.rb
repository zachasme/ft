module ApplicationHelper
  def highlighted_excerpt(haystack, needle)
    if needle.present?
      highlight(excerpt(haystack, needle, radius: 30), needle)
    else
      truncate(haystack, length: 60)
    end
  end
end
