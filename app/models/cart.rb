class Cart
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(product_id)
    # 搜尋
    found_item = @items.find { |item|  #@v
      #item是指CartItem
      item.product_id == product_id
    }

    if found_item
      found_item.increment
    else
      @items << CartItem.new(product_id)  #@v
    end
    # if 找到
    #   + 1
    # else
    #   newitem
    # end
    #@items << product_id
  end

  def empty?
    @items.empty?  #@v
  end

  # def items
  #   @items
  # end

  def total_price
    # @items.reduce { |product.total_price, product| product.total_price + product }
    @items.reduce(0) { |sum, item| sum + item.total_price }

    total = 0
    @items.each do |item|
      total += item.total_price
    end
    total
  end

end
