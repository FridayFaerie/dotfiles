#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#set text(size:20pt)


#place(horizon+center,image("screenshot.png"))
#place(horizon+center,

diagram(
	spacing: (18mm, 10mm),
	node-stroke: luma(80%),
        node((-20,-20)),
        node((20,20)),


	edge((4,5), (-1,2), "-|>", bend: 32deg, stroke: red, text(red)[I have a worse idea], label-angle: auto)
)
)
