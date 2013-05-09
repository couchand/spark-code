# spark-code viz

# expects lines to be in order and of the form
#   indent: num
#   length: num
#   type: str

module.exports = (lines, svg) ->

    color = d3.scale.ordinal()
        .domain(['function', 'conditional', 'repeat', 'statement'])
        .range(['#7e4', '#cb3', '#e54', '#39d'])

    path = svg.selectAll(".line")
        .data(lines)
        .enter().append("path")
        .classed("line", -> yes)
        .attr("stroke", (d) -> color d.type)
        .attr "d", (d, i) ->
          "m #{d.indent} #{i} l #{d.indent + d.length} 0"
