#PORO plain Old ruby Object
class Cart
  attr_reader :item
  def initialize
    @item=[]
  end
  def add_item(product_id)
     found=@item.find{|item| item.product_id == product_id}
     if found
      found.increment!
     else
      @item << CartItem.new(product_id)
     end
  
  end

  def empty?
    @item.empty?
  end


end