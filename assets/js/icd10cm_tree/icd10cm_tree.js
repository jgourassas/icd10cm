import { json } from "d3";

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

  
/////////////////////////////
 
let get_data= (group) => {
  
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
    let draw = new Draw()
     draw.icd10cm(group, res);
    
  });//requst
  


};//get_data
/////////////////////////////////////
 
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
      this.utils = new Utils();
    }
  
    //////////////////
    icd10cm(group, treeData){
     /*
      treeData.each(function(d){
        if (d.name == "name") 
            d3.select(this).remove();});
        link.each(function(d){
        if (d.source.name == "name") 
            d3.select(this).remove();});

    let root = d3.stratify()
      .id( (d) => { return d.id; })
      .parentId( (d) => { return d.parentid; })
      (treeData)
      
      //console.log("------data-------------------------")
     // console.log(JSON.stringify( root));

*/


     ////////////////////////////
    

    let tree_origin_x = width * 0.09;
      let tree_origin_y = height * 0.09;
  
      let svg = group.append("svg")
        .attr("width", width)
        .attr("height", height)
        .append("g")
        .attr("id", "group_svg")
         .attr('transform', `translate(${tree_origin_x}, ${tree_origin_y})`);
  
      // declares a tree layout and assigns the size
      let treemap = d3.tree()
        .size([width, height - 200])
  

      let nodes = d3.hierarchy(treeData)
      
       nodes = treemap(nodes);
      
          
      let node = svg.selectAll(".node")
       .data(nodes.descendants())
      //.data(nodes.descendants() , function(d, i) { return d.children || (d.children = ++i); })
      .enter().append("g")
      .attr("class", "node")
      //.attr("transform", function (d) {
       // return "translate(" + d.x + "," + d.y + ")";
     // })

      d3.selectAll("g.node")
      .append("circle")
      .attr("r", 4.5)
      .attr("stroke", (d) => {
        return "cyan"
      })
      .style("fill", "yellow")

    let dots = node.selectAll("circle")
      //.data(function (d) { return d.values; })
      .data( (d, i) => { 
        console.log(JSON.stringify( d["data"][i]["children"]) )
        return d["data"][i]["children"]
       })
      .enter()
      .append("svg:circle")
      .attr("id", (d, i) => {
        "circle"
      })
      .attr("cx", function (d, i) {
        return mag_size * 9 * i;
      })
      .attr("cy", function (d, i) {
        // return 25 * i;
        return 40 
      })
      .attr("r", mag_size * 2.8)
      .style("fill", (d, i) => {
        return "#fff"
      })
      .style("stroke", "#fff")
      .style("stoke-width", (d, i) => {
        return mag_size;

      })

    
      let a_title = node.append('title')
      //.attr("class", "tooltip");
      .style('font', 'sans-serif')
      .style('font-size', '0.85em')
      .style('text-align', 'center')
      .attr('cursor', 'pointer')
      .style('background-color', 'cyan')
      .text( (d, i, j) => {
        console.log( "--------children j "+JSON.stringify(d["data"][i]["children"][i][3]) + "Test")

        return d["data"][i]["children"][i]

      }
      );
    
   
      /*

      node.append("svg:rect")
      .attr("y", -barHeight / 2)
      .attr("height", barHeight)
			.attr("rx", 5)
      .attr("ry", 5)
      .attr("width", barWidth)
      .style("stroke","#FFFCE5")
      .attr("stroke-width", 2)
      .style("opacity",0.9)
*/
    // adds the circle to the nod
  
  

    /*---------------------------------------*/
    };//icd10cm

    /////////////////////////
    icd10cm_1(group, icd10cm_json){
     let utils = new Utils();
     let tree_origin_x = width * 0.08;
     let tree_origin_y = height * 0.09;
    // console.log(JSON.stringify(icd10cm_json) )
     
    // icd10cm_json.children.forEach(utils.collapse); 
    const root = d3.hierarchy(icd10cm_json);
    
    
    
    root.x0 = 0;
    root.y0 = 0;

     root.descendants().forEach((d, i) => {
      d.id = i;
      d._children = d.children;
       if (d.depth && d.data.name.length !== 7) d.children = null;
    });

    
    let svg = group.append("svg")
    .attr("width", width)
    .attr("height", height)
    .append("g")
    .attr("id", "group_svg")
    //.attr('transform', `translate(${tree_origin_x}, ${tree_origin_y})`);///////////////

    const gLink = svg.append("g")
    .attr("fill", "none")
    .attr("stroke", "#fff")
    .attr("stroke-opacity", 0.4)
    .attr("stroke-width", 1.5);

const gNode = svg.append("g")
    .attr("cursor", "pointer")
    .attr("pointer-events", "all");
////////////////////////////////////
  // Compute the new tree layout.
  tree(root);
///////////////


 

};//funct

    
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
              get_data(vis);

              //let draw = new Draw()
              //draw.icd10cm(vis);
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
    console.log("collapse ------------------")
    //console.log("---> " + JSON.stringify(d["children"]) );
   /*   
    if (d["children"]) { 
      d._children = d["children"]; 
      d._children.forEach(this.collapse); 
      d["children"] = null; 
          }
  */        
    if (d.children) { 
        d._children = d.children; 
        d._children.forEach(collapse); 
        d.children = null; 
            }
            
}//collapse

 title(element) {
    let a_title = element
      .append('title')
      //.attr("class", "tooltip");
      .style('font', 'sans-serif')
      .style('font-size', '0.85em')
      .style('text-align', 'center')
      .style('cursor', 'default')
      .style('background-color', 'cyan');

    return a_title;
  }

};//Utils

///////////////////////////
const draw_icd10cm_tree_init = () => {
     let tree_buttons = new Tree_buttons()
  };
  
  draw_icd10cm_tree_init(); 