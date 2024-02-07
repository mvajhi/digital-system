from dijkstar import Graph, find_path

def print_output(shortest_path):
    pass

graph = Graph ()
graph.add_edge("w3", "w1",  -4)
graph.add_edge("w3", "w2",  -4)
graph.add_edge("w1", "a",   -3)
graph.add_edge("w1", "w4",  -3)
graph.add_edge("w4", "s",   -2)
graph.add_edge("w2", "s",   -3)
graph.add_edge("w2", "b",   -3)

shortest_path = find_path(graph, "w3", "a")
print(shortest_path)
shortest_path = find_path(graph, "w3", "s")
print(shortest_path)
shortest_path = find_path(graph, "w3", "b")
print(shortest_path)

print(graph)