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


Todo
----

Toggle keys for applying uniform/scaled distance from sun to max of height of screen.
(also add a draw from middle of sun on far-left mode.. maybe stationary but with axis and moons.. and a 'speed, striped orbit line')
