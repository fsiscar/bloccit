module ApplicationHelper
  def form_group_tag(errors, &block)
    ccs_class = 'form-group'
    ccs_class << ' has-error' if errors.any?
    content_tag :div, capture(&block), class: ccs_class
  end
end
