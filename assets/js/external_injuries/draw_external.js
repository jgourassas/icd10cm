import { json, interpolateRound } from "d3";
import { InvalidArgumentsGraphError } from "graphology";

// check and Partition Layouts
var d3 = require("d3");
const Graph = require('graphology');

//import mergePath from 'graphology-utils/merge-path';
//import shortestPath from 'graphology-shortest-path';
//import dijkstra from 'graphology-shortest-path/dijkstra';

const nest = (items, id = null, link = 'parent_id') =>
  items
    .filter(item => item[link] === id)
    .map(item => ({ ...item, children: nest(items, item.id) }));



const desc_color = (d) => {
  return d._children ? "#87AAAE" : d.children ? "#BFD9DA" : "#DDECEF";

}

let json_graph = {};

const set_json_graph = (graph) => {
  json_graph = graph.export();
}

/////////////
const mag_size = 1.9;
let template = [];
let barHeight = 24
let barWidth = 1100 * .8

let injury_template = [];
//////////////////////////
//////////////////////////
const parent_child_template = [
  {
    term_level: "1",
    data: "",
    parent: null,
    children: "2"
  },

  {
    term_level: "2",
    data: "",
    parent: "1",
    children: "3"
  },

  {
    term_level: "3",
    data: "",
    parent: "2",
    children: "4"
  },
  {
    term_level: "4",
    data: "",
    parent: "3",
    children: "5"
  },
  {
    term_level: "5",
    data: "",
    parent: "4",
    children: "6"
  },
  {
    term_level: "6",
    data: "",
    parent: "5",
    children: "7"
  },

  {
    term_level: "7",
    data: "",
    parent: "6",
    children: "8"
  },
  {
    term_level: "8",
    data: "",
    parent: "7",
    children: "9"
  },
  {
    term_level: "9",
    data: "",
    parent: "8",
    children: null
  },
]
//////////////////
const nested_template = [
  {
    term_level: "0",
    data: "",
    parent: null,
    children: [
      {
        term_level: "1",
        data: "",
        parent: "0",
        children: [
          {
            term_level: "2",
            data: "",
            parent: "1",
            children: [
              {
                term_level: "3",
                data: "",
                parent: "2",
                children: [
                  {
                    term_level: "4",
                    data: "",
                    parent: "3",
                    children: [
                      {
                        term_level: "5",
                        data: "",
                        parent: "4",
                        children: [
                          {
                            term_level: "6",
                            data: "",
                            parent: "5",
                            chidren: [
                              {
                                term_level: "7",
                                data: "",
                                parent: "6",
                                children: [
                                  {
                                    term_level: "8",
                                    data: "",
                                    parent: "7",
                                    children: [
                                      {
                                        term_level: "9",
                                        data: "",
                                        parent: "8",
                                      }
                                    ]
                                  }
                                ]
                              }
                            ]

                          }


                        ]
                      }
                    ]
                  }
                ]
              }
            ]
          }
        ]
      }

    ]
  },


];//injury_template

//////////////////////////
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

let nested_data = []

let links = [];

//let color  = d3.schemeCategory20

let color = d3.scaleOrdinal(d3.schemeCategory10);

const get_links = () => {
  return links;
}

const get_nested_data = () => {
  return nested_data;
}
let unit_size = 5.5;

let digits_text_path = d3.arc()
  .startAngle(-2.2)
  .endAngle(function (d) { return 3.5; })
  .innerRadius(function (d) { return unit_size * 12; })
  .outerRadius(function (d) { return unit_size * 16; });


let margin = {
  top: 30,
  right: 20,
  bottom: 30,
  left: 50,
}
let width = 1100 - margin.left - margin.right;
let height = 1300 - margin.top - margin.bottom;



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
      .attr('dx', start_x + width / 2 + 'px')
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
  constructor() { }
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

class Draw {
  constructor(


  ) {

  };//constructor

  level_intend(term_level) {
    switch (term_level) {
      case "1":
        return 60 * term_level;
        // code block
        break;
      case "2":
        return 80 * term_level;

        break;
      default:
      // code block
    }

  };//level_intend

  ////////////////////////////
  diagram_x1(group) {
    let tree_origin_x = width * 0.06;
    let tree_origin_y = height * 0.07;



    let tree = d3.tree()
      .size([width, height])
    ///////////////////
    console.log("JSON GRAPH" + JSON.stringify(json_graph));

    let links = json_graph.edges
    let nodes = json_graph.nodes



    let svg = group.append("svg")
      .attr("width", width)
      .attr("height", height)
      .append("g")
      .attr("id", "svg_group")
      .attr('transform', `translate(${tree_origin_x}, ${tree_origin_y})`);




    // declares a tree layout and assigns the size
    let node = svg.selectAll(".node")
      //.data(nested_data)
      .data(nodes)
      .enter().append("svg:g")
      .attr("class", "node")
      .append("svg:circle")
      .attr("id", (d, i) => {
        "circle"
      })
      .attr("cx", function (d, i) {
        //return d.attributes["term_level"]
        //  level_intend(d.term_level);
        //return 70 * d.term_level 
        return mag_size * 9 * i;
      })
      .attr("cy", function (d, i) {
        return 25 * i;
        //return 40 * d.term_level 
      })
      .attr("r", mag_size * 2.8)
      .style("fill", (d, i) => {
        return "#fff"
        //return color(d.term_level)
      })
      .style("stroke", "#fff")
      .style("stoke-width", (d, i) => {
        return mag_size;

      })
      .append("title")
      .attr("cursor", "pointer")
      .text((d) => {
        return " Level: "
          + d.term_level
          + " Title: "
          + d.term_title
          + " Code: "
          + d.term_code
      }//d
      );//text


    // Store nodes in a hash by name
    let nodesByName = {};

    nodes.forEach(function (d) {
      nodesByName[d.name] = d;
    });
    // Convert link references to objects
    links.forEach(function (link) {
      link.source = nodesByName[link.source];
      link.target = nodesByName[link.target];
      if (!link.source.links) {
        link.source.links = [];
      }
      link.source.links.push(link.target);
      if (!link.target.links) {
        link.target.links = [];
      }
      link.target.links.push(link.source);
    });

    // Convert link references to objects
    links.forEach(function (link) {
      link.source = nodesByName[link.source];
      link.target = nodesByName[link.target];
      if (!link.source.links) {
        link.source.links = [];
      }
      link.source.links.push(link.target);
      if (!link.target.links) {
        link.target.links = [];
      }
      link.target.links.push(link.source);
    });

    nodes.each(setPosition);

    // Update inserted elements with computed positions
    nodes.attr('transform', function (d) {
      return 'translate(' + d.x + ', ' + d.y + ')';
    });

    links.attr('x1', function (d) {
      return d.source.x;
    }).attr('y1', function (d) {
      return d.source.y;
    }).attr('x2', function (d) {
      return d.target.x;
    }).attr('y2', function (d) {
      return d.target.y;
    });

    // console.log("LINKS " + JSON.stringify(links));

    /////////////////////////
  }





  ////////////////
  diagram(group) {
    let tree_origin_x = width * 0.08;
    let tree_origin_y = height * 0.09;


    // declares a tree layout and assigns the size
    let treemap = d3.tree()
      .size([width, height - 200])

    let nodes = d3.hierarchy(nested_data)
    nodes = treemap(nodes);


    ///////////////////////
    let svg = group.append("svg")
      .attr("width", width)
      .attr("height", height)
      .append("g")
      .attr("id", "group_svg")
      .attr('transform', `translate(${tree_origin_x}, ${tree_origin_y})`);

    // declares a tree layout and assigns the size
    let node = svg.selectAll(".node")
      .data(nested_data)
      //   .data(nodes.descendants())
      .enter().append("svg:g")
      .attr("class", "node")



    let dots = node.selectAll("circle")
      .data(function (d) { return d.values; })
      .enter()
      .append("svg:circle")
      .attr("id", (d, i) => {
        "circle"
      })
      .attr("cx", function (d, i) {
        //  level_intend(d.term_level);

        //return 70 * d.term_level 
        return mag_size * 9 * i;
      })
      .attr("cy", function (d, i) {
        // return 25 * i;
        return 40 * d.term_level
      })
      .attr("r", mag_size * 2.8)
      .style("fill", (d, i) => {
        return color(d.term_level)
      })
      .style("stroke", "#fff")
      .style("stoke-width", (d, i) => {
        return mag_size;

      })
      .append("title")
      .attr("id", "icd10cm_title")
      .attr("cursor", "pointer")
      .text((d) => {
        return " Level: "
          + d.term_level
          + " Title: "
          + d.term_title
          + " Code: "
          + d.term_code
      }//d
      );//text



    ////////////////////
  };//diagram



  //////////////////////

  prototype(group) {
    let tree_origin_x = width * 0.01;
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
      //  .data(nodes)
      // .data(nodes.descendants() , function(d, i) { return d.values || (d.values = ++i); })
      .enter().append("g")
      .attr("class", "node")
      .attr("transform", function (d) {
        return "translate(" + d.x + "," + d.y + ")";
      })

    // adds the circle to the nod
    d3.selectAll("g.node")
      .append("circle")
      .attr("r", 15)
      .attr("stroke", (d) => {
        return "cyan"
      })
      .style("fill", "yellow")

    let link = svg.selectAll(".link")
      .data(nodes.descendants().slice(1))
      .enter().append("path")
      .attr("class", "link")
      .attr("d", function (d) {
        return "M" + d.x + "," + d.y
          + "C" + d.x + "," + (d.y + d.parent.y) / 2
          + " " + d.parent.x + "," + (d.y + d.parent.y) / 2
          + " " + d.parent.x + "," + d.parent.y;
      })

      .style("fill", "none")
      .style("stroke", "#fff")

  };//prototype
  ///////////////////

};//class Draw
//////////////////////////


class Data_graph {
  set_graph() {

    let data = get_data();

    let g = new Graph({
      multi: false,
      directed: true,
      // allowSelfLoops: true,
      allowSelfLoops: false,
    });
    for (let i = 0; i < data.length; i++) {
      let n_i = data[i];


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
        term_see_tab: a_term_see_tab,
        term_see_codes: a_term_see_codes,
        term_see: a_term_see,
        term_nemod: a_term_nemod,
        term_codes: a_term_codes,
        term_code: a_term_code,
        term_level: a_term_level,
      });
      //////////////////////////

      ///////////////////////////

    };//for


    this.build_edges(g);
    this.build_nodes(g)
    //this.insert_children_to_template(g);
    return g;

  };
  /////////////////////
  /************************************ */
  /////////////////////////000001

  build_nodes(graph) {

    graph.forEachNode((node, attributes) => {
      let template_i = this.insert_nodes_to_template(graph, node, attributes);

    })//graph

    /*
      let nested_data =  nest(injury_template)
          console.log("NESTED DATA " + JSON.stringify(nested_data) )
    */
    console.log("-----------------------")
    set_json_graph(graph)
    //console.log("JSON GRAPH " +  JSON.stringify(json_graph ) )
    console.log("-----------------------")

    nested_data = d3.nest()
      .key(function (d) { return d.term_level; }).sortKeys(d3.ascending)
      .entries(injury_template);

    return nested_data;
    ///////////////////////////////

    //////////////////////////
  };//build_nodes
  /////////////////////

  get_parent(term_level) {
    let parent = "";
    for (let i = 0; i < parent_child_template.length; i++) {
      let template_i = parent_child_template[i];
      if (template_i["term_level"] == term_level) {

        this.parent = template_i["parent"];

      };//if
    };//for

    return this.parent;

  }
  /////////////////////////////


  get_children(term_level) {
    //console.log("term_level-------> " + term_level);
    let children = [];
    for (let i = 0; i < parent_child_template.length; i++) {
      let template_i = parent_child_template[i];
      if (template_i["term_level"] == term_level) {
        children.push(template_i["children"]);
      };//if
    };//for
    //console.log("term_level children -------> " + children);
    return children
  }/////
  ///////////////////////////





  insert_children_to_template(graph) {

    graph.forEachNode((node, attributes) => {
      let all_children = []

      let term_level = attributes["term_level"]
      let child = this.get_children(term_level);

      if (graph.hasNode(child)) {

        let children_attr = graph.getNodeAttributes(Number(child))

        ////////////////////////////
        for (let i = 0; i < injury_template.length; i++) {
          let template_i = injury_template[i];

          if (template_i["id"] == node) {
            all_children.push(children_attr)

          };//if template_i
          ///   injury_template.push(["children" + this.all_children ])


        };//for
        //console.log("CHILDREN " + JSON.stringify( children_attr ) + " " + node );
        //////////////////////////////////
        // injury_template.push({ "children": children_attr } );
        injury_template.push(["children" + all_children])
      };//if graph

    });//graph.forEach


  }

  /////////////////////////////
  insert_nodes_to_template(graph, node, attributes) {
    let parent = this.get_parent(attributes["term_level"])


    let a_node = {
      id: node,
      term_level: attributes["term_level"],
      term_code: attributes["term_code"],
      term_title: attributes["term_title"],
      term_see_tab: attributes["term_see_tab"],
      term_see_codes: attributes["term_see_codes"],
      term_see: attributes["term_see"],
      term_nemod: attributes["term_nemod"],
      term_level: attributes["term_level"],
      term_codes: attributes["term_codes"],
      term_code: attributes["term_code"],
      parent: parent
    };//an_item 


    injury_template.push(a_node);



    /*
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
  
    */





  };//insert_to_template



  build_edges(graph) {

    graph.forEachNode((node, attributes) => {
      let all_edges = this.set_edge(graph, node);

    });//graph.forEach
    //////////////////////////////////////////////
    /*
        let data_a = graph.forEachEdge(
         (
             edge,
             attributes,
             source,
             target,
             sourceAttributes,
             targetAttributes,
         ) => {
     
             let data_i = {
                 name: target,
                 parent: source,
                 attributes: targetAttributes
                 //children: targetAttributes
             };
     
             injury_template.push(data_i);
         },
     );
     
     let dataMap = injury_template.reduce(function (map, node) {
       map[node.name] = node;
       return map;
     }, {});
     
      injury_template.forEach(function (node) {
       // add to parent
       let parent = dataMap[node.parent];
       if (parent) {
           // create child array if it doesn't exist
           parent.children || (parent.children = []);
           // add node to child array
           parent.children.push(node);
       } else {
           // parent is null or missing
           nested_data.push(node);
     
       }
       console.log("NESTED DATA" + JSON.stringify(nested_data ))
       return nested_data[0]
     
     
     });
    */
    /////////////////////////////////


    //////////////////////////
  };//buiild edges
  /////////////////////////////////

  ////////////////////////
  set_edge(graph, source) {

    let current_level = graph.getNodeAttribute(source, "term_level");

    let next_level = Number(current_level) + 1;


    graph.forEachNode((node, attributes) => {
      let term_level = attributes["term_level"]


      if (term_level == next_level) {
        let target = node;


        if (typeof target !== 'undefined' && target) {
          let key = term_level + next_level + source + "_" + target;
          let edge = graph.addEdgeWithKey(key, source, target);
          let a_link = { "source": source, "target": target }
          links.push(a_link)
          // let edge = graph.mergeEdgeWithKey(key, source, target);

          ////////////////////////////////////////////////////////////////


        };//if typeof

      };//if term_level


    });//forEachNode


    return graph;


  };//func set edge

  /*************************************/


};//class Data_graph


///////////////////////////

/////////////////////////////
class Prep_data {

  constructor() {
    this.g = new Data_graph();

  };//constructor

  start() {
    let graph = this.g.set_graph();


    // console.log(" INJURY TEMPLATE: "
    //   + JSON.stringify(injury_template)
    //   + " length " + injury_template.length)

    //  console.log("NODES DATA: "+JSON.stringify(nodes_data) + " length " + nodes_data.length)
    /*
    console.log("***********************************");
    console.log("Graph type: " +  graph.type)
    console.log("Graph Nodes: " + graph.nodes())
  
   
    console.log('Order Of Graph: '+ graph.order);
  
    
    console.log("-----start ---edges---------------------------");
  */
    /*
        console.log("----------end edges ----------------------");
        graph.forEachEdge(
          (edge, attributes, source, target, sourceAttributes, targetAttributes) => {
            console.log(`Edge from ${source} to ${target}`)
            console.log(`sourceAttributes  ${JSON.stringify(sourceAttributes)} 
                targetAttributes  ${JSON.stringify(targetAttributes)}`)
          });
        console.log('Size: Number of edges in the graph ' + graph.size);
        console.log("----------end edges ----------------------");
    */
    /*
        
         graph.forEachNode((node, attributes) => {
            console.log(" NODE----------- ID "+JSON.stringify(node) + 
            "ATTRIBUTES " + JSON.stringify(attributes))
           //console.log(`node attributes ${node} to ${attributes}`);
            });
        
      */





  }




  feed_elements(element) {

    let terms = {
      "term_use": element["terms_use"],
      "term_title": element["terms_title"],
      "term_see_tab": element["term_see_tab"],
      "term_see_codes": element["term_see_codes"],
      "term_see": element["term_see"],
      "term_nemod": element["term_nemod"],
      "term_level": element["term_level"],
      "term_codes": element["term_codes"],
      "term_code": element["term_code"]
    };//terms

    return terms;


  };//feed_elements
  ///////////////////////
};//class Prep_data
/////////////////////
////////////////////////////////////////
class Main_tree {
  constructor(vis) {
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
            let tree = new Main_tree(vis);
            let draw = new Draw()
            draw.diagram(vis);
            //draw.prototype(vis);
          }
        }, //click
      ); //click
    } //if draw_div




  }//make_button    

}//class Interface_buttons
///////////////////////////
class Utils {
  constructor() {

  };//constructor
  /////////////////////////////
  convert(namesArray) {
    let result = {};
    let nestedObj = result;
    namesArray.forEach(name => {
      nestedObj[name] = {};
      nestedObj = nestedObj[name];
    });

    return result;
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





  unflatten(arr) {
    var tree = [],
      mappedArr = {},
      arrElem,
      mappedElem;

    // First map the nodes of the array to an object -> create a hash table.
    for (var i = 0, len = arr.length; i < len; i++) {
      arrElem = arr[i];
      mappedArr[arrElem.id] = arrElem;
      mappedArr[arrElem.id]['children'] = [];
    }


    for (var id in mappedArr) {
      if (mappedArr.hasOwnProperty(id)) {
        mappedElem = mappedArr[id];
        // If the element is not at the root level, add it to its parent array of children.
        if (mappedElem.parentid) {
          mappedArr[mappedElem['parentid']]['children'].push(mappedElem);
        }
        // If the element is at the root level, add it to first level elements array.
        else {
          tree.push(mappedElem);
        }
      }
    }
    return tree;
  }



  create_tree(arr, topItem = "Top") {
    const node = (name, parent = null) => ({
      name,
      parent,
      children: []
    });

    const addNode = (parent, child) => {
      parent.children.push(child);

      return child;
    };
    const findNamedNode = (name, parent) => {
      for (const child of parent.children) {
        if (child.name === name) {
          return child
        }
        const found = findNamedNode(name, child);
        if (found) {
          return found
        }
      }
    };

    const top = node(topItem);
    let current;

    for (const children of arr) {
      current = top;
      for (const name of children) {
        const found = findNamedNode(name, current);
        current = found ? found : addNode(current, node(name, current.name));
      }
    }

    return top;
  }


  nested_array_to_json(structure) {
    const top_item = '0';

    let data = {
      children: [
        {
          name: top_item,
          parent: null,
          children: [],
        }],
    };

    for (let i = 0; i < structure.length; i++) {
      let parents = [top_item];
      for (let j = 0; j < structure[i].length; j++) {
        let obj = data;
        for (parent of parents) {
          obj = obj.children.find(o => o.name === parent);
        }
        const name = structure[i][j];
        if (!obj.children.find(o => o.name === name)) {
          obj.children.push({
            name,
            parent,
            children: [],
          });
        }
        parents.push(structure[i][j]);
      }
    }

    return data.children[0];
  }
  ///////////////////////////
  memoize(node) {
    let root = { children: [] };

    var i = node.term_level.lastIndexOf("."),
      p = i < 0 ? root : memoize({
        term_level: node.term_level.substring(0, i),
        children: []
      }),
      n = p.children.length;
    for (i = -1; ++i < n;) {
      if (p.children[i].term_level === node.term_level) {
        return p.children[i];
      }
    }
    p.children.push(node);
    return node;
  }


};//class
/////////////////////
const draw_external_init = () => {

  const main = new Interface_buttons();

};

draw_external_init();
