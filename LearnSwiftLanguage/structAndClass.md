1. Struct automatically provide init function to init all the instance(we don't need to write the function by ourselves). However it doesn't provide copy init function like C++.
2. Struct and Enum are `value type` which means Swift copy their value instead of using reference while using as parameters of function. Besides struct are father of other common type like Int, String, Arrays, etc.
3. Class is `Reference Type`, it's not copied when assigned to new variable or passed to function. It's like simple pointers in C++.
 
