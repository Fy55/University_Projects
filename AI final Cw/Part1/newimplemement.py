# Sample code from http://www.redblobgames.com/pathfinding/
# Copyright 2014 Red Blob Games <redblobgames@gmail.com>
#
# Feel free to use this code in your own projects, including commercial projects
# License: Apache v2.0 <http://www.apache.org/licenses/LICENSE-2.0.html>

class SimpleGraph:
    def __init__(self):
        self.edges = {}
    
    def neighbors(self, id):
        return self.edges[id]

example_graph = SimpleGraph()
example_graph.edges = {
    'A': ['B'],
    'B': ['A', 'C', 'D'],
    'C': ['A'],
    'D': ['E', 'A'],
    'E': ['B']
}

import collections

class Queue:
    def __init__(self):
        self.elements = collections.deque()
    
    def empty(self):
        return len(self.elements) == 0
    
    def put(self, x):
        self.elements.append(x)
    
    def get(self):
        return self.elements.popleft()

# utility functions for dealing with square grids
def from_id_width(id, width):
    return (id % width, id // width)

def draw_tile(graph, id, style, width):
    r = "."
    n=0
    n = n+1
    if 'number' in style and id in style['number']: r = "%d" % style['number'][id]
    if 'point_to' in style and style['point_to'].get(id, None) is not None:
        (x1, y1) = id
        (x2, y2) = style['point_to'][id]
        if x2 == x1 + 1: r = "\u2192"
        if x2 == x1 - 1: r = "\u2190"
        if y2 == y1 + 1: r = "\u2193"
        if y2 == y1 - 1: r = "\u2191"
    if 'start1' in style and id == style['start1']: r = "R1"
    if 'goal1' in style and id == style['goal1']: r = "G1"
    if 'start2' in style and id == style['start2']: r = "R2"
    if 'goal2' in style and id == style['goal2']: r = "G2"
    if 'path1' in style and id in style['path1']: r = "@"
    if 'path2' in style and id in style['path2']: r = "*"
    if id in graph.walls: r = "#" 
    if id in graph.traps: r = "T"
    return r
    
    
def draw_grid(graph, width=2, **style):
    for y in range(graph.height):
        for x in range(graph.width):
            print("%%-%ds" % width % draw_tile(graph, (x, y), style, width), end="")
        print()

# data from main article
DIAGRAM1_WALLS = [from_id_width(id, width=30) for id in [21,22,51,52,81,82,93,94,111,112,123,124,133,134,141,142,153,154,163,164,171,172,173,174,175,183,184,193,194,201,202,203,204,205,213,214,223,224,243,244,253,254,273,274,283,284,303,304,313,314,333,334,343,344,373,374,403,404,433,434]]

 
    

class SquareGrid:
    def __init__(self, width, height):
        self.width = width
        self.height = height
        self.walls = []
        self.traps = []
        self.Robot1path = [(5,1)]     
        #self.Robot1path = [(5,3),(6,4),(6,3),(7,2)] #problem4
      
        
    
    def in_bounds(self, id):
        (x, y) = id
        return 0 <= x < self.width and 0 <= y < self.height
    
    def passable(self, id):
        return id not in self.walls
        

    def dodge(self, id):
        return id not in self.Robot1path
        return self.Robot1path
    
    def neighbors(self, id):
        (x, y) = id
        results = [(x+1, y), (x, y-1), (x-1, y), (x, y+1)]
        if (x + y) % 2 == 0: results.reverse() # aesthetics
        results = filter(self.in_bounds, results)
        results = filter(self.passable, results)
        results = filter(self.dodge, results)
        return results

class GridWithWeights(SquareGrid):
    def __init__(self, width, height):
        super().__init__(width, height)
        self.weights = {}
        self.traps = {}
    
    def cost(self, from_node, to_node): 
        if to_node in self.traps:
            return self.weights.get(to_node, 5)
        return self.weights.get(to_node, 1)
        


#original problem
   
diagram4 = GridWithWeights(8, 5)
diagram4.walls = [(0, 2),(3,1),(4,1),(2,4),(2,6),(2,8),(3,3),(3,4),(5,3),(7,3)]
diagram4.traps = [(3,2)]

#problem2 :different starting location for each robot
"""diagram4 = GridWithWeights(8, 5)
diagram4.walls = [(0, 2),(3,1),(4,1),(2,4),(2,6),(2,8),(3,3),(3,4),(5,3),(7,3)]
diagram4.traps = [(3,2)]"""

#problem3: different wall configurations
"""diagram4 = GridWithWeights(8, 5)
diagram4.walls = [(0, 1),(2,1),(2,2),(4,1),(3,2),(4,3),(5,3),(6,3)]
diagram4.traps = [(3,2)]"""

#problem4
"""diagram4 = GridWithWeights(10, 10)
diagram4.walls = [(1, 6), (1, 9), (2, 4), (2, 6), (7, 6), (3, 3), (9, 5)]
diagram4.traps = [(1, 5), (3, 4), (4, 9)] """

import heapq

class PriorityQueue:
    def __init__(self):
        self.elements = []
    
    def empty(self):
        return len(self.elements) == 0
    
    def put(self, item, priority):
        heapq.heappush(self.elements, (priority, item))
    
    def get(self):
        return heapq.heappop(self.elements)[1]


def reconstruct_path(came_from, start, goal):
    current = goal
    path = [current]
    while current != start:
        current = came_from[current]
        path.append(current)
    path.append(start) # optional
    path.reverse() # optional
    return path


def heuristic(a, b):
    (x1, y1) = a
    (x2, y2) = b
    return abs(x1 - x2) + abs(y1 - y2)

#eucliedean Heuristic
#import  numpy as np
import math

def heuristic1(a,b):
    (x1, y1) = a
    (x2, y2) = b
    
    #return np.sqrt((x2-x1)*(x2-x1) + (y2-y1)*(y2-y1) )
    return math.sqrt((x2-x1)*(x2-x1) + (y2-y1)*(y2-y1) )
    
def a_star_search(graph, start, goal):
    frontier = PriorityQueue()
    frontier.put(start, 0)
    came_from = {}
    cost_so_far = {}
    came_from[start] = None
    cost_so_far[start] = 0
    
    while not frontier.empty():
        current = frontier.get()
        
        if current == goal:
            break
        
        for next in graph.neighbors(current):
            new_cost = cost_so_far[current] + graph.cost(current, next)
            if next not in cost_so_far or new_cost < cost_so_far[next]:
                cost_so_far[next] = new_cost
                priority = new_cost + heuristic(goal, next)
                frontier.put(next, priority)
                came_from[next] = current
    
    return came_from, cost_so_far

def a_star_search(graph, start, goal):
    frontier = PriorityQueue()
    frontier.put(start, 0)
    came_from = {}
    cost_so_far = {}
    came_from[start] = None
    cost_so_far[start] = 0
    
    while not frontier.empty():
        current = frontier.get()
        
        if current == goal:
            break
        
        for next in graph.neighbors(current):
            new_cost = cost_so_far[current] + graph.cost(current, next)
            if next not in cost_so_far or new_cost < cost_so_far[next]:
                cost_so_far[next] = new_cost
                priority = new_cost + heuristic1(goal, next)
                frontier.put(next, priority)
                came_from[next] = current
    
    return came_from, cost_so_far

