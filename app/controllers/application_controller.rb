class ApplicationController < ActionController::API
  def paginate (item_name, item, page)
    per_page = 5
    count = item.count
    items_paginated = Kaminari.paginate_array(item).page(page).per(per_page)

    return {
      "#{item_name}": items_paginated,
      page: page.to_i,
      per_page: per_page,
      total_count: count,
      total_pages: (count / per_page.to_f).ceil
    }
  end
end
