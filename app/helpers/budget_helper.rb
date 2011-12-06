module BudgetHelper

  def link_to_show_div(title, d)
    raw(link_to_function("Show #{title}", "$('##{d}').show()" ))
  end

end
