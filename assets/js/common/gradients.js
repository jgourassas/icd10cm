/** 
 * Very nice book
 * SVG Colors, Patterns & Gradients
 * Auth Amelia Bellamy-Royds & Kurt Cagle
 * Editions O'REILLY
 * 
 */
export class Gradients {
   constructor() {
   };//constructor

   linear(group, id, color_1, color_2) {
      let defs = group.append("defs");

      let gradient = defs.append("linearGradient")
         .attr("id", id)
         .attr("x1", "0%")
         .attr("x2", "100%")
         .attr("y1", "0%")
         .attr("y2", "100%");

      gradient.append("stop")
         .attr('class', 'start')
         .attr("offset", "0%")
         .attr("stop-color", color_1)
         .attr("stop-opacity", 1);

      gradient.append("stop")
         .attr('class', 'end')
         .attr("offset", "100%")
         .attr("stop-color", color_2)
         .attr("stop-opacity", 1);


   };//linier

   ///////////////////////
   linear_group(group, id, color_1, color_2) {

      let gradient_linear = group.append("svg:defs")
         .append("svg:linearGradient")
         .attr("id", id)
         .attr("x", "0%")
         .attr("y", "0%")
         .attr("x2", "100%")
         .attr("y2", "100%");

      gradient_linear.append("svg:stop")
         .attr("offset", "0%")
         .attr("stop-color", color_1)
         .attr("stop-opacity", 1);


      gradient_linear.append("svg:stop")
         .attr("offset", "30%")
         .attr("stop-color", color_2)
         .attr("stop-opacity", 0.7)
         .attr("gradientTransform", "rotate(45)");

         gradient_linear.append("svg:stop")
         .attr("offset", "100%")
         .attr("stop-color", color_1)
         .attr("stop-opacity", 0.7)
         .attr("gradientTransform", "rotate(-45)");

   }; //linear gradient

   blue_gradient(group, id) {
      this.group = group;
     this.group
          .append('path')
          //.attr('d', 'M-1,1 l2,-2 M0,4 l4,-4 M3,5 l2,-2');
          //.attr('d','c 0,4 8,6 8,10 8,14 0,16 0,20');
          .attr("d", "M-1,1 l2,-2 M0,4 l4,-4 M3,5 l2,-2");

      let gradient = this.group.append("defs").append("linearGradient")
          .attr("id", id)
          .attr("x1", "0%")
          .attr("y1", "20%")
          .attr("x2", "20%")
          .attr("y2", "100%");
      //.append('path')
      //    .attr('d', 'M-1,1 l2,-2 M0,4 l4,-4 M3,5 l2,-2');


      gradient.append("stop")
          .attr("offset", "20%")
          .attr("stop-color", "#a6cee3");

      gradient.append("stop")
          .attr("offset", "50%")
          .attr("stop-color", "#1f78b4");

      gradient.append("stop")
          .attr("offset", "100%")
          .attr("stop-color", "#19162B");

      return gradient;
  }

   radial(group, id, color_1, color_2) {

      let gradient_radial = group.append("svg:defs")
         .append("svg:radialGradient")
         .attr("id", id)
         .attr("cx", "50%")
         .attr("cy", "50%")
         .attr("fx", "50%")
         .attr("fy", "80%")
         .attr("spreadMethod", "pad");

      gradient_radial.append("svg:stop")
         .attr("offset", "0%")
         .attr("stop-color", color_1)
         .attr("stop-opacity", 1);

      gradient_radial.append("svg:stop")
         .attr("offset", "100%")
         .attr("stop-color", color_2)
         .attr("stop-opacity", 0.7);

      return gradient_radial;

   }; //radialGradient
 ///////////////////////////  
   padded(group, id, method, color_1, color_2, color_3){
   //   method: pad, reflect

  let light = group.append("svg:defs")
           .append("svg:linearGradient")
           .attr("id", id)
           .attr("x1","45%")
           .attr("y2","55%")
           .attr("spreadMethod", method);

   light.append("svg:stop")
           .attr("offset", "0%")
           .attr("stop-color", color_1)
           .attr("stop-color", color_1)
           .attr("stop-opacity", 1);

   light.append("svg:stop")
           .attr("offset", "50%")
           .attr("stop-color", color_2)
           .attr("stop-opacity", 1);

   light.append("svg:stop")
           .attr("offset", "100")
           .attr("stop-color", color_3)
           .attr("stop-opacity", 1);
   };//padded
   /////////////////////////

   color_gradients(element) {
     // let frame_element = this.d3.selectAll('#frame_element');
      
     let frame_gradient_outer =  this.linear
      (element, 
         'frame_gradient_outer', 
         '#636363', 
         '#bdbdbd');
        
    let frame_gradient_middle =  this.linear
         (element, 
            'frame_gradient_middle', 
            '#636363', 
            'red');
   let frame_gradient_inner =  this.linear
            (element, 
               'frame_gradient_inner', 
               'green', 
               'red');

      let lesion_gradient = this.radial(
         element,
         'lesion_gradient',
         '#7fcdbb',
         '#2c7fb8',
      );


      let arterial_gradient = this.linear(
         element,
         'arterial_gradient',
         '#d94701',
         'white',
      );
      let icd10cm_name_gradient_1 = this.linear(
         element,
         'icd10cm_name_gradient_1',
         '#a1c4fd',
         '#c2e9fb',
      );
     // padded(group, id, method, color_1, color_2, color_3){

      let padded_gradient = this.padded(
         element,
         'padded_gradient',
         'pad',
         'green',
         'yellow',
         'red'
      );

     // background-image: linear-gradient(to top, #1e3c72 0%, #1e3c72 1%, #2a5298 100%);
     //background-image: linear-gradient(120deg, #a1c4fd 0%, #c2e9fb 100%);
      let icd10cm_name_gradient = this.linear(
         element,
         'icd10cm_name_gradient',
         '#a1c4fd',
         '#c2e9fb',
      );
   let blue_gradient = this.blue_gradient(element,
      "blue_gradient"

      )

   }
   /////////////////////
};//class Gradients

/*background-image: linear-gradient(to right, #92fe9d 0%, #00c9ff 100%);

var line = svg.append("path")
              //.attr("d", function () { … } )
              .attr("stroke", "url(#svgGradient)")
              .attr("fill", "none");
*/

