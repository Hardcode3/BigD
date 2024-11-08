# Java basics

!!! cite
    - [Oracle official website](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/variables.html)

## Variables

### Scopes

The Java programming language defines the following kinds of variables:

- **_Instance Variables (Non-Static Fields)_**: their values are unique to each _instance_ of a class
- **_Member variables_** in a class—these are called _fields_.
- Variables in a method or block of code—these are called **_local variables_**.
- Variables in method declarations—these are called **_parameters_**.

### Naming conventions

!!! tip "In Java, it is a common convention to use uppercase letters for constant variables."

### Primitive data types

The eight primitive data types supported by the Java programming language are:

- **byte**: The `byte` data type is an 8-bit signed two's complement integer. It has a minimum value of -128 and a maximum value of 127 (inclusive). The `byte` data type can be useful for saving memory in large [arrays](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/arrays.html), where the memory savings actually matters. They can also be used in place of `int` where their limits help to clarify your code; the fact that a variable's range is limited can serve as a form of documentation.
- **short**: The `short` data type is a 16-bit signed two's complement integer. It has a minimum value of -32,768 and a maximum value of 32,767 (inclusive). As with `byte`, the same guidelines apply: you can use a `short` to save memory in large arrays, in situations where the memory savings actually matters.
- **int**: By default, the `int` data type is a 32-bit signed two's complement integer, which has a minimum value of -231 and a maximum value of 231-1. In Java SE 8 and later, you can use the `int` data type to represent an unsigned 32-bit integer, which has a minimum value of 0 and a maximum value of 232-1. Use the Integer class to use `int` data type as an unsigned integer. See the section The Number Classes for more information. Static methods like `compareUnsigned`, `divideUnsigned` etc have been added to the [`Integer`](https://docs.oracle.com/javase/8/docs/api/java/lang/Integer.html) class to support the arithmetic operations for unsigned integers.
- **long**: The `long` data type is a 64-bit two's complement integer. The signed long has a minimum value of -263 and a maximum value of 263-1. In Java SE 8 and later, you can use the `long` data type to represent an unsigned 64-bit long, which has a minimum value of 0 and a maximum value of 264-1. Use this data type when you need a range of values wider than those provided by `int`. The [`Long`](https://docs.oracle.com/javase/8/docs/api/java/lang/Long.html) class also contains methods like `compareUnsigned`, `divideUnsigned` etc to support arithmetic operations for unsigned long.
- **float**: The `float` data type is a single-precision 32-bit IEEE 754 floating point. Its range of values is beyond the scope of this discussion, but is specified in the [Floating-Point Types, Formats, and Values](https://docs.oracle.com/javase/specs/jls/se7/html/jls-4.html#jls-4.2.3) section of the Java Language Specification. As with the recommendations for `byte` and `short`, use a `float` (instead of `double`) if you need to save memory in large arrays of floating point numbers. This data type should never be used for precise values, such as currency. For that, you will need to use the [java.math.BigDecimal](https://docs.oracle.com/javase/8/docs/api/java/math/BigDecimal.html) class instead. [Numbers and Strings](https://docs.oracle.com/javase/tutorial/java/data/index.html) covers `BigDecimal` and other useful classes provided by the Java platform.
- **double**: The `double` data type is a double-precision 64-bit IEEE 754 floating point. Its range of values is beyond the scope of this discussion, but is specified in the [Floating-Point Types, Formats, and Values](https://docs.oracle.com/javase/specs/jls/se7/html/jls-4.html#jls-4.2.3) section of the Java Language Specification. For decimal values, this data type is generally the default choice. As mentioned above, this data type should never be used for precise values, such as currency.
- **boolean**: The `boolean` data type has only two possible values: `true` and `false`. Use this data type for simple flags that track true/false conditions. This data type represents one bit of information, but its "size" isn't something that's precisely defined. 
- **char**: The `char` data type is a single 16-bit Unicode character. It has a minimum value of `'\u0000'` (or 0) and a maximum value of `'\uffff'` (or 65,535 inclusive).

### Literals

#### Integer literals

```java
// The number 26, in decimal
int decVal = 26;
//  The number 26, in hexadecimal
int hexVal = 0x1a;
// The number 26, in binary
int binVal = 0b11010;
```

#### Floating-point literals

```java
double d1 = 123.4;
// same value as d1, but in scientific notation
double d2 = 1.234e2;
float f1  = 123.4f;
```

#### Character and string literals

Always use 'single quotes' for `char` literals and "double quotes" for `String` literals.
The Java programming language also supports a few special escape sequences for `char` and `String` literals:

- `\b` (backspace)
- `\t` (tab)
- `\n` (line feed)
- `\f` (form feed)
- `\r` (carriage return)
- `\"` (double quote)
- `\'` (single quote)
- `\\` (backslash)

#### Null literal

There's also a special `null` literal that can be used as a value for any reference type. `null` may be assigned to any variable, except variables of primitive types. There's little you can do with a `null` value beyond testing for its presence. Therefore, `null` is often used in programs as a marker to indicate that some object is unavailable.

#### Using Underscore Characters in Numeric Literals

The following example shows other ways you can use the underscore in numeric literals:

```java
long creditCardNumber = 1234_5678_9012_3456L;
long socialSecurityNumber = 999_99_9999L;
float pi =  3.14_15F;
long hexBytes = 0xFF_EC_DE_5E;
long hexWords = 0xCAFE_BABE;
long maxLong = 0x7fff_ffff_ffff_ffffL;
byte nybbles = 0b0010_0101;
long bytes = 0b11010010_01101001_10010100_10010010;
```

You can place underscores only between digits; you cannot place underscores in the following places:

- At the beginning or end of a number
- Adjacent to a decimal point in a floating point literal
- Prior to an `F` or `L` suffix
- In positions where a string of digits is expected

The following examples demonstrate valid and invalid underscore placements (which are highlighted) in numeric literals:

```java
// **Invalid: cannot put underscores**
// **adjacent to a decimal point**
float pi1 = 3_.1415F;
// **Invalid: cannot put underscores** 
// **adjacent to a decimal point**
float pi2 = 3._1415F;
// **Invalid: cannot put underscores** 
// **prior to an L suffix**
long socialSecurityNumber1 = 999_99_9999_L;

// OK (decimal literal)
int x1 = 5_2;
// **Invalid: cannot put underscores**
// **At the end of a literal**
int x2 = 52_;
// OK (decimal literal)
int x3 = 5_______2;

// **Invalid: cannot put underscores**
// **in the 0x radix prefix**
int x4 = 0_x52;
// **Invalid: cannot put underscores**
// **at the beginning of a number**
int x5 = 0x_52;
// OK (hexadecimal literal)
int x6 = 0x5_2; 
// **Invalid: cannot put underscores**
// **at the end of a number**
int x7 = 0x52_;
```

### Derived types

#### Strings

In addition to the eight primitive data types listed above, the Java programming language also provides special support for character strings via the [java.lang.String](https://docs.oracle.com/javase/8/docs/api/java/lang/String.html) class. Enclosing your character string within double quotes will automatically create a new `String` object; for example, `String s = "this is a string";`. `String` objects are _immutable_, which means that once created, their values cannot be changed. The `String` class is not technically a primitive data type, but considering the special support given to it by the language, you'll probably tend to think of it as such.

#### Arrays

##### Declaration

```java
// declares an array of integers
int[] anArray;
byte[] anArrayOfBytes;
short[] anArrayOfShorts;
long[] anArrayOfLongs;
float[] anArrayOfFloats;
double[] anArrayOfDoubles;
boolean[] anArrayOfBooleans;
char[] anArrayOfChars;
String[] anArrayOfStrings;
```

##### Creating, initializing and accessing an array

```java
// create an array of integers
anArray = new int[10];
anArray[0] = 100; // initialize first element
anArray[1] = 200; // initialize second element
anArray[2] = 300; // and so forth
System.out.println("Element 1 at index 0: " + anArray[0]);
System.out.println("Element 2 at index 1: " + anArray[1]);
System.out.println("Element 3 at index 2: " + anArray[2]);
System.out.println(anArray.length); // print array length
```

Alternatively, you can use the shortcut syntax to create and initialize an array:

```java
int[] anArray = { 
    100, 200, 300,
    400, 500, 600, 
    700, 800, 900, 1000
};
```

Multidimensional arrays can be created as follows:

```java
String[][] names = {
            {"Mr. ", "Mrs. ", "Ms. "},
            {"Smith", "Jones"}
        };
```

##### Copying arrays

The `System` class has an `arraycopy` method that you can use to efficiently copy data from one array into another:

```java
public static void arraycopy(Object src, int srcPos,
                             Object dest, int destPos, int length)
```

Either manually:

```java
public static void main(String[] args) {
        String[] copyFrom = {
            "Affogato", "Americano", "Cappuccino", "Corretto", "Cortado",   
            "Doppio", "Espresso", "Frappucino", "Freddo", "Lungo", "Macchiato",      
            "Marocchino", "Ristretto" };
        
        String[] copyTo = new String[7];
        System.arraycopy(copyFrom, 2, copyTo, 0, 7);
        for (String coffee : copyTo) {
            System.out.print(coffee + " ");           
        }
    }
```

Or using the `java.utils.Arrays` class:

```java
public static void main(String[] args) {
        String[] copyFrom = {
            "Affogato", "Americano", "Cappuccino", "Corretto", "Cortado",   
            "Doppio", "Espresso", "Frappucino", "Freddo", "Lungo", "Macchiato",      
            "Marocchino", "Ristretto" };
        
        String[] copyTo = java.util.Arrays.copyOfRange(copyFrom, 2, 9);        
        for (String coffee : copyTo) {
            System.out.print(coffee + " ");           
        }            
    }
```

Some other useful operations provided by methods in the `java.util.Arrays` class are:

- Searching an array for a specific value to get the index at which it is placed (the `binarySearch` method).
- Comparing two arrays to determine if they are equal or not (the `equals` method).
- Filling an array to place a specific value at each index (the `fill` method).
- Sorting an array into ascending order. This can be done either sequentially, using the `sort` method, or concurrently, using the `parallelSort` method introduced in Java SE 8. Parallel sorting of large arrays on multiprocessor systems is faster than sequential array sorting.
- Creating a stream that uses an array as its source (the `stream` method). For example, the following statement prints the contents of the `copyTo` array in the same way as in the previous example:
java.util.Arrays.stream(copyTo).map(coffee -> coffee + " ").forEach(System.out::print);  
See [Aggregate Operations](https://docs.oracle.com/javase/tutorial/collections/streams/index.html) for more information about streams.

- Converting an array to a string. The `toString` method converts each element of the array to a string, separates them with commas, then surrounds them with brackets. For example, the following statement converts the `copyTo` array to a string and prints it:
`System.out.println(java.util.Arrays.toString(copyTo)); `
This statement prints the following:
`[Cappuccino, Corretto, Cortado, Doppio, Espresso, Frappucino, Freddo]`

## Operators

### Operator precedence

| Operators | Precedence |
| ---- | ------ |
| postfix | `_expr_++ _expr_--` |
| unary | `++_expr_ --_expr_ +_expr_ -_expr_ ~ !` |
| multiplicative | `* / %` |
| additive | `+ -` |
| shift | `<< >> >>>` |
| relational | `< > <= >= instanceof` |
| equality | `== !=` |
| bitwise AND | `&` |
| bitwise exclusive OR | `^` |
| bitwise inclusive OR | `\|` |
| logical AND | `&&` |
| logical OR | `\|`|
| ternary | `? :` |
| assignment | `= += -= *= /= %= &= ^= \|= <<= >>= >>>=` |

### Arithmetic operators

|Operator|Description|
|---|---|
|`+`|Additive operator (also used for String concatenation)|
|`-`|Subtraction operator|
|`*`|Multiplication operator|
|`/`|Division operator|
|`%`|Remainder operator|

### Unary operators

|Operator|Description|
|---|---|
|`+`|Unary plus operator; indicates positive value (numbers are positive without this, however)|
|`-`|Unary minus operator; negates an expression|
|`++`|Increment operator; increments a value by 1|
|`--`|Decrement operator; decrements a value by 1|
|`!`|Logical complement operator; inverts the value of a boolean|

### Equality and Relational Operators

Same as C and C++.

### Conditional operators

Same as C and C++.`

### Type Comparison Operator `instanceof`

```java
Parent obj1 = new Parent();
Parent obj2 = new Child();

System.out.println("obj1 instanceof Parent: " + (obj1 instanceof Parent));
System.out.println("obj1 instanceof Child: " + (obj1 instanceof Child));
System.out.println("obj1 instanceof MyInterface: " + (obj1 instanceof MyInterface));
System.out.println("obj2 instanceof Parent: " + (obj2 instanceof Parent));
System.out.println("obj2 instanceof Child: " + (obj2 instanceof Child));
System.out.println("obj2 instanceof MyInterface: " + (obj2 instanceof MyInterface));
```

### Bitwise and bitshift operators

Same as C and C++.

```java
public static void main(String[] args) {
    int bitmask = 0x000F;
    int val = 0x2222;
    // prints "2"
    System.out.println(val & bitmask);
}
```

## Expressions, Statements, and Blocks

### Expressions

> [!info] An _expression_ is a construct made up of variables, operators, and method invocations, which are constructed according to the syntax of the language, that evaluates to a single value.

#### Regular expression

```java
x + 1
```

#### Compound expression

```java
(x + y) / 100
```

### Statements

!!! info "Statements are roughly equivalent to sentences in natural languages. A _statement_ forms a complete unit of execution."

#### Expression statements

- Assignments
- Increments operators
- Method invocation
- Object creation expression

```java
// assignment statement
aValue = 8933.234;
// increment statement
aValue++;
// method invocation statement
System.out.println("Hello World!");
// object creation statement
Bicycle myBike = new Bicycle();
```

#### Declaration statement

Declares a variable.

```java
// declaration statement
double aValue = 8933.234;
```

#### Control flow statements

Controls the order in which the statements get executed.

### Blocks

> [!info] A _block_ is a group of zero or more statements between balanced braces and can be used anywhere a single statement is allowed.

```java
class BlockDemo {
     public static void main(String[] args) {
          boolean condition = true;
          if (condition) { **// begin block 1**
               System.out.println("Condition is true.");
          } **// end block one**
          else { **// begin block 2**
               System.out.println("Condition is false.");
          } **// end block 2**
     }
}
```

## Control flow statements

### If-else statement

Just like C and C++.

```java
if (isMoving)
     currentSpeed--;
```

```java
if (isMoving) {
    currentSpeed--;
} else {
    currentSpeed++;
}
```

```java
if (testscore >= 90) {
    grade = 'A';
} else if (testscore >= 80) {
    grade = 'B';
} else if (testscore >= 70) {
    grade = 'C';
} else if (testscore >= 60) {
    grade = 'D'
} else {
    grade = 'F';
}
```

### Switch statement

Just like C and C++.

```java
 switch (month) {
    case 1:  monthString = "January";
        break;
    case 2:  monthString = "February";
        break;
    case 3:  monthString = "March";
        break;
    default: monthString = "Invalid month";
        break;
}
```

### While and do-while statements

#### While statements

```java
while (count < 11) {
    System.out.println("Count is: " + count);
    count++;
}
```

#### Do-while statements

```java
do {
    System.out.println("Count is: " + count);
    count++;
} while (count < 11);
```

### For statements

```java
for(int i=1; i<11; i++){
    System.out.println("Count is: " + i);
}
```

```java
// infinite loop
for ( ; ; ) {
    
    // your code goes here
}
```

### Break, continue and return statement

!!! info "An unlabeled `break` statement terminates the innermost `switch`, `for`, `while`, or `do-while` statement, but a labeled `break` terminates an outer statement."

#### Break statements

##### Unlabeled `break` statement

```java
for (i = 0; i < arrayOfInts.length; i++) {
    if (arrayOfInts[i] == searchfor) {
        foundIt = true;
            **break;**
    }
}
```

##### Labeled `break` statement

```java
search:
    for (i = 0; i < arrayOfInts.length; i++) {
        for (j = 0; j < arrayOfInts[i].length; j++) {
            if (arrayOfInts[i][j] == searchfor) {
                foundIt = true;
                break search;
            }
        }
    }
```

#### Continue statement

!!! info "The `continue` statement skips the current iteration of a `for`, `while` , or `do-while` loop. The unlabeled form skips to the end of the innermost loop's body and evaluates the `boolean` expression that controls the loop."

##### Unlabeled continue statement

```java
for (int i = 0; i < max; i++) {
    // interested only in p's
    if (searchMe.charAt(i) != 'p')
        continue; // skips the current iteration during the loop
    // process p's
    numPs++;
}
```

##### Labeled continue statement

```java
test:
    for (int i = 0; i <= max; i++) {
        int n = substring.length();
        int j = i;
        int k = 0;
        while (n-- != 0) {
            if (searchMe.charAt(j++) != substring.charAt(k++)) {
                continue test; // skip an iteration in the outer loop
            }
        }
        foundIt = true;
            break test; // ends the outermost for loop
        }
```

##### Labeled continue statement

#### Return statement

!!! info "The `return` statement exits from the current method, and control flow returns to where the method was invoked. The `return` statement has two forms: one that returns a value, and one that doesn't."

```java
return;
```

```java
return ++count;
```

## Classes

#### Defining fields

In general, class declarations can include these components, in order:

1. Modifiers such as _public_, _private_, and a number of others (However, note that the _private_ modifier can only be applied to [Nested Classes](https://docs.oracle.com/javase/tutorial/java/javaOO/nested.html).)
    - `public` modifier—the field is accessible from all classes.
    - `private` modifier—the field is accessible only within its own class.
2. The class name, with the initial letter capitalized by convention.
3. The name of the class's parent (super-class), if any, preceded by the keyword _extends_. A class can only _extend_ (subclass) one parent.
4. A comma-separated list of interfaces implemented by the class, if any, preceded by the keyword _implements_. A class can _implement_ more than one interface.
5. The class body, surrounded by braces, {}.

```java
public int cadence;
```

### Defining methods

More generally, method declarations have six components, in order:

1. Modifiers such as `public`, `private`
2. The return type—the data type of the value returned by the method, or `void` if the method does not return a value.
3. The method name—the rules for field names apply to method names as well, but the convention is a little different.
4. The parameter list in parenthesis—a comma-delimited list of input parameters, preceded by their data types, enclosed by parentheses, `()`. If there are no parameters, you must use empty parentheses.
5. An exception list.
6. The method body, enclosed between braces—the method's code, including the declaration of local variables, goes here.

```java
public double calculateAnswer(double wingSpan, int numberOfEngines, double length, double grossTons) {
    //do the calculation here
}
```

!!! info "Methods can be overloaded using different signatures"

```java
public class DataArtist {
    ...
    public void draw(String s) {
        ...
    }
    public void draw(int i) {
        ...
    }
    public void draw(double f) {
        ...
    }
    public void draw(int i, double f) {
        ...
    }
}
```

!!! info "You can use a construct called _varargs_ to pass an arbitrary number of values to a method. You use varargs when you don't know how many of a particular type of argument will be passed to the method. It's a shortcut to creating an array manually"

```java
public Polygon polygonFrom(Point... corners) {
    int numberOfSides = corners.length;
    double squareOfSide1, lengthOfSide1;
    squareOfSide1 = (corners[1].x - corners[0].x)
                     * (corners[1].x - corners[0].x) 
                     + (corners[1].y - corners[0].y)
                     * (corners[1].y - corners[0].y);
    lengthOfSide1 = Math.sqrt(squareOfSide1);

    // more method body code follows that creates and returns a 
    // polygon connecting the Points
}
```

### Providing constructors for the class

!!! info "A class contains constructors that are invoked to create objects from the class blueprint. Constructor declarations look like method declarations—except that they use the name of the class and have no return type."

```java
public Bicycle(int startCadence, int startSpeed, int startGear) {
    gear = startGear;
    cadence = startCadence;
    speed = startSpeed;
}
```

Default constructors can also be implemented:

```java
public Bicycle() {
    gear = 1;
    cadence = 10;
    speed = 0;
}
```

### Examples

```java
public class Bicycle {
        
    // **the Bicycle class has**
    // **three _fields_**
    public int cadence;
    public int gear;
    public int speed;
        
    // **the Bicycle class has**
    // **one _constructor_**
    public Bicycle(int startCadence, int startSpeed, int startGear) {
        gear = startGear;
        cadence = startCadence;
        speed = startSpeed;
    }
        
    // **the Bicycle class has**
    // **four _methods_**
    public void setCadence(int newValue) {
        cadence = newValue;
    }
        
    public void setGear(int newValue) {
        gear = newValue;
    }
        
    public void applyBrake(int decrement) {
        speed -= decrement;
    }
        
    public void speedUp(int increment) {
        speed += increment;
    }
        
}
```

```java
public class MountainBike extends Bicycle {
        
    // **the MountainBike subclass has**
    // **one _field_**
    public int seatHeight;

    // **the MountainBike subclass has**
    // **one _constructor_**
    public MountainBike(int startHeight, int startCadence, int startSpeed, int startGear) {
        super(startCadence, startSpeed, startGear); // build the parent oject
        seatHeight = startHeight;
    }   
        
    // **the MountainBike subclass has**
    // **one _method_**
    public void setHeight(int newValue) {
        seatHeight = newValue;
    }   

}
```

## Objects

### Creating objects

```java
Point originOne = new Point(23, 94);
Rectangle rectOne = new Rectangle(originOne, 100, 200);
Rectangle rectTwo = new Rectangle(50, 100);
```

Each of these statements has three parts (discussed in detail below):

1. **Declaration**: The code that is left to the `=` operator are variable declarations that associate a variable name with an object type.
2. **Instantiation**: The new keyword is a Java operator that creates the object.
3. **Initialization**: The new operator is followed by a call to a constructor, which initializes the new object.

### Using objects

#### Referencing an onject's field

```java
objectReference.fieldName
```

#### Calling an object's method

```java
objectReference.methodName(argumentList);
```

#### Garbage collector

!!! info "Some object-oriented languages require that you keep track of all the objects you create and that you explicitly destroy them when they are no longer needed."
    Managing memory explicitly is tedious and error-prone. The Java platform allows you to create as many objects as you want (limited, of course, by what your system can handle), and you don't have to worry about destroying them. The Java runtime environment deletes objects when it determines that they are no longer being used. This process is called _garbage collection_.

### This keyword

!!! info "Within an instance method or a constructor, `this` is a reference to the _current object_ — the object whose method or constructor is being called. You can refer to any member of the current object from within an instance method or a constructor by using `this`."

#### Using this outside of a constructor

Using this keyword inside of class's methods is optional.

```java
public class Point {
    public int x = 0;
    public int y = 0;
    
    //constructor
    public Point(int x, int y) {
        this.x = x;
        this.y = y;
    }
}
```

```java
public class Point {
    public int x = 0;
    public int y = 0;
    
    //constructor
    public Point(int a, int b) {
        x = a;
        y = b;
    }
}
```

#### Using this with a constructor

```java
public Rectangle() {
    this(0, 0, 1, 1);
}
public Rectangle(int width, int height) {
    this(0, 0, width, height);
    }
```

### Controlling access to members of a class

!!! info "Access level modifiers determine whether other classes can use a particular field or invoke a particular method."
    There are two levels of access control:
    - At the top level, `public`
    - At the member level `public`, `private`, `protected`

!!! tip "Access level"
    If other programmers use your class, you want to ensure that errors from misuse cannot happen. Access levels can help you do this.
    - Use the most restrictive access level that makes sense for a particular member. Use `private` unless you have a good reason not to.
    - Avoid `public` fields except for constants

The following table shows the access to members permitted by each modifier:

|Modifier|Class|Package|Subclass|World|
|---|---|---|---|---|
|`public`|Y|Y|Y|Y|
|`protected`|Y|Y|Y|N|
|no modifier|Y|Y|N|N|
|`private`|Y|N|N|N|

#### Example

Say:

- Package one contains two classes: `Alpha` and `Beta`.
- Package two contains two other classes: `AlphaStub` and `Gamma`.
- `Alphastub` is derived from `Alpha` class.
The following table shows where the members of the `Alpha` class are visible for each of the access modifiers that can be applied to them.

| Modifier | Alpha | Beta | Alphasub | Gamma |
| ---- | ---- | ---- | ---- | ---- |
| `public` | Y | Y | Y | Y |
| `protected` | Y | Y | Y | N |
| no modifier | Y | Y | N | N |
| `private` | Y | N | N | N |

### Class members - static

To access or call a class member, use the class name followed by the dot operator without going through instanciation.

#### Class variable - static variable

```java
public class Bicycle {
        
    private int cadence;
    private int gear;
    private int speed;
    private int id;
    
    private static int numberOfBicycles = 0;
}
```

#### Class methods - static methods

```java
public static int getNumberOfBicycles() {
    return numberOfBicycles;
}
```

#### Final keyword

!!! info "The `static` modifier, in combination with the `final` modifier, is also used to define constants. The `final` modifier indicates that the value of this field cannot change."

```java
static final double PI = 3.141592653589793;
```

#### Full example

```java
public class Bicycle {
        
    private int cadence;
    private int gear;
    private int speed;
        
    private int id;
    
    private static int numberOfBicycles = 0;

        
    public Bicycle(int startCadence,
                   int startSpeed,
                   int startGear) {
        gear = startGear;
        cadence = startCadence;
        speed = startSpeed;

        id = ++numberOfBicycles;
    }

    public int getID() {
        return id;
    }

    public static int getNumberOfBicycles() {
        return numberOfBicycles;
    }

    public int getCadence() {
        return cadence;
    }
        
    public void setCadence(int newValue) {
        cadence = newValue;
    }
        
    public int getGear(){
        return gear;
    }
        
    public void setGear(int newValue) {
        gear = newValue;
    }
        
    public int getSpeed() {
        return speed;
    }
        
    public void applyBrake(int decrement) {
        speed -= decrement;
    }
        
    public void speedUp(int increment) {
        speed += increment;
    }
}
```

### Static initialization block

!!! info "A _static initialization block_ is a normal block of code enclosed in braces, `{ }`, and preceded by the `static` keyword."
    A class can have any number of static initialization blocks, and they can appear anywhere in the class body. The runtime system guarantees that static initialization blocks are called in the order that they appear in the source code.

#### Using static initialization block

```java
static {
    // whatever code is needed for initialization goes here
}
```

#### Using a private static method

```java
class Whatever {
    public static varType myVar = initializeClassVariable();
        
    private static varType initializeClassVariable() {
        // initialization code goes here
    }
}
```

### initializing instance members

#### Using initializer blocks

Initializer blocks for instance variables look just like static initializer blocks, but without the `static` keyword:

```java
{
    // whatever code is needed for initialization goes here
}
```

#### Using final method

```java
class Whatever {
    private varType myVar = initializeInstanceVariable();
        
    protected final varType initializeInstanceVariable() {
        // initialization code goes here
        // final method can not be overriden in the subclass
        // protected statement ensure that its use is kept to the current class and not to derived ones
    }
}
```

## Nested classes

!!! info " Why use nested classes ?"
    - Its a way of logically grouping classes that are logically grouped in one place.
    - Increases encapsulation.
    - Lead to more readable and maintainable code.

### Inner classes

!!! info "As with instance methods and variables, an inner class is associated with an instance of its enclosing class and has direct access to that object's methods and fields."
    Also, because an inner class is associated with an instance, it cannot define any static members itself.

```java
class OuterClass {
    class InnerClass {
    }
}
```

To instantiate an inner class, you must first instantiate the outer class. Then, create the inner object within the outer object with this syntax:

```java
OuterClass outerObject = new OuterClass(); // create the outer class
OuterClass.InnerClass innerObject = outerObject.new InnerClass(); // create the nested object inside the outer class 
```

### Static nested classes

!!! info "A static nested class interacts with the instance members of its outer class (and other classes) just like any other top-level class. In effect, a static nested class is behaviorally a top-level class that has been nested in another top-level class for packaging convenience."
    A static nested class is instantiated the same way as a top-level class.

### Shadowing

!!! info "If a declaration of a type (such as a member variable or a parameter name) in a particular scope (such as an inner class or a method definition) has the same name as another declaration in the enclosing scope, then the declaration _shadows_ the declaration of the enclosing scope."
    You cannot refer to a shadowed declaration by its name alone. Using the class name or this keyword will help to have a defined scope.

### Example

```java
public class OuterClass {

    String outerField = "Outer field";
    static String staticOuterField = "Static outer field";

    class InnerClass {
        void accessMembers() {
            System.out.println(outerField);
            System.out.println(staticOuterField);
        }
    }

    static class StaticNestedClass {
        void accessMembers(OuterClass outer) {
            // Compiler error: Cannot make a static reference to the non-static
            //     field outerField
            // System.out.println(outerField);
            System.out.println(outer.outerField);
            System.out.println(staticOuterField);
        }
    }

    public static void main(String[] args) {
        System.out.println("Inner class:");
        System.out.println("------------");
        OuterClass outerObject = new OuterClass();
        OuterClass.InnerClass innerObject = outerObject.new InnerClass();
        innerObject.accessMembers();

        System.out.println("\nStatic nested class:");
        System.out.println("--------------------");
        StaticNestedClass staticNestedObject = new StaticNestedClass();        
        staticNestedObject.accessMembers(outerObject);
        
        System.out.println("\nTop-level class:");
        System.out.println("--------------------");
        TopLevelClass topLevelObject = new TopLevelClass();        
        topLevelObject.accessMembers(outerObject);                
    }
}
```

## Interfaces

TODO
