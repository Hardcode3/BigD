# Pybind 11 basics

!!! info "What is this?"
    Pybind11 is a lightweight, open-source library designed to create Python bindings for C++ code. It enables seamless integration of C++ code into Python programs by allowing Python to call C++ functions, classes, and methods as if they were native Python objects.

!!! cite
    - [GitHub](https://github.com/pybind/pybind11)
    - [Official documentation](https://pybind11.readthedocs.io/en/stable/)

## Bindings for custom types

```c++
struct Pet {
    Pet(const std::string &name) : name(name) { }
    void setName(const std::string &name_) { name = name_; }
    const std::string &getName() const { return name; }

    std::string name;
};

#include <pybind11/pybind11.h>

namespace py = pybind11;

PYBIND11_MODULE(example, m) {
    py::class_<Pet>(m, "Pet")
        .def(py::init<const std::string &>())
        .def("setName", &Pet::setName)
        .def("getName", &Pet::getName);
}
```

## Instance and static fields

Define a read and write binding for a class attribute of a static field: 

```c++
.def_readwrite("name", &Pet::name)
.def_readonly("name", &Pet::name)

```

```python
>>> p = example.Pet("Molly")
>>> p.name
'Molly'
>>> p.name = "Charly"
>>> p.name
'Charly'
```

## Dynamic attributes

```C++
py::class_<Pet>(m, "Pet", py::dynamic_attr())
    .def(py::init<>())
    .def_readwrite("name", &Pet::name);
```

```python
>>> p = example.Pet()
>>> p.name = "Charly"  # OK, overwrite value in C++
>>> p.age = 2  # OK, dynamically add a new attribute
>>> p.__dict__  # just like a native Python class
{'age': 2}
```

## Inheritance

```C++
struct Pet {
    Pet(const std::string &name) : name(name) { }
    std::string name;
};

struct Dog : Pet {
    Dog(const std::string &name) : Pet(name) { }
    std::string bark() const { return "woof!"; }
};
```

### Using the C++ base class as an extra template parameter of the class_

```C++
py::class_<Pet>(m, "Pet")
   .def(py::init<const std::string &>())
   .def_readwrite("name", &Pet::name);

// Method 1: template parameter:
py::class_<Dog, Pet /* <- specify C++ parent type */>(m, "Dog")
    .def(py::init<const std::string &>())
    .def("bark", &Dog::bark);
```

### Assign a name to the parent class and reference it

```C++
py::class_<Pet> pet(m, "Pet");
pet.def(py::init<const std::string &>())
   .def_readwrite("name", &Pet::name);

// Method 2: pass parent class_ object:
py::class_<Dog>(m, "Dog", pet /* <- specify Python parent type */)
    .def(py::init<const std::string &>())
    .def("bark", &Dog::bark);
```

## Polymorphic types

!!! info "Pybind recognizes polymorphic types automatically if there is at least one virtual function"

Therefore, if a virutal method is defined, then downcasting is authorized:

```C++
struct PolymorphicPet {
    virtual ~PolymorphicPet() = default;
};

struct PolymorphicDog : PolymorphicPet {
    std::string bark() const { return "woof!"; }
};

// Same binding code
py::class_<PolymorphicPet>(m, "PolymorphicPet");
py::class_<PolymorphicDog, PolymorphicPet>(m, "PolymorphicDog")
    .def(py::init<>())
    .def("bark", &PolymorphicDog::bark);

// Again, return a base pointer to a derived instance
m.def("pet_store2", []() { return std::unique_ptr<PolymorphicPet>(new PolymorphicDog); });
```

```python
>>> p = example.pet_store2()
>>> type(p)
PolymorphicDog  # automatically downcast
>>> p.bark()
'woof!'
```

## Overloading methods

```C++
struct Pet {
    Pet(const std::string &name, int age) : name(name), age(age) { }

    void set(int age_) { age = age_; }
    void set(const std::string &name_) { name = name_; }

    std::string name;
    int age;
};

// C++ < 14
py::class_<Pet>(m, "Pet")
   .def(py::init<const std::string &, int>())
   .def("set", static_cast<void (Pet::*)(int)>(&Pet::set), "Set the pet's age")
   .def("set", static_cast<void (Pet::*)(const std::string &)>(&Pet::set), "Set the pet's name");

// C++ >= 14
py::class_<Pet>(m, "Pet")
    .def("set", py::overload_cast<int>(&Pet::set), "Set the pet's age")
    .def("set", py::overload_cast<const std::string &>(&Pet::set), "Set the pet's name");
```

!!! info "Defining multiple overloads is possible: python will try every signature to get the right one"

!!! warning "If a function is overloaded based on constness, the `py::const_` tag should be used"

### For const members

```C++
struct Widget {
    int foo(int x, float y);
    int foo(int x, float y) const;
};

py::class_<Widget>(m, "Widget")
   .def("foo_mutable", py::overload_cast<int, float>(&Widget::foo))
   .def("foo_const",   py::overload_cast<int, float>(&Widget::foo, py::const_));
```

There is another way, but this one is fine.

## Enums and internal types

```C++
struct Pet {
    enum Kind {
        Dog = 0,
        Cat
    };

    struct Attributes {
        float age = 0;
    };

    Pet(const std::string &name, Kind type) : name(name), type(type) { }

    std::string name;
    Kind type;
    Attributes attr;
};
```

```C++
py::class_<Pet> pet(m, "Pet");

pet.def(py::init<const std::string &, Pet::Kind>())
    .def_readwrite("name", &Pet::name)
    .def_readwrite("type", &Pet::type)
    .def_readwrite("attr", &Pet::attr);

// enum definition is done through py::enum_
py::enum_<Pet::Kind>(pet, "Kind")
    .value("Dog", Pet::Kind::Dog)
    .value("Cat", Pet::Kind::Cat)
    .export_values();

// class definition is done through py::class_
py::class_<Pet::Attributes>(pet, "Attributes")
    .def(py::init<>())
    .def_readwrite("age", &Pet::Attributes::age);
```

!!! info "When the special tag py::arithmetic() is specified to the enum_ constructor, pybind11 creates an enumeration that also supports rudimentary arithmetic and bit-level operations like comparisons, and, or, xor, negation, etc."

```C++
py::enum_<Pet::Kind>(pet, "Kind", py::arithmetic())
```

## Return value policy

!!! info "If custom smart pointers are used, it eliminates the need to use return value policies."
    Python and C++ will handle the pointer reference count and the object will be deleted once there is no more reference for this pointer.

## Call policies

### Keep alive

### Call guard

## Python object as arguments

## \*args and \*kwargs

!!! info "\*args derive from a tuple and \*kwargs from a dictionnary"

### Specify that an argument is keyword only

```C++
m.def("f", [](int a, int b) { /* ... */ },
      py::arg("a"), py::kw_only(), py::arg("b"));
```

!!! info "Since v2.6, using py::arg uses py::kw_only"
    Therefore it is not useful to specify it.

### Specify that an argument is positional only

```C++
m.def("f", [](int a, int b) { /* ... */ },
       py::arg("a"), py::pos_only(), py::arg("b"));
```

## Default values

!!! warn "When using `nullptr` as a default argument: `static_cast` it to the needed type before"

```C++
py::class_<MyClass>("MyClass")
    .def("myFunction", py::arg("arg") = static_cast<SomeType *>(nullptr));
```

## Force non-conversions between types

Sometimes we do not want to convert arguments.
For instance if a function takes a float and we do not want to use any other type like integer, then we can add `.noconvert()` specifier.

```C++
m.def("floats_only", [](double f) { return 0.5 * f; }, py::arg("f").noconvert());
m.def("floats_preferred", [](double f) { return 0.5 * f; }, py::arg("f"));
```
