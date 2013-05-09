# spark-code viz

# expects lines to be in order and of the form
#   indent: num
#   length: num
#   type: str

colors =
  function:     "#37e36f"
  conditional:  "#ffb073"
  repeat:       "#ff8973"
  statement:    "#67d4e2"

module.exports = (lines, svg) ->

    cd = []
    cr = []
    for type, color of colors
      cd.push type
      cr.push color

    color = d3.scale.ordinal()
        .domain(cd)
        .range(cr)

    path = svg.selectAll(".line")
        .data(lines)
        .enter().append("path")
        .classed("line", -> yes)
        .attr("stroke", (d) -> color d.type)
        .attr "d", (d, i) ->
          "m #{d.indent} #{i} l #{d.indent + d.length} 0"
