# 100 Prisoners Riddle

This code simulates the 100 Prisoners Riddle I first saw presented by [Veritasium](https://www.youtube.com/watch?v=iSNsgj1OCLA)


### (Poor) Riddle Summary

100 prisoners are given an opportunity to escape if they can solve the following challenge:

Each prisoner is given a number from 1 to 100. The Warden will place 100 boxes in a room, and randomly distribute each prisoners' number into the boxes. 

One by one, the prisoners will enter the room, and have the opportunity to open half the boxes so they can find their own number.

The prisoners must leave the room as they found it, and may not communicate during the challenge.

If _all_ prisoners find their number, then all prisoners are set free, but if even one prisoner fails to find their number then all prisoners are executed.


### What This Code Does

I just wanted to validate the results in simulation, and use this as an excuse to write some code, Ruby is possibly not the best choice because of its performance charactaristics, but I like it for its expressiveness.

We:
* Create a large number of Prisons with many Prisoners each
* For each Prison let the Prisoners attempt with a random search strategy
* For each Prison let the Prisoners attempt with a cycle-based strategy (see Veritasium's video for details)
* Fin

The code does this verrrryyy naïevely, so its not memory efficient at all, as it holds onto Prison and Prisoner objects much longer than required for the simulation.

It is also damn slow.