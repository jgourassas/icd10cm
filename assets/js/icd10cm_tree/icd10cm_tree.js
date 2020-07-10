var d3 = require("d3");
const axios = require('axios').default;

let margin = {
    top: 30,
    right: 20,
    bottom: 50,
    left: 50,
  }
  
  let width = 950 - margin.left - margin.right;
  let height = 1200 - margin.top - margin.bottom;
  let barHeight = 24;
  let barWidth = width * .8;
  
  //let colors = d3.schemeSet2()
  
  const mag_size = 1.9;
  let root_icd10cm = []


/////////////////////////////
 


let get_data= () => {
  
  let field = '';

  let request = $.ajax({
    url: '/icd10cm_tree/get_icd10cm_clinicals_json',
    method: 'POST', // whatever You need
    data: {
      input: field,
     }, //
    beforeSend: function(xhr) {
      xhr.setRequestHeader("X-CSRF-Token", window.csrf_token);
    },
    dataType: 'json',
   error: function() {
       console.log('error!');
    }
    });

  request.done(function(res) {
   return res;
   
    //      console.log( JSON.stringify( res));


  })
  

};//get_data

 
 let tree = d3.tree()
    .size([height, 160]);


//////////////////////////
class Graphical{
constructor(){

};//constructor


};//class
  class Set_sketch {
    constructor() { }
    svg() {
      let container = d3.select('#icd10cm_tree_draw_area');
      let svg = container.append('svg');
  
      svg.attr('id', 'main_svg');
      svg.attr('class', 'main_svg');
      svg.attr({
        width: '100%',
        height: '100%',
      });
      svg.attr("viewBox", "0 0 " + width + " " +  height);
      svg.attr('preserveAspectRatio', 'xMidYMid meet');
      svg.attr('pointer-events', 'all');
      svg.style('margin-left', '0%');
      svg.style('margin-right', '0%');
      svg.style('margin-top', '0%');
      svg.style('margin-bottom', '0%');
      svg.style('background-color', '#000');
      svg.style('cursor', 'move');
      svg.style('shape-rendering', 'crispEdges');
      svg.call(this.zoom());
  
      return svg;
    } //svg
  
    zoom() {
      let a_zoom = d3.zoom().on('zoom', function () {
        let svg_vis = d3.select('#svg_vis');
        svg_vis.attr('transform', d3.event.transform);
      });
      return a_zoom;
    } //zoom
  
    vis() {
      let svg_vis = this.svg();
      let vis = svg_vis.append('svg:g').attr('id', 'svg_vis');
      return vis;
    }
  } //class Set_sketch
  //////////////////////////
  class Draw{
    constructor(){
    

    }

  
    icd10cm(group){
  

     let utils = new Utils();

     let  icd10cm_json = get_data();
    /*
     icd10cm_json.x0 = 0;
     icd10cm_json.y0 = 0;
     
     for(let i = 0; i< icd10cm_json.length; i++ ){
       //let children = icd10cm_json[i]["children"]; 
       let children = icd10cm_json[i]; 
       utils.collapse(children)
     }
  */

  //     this.icd10cm_update(root_icd10cm = icd10cm_json. group);
/*
     d3.json("../../../data/icd10cm_clinicals.json", function(tree_data) { 
        // d3.json("icd10cm_2013.json", function(tree_data) {
        // this.build_tree(tree_data, group) 
      })
*/
 

};//funct
  
//////////////////////////////////////
icd10cm_update(source, group) {

  // Compute the flattened node list. TODO use d3.layout.hierarchy.
   //var icd10cm_nodes = tree.nodes(root_icd10cm);
   let icd10cm_nodes = d3.hierarchy(root_icd10cm);
  // Compute the "layout".
   icd10cm_nodes.forEach(function(n, i) {
     n.x = i * barHeight;
   });

   
  let svg = group.append("svg")
  .attr("width", width)
  .attr("height", height)
  .append("g")
  .attr("id", "group_svg")
  .attr('transform', `translate(${tree_origin_x}, ${tree_origin_y})`);///////////////
  
  let node = svg.selectAll("g.node")
  .data(icd10cm_nodes, function(d) { return d.id || (d.id = ++i); });

  var nodeEnter = node.enter().append("svg:g")
      .attr("class", "node")
     .attr("transform", function(d) { return "translate(" + source.y0 + "," + source.x0 + ")"; })
      .style("opacity", 1);

      nodeEnter.append("svg:rect")
      .attr("y", -barHeight / 2)
      .attr("height", barHeight)
			.attr("rx", 5)
      .attr("ry", 5)
      .attr("width", barWidth)
      .style("stroke","#FFFCE5")
      .attr("stroke-width", 2)
      .style("opacity",0.9)
      .style("fill", "yellow")
      //.style("fill", icd10cm_desc_color)
      //.on("click", icd10cm_click); 



  };//icd10cm_update
/////////////////////////
    //////////////////////////////
    build_tree(tree_data, group){
      console.log( "jgour ------33333 ------------");
      //console.log( JSON.stringify(tree_data) )

      let tree_origin_x = width * 0.08;
      let tree_origin_y = height * 0.09;
  
    
      // declares a tree layout and assigns the size
      let treemap = d3.tree()
        .size([width, height - 200])
      
            
      let nodes = d3.hierarchy(tree_data, (d) => {
        return d.children

      })

      //let nodes = d3.hierarchy(tree_data)
      nodes = treemap(nodes);

      let svg = group.append("svg")
      .attr("width", width)
      .attr("height", height)
      .append("g")
      .attr("id", "group_svg")
      .attr('transform', `translate(${tree_origin_x}, ${tree_origin_y})`);
      
      let node = svg.selectAll(".node")
      .enter()
      .enter().append("svg:g")
      .attr("class", "node")

      

    
      svg.selectAll("circle")
                   .data(nodes.descendants())
                   .enter()
                   .append("circle")
                   .style("fill", "#fff")
                   .attr("cx", function(d, i) {
                       return (i * 50) +25; })
                   .attr("cy", (d, i) => { 30 * i  })//height/2)
                   .attr("r", function(d, i) {
                               return 10 });
                



    };//icd10cm
  };//class
///////////////////////////////
  export class Tree_buttons {
    constructor() {
      this.make_button();
  
    } //constructor
  
    make_button() {
      /******************
       * button show All
       * ***************/
  
      let button = document.createElement('button');
      button.innerHTML = 'Show  - ICD-10-CM Graphical Tree';
      button.classList.add('large');
      button.classList.add('primary');
      button.classList.add('button');
  
      let draw_div = document.querySelector('#icd10cm_tree_draw_button');
  
      if (draw_div !== null) {
        draw_div.appendChild(button);
        button.addEventListener(
          'click',
          function () {
            let main_svg = d3.select('#main_svg');
            if (main_svg !== null) {
              d3.select('#main_svg')
                .transition()
                .duration(1500)
                .ease(d3.easeLinear)
                .style("fill", "#000")
                .attr('opacity', d => 0.1)
                .remove();
  
              //g_draw_n_template.clear();
              //draw_symbols_template.length = 0;
  
              let setup = new Set_sketch();
              ////////////////////////////////
              let vis = setup.vis();
              let guides = new Guides();
              let bullets_group = guides.make_bullets(vis);
              let draw = new Draw()
              draw.icd10cm(vis);
              //draw.prototype(vis);
            }
          }, //click
        ); //click
      } //if draw_div
  
  
  
  
    }//make_button    
  
  }//class Tree_buttons
  ///////////////////////////
  class Guides {
    constructor() {
      //this.utility = new Utility();
      //this.property = new Segment_property(d3);
      // this.native_data = new Prepare_natives_data();
    }
  
    make_bullets(svg) {
  
  
      let start_x = 25;
      let start_y = 25;
  
  
  
      let rect1 = svg.append('rect')
        .attr('id', 'frame_element')
        .attr('class', 'frame_element_grid')
        .attr('x', start_x)
        .attr('y', start_y)
        .attr('rx', 12.5)
        .attr('ry', 12.5)
        .attr('width', width)
        .attr('height', height)
        .attr('stroke-width', 15)
        //.style('stroke', 'url(#frame_gradient)');
        .style('stroke', '#deebf7');
  
      let rect2 = svg
        .append('rect')
        .attr('id', 'frame_element')
        .attr('x', start_x + 10)
        .attr('y', start_y + 10)
        .attr('rx', 6.125)
        .attr('ry', 6.125)
        .attr('width', width - 20)
        .attr('height', height - 20)
        .attr('stroke-width', 12)
        .style("stroke", "#3182bd");
      //.style('stroke', 'url(#frame_gradient)');
  
      let rect3 = svg
        .append('rect')
        .attr('id', 'frame_element')
        .attr('x', start_x + 20)
        .attr('y', start_y + 20)
        .attr('rx', 3.63)
        .attr('ry', 3.63)
        .attr('width', width - 40)
        .attr('height', height - 40)
        .attr('stroke-width', 7)
        .style("stroke", "#f89406");
      // .style('stroke', 'url(#frame_gradient)');
  
      // this.utility.build_grid(svg);
  
      let bullets_group = svg
        .append('g')
        .attr('transform', 'translate(150, 150)');
  
      //let bullets_color = this.property.color_gradient(bullets_group);
  
      /*--------------------------------*/
      let text = svg
        .append('text')
        .attr('dx', start_x + width / 2 + 'px')
        .attr('dy', start_y + 50 + 'px')
        //.attr('fill', 'url(#frame_gradient)')
        .attr('fill', '#eff3ff')
        .attr('text-anchor', 'middle')
        .style("font-family", "sans, georgia, times")
  
        .style('font-size', '1.5em')
        .style('font-weight', 'normal')
        .style('opacity', '0.9')
        .style('stroke', 'none')
        .text(
          ' ICD-10-CM Graphical Tree'
        );
  
  
  
  
  
      return bullets_group;
    } //make_bullets
  } //class Cuides
  
  

///////////////////////////////
class Utils{
  constructor(){}
   
  collapse(d) { 

    //console.log("---> " + JSON.stringify(d["children"]) );
      
    if (d["children"]) { 
      d._children = d["children"]; 
      d._children.forEach(this.collapse); 
      d["children"] = null; 
          }
   /*        
    if (d.children) { 
        d._children = d.children; 
        d._children.forEach(this.collapse); 
        d.children = null; 
            }
 */            
}//collapse


};//Utils

///////////////////////////
const draw_icd10cm_tree_init = () => {
     let tree_buttons = new Tree_buttons()
  };
  
  draw_icd10cm_tree_init(); 