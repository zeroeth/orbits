# Introduction

Orbits is a simple program to take a database of a nested structure of objects with orbiting and rotational speed, and displays them opengl

# Requirements

Bundler
Datamapper
Ruby-OpenGL (You will need native opengl headers)
Chingu (and Gosu which it is built off of)

Platform specific requirements for native compiling Gosu.
http://code.google.com/p/gosu/wiki/GettingStartedOnLinux
http://code.google.com/p/gosu/wiki/GettingStartedOnOsx
http://code.google.com/p/gosu/wiki/GettingStartedOnWindows


# Installation 

gem install bundler
bundle install

# Configuration

Orbits has two databases, a simple example orbits_time.sqlite and a list of all the planets in our solar system orbits_planets.sqlite
specify which one to load in orbiter.rb 

# Usage

ruby orbits.rb
