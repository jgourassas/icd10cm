//import { thresholdFreedmanDiaconis } from "d3";
import { Gradients } from "../common/gradients.js"
import { Background_grid } from "../common/background_grid.js"
/***********try to be d3v5 collapsible indented tree****************** */
//import { json, schemeDark2 } from "d3";

var d3 = require("d3");


let margin = {
  top: 30,
  right: 20,
  bottom: 50,
  left: 50,
}


let width = 1100 - margin.left - margin.right;
let height = 1526 - margin.top - margin.bottom;
let barHeight = 24;
let barWidth = (width - margin.left - margin.right) * 0.9;

let icd10cm_duration = 500;
//let barVertPadding = 0;
var icd10cm_json;
var root_icd10cm;
var vis_icd10cm;

const unit_size = 5;

let opacity_very_low = 0.1;
let opacity_low = 0.4;
let opacity_high = 0.8;
let opacity_very_high = 1;

var treemap = d3.tree()
  .size([height, 160])
//.nodeSize([0, 28]);
/*
let tree = data => {
  const root = d3.hierarchy(data);
  root.dx = 10;
  root.dy = width / (root.height + 1);
  return d3.tree().nodeSize([root.dx, root.dy])(root);
}
*/
let diagonal = d3.linkHorizontal()
  .x(function (d) { return d.y; })
  .y(function (d) { return d.x; });

//let colors = d3.scaleOrdinal(d3.schemeBlues[9]);
//let colors  = d3.scaleOrdinal(d3.schemeBrBG[4]);
//let colors =  d3.scaleOrdinal(d3.schemePastel1); 
//let  colors = d3.scaleOrdinal(d3.schemeCategory10)
// let colors = d3.scaleOrdinal(d3.schemeSet2)
// let colors = d3.scaleOrdinal(d3.schemePiYG[7])
//let  colors = d3.scaleOrdinal(d3.schemeSet3);


const icd10cm_desc_color = (d) => {
  // return d._children ? "#87AAAE" : d.children ? "#BFD9DA" : "#DDECEF";
  //return d._children ? colors(d._children): d.children ? colors(d.children) : colors(d._children);
  // return d._children ? "#87bdd8" : d.children ? "#b7d7e8" : "#cfe0e8";
  return d._children ? 'url(#icd10cm_name_gradient)' : d.children ? "#b7d7e8" : "#cfe0e8";
}


const icd10cm_code_color = (d) => {
  //return d._children ? "#87AAAE" : d.children ? "#BFD9DA" : "#F6F6F6";
  return d._children ? "#87bdd8" : d.children ? "#b7d7e8" : "#cfe0e8";

}
const icd10cm_code_mark_color = (d) => {
  return d._children ? "#87AAAE" : d.children ? "#BFD9DA" : "#FF1CAE";


}
const icd10cm_code_mark_stroke_color = (d) => {
  return d._children ? "#87AAAE" : d.children ? "#BFD9DA" : "#adff2f";
}



//const mag_size = 1.9;

////////////////////////////
let collapse = (d) => {
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
//////////////////////////
  //////////////////////////
 let  flatten = (root_icd10cm) => {
    var nodes = [], i = 0;
    function recurse(node) {
      if (node.children) node.children.forEach(recurse);
      if (!node.id) node.id = ++i;
      nodes.push(node);
    }

    recurse(root_icd10cm);
    return nodes;
  };//flatten
  /////////////////////
  
let traverse_tree = (value) => {
  let my_nodes = flatten(root_icd10cm)
  

  my_nodes.forEach(function (d) {
   // console.log("my nodes ---> " + d.data.code);
    if (d.data.code == value) {
        console.log(d.data.code);
      //  display_message((20+(unit_size*1)),((icd10pcs_as_force_h/6) + unit_size*9 ),d.name)
      console.log(d.data.name)
      //click(d);
    }//if
  });//forEach
}//traverse_tree

/////////////////////////////

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

    /////////////////////    
    vis_icd10cm = vis;


    icd10cm_json = json_data_hierarchy;
    json_data = null;


    icd10cm_json.x0 = 0;
    icd10cm_json.y0 = 0;
    icd10cm_json.children.forEach(collapse);
    //let search = new Search();
    //search.draw_input_area(icd10cm_json);

    let draw = new Draw()
    draw.test(root_icd10cm = icd10cm_json)

  });//requst


};//get_data
/////////////////////////////////////


class Draw {
  constructor() {
    this.utils = new Utils();
  }
  ////////////////////////////


  /////////////////////////

  test(source) {
    let tree_origin_x = width * 0.03;
    let tree_origin_y = height * 0.09;


    let svg_dot = vis_icd10cm
      .attr("width", width)
      .attr("height", height)
      .append("svg:g")
      .attr("id", "group_svg")
      .attr("transform", "translate(" + tree_origin_x + "," + tree_origin_y + ")");

    // declares a tree layout and assigns the size
    d3.select("#group_svg").transition()
      .duration(icd10cm_duration)
      .attr("height", height);



    let nodes = treemap(root_icd10cm);


    let index = -1;
    nodes.eachBefore(function (n) {
      n.x = ++index * barHeight;
    });


    let node = vis_icd10cm.selectAll(".node")
      .data(nodes.descendants(), function (d, i) { return d.id || (d.id = ++i); })



    let nodeEnter = node.enter().append('svg:g')
      .attr("class", "node")
      .on("click", (d, i) => {
        if (d.children) {
          d._children = d.children;
          d.children = null;
        } else {
          d.children = d._children;
          d._children = null;
        }
        this.test(d);
      })

    let symbol = d3.symbol().type(d3.symbolCircle).size(70);
    //let symbol = d3.symbol().type(d3.symbolTriangle).size(30); 
    //let symbol = d3.symbol().type(d3.symbolStar).size(100); 

    let a_symbol = d3.selectAll(".node")
      .append("path")
      .attr("d", symbol)
      .style("fill", icd10cm_code_mark_color)
      .style("stroke", "#daebe8")
      .style("stroke-width", 1)
      .style("cursor", "pointer")
      .attr("pointer-events", "all")
      .attr("opacity", 0.8)
      // .attr("transform", "translate(" +  -8 + "," + 0 + ")")
      .on("mousedown", this.utils.increase_shape)

    /*
  
      
         nodeEnter.append('circle')
         .attr('class', 'circle')
         .attr('r', 10)
         .style("stroke-width", 2)
          .style("fill", "none")
          .style("cursor", "pointer")
          .attr("opacity", 0.8)
          .attr("pointer-events", "all")
         .style("stroke", icd10cm_code_mark_color )
         .on("mousedown", this.utils.increase_shape)
   */

    nodeEnter.append("rect")
      .attr("id", "first_rect")
      .attr("y", -barHeight / 2)
      .attr("height", barHeight)
      .attr("rx", 5)
      .attr("ry", 5)
      .attr("width", barWidth)
      .style("stroke", "#FFFCE5")
      .attr("stroke-width", 3)
      .style("opacity", 0.9)
      .style("fill", icd10cm_desc_color)
      .on("mousedown", this.utils.increase_shape)

    nodeEnter.append("text")
      .attr("dy", 4.5)
      .attr("dx", 5.5)
      .attr("stroke", "#fff")
      .attr("fill", "#000")
      .attr("stroke-width", 0.001)
      .style("font", "Lucida Bright")
      .style("font-size", "0.85em")
      .style("font-weight", 500)
      .style("cursor", "pointer")
      .on("mouseover", this.utils.icd10cm_bigger_fonts)
      .on("mouseout", this.utils.icd10cm_normal_fonts)
      .text(function (d) { return d.data.name; });

    let code_rect = nodeEnter.append("rect")
      .attr("y", -barHeight / 2)
      .attr("height", barHeight)
      .attr("x", barWidth - 110.0)
      .attr("width", 80)
      .attr("rx", 2)
      .attr("ry", 2)
      .style("stroke", "#FFFCE5")
      .attr("stroke-width", 2)
      .style("fill", icd10cm_code_color);

    let code_text = nodeEnter.append("text")
      .attr("dy", 4.5)
      .attr("dx", barWidth - 105.0)
      .attr("stroke", "cyan")
      .attr("fill", "darkblue")
      .attr("stroke-width", 0.001)
      .style("font", "Lucida Bright")
      .style("font-size", "0.90em")
      .style("font-weight", 600)
      .style("cursor", "pointer")
      .attr("id", (d) => { return "code" + "_" + d.data.code })
      .text(function (d) { return (!d.data.code) ? null : d.data.code; });

    nodeEnter.append("svg:rect")
      .attr("y", -barHeight / 6)
      .attr("height", barHeight / 4)
      .attr("x", barWidth - 20.0)
      .attr("width", barHeight / 4)
      .attr("rx", 2)
      .attr("ry", 4)
      .style("stroke", icd10cm_code_mark_stroke_color)
      .attr("stroke-width", 0.2)
      .style("fill", icd10cm_code_mark_color);



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
    this.utils.node_enter_move(nodeEnter, nodes.descendants())
    this.utils.node_move(node, nodeEnter, nodes.descendants());
    this.utils.node_exit(node, source)





    ///////////////////

    // Update the links…
    var link = vis_icd10cm.selectAll("path.link")
      .data(nodes.links(), function (d) { return d.target.id; });

    // Enter any new links at the parent's previous position.
    link.enter().insert("path", "g")
      .attr("class", "link")
      .attr("d", function (d) {
        var o = { x: d.x, y: d.y };
        return diagonal({ source: o, target: o });
      })
      .style("fill", "none")
      .style("stroke", "#ddeedd")
      .style("stroke", function (d) {
        return d.source === this.node || d.target === this.node ? "red" : "#888888";
      })
      .style("stoke-width", 0.8)
      .transition()
      .duration(icd10cm_duration)
      .attr("d", diagonal);

    // Transition links to their new position.
    link.transition()
      .duration(icd10cm_duration)
      .attr("d", diagonal);
    ///////////////////
    ////////////////////
    // Transition exiting nodes to the parent's new position.
    link.exit().transition()
      .duration(icd10cm_duration)
      .attr("d", function (d) {
        var o = { x: d.x, y: d.y };
        return diagonal({ source: o, target: o });
      })
      .remove();
    /////////////////


    nodes.each(function (d) {
      d.x0 = d.x;
      d.y0 = d.y;
    });

    ///////////
  };//test

  ////////////////
  ///////////////
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
        () => {
          let main_svg = d3.select('#main_svg');
          if (main_svg !== null) {
            d3.select('#main_svg')
              .transition()
              .duration(1500)
              .ease(d3.easeLinear)
              .style("fill", "#000")
              .attr('opacity', d => 0.2)
              .remove();

            //g_draw_n_template.clear();
            //draw_symbols_template.length = 0;

            let setup = new Set_sketch();
            ////////////////////////////////
            let vis = setup.vis();


            let guides = new Guides();
            let bullets_group = guides.make_bullets(vis);
            let draw = new Draw()
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
    let gradients = new Gradients();

    let grid = new Background_grid()
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
      .style('stroke', 'url(#frame_gradient_outer)')
      .style("opacity", opacity_very_low)
    ///.style('stroke', 'url(#padded_gradient)')
    //.style("opacity", 1)

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
      //.style("stroke", "#756bb1")
      .style('stroke', 'url(#frame_gradient_middle)')
      .style("opacity", opacity_very_low)
    // .style("srroke", "url(#padded_gradient)")
    // .style("opacity", 1)

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
      .style('stroke', 'url(#blue_gradient)')
      .style("opacity", opacity_very_low)
    // this.utility.build_grid(svg);

    let bullets_group = svg
      .append('g')
      .attr('transform', 'translate(0, 0)');

    let bullets_color = gradients.color_gradients(bullets_group);
    let set_grid = grid.set_grid(bullets_group);
    /*--------------------------------
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
*/

    return bullets_group;
  } //make_bullets
} //class Cuides


/////////////////////////
class Search {
  constructor() {
    this.utils = new Utils();
    //this.traverse_tree = this.traverse_tree.bind(this);
    //this.foo = this.foo.bind(this)

  };//constructor

  draw_input_area(d) {


    var input_area_group = vis_icd10cm.append("svg:g")
      .attr("id", "input_area_code")
      .style("opacity", 1.0)
      .attr("transform", function (d) { return "translate(" + 20 + "," + (height / 6) + ")"; });

    var input_code_rect = input_area_group.append("svg:rect")
      .attr("id", "input_area_rect")
      .attr("rx", (unit_size * 0.20))
      .attr("ry", (unit_size * 0.20))
      .attr("width", (unit_size * 20))
      .attr("height", (unit_size * 10))
      .style("fill", "none")
      .style("stroke", "#b0e0e6")
      .style("stroke-width", unit_size)
      .style("stroke-linecap", "round")
      .style("stroke-linejoin", "miter")
      .style("stroke-miterlimit", 4);
    //.on("mouseover",get_code_input);


    //var input_code_rect_text = input_area_group.append("svg:text")
    //       .attr("class","input_area_rect_text")
    //       .attr("id","input_area_rect_text")
    //       .attr("text-anchor", "start")
    //       .style("font-family", "monospace")
    //       .style("font-size", ".9em")
    //       .style("font-weight","normal")
    //			 .style("fill","#98fb98")
    //       .text("Search For A Code" );

    let input_code_element = input_area_group.append("foreignObject")
      .attr("y", unit_size)
      .attr("width", unit_size * 20)
      .attr("height", unit_size * 10)
      .append("xhtml:body")
      .style("font-size", "1em")
      .style("font-weight", "bold")
      .html("<input type=\"text\" id=\"input_code_element\" name=\"input_code_element\" value=\"Code\" />")
      .on("keyup", this.user_icd10cm_code);

    //var input_button_collapse = input_area_group.append("foreignObject")
    //            .attr("y", unit_size*6)
    //            .attr("width", unit_size*15)
    //            .attr("height", unit_size*10)
    //            .style("border","4px solid blue;")
    //            .append("xhtml:body")
    //            .style("font", "1em 'sans-serif'")
    //            .style("font-weight", "bold")
    //            .html("<input type=\"button\" value=\"Collapse\" />")
    //            .on("click",  collapse_all);
    //

  }

/*
  traverse_tree(value) {
    let my_nodes = this.utils.flatten(root_icd10cm)
    my_nodes.forEach(function (d) {
      if (d.data.code == value) {
        console.log(d.data.code);
        //  display_message((20+(unit_size*1)),((icd10pcs_as_force_h/6) + unit_size*9 ),d.name)
        console.log(d.data.name)
        //click(d);
      }//if
    });//forEach
  }//traverse_tree
*/

  //////////////////

  user_icd10cm_code() {
    let code = $('#input_code_element');
    //console.log("code " + JSON.stringify(code.val()));
    let code_value = code.val()

    traverse_tree(code_value);

  };//set_user_icd10cm_code
  //////////

  ///////////////////
};//class Search

///////////////////////////////
class Utils {
  constructor() { }

  node_enter_move(nodeEnter, d) {
    nodeEnter.transition()
      .duration(icd10cm_duration)
      .ease(d3.easeLinear)
      .attr("transform", function (d) {
        return "translate(" + d.y + "," + d.x + ")";
      })
      .style("opacity", 1);
  }

  node_move(node, nodeEnter, d) {

    node.transition()
      .duration(icd10cm_duration)
      .ease(d3.easeLinear)
      .attr("transform", (d) => {
        return "translate(" + d.y + "," + d.x + ")";
      })
  }

  node_exit(node, source) {
    //Transition exiting nodes to the parent's new position.
    node.exit().transition(icd10cm_duration).remove()
      .attr("transform", d => `translate(${source.y},${source.x})`)
      .attr("fill-opacity", 1)
      .attr("stroke-opacity", 1);


  }


  ////////////////////

  //////////////////////////
  /*
  flatten(root_icd10cm) {
    var nodes = [], i = 0;

    function recurse(node) {
      if (node.children) node.children.forEach(recurse);
      if (!node.id) node.id = ++i;
      nodes.push(node);
    }

    recurse(root_icd10cm);
    return nodes;
  };//flatten
  /////////////////////
*/

  elbow(d, i) {
    return "M" + d.source.y + "," + d.source.x
      + "V" + d.target.x + "H" + d.target.y;
  }

  icd10cm_bigger_fonts(d, i) {
    var node_text = d3.select(this);
    node_text.style("font-size", "1.1em")
      .attr("dx", ".35em")
      .attr("dy", ".35em");
  }
  ///////////

  icd10cm_normal_fonts(d, i) {
    var fonts = d3.select(this);
    fonts.style("font-size", "0.95em");
  }

  icd10cm_highlite(d) {
    var node_highlite = d3.select(this);
    node_highlite.style("fill", "#7fffd4")
      .style("opacity", "0.3");
  }



  increase_shape(d) {
    d3.select(this)
      .transition()
      .delay(3)
      .duration(200)
      // .attr("transform", function (d, i) { return "scale(" + (1 - 30 / 20) * 10 + ")"; })
      .attr("transform", function (d) { return "scale(" + 1.4 + "," + 1.1 + ")"; })
      .transition()
      .duration(800)
      .attr("transform", function (d) { return "scale(" + 1 + "," + 1 + ")"; });
  };

  normal_shape(d) {
    d3.select(this)
      .transition()
      .duration(1800)
      .attr("transform", function (d) { return "scale(" + 1 + "," + 1 + ")"; });
    //.attr("transform", "rotate(0)");
  };


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

  show_rain_drop(size) {
    let r = Math.sqrt(size / Math.PI)
    let drop = "M" + r + ",0" + "A" + r + "," + r + " 0 1,1 " + -r + ",0" + "C" + -r + "," + -r + " 0," + -r + " 0," + -3 * r + "C0," + -r + " " + r + "," + -r + " " + r + ",0" + "Z";
    return drop

  };//rain_drop

};//Utils

///////////////////////////
const draw_icd10cm_tree_init = () => {
  let tree_buttons = new Tree_buttons()
};

draw_icd10cm_tree_init(); 