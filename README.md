Orbits
======

a simple program to render trees of objects orbiting one another.

Requirements
------------

* Bundler
* Datamapper
* Ruby-OpenGL (You will need native opengl headers)
* Chingu (Extra Libraries on top of Gosu)
* Gosu (Ruby Game Library)


Installation 
------------

### Gosu

* http://code.google.com/p/gosu/wiki/GettingStartedOnLinux
* http://code.google.com/p/gosu/wiki/GettingStartedOnOsx
* http://code.google.com/p/gosu/wiki/GettingStartedOnWindows

### Orbits

    gem install bundler
    bundle install

### Configuration

Orbits has two databases, a simple example orbits_time.sqlite and a list of all the planets in our solar system orbits_planets.sqlite
specify which one to load in orbiter.rb 


Usage
-----

    ruby orbits.rb
