module ApplicationHelper

  def is_active_menu_item(item="vendors")    
    return 'active' if request.path_info.include? item
    ''
  end
end
