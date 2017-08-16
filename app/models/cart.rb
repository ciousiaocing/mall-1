class Cart
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(product_id)
    # 搜尋
    found_item = @items.find { |item|
      #item是指CartItem
      item.product_id == product_id
    }

    if found_item
      found_item.increment
    else
      @items << CartItem.new(product_id)
    end
    # if 找到
    #   + 1
    # else
    #   newitem
    # end
    #@items << product_id
  end

  def empty?
    @items.empty?
  end

  # def items
  #   @items
  # end

end
