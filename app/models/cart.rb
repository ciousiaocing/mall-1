class Cart
  attr_reader :items

  # def initialize
  #   @items = []
  # end

  # 預設參數為空陣列
  def initialize(items = [])
    @items = items
  end


  #Cart.from_hash({}) 給空的
  def self.from_hash(hash)  #hash= {} 就不會是nil了
    if hash.nil? or hash["items"].nil?  #has_key  如果是空的給一台全新車子
      new
      # Cart.new
    else

      a = hash["items"].map { |item|
          CartItem.new(item["product_id"], item["quantity"])
      }
      Cart.new(a)

      #上面可以簡化成下面，因為在Cart這個類別裡，scope的作用
      # new hash["items"].map { |item|
      #     CartItem.new(item["product_id"], item["quantity"])
      # }
      # 因為do..end和 {} 層級不一樣，下面如果沒有加 () ，new會執行到do之前就結束了
      # new (hash["items"].map do |item|
      #     CartItem.new(item["product_id"], item["quantity"])
      # end)


      # a = []
      # hash["items"].each do |item|
      #   a << CartItem.new(item["product_id"], item["quantity"])
      # end
      # Cart.new(a)

    end

    # p hash
    # Cart.new
  end

  def serialize
    # {
    #   "items" => [
    #     {"product_id" => 2, "quantity" => 3},
    #     {"product_id" => 4, "quantity" => 5}
    #   ]
    # }

    # hash = { "item" => 1 }  # hash["item"]
    # hash = { :item => 1 }   # hash[:item]
    # hash = { item: 1 }      # hash[:item]

    # @items.map { |i| "product_id" => i.product_id, "quantity" => i.quantity }  自寫

    list = items.map { |item|  #@items @可拿，因為讀取專用
      { "product_id" => item.product_id, "quantity" => item.quantity }
    }

    { "items" => list }

    # a = []
    # @items.each do |item|
    #   a << { "product_id" => item.product_id,
    #          "quantity" => item.quantity }
    # end
    #
    # { "items" => a }

    #動態陣列
    # list = [
    #   {"product_id" => 2, "quantity" => 3},
    #   {"product_id" => 4, "quantity" => 5}
    # ]
    #
    # { "items" => list}


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
