--  BARIS AYDINAY 2452977
--  I read and accept the submission rules and the extra rules. This is my own work that is done by myself only.

--DO NOT FORGET TO CHANGE THE NAME OF THE FILE WITH YOUR OWN STUDENTID!

--Your data, you can expand or do changes on the Tree if necessary. Do not change the included names
--You must at least complete the Node according to the given explanation.

data TernaryTree = Empty | Node [Char] TernaryTree TernaryTree TernaryTree | NotReachable | NodeExists | NodeNotFound deriving (Show, Eq, Ord, Read) -- I added error sentences which is in data TernaryTree


--Part One
charToInt :: Char->Int
charToInt '1' = 1
charToInt '2' = 2
charToInt '3' = 3
charToInt '4' = 4
charToInt '5' = 5
charToInt '6' = 6
charToInt '7' = 7
charToInt '8' = 8
charToInt '9' = 9
charToInt '0' = 0


--Part Two
insertNode::TernaryTree->[Char]->TernaryTree        
                                                   
helper1 ndex x = x!!ndex -- This function simply gets the desired char in the string by index


leftSide = Node "MyApp.1" (Node "MyApp.1.1" Empty Empty Empty) (Node "MyApp.1.2" Empty Empty Empty) Empty
midSide = Node "MyApp.2" Empty Empty Empty
rightSide = Node "MyApp.3" (Node "MyApp.3.1" (Node "MyApp.3.1.1" Empty Empty Empty) Empty (Node"MyApp.3.1.3" Empty Empty Empty))(Node "MyApp.3.2" Empty Empty Empty) (Node "MyApp.3.3" Empty Empty Empty)
figureOne = Node "MyApp" leftSide midSide rightSide

treeOne = Node "Zamzung SolarSystem" (Node "Zamzung SolarSystem.1" Empty Empty Empty) (Node "Zamzung SolarSystem.2" Empty Empty Empty) (Node "Zamzung SolarSystem.3" Empty Empty Empty)
treeTwo = Node "Pear kOS" (Node "Pear kOS.1" Empty (Node "Pear kOS.1.2" Empty Empty (Node "Pear kOS.1.2.3" Empty Empty Empty)) Empty) Empty (Node "Pear kOS.3" (Node "Pear kOS.3.1" Empty Empty Empty) Empty Empty)
treeThree = Node "Suum" Empty (Node "Suum.2" (Node "Suum.2.1" Empty (Node "Suum.2.1.2" Empty Empty Empty) (Node "Suum.2.1.3" (Node "Suum.2.1.3.1" Empty Empty Empty) Empty Empty)) (Empty) (Node "Suum.2.3" Empty Empty Empty)) (Node "Suum.3" Empty (Node "Suum.3.2" (Node "Suum.3.2.1" Empty Empty (Node "Suum.3.2.1.3" Empty (Node "Suum.3.2.1.3.2" Empty Empty Empty) Empty)) Empty (Node "Suum.3.2.3" Empty Empty Empty)) Empty)




-- In second part, I mainly build my algorithms on the length of the strings and made my approches related to it.

insertNode Empty x = Node x Empty Empty Empty        -- Base case                                                
insertNode (Node x leftSide midSide rightSide) y = if (helper (Node x leftSide midSide rightSide) y == 1 && helperReach (Node x leftSide midSide rightSide) y == 1) then (if helper1 ((length x)+1) y == '1' then (Node x (insertNode leftSide y) midSide rightSide) else if helper1 ((length x)+1) y == '3' then (Node x leftSide midSide (insertNode rightSide y)) else (Node x leftSide (insertNode midSide y) rightSide)) 
                                                else if (helper (Node x leftSide midSide rightSide) y == 0) then NodeExists
                                                else NotReachable                                                                                                
                                                                                                
                                                                                                
                                                                                                
helper Empty y = 1                -- This is my first helper function for insertNode, it determines the which way to go by examining the numbers after dots and helps for existence of nodes                                                                
helper (Node x leftSide midSide rightSide) y = if (x/=y) then (if helper1 ((length x)+1) y == '1' then helper leftSide y else if helper1 ((length x)+1) y == '3' then helper rightSide y else helper midSide y) else 0


helperReach Empty y = 1  -- This is my second helper function for insertNode, it helps for reachability
helperReach (Node x leftSide midSide rightSide) y = if helper1 ((length x)+1) y == '1' then (if (length y - length x > 2) && (leftSide == Empty) then 0 else helperReach leftSide y) else if helper1 ((length x)+1) y == '2' then (if (length y - length x > 2) && (midSide == Empty) then 0 else helperReach midSide y) else (if (length y - length x > 2) && (rightSide == Empty) then 0 else helperReach rightSide y)


                                  
--Part Three
totalNodes::TernaryTree->Int

totalNodes Empty = 0 -- Base case 
totalNodes (Node x leftSide midSide rightSide) = 1 + totalNodes leftSide + totalNodes midSide + totalNodes rightSide   -- Recursively adding all the nodes until Empty Tree


--Part Four
height::TernaryTree->Int


height Empty = 0 -- Base case , this function recursively finds the maximum long path throught recursion basically.
height (Node x leftSide midSide rightSide) = 1 + max(height leftSide) (max (height midSide) (height rightSide)) 



--Part Five
levelcount::TernaryTree->Int->Int

dotCounter "" = 0  -- dotCounter is my helper function for levelcount, it simply counts all nodes' dots for level counting since I realized number of dots and levels are basically related
dotCounter (y:ys) = if y == '.' then 1 + dotCounter ys else dotCounter ys 

levelcount Empty y = 0 -- Base case 
levelcount (Node x leftSide midSide rightSide) y = if (dotCounter x == y) then (1 + levelcount leftSide y + levelcount midSide y + levelcount rightSide y)
                                                   else levelcount leftSide y + levelcount midSide y + levelcount rightSide y


--Part Six
findNode::TernaryTree->[Char]->TernaryTree

findNode Empty y = NodeNotFound -- In this algorithm, I proceeded to find the desired node by dividing it, and if I reach Empty before my node is finished, I conclude that this desired node is not in the tree.
findNode (Node x leftSide midSide rightSide) "" = Node x leftSide midSide rightSide 
findNode (Node x leftSide midSide rightSide) (y:ys) = if y == '.' then (if head ys == '1' then findNode leftSide ys else if head ys == '2' then findNode midSide ys else findNode rightSide ys)     
                                                      else findNode (Node x leftSide midSide rightSide) ys
                                                                                                          
                                                 
