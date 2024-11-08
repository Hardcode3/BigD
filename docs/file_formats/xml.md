# XML

!!! quote

    - [What is XML | XML Beginner Tutorial | Learn XML with Demo in 10 min](https://www.youtube.com/watch?v=1JblVElt5K0&list=PLhW3qG5bs-L9DloLUPwC3GdFimY5Ce_gS){target=_blank}
    - [Wikipedia Extensible Markup Language](https://fr.wikipedia.org/wiki/Extensible_Markup_Language){target=_blank}
    - [XML formatter](https://www.freeformatter.com/xml-formatter.html){target=_blank}

## About

- XML = Extensible Markup Language
- You can use you own tags <> so it can be extended to any need
- It is a W3C recommendation
- It's a software and hardware independent data exchange format
- Both human and machine readable
- XML uses a Document Typed Definition (DTD) or XML schema to describe the data
- XML is not a replacement of HTML
- XML has no function but to store informations: someone must write a separate code to interpret its data
- XML has a high degree of persistency i.e. it is very stable through time

Other exchange formats:

- WITSMl (XML for seismic acquisition)
- RESQML

World Wide Web consortium recommends:

- XML (Extensible Markup Language)
- XPath (XML Path Language)
- XSchema (XML Schema Language)
- XSL (Extensible Style Language)
- XQuery (Extensible Query Language)...

## XML elements

### XML declaration

Tells the reader program which version of XML will be used.

```xml
<?xml version="1.0" encoding="ITF-8"?>
```

### Values (always quoted)

```xml
<number> x="1.2" </number>
```

### Element (the root element if the first element to be created)

```xml
<name> toto </name>
```

### Empty elements

```xml
<point x="1.23" y="4.56" z="7.97" />
```

### Tags

```xml
<name> toto </name>
```

### Attributes of an element (a way of storing data, child element is another way)

```xml
<name font="arial">

### Entities
    
```xml
<equation> a &lt; b </equation>
```

### PCDATA (Parsed Character Data)

Parsed text between start-tag and end-tag

```xml
<name> toto </name>
```

### CDATA (Character Data)

CDATA will not be parsed.

```xml
<![CDATA[*p = &q; b = (i <= 3);]]>
```

### Creation and basic rules

- Create a file with the xml extension
- Add an XML prolog

```xml
<?xml version="1.0" encoding="UTF-8"?>
```

- Create a root tag and other sub-tags tags
- Each tag has a start <tag_name> and an end </tag_name>:
- Tags are case sensitive
- White spaces are preserved (HTML mix multiples spaces into a single but not xml)
- Can not start a name using "xml"

```xml
<root>

<child>

<subchild> ... </subchild>

</child>

</root>
```

### Attributes

- If necessary, creates attributes like following. Attributes must be quoted.

```xml
<friendList>

<friend gender="male">

<name> Alex </name

<age> 25 </age>

</friend>

</friendList>
```

### Dealing with reserved symbols

- Some symbols already have a meaning in xml, therefore use the reference symbol

This will not work:

```xml
<eligibility> age > 18 </eligibility>
```

But instead, write this:

```xml
<eligibility> age &gt; 18 </eligibility>
```
￼

### Commenting the code

```xml
<!-- This is a comment -->

<!-- This is an invalid -- comment -->
```

### Using prefixes or namespaces

- When using prefixes in xml, namespace for the prefix must be defined.

  - The namespaces are "h:" or "f:"

    - All child elements with the same prefix are associated with the same namespace
    - « xmlns » stands for xml namespaces
    - the namespace is declared with double dots « : » and its name is just after it (here f and h namespaces), followed by an URL

```xml
<root>

<h:table xmlns:h=‘https://www.w3.org/TR/html’>

<h:tr>

<h:td> Apples </h:td>

<h:td> Bananas </h:td>

</h:tr>

</h:table>

<f:table xmlns:f-‘https://www.w3.org/furniture’>

<f:name> Coffee Table </f:name>

<f:width> 10 </f:width>

<f:height> 20 </f:height>

</f:table>

</root>
```

Namespaces can also be declared in the xml root element

```xml
<root xmlns:h=‘https://www.w3.org/TR/html4/‘

xmlns:f=‘https://www.w3.org/furniture’>

<h:table xmlns:h=‘https://www.w3.org/TR/html’>

<h:tr>

<h:td> Apples </h:td>

<h:td> Bananas </h:td>

</h:tr>

</h:table>

<f:table xmlns:f-‘https://www.w3.org/furniture’>

<f:name> Coffee Table </f:name>

<f:width> 10 </f:width>

<f:height> 20 </f:height>

</f:table>

</root>
```

Default namespaces can be defined for an element and all the child elements will use it

```xml
<table xmlns=‘https://www.w3.org/TR/html4/’>

<tr>

<td> Apples </td>

<td> Bananas </td>

<tr>

</table>
```

is the same as:

```xml
<h:table xmlns:h=‘https://www.w3.org/TR/html’>

<h:tr>

<h:td> Apples </h:td>

<h:td> Bananas </h:td>

</h:tr>

</h:table>
```

### CDATA sections

Instructs the parser to ignore most markup characters

```xml
<![CDATA[[ if( *pi < z ) ]]>
```

### Document Type Definition (DTD)

- Define the legal building bloacks of an XML document
- Each XML file can carry a description of its own format with it
- Different people can agree to use a common DTD for interchanging data

### Define elements (general case)

```xml
<!ELEMENT element_name category>
<!ELEMENT element_name (element_content)>
```

#### Empty elements

```xml
<!ELEMENT element_name EMPTY>
```

#### Elements with only character data

```xml
<!ELEMENT element_name (#PCDATA)>
```

#### Elements with any content

```xml
<!ELEMENT element_name ANY>
```

#### Elements with children (sequences)

```xml
<!ELEMENT element_name (child_element_name)>

<!ELEMENT element_name (child_element_name, child_element_name_1, ...)>
```

#### Number of occurence of the same child element

##### Exactly one child

```xml
<!ELEMENT element_name (child_name)>
```

##### Minimum one child

```xml
<!ELEMENT element_name (child_name+)>
```

##### Zero or more children

```xml
<!ELEMENT element_name (child_name*)>
```

##### Zero or one child

```xml
<!ELEMENT element_name (child_name?)>
```

Either, or

```xml
<!ELEMENT element_name (either | or)>
```

##### Mixed content

```xml
<!ELEMENT element_name (#PCDATA | choice_1 | choice_2 | ...)>
```

### DTD attributes

```xml
<!ATTLIST element_name attribute_name attribute_type default_value>

<!ATTLIST book isbn CDATA #REQUIRED>
```

### Default values

```xml
'#REQUIRED' -> the attribute value must be included in the element

'#IMPLIED' -> the attribute does ot have to be included

"value" -> an attribute can be given any legal value as a default

'#FIXED' "value" -> the attribute value is fixed
```

### DTD internal entities

```xml
<!ENTITY entity_name "entity_value">
```

### DTD external entities

...

Example:

```xml
<!ELEMENT author (#PCDATA)>

<!ELEMENT book (title, author, character+)>

<!ATTLIST book isbn CDADA #REQUIRED>

<!ELEMENT character (name, friend-of?, since, qualification)>

<!ELEMENT friend_of (#PCDATA)>

<!ELEMENT name (#PCADATA)>

<!ELEMENT qualification (#PCDATA)>

<!ELEMENT since (#PCDATA)>

<!ELEMENT title (#PCDATA)>
```

!!! bug "Problems of the DTD"

    - The syntax is different for XML and DTD so there is a need for two different parsers and there is more work.
    - A soution can be X-Schemas

## X-Schemas

- [w3.org](https://www.w3.org/){target=_blank}
- [xml.com](https://www.xml.com/){target=_blank}

### About

- Contains document information such as the data-type of the elements, ranges and values and how data is related to another piece of data
- 'xs:sequence' defines an ordered sequence of sub-elements
- 'xs:choice' choice between several possible particles
- 'xs:all' unordered set of elements
- 'simpleType' is for data-types holding values only
- 'complexType' is for data-types holding attributes, non text children...

### Definition

```xml
<? xml version='1.0' encoding='UTF-8'?>

<xs:schema xmlns:xs='https://w3.org/2001/XMLSchema'>

.../...

</xd:schema>
```

### Creating personalized types

Lets create a new type derived from xs:string with a max number of characters equal to 32:

```xml
<xs:simpleType name='type_name'>

<xs:restriction base='xs:string'>

<xs:maxLength value='32'/>

</xs:restriction>

</xs/simpleType>
```

### Groups

Containers holding a set of elements or attributes that can be used to describe complex types

```xml
<!--definition of an element group -->

<xs:group name ='mainBookElements'>

<xs:sequence>

<xs:element name='title' type='nameType'/>

<xs:element name='author' type='nameType'/>

</xs:sequence>

</xs:group>

<!-- definition of an attribute group -->

<xs:attributeGroup name='bookAttributes'>

<xs:attribute name='isbn' type='isbnType' use='required'/>

<xs:attribute name='available' type='xs:string'/>

</xs:attributeGroup>

<!-- definition of a new complexType bookType -->

<xs:complexType name='bookType'>

<xs:sequence>

<xs:group ref='mainBookElements'/>

<xs:element name='character' type='characterType' minOccurs='0' maxOccurs='unbounded'/>

</xs:sequence>

<xs:complexType>
```

Examples:

```xml
<xs:element name='name' type='xs:string'/>

<xs:element name='friend-of' type='xs:string' minOccurs='0' maxOccurs='unbounded'/>

<xs:element name='since' type='xs:date'/>

<xs:element name='qualification' type='xs:string'/>

Real example:

<?xml version="1.0" encoding="utf-8"?>

<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">

<xs:element name="book">

<xs:complexType>

<xs:sequence>

<xs:element name="title" type="xs:string"/>

<xs:element name="author" type="xs:string"/>

<xs:element name="character" minOccurs="0" maxOccurs="unbounded">

<xs:complexType>

<xs:sequence>

<xs:element name="name" type="xs:string"/>

<xs:element name="friend-of" type="xs:string" minOccurs="0" maxOccurs="unbounded"/>

<xs:element name="since" type="xs:date"/>

<xs:element name="qualification" type="xs:string"/>

</xs:sequence>

</xs:complexType>

</xs:element>

</xs:sequence>

<xs:attribute name="isbn" type="xs:string“ use=“required”/>

</xs:complexType>

</xs:element>

</xs:schema>
```

## X-Path

### About

- Locate information in an XML document
- Represent node adresses following the document's tree structure (like a unix directory)
- A path starting with `/` is an absolute path
- A path starting with `//` encompasses all elements in the document that fullfill the criteria
- So `/book/character/name` selects all the name elements of all the character elements of the book element
- So `//name` selects all the name elements in the document
- Wildcards `*` can be used to select unknown XML elements
- So `/book/character/*` selects all child elements of all character elements of the book element
- So `/book/*/name` selects all name elements that are grandchild elements of the book element
- So `//*` selects all elements in the current document
