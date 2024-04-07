from dijkstar import Graph, find_path

INP = ['a','b','s']
OUT = ['w3']
PATH = [
    {
        'in': 'w1',
        'out': 'w3',
        'delay': 4
    },
    {
        'in': 'w2',
        'out': 'w3',
        'delay': 4
    },
    {
        'in': 'a',
        'out': 'w1',
        'delay': 3
    },
    {
        'in': 'w4',
        'out': 'w1',
        'delay': 3
    },
    {
        'in': 's',
        'out': 'w4',
        'delay': 2
    },
    {
        'in': 's',
        'out': 'w2',
        'delay': 3
    },
    {
        'in': 'b',
        'out': 'w2',
        'delay': 3
    },
]
    

def create_path_str(nodes):
    way = list()
    for i in nodes:
        way.append(i)
    way.reverse()
    output = str()
    for i in way:
        output += str(i) + " -> "
    output = output[:-3]
    return str(output)

def print_output(worst_path):
    print("worst case:", -worst_path.total_cost)
    print("path:", create_path_str(worst_path.nodes))

def main(path = PATH, inp = INP, out = OUT):

    # create graph
    graph = Graph ()
    for i in path:
        graph.add_edge(i['out'], i['in'], -i['delay'])

    # create all path
    paths = list()
    for i in inp:
        for j in out:
            paths.append(find_path(graph, j, i))

    # find max path
    max_path = paths[0]
    for i in paths:
        if -max_path.total_cost < -i.total_cost:
            max_path = i

    print_output(max_path)
    
if __name__ == "__main__":
    main()