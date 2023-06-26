# Exceptions

Python 3 defines **63 built-in exceptions**, and all of them form a **tree-shaped hierarchy**, although the tree is a bit weird as its root is located on top.

Some of the built-in exceptions are more general (they include other exceptions) while others are completely concrete (they represent themselves only). We can say that **the closer to the root an exception is located, the more general (abstract) it is**. In turn, the exceptions located at the branches' ends (we can call them **leaves**) are concrete.

Take a look at the figure:

![Tree-shaped hierarchy of selected exceptions](https://edube.org/uploads/media/default/0001/01/0ee75473d85349d36925771423976c94c08ddbf1.png)  
  

It shows a small section of the complete exception tree. Let's begin examining the tree from the ZeroDivisionError leaf.

Note:

- ZeroDivisionError is a special case of more a general exception class named ArithmeticError;
- ArithmeticError is a special case of a more general exception class named just Exception;
- Exception is a special case of a more general class named BaseException;

We can describe it in the following way (note the direction of the arrows - they always point to the more general entity):

BaseException  
↑  
Exception  
↑  
ArithmeticError  
↑  
ZeroDivisionError

  

We're going to show you how this generalization works. Let's start with some really simple code.