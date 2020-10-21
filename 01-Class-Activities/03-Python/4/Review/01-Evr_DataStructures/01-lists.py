# Create a variable and set it as an List
myList = ["Jacob", 25, "Ahmed", 80, True]
print(myList)

# Adds an element onto the end of a List
myList.append("Matt")
print(myList)

# Returns the index of the first object with a matching value
print(myList.index("Matt"))

# Changes a specified element within an List at the given index
myList[3] = "Heather"
print(myList)

# Returns the length of the List
print(len(myList))

# Removes a specified object from an List
myList.remove("Matt")
myList.remove("Heather")
print(myList)

# Removes the object at the index specified
myList.pop(0)
myList.pop(0)
print(myList)