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
![Simple Class](https://raw.github.com/whistler/architect/master/examples/simple_class.svg)
    
### Class with methods and attributes
    [User|+Firstname;+Lasname;-Password;|+Login();+Logout()]
![Class with details](https://raw.github.com/whistler/architect/master/examples/class_with_details.svg)
    
### Simple Association
    [User]-[Tweet]
![Simple Association](https://raw.github.com/whistler/architect/master/examples/simple_association.svg)
    
### Composition and Aggregation
    [Car]++0..1-1[Carburetor]
    [Pong]+0..1-0..*[Duck]
![Composition and Aggregation](https://raw.github.com/whistler/architect/master/examples/composition_and_aggregation.svg)
    
### Directional Association
    [Order]-billing >[Address], [Order]-shipping >[Address]
![Directional Association](https://raw.github.com/whistler/architect/master/examples/directional_association.svg)
    
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
