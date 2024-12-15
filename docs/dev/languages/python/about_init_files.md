# `__init__.py` 

!!! success "Key Takeaways"

    - `__init__.py` is **required to treat directories as packages** (in Python 3.3+, it can be empty, but it’s often useful for defining imports).
    - It’s a **central file to manage package-level exports and initialization**.
    - Properly structuring `__init__.py` helps keep packages modular, readable, and easy to import.

!!! Note "These tips are linked to [python wheels](./wheels.md)."

Here's a breakdown of its purpose and behavior in the context of creating a Python package.

## 1. **Defining a Package**

Any directory containing a file named `__init__.py` is treated as a Python *package*. 
This file signals to Python that the directory should be treated as a package, making it possible to import modules and sub-packages within that directory.

## 2. **Setting Up Imports and Namespaces**

The `__init__.py` file allows you to control what’s exposed when someone imports the package. For example:

```python
# mypackage/__init__.py
from .module1 import MyClass
from .module2 import my_function
```

With this setup, importing the package (`import mypackage`) will expose `MyClass` and `my_function` directly under `mypackage`.
You can also use `__all__` to define the public API of the package, which restricts what’s available when using `from package import *`.

## 3. **Code Execution**

The `__init__.py` file can contain executable code. This means you can initialize variables, configure logging, or perform setup when the package is imported.

!!! warning "Be careful with heavy computations or I/O in `__init__.py`, as it can slow down imports."

## 4. **Organizing Sub-packages**

Packages can be nested within other packages. By using `__init__.py` files in sub-directories, you can create hierarchical structures, such as `mypackage.subpackage.module`.
Each level in the hierarchy requires its own `__init__.py` file to be considered part of the package structure.

## Example Structure

Here's an example of a package structure with `__init__.py` files:

```
mypackage/
│
├── __init__.py       # Initializes the package
├── module1.py        # Contains some classes or functions
├── module2.py
└── subpackage/
    ├── __init__.py   # Initializes the subpackage
    └── submodule.py
```

In the above structure, each `__init__.py` file can be tailored to set up the imports, initialize values, and control the public API for each package or sub-package.

Here’s a more detailed look.

### Content of `mypackage/__init__.py`

This file serves as the entry point for the `mypackage` package, allowing control over what is available to users when they import `mypackage`.

!!! example "Here’s an example of what `mypackage/__init__.py` might look like:"

    ```python
    # Import specific functions or classes from modules within the package
    from .module1 import MyClass
    from .module2 import my_function

    # Import specific functions or classes from subpackage
    from .subpackage.submodule import SubClass, sub_function
    # Optionnally from .subpackage.submodule import * imports every component defined in the submodule subpackage (no need to repeat function names)

    # Optionally define an __all__ variable to control what’s accessible when using `from mypackage import *`
    __all__ = ["MyClass", "my_function"]

    # You could also add some package-level variables or configuration settings if needed
    VERSION = "1.0.0"
    ```

    With this setup:

    - `from mypackage import MyClass` or `from mypackage import my_function` works directly, without needing to specify the individual module.
    - `__all__` restricts what is exported during a `from mypackage import *` operation, so only `MyClass` and `my_function` would be imported.
    - `VERSION` is a package-level constant that can be accessed with `mypackage.VERSION`.

### Content of `mypackage/subpackage/__init__.py`

This file initializes `mypackage.subpackage`, potentially exposing elements within the sub-package to make them available directly through `subpackage`.

!!! example "Here’s an example of `mypackage/subpackage/__init__.py`:"

    ```python
    # Import elements from submodule
    from .submodule import SubClass, sub_function

    # Control what’s accessible when using `from mypackage.subpackage import *`
    __all__ = ["SubClass", "sub_function"]
    ```

With this setup:

- Users can import directly from `mypackage.subpackage` without specifying the submodule: `from mypackage.subpackage import SubClass`.
- `__all__` controls what is accessible in case of wildcard imports (`*`).

### Sample Content of `mypackage/module1.py`, `module2.py`, and `subpackage/submodule.py`

For completeness, here’s a quick idea of what the individual modules might contain:

!!! example "`mypackage/module1.py`"

    ```python
    class MyClass:
        def __init__(self):
            print("MyClass initialized")

    def helper_function():
        print("Helper function in module1")
    ```

!!! example "`mypackage/module2.py`"

    ```python
    def my_function():
        print("Function in module2")
    ```

!!! example "`mypackage/subpackage/submodule.py`"

    ```python
    class SubClass:
        def __init__(self):
            print("SubClass initialized")

    def sub_function():
        print("Function in submodule")
    ```

### Usage Example

Once structured, the package can be imported and used as follows:

```python
# Import from the main package ()
# Good for users, since they do not have to know the structure of the library
from mypackage import MyClass, my_function

# Import from the sub-package (recommended for internal imports)
# Users may not have to know the package strucure of the library
from mypackage.subpackage import SubClass, sub_function

# Import every symbol (not recommended because it can cause undefined behaviors with shadowed names)
from mypackage import *

# Import the library in a namespace
# Recommended because it specifies the namespace and avoids name conflicts
# Functions has to be called with mp. before function / class names
import mypackage as mp

# Using the imports
instance = (mp.)MyClass()
my_function()

sub_instance = (mp.)SubClass()
sub_function()
```

## Refs

!!! cite "Refs"

    [Python Packaging User Guide](https://packaging.python.org/en/latest/)
    