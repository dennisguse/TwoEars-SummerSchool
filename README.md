Two!Ears Summer School
===
The project was done at the [Two!Ears Summer School 2015](http://twoears2015.sciencesconf.org/) in Toulouse, France (2015).
The goal was the implementation of an algorithm to search, locate and identify sound sources while controlling a robot.
The robot, a [turtlebot](http://www.turtlebot.com/), was equipped with two microphones resempling two ears.

The maze with the sound sources consisted of three rooms and only one sound source would be active at a time.
an overview can be seen in this [video](video-demo.mp4) (Video was taken from [here](http://twoears2015.sciencesconf.org/resource/page/id/27).

The basic idea of the implemented algorithm:

1. Drive to the center of the current room
2. When no source is present drive to next room
3. When a source is present (noise level with RMS > 250): repeat up to 5 times
  1. Listen: repeat 5 time: 
     1. acquire azimuth estimation
     2. rotate by +30 degrees
  2. Drive in direction of azimuth: 0.2m
4. Classify source using Spectral Analysis based upon training (stored in features.mat)
5. Conduct a robot dance

Repeat this algorithms until _3_ sources are found.

_ATTENTION: Code has never exectuted._

Project members:

# Axel Rauschenberger, Universität Hannover
# David E. Fernandez, Universidad Carlos III Madrid
# Dennis Guse, TU Berlin
# Siddhartha Jha, Sonova GmbH
# Van Q. Nguyen, INRIA