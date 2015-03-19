$(function(){

    var t = 0;
    var picCount = $('.pic li').length;
    var sliderW = $('.slider').width();
    var ulWidth = (picCount+1) * sliderW;
    var TT = setInterval( pp, 3000 );
    $('.pic').width(ulWidth);
    $('.pic li').width(sliderW);
    $('.pic').append($('.pic li:first').clone());

    function pp(){
      t++;

      var LL = t * sliderW * -1;
      $('.pic').animate({left: LL}, 300,ck );
    }


    function ck(){
      if(t == picCount){
        t=0;
        $('.pic').css({left:0});
      }
    }

    $(window).resize(function(){
      sliderW = $('.slider').width();
      ulWidth = picCount * sliderW;

      $('.pic').width(ulWidth);
      $('.pic li').width(sliderW);
      LL = t * sliderW * -1;
      $('.pic').css({left: LL})
    });

  })