// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require rails-ujs
//= require activestorage
//= require_tree .
//= require popper
//= require bootstrap-sprockets
//= require cocoon
//= require Chart.min

$(function() {
  function readURL(input) {
   if (input.files && input.files[0]) {
     var reader = new FileReader();
     reader.onload = function (e) {
       $('#img_prev').attr('src', e.target.result);
     }
     reader.readAsDataURL(input.files[0]);
   }
 }
 $("#up_img").change(function(){
   readURL(this);
 });
});

(function() {
  window.draw_graph = function() {
    var ctx, myChart;
    ctx = document.getElementById("myChart");
    var player = document.getElementById("myChart").getAttribute('data-player');
    var playing_time = document.getElementById("myChart").getAttribute('data-playing_time');
    var level = document.getElementById("myChart").getAttribute('data-level');
    return myChart = new Chart(ctx, {
      type: 'radar',
      data: {
        labels: ["プレイ人数", "プレイ時間", "推奨年齢"],
        datasets: [
          {
            data: [player, playing_time, level],
            backgroundColor: ['rgba(255, 159, 64, 0.4)'],
            borderColor: ['rgba(255, 159, 64, 1)'],
            borderWidth: 1.3,
            pointBorderColor: "orange"
          }
        ]
      },
      options: {
        legend: {
          display: false
        },
        scale: {
          pointLabels: {
            fontSize: 18
          },
          ticks: {
            display: false,
            suggestedMin: 0,
            suggestedMax: 6,
            stepSize: 1
          },
          angleLines: {
            display: true,
            color: "#CCCCCC"
          },
          gridLines: {
            display: true,
            color: "#CCCCCC"
          }
        }
      }
    });
  };

}).call(this);

$(function(){
  $('#open_nav').on('click', function(){
    $('#wrapper, #nav').toggleClass('show');
  });
  $('#close_nav').on('click', function(){
    $('#wrapper, #nav').removeClass('show');
  });
});
