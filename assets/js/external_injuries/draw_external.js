import { json } from "d3";


var d3 = require("d3");
const Graph = require('graphology');

const edges=[];

const get_edges = () => {
  return edges;

}
export const graph_edges = [{

  key: 'level_1_level_2',
  source: '1',
  target: '2',
},
 {
  key: 'level_2_level_3',
  source: '2',
  target: '3',
},
{
  key: 'level_3_level_4',
  source: '3',
  target: '4',
},

{
  key: 'level_4_level_5',
  source: '4',
  target: '5',
},

{
  key: 'level_5_level_6',
  source: '5',
  target: '6',
},

{
  key: 'level_6_level_7',
  source: '6',
  target: '7',
},
{
  key: 'level_7_level_8',
  source: '7',
  target: '8 ',
},

]

var treeData =
  {
    "name": "Top Level",
    "children": [
      {
                "name": "Level 2: A",
        "children": [
          { "name": "Son of A" },
          { "name": "Daughter of A" }
        ]
      },
      { "name": "Level 2: B" }
    ]
  };
  
const get_data = () => {
    let eindex_data = EINDEX_DATA;
       return eindex_data["eindex"]["main_term_jsonb"]["terms_l"];
};

let nodes_data = [];



const get_draw_data = () => {
    return nodes_data;
}

let margin = {
    top: 30,
    right: 20,
    bottom: 30,
    left: 50,
  }
 let width = 1100 - margin.left - margin.right;
 let  height = 1300 - margin.top - margin.bottom;


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
        .style("stroke", "#9ecae1");
      // .style('stroke', 'url(#frame_gradient)');
  
      // this.utility.build_grid(svg);
  
      let bullets_group = svg
        .append('g')
        .attr('transform', 'translate(150, 150)');
  
      //let bullets_color = this.property.color_gradient(bullets_group);
    
      /*--------------------------------*/
      let text = svg
        .append('text')
        .attr('dx', start_x + width/2 + 'px')
        .attr('dy', start_y + 50 + 'px')
        //.attr('fill', 'url(#frame_gradient)')
         .attr('fill', '#eff3ff')
        .attr('text-anchor', 'middle')
        .style("font-family", "sans, georgia, times")
  
        .style('font-size', '1.2em')
        .style('font-weight', 'normal')
        .style('opacity', '0.9')
        .style('stroke', 'none')
        .text(
          ' ICD10-External Injuries '
        );
      
  
  
  
      
      return bullets_group;
    } //make_bullets
  } //class Cuides
  
  
class Set_sketch {
    constructor() {}
    svg() {
      let container = d3.select('#d3_eindex_parent_canvas');
      let svg = container.append('svg');
  
      svg.attr('id', 'main_svg');
      svg.attr('class', 'main_svg');
      svg.attr({
        width: '100%',
        height: '100%',
      });
      svg.attr('viewBox', '0 0 ' + 1100 + ' ' + 1300);
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
constructor(
  

){

};//constructor


diagram(group){
    

let tree_origin_x = width * 0.01;
let tree_origin_y = height * 0.1;

let  svg = group.append("svg")
.attr("width", width)
.attr("height", height )
.append("g")
.attr('transform', `translate(${tree_origin_x}, ${tree_origin_y})`);
/////////////////////////




/*
  let diagonal = function link(d) {
    return "M" + d.source.y + "," + d.source.x
        + "C" + (d.source.y + d.target.y) / 2 + "," + d.source.x
        + " " + (d.source.y + d.target.y) / 2 + "," + d.target.x
        + " " + d.target.y + "," + d.target.x;
  };
 */

//////////////attempt/////////

    this.g = new Data_graph();
    let graph = this.g.set_graph();
   
    graph.forEachNode((node, attributes) => {
      //console.log("NODE "+JSON.stringify(node) + "ATTRIBUTES " + JSON.stringify(attributes))
     // console.log(`node attributes ${node} to ${attributes}`);
      nodes_data.push(attributes)
    });
  
    
    
   // console.log("+++ nodes data ++++++" + JSON.stringify(nodes_data) );
    
      
  //  let nodes = d3.hierarchy(nodes_data);
  //  nodes = treemap(nodes);

 // let  root  = d3.stratify()
 // .id(function(d) { return d.id; })
//  .parentId(function(d) { return d.term_level; })
//  (nodes);

 //console.log("+++ tranfomed ++++++" + JSON.stringify(root) );

   //let root = d3.hierarchy(tree_data, function (d) {return d.children})

   ///////end attempt////////////////////

 
 /*******THE EXAMPOE****************/
 /*
 // declares a tree layout and assigns the size
 let treemap = d3.tree()
 .size([width, height-250]);

 // assigns the data to a hierarchy using parent-child relationships
 let nodes = d3.hierarchy(treeData);
//// maps the node data to the tree layout
   nodes = treemap(nodes);



let link = svg.selectAll(".link")
    .data( nodes.descendants().slice(1))
  .enter().append("path")
    .attr("class", "link")
    .attr("d", function(d) {
       return "M" + d.x + "," + d.y
         + "C" + d.x + "," + (d.y + d.parent.y) / 2
         + " " + d.parent.x + "," + (d.y + d.parent.y) / 2
         + " " + d.parent.x + "," + d.parent.y;
        })
    .attr("fill", "none")
    .attr("stroke", "yellow")
    .attr("storke-width", "4px")
        
let  node = svg.selectAll(".node")
        .data(nodes.descendants())
      .enter().append("g")
        .attr("class", function(d) {
          return "node" +
            (d.children ? " node--internal" : " node--leaf"); })
        .attr("transform", function(d) {
          return "translate(" + d.x + "," + d.y + ")"; });
    // adds the circle to the no

    node.append("circle")
    .attr("r", 10)
    .attr("fill", "#fff")
    .attr("stroke","blue")
    .attr("stoke-width", "3px")



// adds the text to the node
node.append("text")
  .attr("dy", ".45em")
  .attr("y", function(d) { return d.children ? -20 : 20; })
  .style("text-anchor", "middle")
  .text(function(d) { return d.data.name; })
  .attr("stroke", "#fff");
*/

 /********END OF EXAMPLE**************************/
/*
 svg.append("rect")    // attach a rectangle
    .attr("x", 100)      // position the left of the rectangle
    .attr("y", 50)       // position the top of the rectangle
    .attr("height", 100) // set the height
    .attr("width", 200) // set the width
    .attr("fill", "#fff")
*/
/*
  let layoutRoot = d3
  .select(svg)
  .append('svg:svg')
  .attr('width', size.width)
  .attr('height', size.height)
  .append('svg:g')
  .attr('class', 'container')
  .attr('transform', 'translate(' + width + ',0)');
*/

//////////////////////////////////
/*
var i = 0,
    duration = 750,
    root;

// declares a tree layout and assigns the size
var treemap = d3.tree().size([height, width]);

// Assigns parent, children, height, depth
root = d3.hierarchy(treeData, function(d) { return d.children; });
//root = d3.hierarchy(nodes_data, function(d) { return d.children; });
root.x0 = height / 2;
root.y0 = 0;

// Collapse after the second level
root.children.forEach(collapse);
update(root);

// Collapse the node and all it's children
function collapse(d) {
  if(d.children) {
    d._children = d.children
    d._children.forEach(collapse)
    d.children = null
  }
}

function update(source) {

  // Assigns the x and y position for the nodes
  var treeData = treemap(root);

  // Compute the new tree layout.
  var nodes = treeData.descendants(),
      links = treeData.descendants().slice(1);

  // Normalize for fixed-depth.
  nodes.forEach(function(d){ d.y = d.depth * 180});

  // ****************** Nodes section ***************************

  // Update the nodes...
  var node = svg.selectAll('g.node')
      .data(nodes, function(d) {return d.id || (d.id = ++i); });

  // Enter any new modes at the parent's previous position.
  var nodeEnter = node.enter().append('g')
      .attr('class', 'node')
      .attr("transform", function(d) {
        return "translate(" + source.y0 + "," + source.x0 + ")";
    })
    .on('click', click);

  // Add Circle for the nodes
  nodeEnter.append('circle')
      .attr('class', 'node')
      .attr('r', 1e-6)
      .style("fill", function(d) {
        return d._children ? "#31a354" : "#fff";
    });

     // .style("fill", function(d) {
     //     return d._children ? "lightsteelblue" : "#fff";
      //});

  // Add labels for the nodes
  nodeEnter.append('text')
      .attr("dy", ".35em")
      .attr("x", function(d) {
          return d.children || d._children ? -13 : 13;
      })
      .attr("text-anchor", function(d) {
          return d.children || d._children ? "end" : "start";
      })
      .text(function(d) { return d.data.name; });

  // UPDATE
  var nodeUpdate = nodeEnter.merge(node);

  // Transition to the proper position for the node
  nodeUpdate.transition()
    .duration(duration)
    .attr("transform", function(d) { 
        return "translate(" + d.y + "," + d.x + ")";
     });

  // Update the node attributes and style
  nodeUpdate.select('circle.node')
    .attr('r', 10)
    .style("fill", function(d) {
        return d._children ? "lightsteelblue" : "#fff";
    })
    .attr('cursor', 'pointer');


  // Remove any exiting nodes
  var nodeExit = node.exit().transition()
      .duration(duration)
      .attr("transform", function(d) {
          return "translate(" + source.y + "," + source.x + ")";
      })
      .remove();

  // On exit reduce the node circles size to 0
  nodeExit.select('circle')
    .attr('r', 1e-6);

  // On exit reduce the opacity of text labels
  nodeExit.select('text')
    .style('fill-opacity', 1e-6);

  // ****************** links section ***************************

  // Update the links...
  var link = svg.selectAll('path.link')
      .data(links, function(d) { return d.id; });

  // Enter any new links at the parent's previous position.
  var linkEnter = link.enter().insert('path', "g")
      .attr("class", "link")
      .attr('d', function(d){
        var o = {x: source.x0, y: source.y0}
        return diagonal(o, o)
      });

  // UPDATE
  var linkUpdate = linkEnter.merge(link);

  // Transition back to the parent element position
  linkUpdate.transition()
      .duration(duration)
      .attr('d', function(d){ return diagonal(d, d.parent) });

  // Remove any exiting links
  var linkExit = link.exit().transition()
      .duration(duration)
      .attr('d', function(d) {
        var o = {x: source.x, y: source.y}
        return diagonal(o, o)
      })
      .remove();

  // Store the old positions for transition.
  nodes.forEach(function(d){
    d.x0 = d.x;
    d.y0 = d.y;
  });

  // Creates a curved (diagonal) path from parent to the child nodes
  function diagonal(s, d) {

   let path = `M ${s.y} ${s.x}
            C ${(s.y + d.y) / 2} ${s.x},
              ${(s.y + d.y) / 2} ${d.x},
              ${d.y} ${d.x}`

    return path
  }

  // Toggle children on click.
  function click(d) {
    if (d.children) {
        d._children = d.children;
        d.children = null;
      } else {
        d.children = d._children;
        d._children = null;
      }
    update(d);
  }
}
*/
//////////////////////
/*
    var root = d3.stratify()
    .id(function(d) { return d.term_level; })
    .parentId(function(d) { return d.term_level; })
    (nodes_data);
    */
    

/*
    let cluster = d3.layout.cluster()
        .size([height, width - 160]);
        let diagonal = d3.svg.diagonal()
           .projection(function(d) { return [d.y, d.x]; });
    let  nodes = cluster.nodes(array_data),
    links = cluster.links(nodes);
*/

};//diagram



};//class Draw
  //////////////////////////

  /*********************
   * let terms = {"term_use":element["terms_use"],
"term_title":element["terms_title"],
"term_see_tab":element["term_see_tab"],
"term_see_codes":element["term_see_codes"],
"term_see":element["term_see"],
"term_nemod":element["term_nemod"],
"term_level":element["term_level"],
"term_codes":element["term_codes"],
"term_code":element["term_code"]
};//terms

  *********************/
class Data_graph {
  set_graph(){
    
    let data = get_data();
   //     console.log(JSON.stringify(data) );

    let g = new Graph({
       multi:false,
       directed: true,
      // allowSelfLoops: true,
       allowSelfLoops: false,
    });
for (let i = 0; i < data.length; i++) {
        let n_i = data[i];


        //console.log(JSON.stringify(n_i));
        /////////////////////////
        let a_id = i;
        let a_term_use = n_i['term_use'];
        let a_term_title = n_i['term_title'];
        let a_term_see_tab = n_i['term_see_tab'];
        let a_term_see_codes = n_i['term_see_codes'];
        let a_term_see = n_i['term_see'];
        let a_term_nemod = n_i['term_nemod'];
        let a_term_codes = n_i['term_codes'];
        let a_term_code = n_i['term_code'];
        let a_term_level = n_i['term_level'];

        
        let nodes = g.addNode(a_id, {
        id: a_id,
        term_use: a_term_use,
        term_title: a_term_title,
        term_see_tab: a_term_see_codes,
        term_see: a_term_see,
        term_nemod: a_term_nemod, 
        term_codes: a_term_codes,
        term_code: a_term_code,
        term_level: a_term_level,
        });
   //////////////////////////
 for (let i = 0; i < nodes.length; i++) {
 
  let n_current = nodes[i];   
  //console.log(JSON.stringify(n_current));

  this.build_edges(g, n_current);

  };//for



 ///////////////////////////

};//for
    
    
    return g;

};
/////////////////////
/*************************************/
build_edges_test(graph) {
  graph.forEachNode((node, attributes) => {
      //let source = attributes["cath_graft_prox_site"]
      let source = attributes["term_level"]
      console.log("ATTRIBUTS:"  + JSON.stringify(attributes) )
      let target = attributes['cath_graft_segments_cdisc'];
      if (typeof target !== 'undefined' && target) {
          const new_node = graph.mergedNode(target);
          let key = source + "_" + target;
          if (target !== "") {
              let edge = graph.addEdgeWithKey(key, source, target);
          }
      }
  });


  graph.forEachEdge(
      (edge, attributes, source, target, sourceAttributes, targetAttributes) => {
          console.log(`Edge from ${source} to ${target}`);
      });

  return graph;

}; //build_graft_edges

/**************************/

build_edges(g, n_current){
  



let level_current = g.getNodeAttribute(n_current, "term_level");
  
  switch(level_current){
      case  "1":
      this.set_edge(g, n_current,  "2")
    break;
    
    case "2":
        this.set_edge(g,  n_current,  "3");
    break;
    
    case "3":
        this.set_edge(g, n_current, "4");
    break;

    case "4":
       this.set_edge(g,  n_current, "5");
    break;

    case "5":
    
      this.set_edge(g,   n_current,"6");
    break;

    case "6":
    
      this.set_edge(g,  n_current,  "7");
    break;
    
    case "7":
        this.set_edge(g,  n_current,  "8");
    break;
    
    default: 

    console.log("Something went horribly wrong...");
   // console.log("Something went horribly wrong..."+ level_current);

};//switch
 
};//define edges

/////////////////////////
set_edge(graph,  source, next_level){
 let prev_num = 1;
 let prev = source - prev_num;
 let next = source + 1;
 
 let prev_node = source[prev]
let next_node = source[next]

 graph.forEachNode((node, attributes) => {
  
 // console.log("source "+ source + " next node " + next_node + " prev " + prev_node);


  if(next_node == source){
   
    let eq_source = prev_node;
    let eq_target  = node;

    ////////////////////////////
    if (typeof eq_source !== 'undefined' && eq_source) {
      let key = eq_source + "_" + eq_target;
      let edge = graph.addEdgeWithKey(key, eq_source, eq_target);
       //let edge = graph.mergeEdge(source, target);
       let title_1 = graph.getNodeAttribute(eq_source, "term_title");
       console.log("SOURCE TITLE: "+title_1);

    // console.log("equal nodes source "+ eq_source + " target > " + eq_target)

      
   };//if typeof

  
  }
  
  else{
  let term_level  = attributes["term_level"]

  if(term_level == next_level) {
     let target = node;
     
     ////////////////////////////
   if (typeof target !== 'undefined' && target) {
      let key = source + "_" + target;
       //let edge = graph.addEdgeWithKey(key, source, target);
        let edge = graph.mergeEdge(source, target);
        let title_2  = graph.getNodeAttribute(source, "term_title");
       console.log("SOURCE TITLE: 2 "+title_2);
   };//if typeof
   ///////////////////////////////
  };//if

};//else

  })//forEeachNode
 
  return graph;


};//set_edge


};//class
  ///////////////////////////

/////////////////////////////
class Prep_data{

  constructor(){
    this.g = new Data_graph();
 
  };//constructor

start() {
  let graph = this.g.set_graph();

  console.log("***********************************");
  console.log("Graph type: " +  graph.type)
  console.log("Graph Nodes: " + graph.nodes())
  
  console.log("-----start ---edges---------------------------");

  graph.forEachEdge(
     (edge, attributes, source, target, sourceAttributes, targetAttributes) => {
        console.log(`Edge from ${source} to ${target}`);
    });
  console.log("----------end edges ----------------------");  
  
  console.log('Order Of Graph: '+ graph.order);
  console.log('Size: Number of edges in the graph '+  graph.size);
  console.log("***********************************");

  /*
 graph.forEachNode((node, attributes) => {
    console.log("NODE "+JSON.stringify(node) + "ATTRIBUTES " + JSON.stringify(attributes))
   // console.log(`node attributes ${node} to ${attributes}`);
    });

  */





}

//console.log("======start level 1=======================")
//a_level_1.push(["children", level_2])
//console.log(JSON.stringify(a_level_1) )
//console.log("======end level 1=======================")



feed_elements(element){

let terms = {"term_use":element["terms_use"],
"term_title":element["terms_title"],
"term_see_tab":element["term_see_tab"],
"term_see_codes":element["term_see_codes"],
"term_see":element["term_see"],
"term_nemod":element["term_nemod"],
"term_level":element["term_level"],
"term_codes":element["term_codes"],
"term_code":element["term_code"]
};//terms

 return terms;


};//feed_elements
///////////////////////
};//class Prep_data
/////////////////////
////////////////////////////////////////
class Main_tree{
constructor(vis){
    this.vis = vis;
    let prep_data = new Prep_data;
       prep_data.start();

    
}


}//class main_tree


 ///////////////////////////

export class Interface_buttons {
    constructor() {
      this.make_button();
       
    } //constructor
    
    make_button() {
        /******************
         * button show All
         * ***************/

        let button = document.createElement('button');
        button.innerHTML = 'Show  - Redraw External Injuries';
        button.classList.add('large');
        button.classList.add('primary');
        button.classList.add('button');
    
        let draw_div = document.querySelector('#d3_eindex_button');

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
                    let tree  = new Main_tree(vis);
                    let draw = new Draw()
                        draw.diagram(vis);
                  }
                }, //click
              ); //click
            } //if draw_div
        

      
      
    }//make_button    

}//class Interface_buttons
///////////////////////////


const draw_external_init = () => {
//console.log("from draw_coronary_init ------------------------");
  
const main = new Interface_buttons();
  
};
  
draw_external_init();
  