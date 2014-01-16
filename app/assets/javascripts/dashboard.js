(function(){
  document.addEventListener( "DOMContentLoaded", function( e ){
      //grabbing & setting variables from ruby/ rails data
      var totalVisitsEl = document.querySelector( '#totvist'),
        uniqEl = document.querySelector( '#univist'),
        retVisEl = document.querySelector( '#retvist'),
        returnVisEl = document.querySelector( '#mobvist'),
        mobileEl = document.querySelector( '#nmobvist');

      // converting variables into int that can be used in graphs
      var totalVis = parseInt( totalVisitsEl.innerHTML, 10 ),
        uniVis = parseInt( uniqEl.innerHTML, 10 ),
        retVis = parseInt( retVisEl.innerHTML, 10 ),
        mobVis = parseInt( returnVisEl.innerHTML, 10 ),
        nmobVis = parseInt( mobileEl.innerHTML, 10 );


      //Get my canvas
      var canvas = document.querySelector( "#canvas" );
      // Get the getContext
      var context = canvas.getContext( '2d' );
      var drawBarRect = function( height, color, xCoord, label ){
      // begin Drawing
      context.beginPath();
      // draw the rectangle
      var rectWidth = 100;
      var rectHeight = height;
      var x = xCoord;
      var y = canvas.height - rectHeight;

    
      // .rect( x, y, width, height )
      // x, y are tp left
      context.rect( x, y, rectWidth, rectHeight );
      // set fill color
      context.fillStyle = color;
      // fill rectangele
      context.fill();
      // stroke
      // context.strokeStyle = 'black'
      // context.stroke();
      context.font = '12pt Arial';
      context.strokeStyle = 'grey';
      context.fillText( label , x , 20);
    

  };

      drawBarRect(14, 'blue', 20, "total visit"  );
      drawBarRect(1, 'green', 220, "unique visits" );
      drawBarRect(3, 'orange', 420, "return visits" );
      drawBarRect(1, 'chartreuse', 620, "mobile visits" );
      drawBarRect(4, 'purple', 820, "non-mobile visits");
});
})();
