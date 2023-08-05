# THE-VERSION-TREE
I worked with tree structures. The case study that I consider is a generic version tree that can be used to record different versions of software. The version control system can be defined as software that allows you to create versions of elements and be involved in different versions independently from each other. 


charToInt : 
I created a function named charToInt, which takes a numerical character from the user and returns the integer version.

insertNode :
In this part, I'll be adding new versions to my version tree. For this purpose, a node will be created from a given 
string and will be inserted to the existing Tree. After the insertion, the function should return the new tree. If the given 
position is already occupied, the function should show NodeExists in the terminal. If the given position is not reachable 
at all, the function should show NotReachable in the terminal.

*leftSide = Node "MyApp.1" (Node "MyApp.1.1" Empty Empty Empty) (Node "MyApp.1.2" Empty Empty 
Empty) Empty*
*midSide = Node "MyApp.2" Empty Empty Empty*
*rightSide = Node "MyApp.3" (Node "MyApp.3.1" (Node "MyApp.3.1.1" Empty Empty Empty) Empty (Node 
"MyApp.3.1.3" Empty Empty Empty) ) (Node "MyApp.3.2" Empty Empty Empty) (Node "MyApp.3.3" Empty Empty 
Empty)*
*figureOne = Node "MyApp" leftSide midSide rightSide*

totalNodes :
In this part, the total number of nodes of a given tree will be calculated.

height :
In this function, the height of a given tree will be calculated. Assume that we have leftSide, midSide, rightSide, figureOne.

levelcounnt :
The number of nodes in a specific level will be computed. 

findNode :
I will be searching for the given String inside the given Tree. If the value is found, the function should 
return the whole Node with its children, if not it should show NodeNotFound in the terminal.
