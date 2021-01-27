import bulmaCarousel from 'bulma-carousel';
document.addEventListener('turbolinks:load',()=>{
  let element =document.querySelector('#carousel')
  if (element){
  bulmaCarousel.attach('#carousel', {
    slidesToScroll: 1,
    slidesToShow: 5,
    infinite: true,
    autoplay: true
  });
}
})
