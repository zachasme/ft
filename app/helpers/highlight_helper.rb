module HighlightHelper
  def highlighted_excerpt(haystack, needle)
    highlighted = if needle.present?
      highlight(excerpt(haystack, needle, radius: 30), needle)
    else
      truncate(haystack, length: 60)
    end
    
    if highlighted.empty?
      truncate(haystack, length: 60)
    else
      highlighted
    end
  end
end
