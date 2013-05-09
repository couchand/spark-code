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

margin = 1

module.exports = (files, container) ->
    files = [files] unless files[0] instanceof Array

    cd = []
    cr = []
    for type, color of colors
      cd.push type
      cr.push color

    color = d3.scale.ordinal()
        .domain(cd)
        .range(cr)

    svg = container.selectAll("svg")
        .data(files)
        .enter().append("svg")
        .attr("width", (d) -> 2*margin + d3.max d, (l) -> l.length)
        .attr("height", (d) -> 2*margin + d.length)
        .append("g")
        .attr("transform", "translate(#{margin},#{margin})")

    path = svg.selectAll(".line")
        .data((d) -> d)
        .enter().append("path")
        .classed("line", -> yes)
        .attr("stroke", (d) -> color d.type)
        .attr "d", (d, i) ->
          "m #{d.indent} #{i} l #{d.indent + d.length} 0"
