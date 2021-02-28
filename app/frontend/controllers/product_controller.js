import { Controller } from "stimulus"
import Rails from "@rails/ujs"
export default class extends Controller {
  static targets = [ "quantity","sku","add_cart" ]

 
  //品項數量按鈕遞減
  quantity_minus(event){
    event.preventDefault();
    let q=Number(this.quantityTarget.value);
    if(q > 1){
    this.quantityTarget.value=q-=1;
    }
  }
  //品項數量按鈕遞增
  quantity_plus(event){
    event.preventDefault();
    let q=Number(this.quantityTarget.value);
    this.quantityTarget.value=q+=1;

  }
  add_to_cart(event){
    event.preventDefault();
    let product_id=this.data.get("id");
    let sku=this.skuTarget.value;
    let quantity=this.quantityTarget.value;
    if (quantity > 0){
      this.add_cartTarget.classList.add('is-loading')
      let data=new FormData();
      data.append("id",product_id);
      data.append("sku",sku);
      data.append("quantity",quantity);

      Rails.ajax({
        url:"/api/v1/cart",
        data,
        type:"POST",
        success: resp=>{
   
          if(resp.status == "ok"){
            let item_count=resp.items || 0;
            //send event
            let evt=new CustomEvent('addToCart',{"detail":{item_count}});
            console.log(evt);
            document.dispatchEvent(evt);
          }
        },
        error:err=>{
          console.log(err);
        },
        complete:()=>{
          this.add_cartTarget.classList.remove('is-loading');
        }
      });
    }
  }



}
