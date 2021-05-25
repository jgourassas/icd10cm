export class Background_grid {
  constructor() {}


  set_grid(group) {

    let pattern = group.append('defs')
      .append('pattern')
      .attr('id', 'grid_pattern')
      .attr('patternUnits', 'userSpaceOnUse')
      .attr('width', 20)
      .attr('height', 20);

    pattern.append("rect")
      .attr("width", 20)
      .attr("height", 20)
      //.style("fill",  '#fff')
      .style("fill", "none")
      .style('stroke', '#fff')
      .style('stroke-width', 1);

    let grid = group.append("rect")
      .attr('id', 'big_grid_rect')
      .attr("x", 5)
      .attr('y', 0)
      .attr('rx', 5)
      .attr('ry', 5)
      .attr("width", "100%")
      .attr("height", '100%')
      .attr('fill', 'url(#grid_pattern)')
      .style('stroke', 'orange')
      .style('stroke-width', 1)
      .style("opacity", 0.2)
    //console.log("selection: "
    //    + JSON.stringify(grid))

    return grid;

  }; //set grid)

}; //class background_grid