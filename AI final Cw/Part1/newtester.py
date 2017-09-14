from newimplemement import *

# for problem 1 and 3

#start of robot1
start1 = (0,0)
goal1 = (6,2)

#start of robot2
start2 = (6,4)
goal2 = (2,0)

#implementing A* search on robot1
diagram4.walls.append(start2)
came_from, cost_so_far1 = a_star_search(diagram4, (0, 0), (6, 2))
start2 = diagram4.walls.pop(-1) #To remove start2 from the end of the stack

draw_grid(diagram4, width=3, point_to=came_from, start1=(0, 0), goal1=(6, 2))
print()
draw_grid(diagram4, width=3, number=cost_so_far1, start1=(0, 0), goal1=(6, 2))
print()
path1=reconstruct_path(came_from, start=(0, 0), goal=(6, 2))
draw_grid(diagram4, width=3, path1=path1)

print()
#implementing A* search on robot2

diagram4.walls.append(goal1)
came_from, cost_so_far2 = a_star_search(diagram4, (6, 4), (2, 0))
goal1 = diagram4.walls.pop(-1)

draw_grid(diagram4, width=3, point_to=came_from, start2=(6, 4), goal2=(2, 0))
print()
draw_grid(diagram4, width=3, number=cost_so_far2, start2=(6, 4), goal2=(2, 0))
print()
path2=reconstruct_path(came_from, start=(6, 4), goal=(2, 0))
draw_grid(diagram4, width=3,path2=path2)
print()
draw_grid(diagram4,width=3,path1=path1,path2=path2)
print()
print("Heuristics of R1:",( heuristic(start1,goal1)))
print("Heuristics of R2:",(heuristic(start2,goal2)))

print("Cost of R1:",(cost_so_far1[goal1]))
print("Cost of R2:",(cost_so_far2[goal2]))

print ("The path robot one takes:",path1)
print ("The path robot two takes:",path2)

print("Euclidean Heuristics from the start to the goal")
print("Heuristics of R1:",( heuristic1(start1,goal1)))
print("Heuristics of R2:",( heuristic1(start2,goal2)))


#problem2

"""#start of robot1
start1 = (0,4)
goal1 = (5,2)

#start of robot2
start2 = (4,3)
goal2 = (2,0)

#implementing A* search on robot1
diagram4.walls.append(start2)
came_from, cost_so_far1 = a_star_search(diagram4, (0, 4), (5, 2))
start2 = diagram4.walls.pop(-1) #To remove start2 from the end of the stack

draw_grid(diagram4, width=3, point_to=came_from, start1=(0, 4), goal1=(5, 2))
print()
draw_grid(diagram4, width=3, number=cost_so_far1, start1=(0, 4), goal1=(5, 2))
print()
path1=reconstruct_path(came_from, start=(0, 4), goal=(5, 2))
draw_grid(diagram4, width=3, path1=path1)

print()
#implementing A* search on robot2

diagram4.walls.append(goal1)
came_from, cost_so_far2 = a_star_search(diagram4, (4, 3), (2, 0))
goal1 = diagram4.walls.pop(-1)

draw_grid(diagram4, width=3, point_to=came_from, start2=(4, 3), goal2=(2, 0))
print()
draw_grid(diagram4, width=3, number=cost_so_far2, start2=(4, 3), goal2=(2, 0))
print()
path2=reconstruct_path(came_from, start=(4, 3), goal=(2, 0))
draw_grid(diagram4, width=3,path2=path2)
print()
draw_grid(diagram4,width=3,path1=path1,path2=path2)
print()
print("Heuristics of R1:",( heuristic(start1,goal1)))
print("Heuristics of R2:",(heuristic(start2,goal2)))

print("Cost of R1:",(cost_so_far1[goal1]))
print("Cost of R2:",(cost_so_far2[goal2]))

print ("The path robot one takes:",path1)
print ("The path robot two takes:",path2)

print("Euclidean Heuristics from the start to the goal")
print("Heuristics of R1:",( heuristic1(start1,goal1)))
print("Heuristics of R2:",( heuristic1(start2,goal2)))"""

#problem4
"""#start of robot1
start1 = (5,0)
goal1 = (7,5)

#start of robot2
start2 = (9,4)
goal2 = (2,2)

#implementing A* search on robot1
diagram4.walls.append(start2)
came_from, cost_so_far1 = a_star_search(diagram4, (5, 0), (7, 5))
start2 = diagram4.walls.pop(-1) #To remove start2 from the end of the stack

draw_grid(diagram4, width=3, point_to=came_from, start1=(5, 0), goal1=(7, 5))
print()
draw_grid(diagram4, width=3, number=cost_so_far1, start1=(5, 0), goal1=(7, 5))
print()
path1=reconstruct_path(came_from, start=(5, 0), goal=(7, 5))
draw_grid(diagram4, width=3, path1=path1)

print()
#implementing A* search on robot2

diagram4.walls.append(goal1)
came_from, cost_so_far2 = a_star_search(diagram4, (9, 4), (2, 2))
goal1 = diagram4.walls.pop(-1)

draw_grid(diagram4, width=3, point_to=came_from, start2=(9, 4), goal2=(2, 2))
print()
draw_grid(diagram4, width=3, number=cost_so_far2, start2=(9, 4), goal2=(2, 2))
print()
path2=reconstruct_path(came_from, start=(9, 4), goal=(2, 2))
draw_grid(diagram4, width=3,path2=path2)
print()
draw_grid(diagram4,width=3,path1=path1,path2=path2)
print()
print("Heuristics of R1:",( heuristic(start1,goal1)))
print("Heuristics of R2:",(heuristic(start2,goal2)))

print("Cost of R1:",(cost_so_far1[goal1]))
print("Cost of R2:",(cost_so_far2[goal2]))

print ("The path robot one takes:",path1)
print ("The path robot two takes:",path2)

print("Euclidean Heuristics from the start to the goal")
print("Heuristics of R1:",( heuristic1(start1,goal1)))
print("Heuristics of R2:",( heuristic1(start2,goal2)))"""

