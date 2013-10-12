# Architect

Create UML Class diagrams using a [yUML](http://yuml.me/diagram/scruffy/class/samples)-like notation.


## Installation

    $ gem install uml_architect

## Usage

    $ architect [file ...]
    
This generates a output file with a svg extension with the same base name as the
input file.

## Examples

### Simple Class
    [User]
![Simple Class](http://whistler.github.io/architect/examples/simple_class.svg)
    
### Class with methods and attributes
    [User|+Firstname;+Lasname;-Password;|+Login();+Logout()]
![Class with details](http://whistler.github.io/architect/examples/class_with_details.svg)
    
### Simple Association
    [User]-[Tweet]
![Simple Association](http://whistler.github.io/architect/examples/simple_association.svg)

### Inheritance
    [Animal]<>-[Cat]
    [Animal]<>-[Dog]
![Inheritance](http://whistler.github.io/architect/examples/inheritance.svg)
    
### Composition and Aggregation
    [Car]++0..1-1[Carburetor]
    [Pong]+0..1-0..*[Duck]
![Composition and Aggregation](http://whistler.github.io/architect/examples/composition_and_aggregation.svg)
    
### Directional Association
    [Order]-billing >[Address], [Order]-shipping >[Address]
![Directional Association](http://whistler.github.io/architect/examples/directional_association.svg)
    
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
