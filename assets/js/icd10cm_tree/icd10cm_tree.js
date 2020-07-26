
/***********try to be d3v5 collapsible indented tree****************** */
import { json, schemeDark2 } from "d3";

var d3 = require("d3");
//const axios = require('axios').default;

let margin = {
  top: 30,
  right: 20,
  bottom: 50,
  left: 50,
}

let width = 1200 - margin.left - margin.right;
let height = 1800 - margin.top - margin.bottom;
let barHeight = 24;
//let barWidth = width * .8;
let barWidth = (width - margin.left - margin.right) * 0.8;

let icd10cm_duration = 500;
let barVertPadding = 0;
var icd10cm_json;
var root_icd10cm;
var vis_icd10cm;

let connector = (d) =>  {
  //curved 
  /*return "M" + d.y + "," + d.x +
     "C" + (d.y + d.parent.y) / 2 + "," + d.x +
     " " + (d.y + d.parent.y) / 2 + "," + d.parent.x +
     " " + d.parent.y + "," + d.parent.x;*/
   //straight
   return "M" + d.parent.y + "," + d.parent.x
     + "V" + d.x + "H" + d.y;      
 }
var  treemap = d3.tree()
  .size([height, 160])
  //.nodeSize([0, 28]);

  let  tree = data => {
    const root = d3.hierarchy(data);
    root.dx = 10;
    root.dy = width / (root.height + 1);
    return d3.tree().nodeSize([root.dx, root.dy])(root);
  }
  let diagonal = d3.linkHorizontal()
  .x(function (d) { return d.y; })
  .y(function (d) { return d.x; });



const icd10cm_desc_color = (d) => {
  return d._children ? "#87AAAE" : d.children ? "#BFD9DA" : "#DDECEF";

}

const icd10cm_code_color = (d) => {
  return d._children ? "#87AAAE" : d.children ? "#BFD9DA" : "#F6F6F6";

}
const icd10cm_code_mark_color = (d) => {
  return d._children ? "#87AAAE" : d.children ? "#BFD9DA" : "#FF1CAE";
  //return d._children ? "#87AAAE" : d.children ? "#BFD9DA" : "green";

}
const icd10cm_code_mark_stroke_color = (d) => {
  return d._children ? "#87AAAE" : d.children ? "#BFD9DA" : "#adff2f";
}


let blues = d3.scaleOrdinal(d3.schemeBlues[9]);
let colors = d3.schemeCategory10

const mag_size = 1.9;
/*
let collapse = (d) => {

  if (d.children) {
    d._children = d.children;
    d._children.forEach(collapse);
    d.children = null;
  }

}//collapse
*/
////////////////////////////
let collapse = (d) =>  {
  d.Selected = false;
  if (d.children) {
      d.numOfChildren = d.children.length;
      d._children = d.children;
      d._children.forEach(collapse);
      d.children = null;
  }
  else {
      d.numOfChildren = 0;
  }
}
/////////////////////////////

//let get_data = (group) => {
let get_data = (vis) => {
  let field = '';

  let request = $.ajax({
    url: '/icd10cm_tree/get_icd10cm_clinicals_json',
    method: 'POST', // whatever You need
    data: {
      input: field,
    }, //
    beforeSend: function (xhr) {
      xhr.setRequestHeader("X-CSRF-Token", window.csrf_token);
    },
    dataType: 'json',
    error: function () {
      console.log('error!');
    }
  });

  request.done(function (json_data) {
    
 let json_data_hierarchy = d3.hierarchy(json_data, function (d) {
      return d.children
    });
    vis_icd10cm = vis;

    icd10cm_json = json_data_hierarchy;
    json_data = null;
    

    icd10cm_json.x0 = 0;
    icd10cm_json.y0 = 0;
    icd10cm_json.children.forEach(collapse); 
  
    let draw = new Draw()
    draw.test(root_icd10cm = icd10cm_json)

    /*
    let nodes = d3.hierarchy(json_data, function (d) {
      return d.children
    });
   
   nodes.x0 = 0;
    nodes.y0 = 0;
    nodes.children.forEach(collapse);

    let draw = new Draw()
    draw.test(nodes)

*/
  });//requst


};//get_data
/////////////////////////////////////


class Set_sketch {
  constructor() { }
  svg() {
    let container = d3.select('#icd10cm_tree_draw_area');
    let svg = container.append('svg');

    svg.attr('id', 'main_svg');
    svg.attr('class', 'main_svg');
    svg.attr({
      width: '100%',
      height: '95$%',
    });
    svg.attr("viewBox", "0 0 " + width + " " + height);
    svg.attr('preserveAspectRatio', 'xMidYMid meet');
    svg.attr('pointer-events', 'all');
    svg.style('margin-left', '0%');
    svg.style('margin-right', '0%');
    svg.style('margin-top', '0%');
    svg.style('margin-bottom', '0%');
    svg.style('background-color', '#000');
    svg.attr("pointer-events", "all")
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


class Draw {
  constructor() {
    this.utils = new Utils();
  }
  ////////////////////////////
  

  /////////////////////////
  //test(tree_data) {
    test(source) {
    let tree_origin_x = width * 0.03;
    let tree_origin_y = height * 0.09;


  /*  
  let svg_dot = d3.select("#svg_vis").append("svg:svg")
      .attr("width", width)
      .attr("height", height)
      .append("svg:g")
      .attr("id", "group_svg")
      .attr("transform", "translate(" + tree_origin_x + "," + tree_origin_y + ")");
    // declares a tree layout and assigns the size
    */
   
    d3.select("#group_svg").transition()
    .duration(icd10cm_duration)
    .attr("height", height);

    let nodes = treemap(root_icd10cm);
  
  
    let index = -1;
    nodes.eachBefore(function(n) {
      n.x = ++index * barHeight ;
      //n.y = n.y * 28;
    });
  


    var node = vis_icd10cm.selectAll(".node")
    .data(nodes.descendants(), function(d, i) { return d.id || (d.id = ++i); })
    .attr("transform", "translate(" + tree_origin_x + "," + tree_origin_y + ")");
    //let node = svg_dot.selectAll(".node")
    // .data(nodes.descendants(), function (d, i) { return d.id || (d.id = ++i); })

      let nodeEnter = node.enter().append('svg:g')
      .attr("class", "node")
      .attr("transform", function(source, i) { 
       return "translate(" + source.y0 + "," + source.x0 + ")"; })
  
      nodeEnter.append('circle')
      .attr('class', 'circle')
      .attr('r', 10)
      .style("stroke-width", 4)
       .style("fill", "none")
      .style("stroke", function(d) {
          return d._children ? "yellow" : "red";
      } );


    nodeEnter.append("rect")
      .attr("id", "first_rect")
      .attr("y", -barHeight / 2)
      .attr("height", barHeight)
      .attr("rx", 5)
      .attr("ry", 5)
      .attr("width", barWidth)
      .style("stroke", "#FFFCE5")
      .attr("stroke-width", 2)
      .style("opacity", 0.9)
      //.style("fill", function(d) { return d._children ? "lightsteelblue" : "#F012BE"; })
      .style("fill", icd10cm_desc_color)
      .on("click", (d, i) => {
      //   d.children = d.children ? null : d._children
      
        if (d.children) {
          d._children = d.children;
          d.children = null;
        } else {
          d.children = d._children;
          d._children = null;
        }
       
        
       this.test(d);
      })

    nodeEnter.append("text")
      .attr("dy", 4.5)
      .attr("dx", 5.5)
      .attr("stroke", "black")
      .attr("fill", "black")
      .attr("stroke-width", 0.001)
      .style("font", "Lucida Bright")
      .style("font-size", "0.85em")
      .style("cursor", "pointer")
      .on("mouseover", this.utils.icd10cm_bigger_fonts)
      .on("mouseout", this.utils.icd10cm_normal_fonts)
      .text(function (d) { return d.data.name; });

    nodeEnter.append("rect")
      .attr("y", -barHeight / 2)
      .attr("height", barHeight)
      .attr("x", barWidth - 110.0)
      .attr("width", 80)
      .attr("rx", 2)
      .attr("ry", 2)
      .style("stroke", "#FFFCE5")
      .attr("stroke-width", 2)
      .style("fill", icd10cm_code_color);

    nodeEnter.append("text")
      .attr("dy", 4.5)
      .attr("dx", barWidth - 105.0)
      .attr("stroke", "black")
      .attr("fill", "black")
      .attr("stroke-width", 0.001)
      .style("font", "Lucida Bright")
      .style("font-size", "0.90em")
      .style("cursor", "pointer")
      // .on("click", icd10cm_click)
      .text(function (d) { return (!d.data.code) ? null : d.data.code; });


    let symbol = d3.symbol().type(d3.symbolCircle).size(100);

    let a_symbol = d3.selectAll(".node")
      .append("path")
      .attr("d", symbol)
      .style("fill", d => d.children ? "#ffffb3" : "#8dd3c7")
      .style("cursor", "pointer")
      .attr("pointer-events", "all")
    

    a_symbol.append("title")
      .attr("dy", "0.31em")
      .attr("x", d => d.children ? -6 : 6)
      .attr("cursor", "pointer")
      .attr("pointer-events", "all")
      .attr("text-anchor", d => d.children ? "end" : "start")
      .text(d => d.data.name)
      .clone(true).lower()
      .attr("stroke", "white");
////////TRANSITIONS///////////////////////


nodeEnter.append("rect")
.attr("y", -barHeight / 2)
.attr("height", barHeight )
.attr("x", barWidth - 110.0)
.attr("width", 80)
.attr("rx", 2)
.attr("ry", 2)
.style("stroke", "red")
.attr("stroke-width", 2)
.style("fill", "none");

this.utils.node_enter_move(nodeEnter, nodes.descendants())
this.utils.node_move(node, nodeEnter, nodes.descendants());
this.utils.node_exit(node, source)
//let nodeExit = d3.select( (d, i) => {return "#node" + i})
//.transition()


  


///////////////////
/*
// Update the links…
var link = svg_dot.selectAll("path.link")
.data(nodes.links(), function(d) { return d.target.id; });

// Enter any new links at the parent's previous position.
link.enter().insert("path", "g")
  .attr("class", "link")
  .attr("d", function(d) {
    var o = {x: d.x, y: d.y};
    return diagonal({source: o, target: o});
  })
  .style("fill", "none")
  .style("stroke", "#9ecae1")
  .style("stoke-width", 1.5)
.transition()
  .duration(icd10cm_duration)
  .attr("d", diagonal);

// Transition links to their new position.
link.transition()
  .duration(icd10cm_duration)
  .attr("d", diagonal);

// Transition exiting nodes to the parent's new position.
link.exit().transition()
  .duration(icd10cm_duration)
  .attr("d", function(d) {
    var o = {x: d.x, y: d.y};
    return diagonal({source: o, target: o});
  })
  .remove();
/////////////////
*/

nodes.each(function(d) {
     d.x0 = d.x;
     d.y0 = d.y;
   });






    ///////////
  };//test
 
 
///////////////
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
            //draw.icd10cm(vis);
            //get_data();
            get_data(vis)

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
  }

  make_bullets(svg) {


    let start_x = 10;
    let start_y = 10;
    let s_width = 10;


    let outer_frame = svg.append('rect')
      .attr('id', 'frame_element')
      .attr('class', 'frame_element_grid')
      .attr('x', start_x)
      .attr('y', start_y)
      .attr('rx', 12.5)
      .attr('ry', 12.5)
      .attr('width', width - (start_x * 2))
      .attr('height', height - (start_y * 2))
      .attr('stroke-width', s_width)
      //.style('stroke', 'url(#frame_gradient)');
      .style('stroke', '#efedf5');

    let middle = svg
      .append('rect')
      .attr('id', 'frame_element')
      .attr('x', start_x + s_width)
      .attr('y', start_y + s_width)
      .attr('rx', 6.125)
      .attr('ry', 6.125)
      .attr('width', width - (start_x * 4))
      .attr('height', height - (start_y * 4))
      .attr('stroke-width', s_width)
      .style("stroke", "#756bb1");
    //  .style('stroke', 'url(#frame_gradient)');

    let inner = svg
      .append('rect')
      .attr('id', 'frame_element')
      .attr('x', start_x + (s_width * 2))
      .attr('y', start_y + (s_width * 2))
      .attr('rx', 3.63)
      .attr('ry', 3.63)
      .attr('width', width - (start_x * 6))
      .attr('height', height - (start_y * 6))
      .attr('stroke-width', s_width)
      .style("stroke", "#bcbddc");
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
class Utils {
  constructor() { }

  


 node_enter_move(nodeEnter, d){ 
  nodeEnter.transition()
  .duration(icd10cm_duration)
  .attr("transform", function(d) { 
    console.log("1111111111111111111111111111")
   //console.log("d.x: " +d.x)
   //console.log("d.y: " +d.y)
    return "translate(" + d.y + "," + d.x + ")"; })
  .style("opacity", 1);
  }

node_move(node, nodeEnter, d) {
  console.log("22222222 node move 22222222222222222222222222")
/*
  node.merge(nodeEnter).transition(icd10cm_duration)
  .attr("transform", d => `translate(${d.y},${d.x})`)
  .attr("fill-opacity", 1)
  .attr("stroke-opacity", 1);
*/
  
  
  node.transition()
  .duration(icd10cm_duration)
  .attr("transform", (d) =>  { 
   return "translate(" + d.y + "," + d.x + ")"; })
    }

node_exit(node, source){
  console.log("33333333333 node exit 333333333333333333333")
  //Transition exiting nodes to the parent's new position.
   node.exit().transition(icd10cm_duration).remove()
       .attr("transform", d => `translate(${source.y},${source.x})`)
    //.attr("transform", d => `translate(${d.y},${d.x})`)
    .attr("fill-opacity", 0)
    .attr("stroke-opacity", 0);
  
  /*
  console.log("3333333333333")
  console.log("source.y ---------------------- "+ JSON.stringify( source.y));

   node.exit().transition()
  .duration(icd10cm_duration)
  .attr("transform", function(source) { 
  // console.log("source.y ---------------------- "+ source.y)
     return "translate(" + source.y + "," + source.x + ")"; })
  .style("opacity", 1)
  .remove();
*/

}

  flatten(icd10pcs_root) {
    var nodes = [], i = 0;

    function recurse(node) {
      if (node.children) node.children.forEach(recurse);
      if (!node.id) node.id = ++i;
      nodes.push(node);
    }

    recurse(icd10pcs_root);
    return nodes;
  };//flatten
  /////////////////////

  elbow(d, i) {
    return "M" + d.source.y + "," + d.source.x
      + "V" + d.target.x + "H" + d.target.y;
  }

  icd10cm_bigger_fonts(d, i) {
    var node_text = d3.select(this);
    node_text.style("font-size", "1.1em")
      .attr("dx", ".45em")
      .attr("dy", ".35em");
  }
  ///////////

  icd10cm_normal_fonts(d, i) {
    var fonts = d3.select(this);
    fonts.style("font-size", "0.85em");
  }

  icd10cm_highlite(d) {
    var node_highlite = d3.select(this);
    node_highlite.style("fill", "#7fffd4")
      .style("opacity", "0.3");
  }


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