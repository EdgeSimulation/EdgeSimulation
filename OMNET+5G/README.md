OMNeT+5G readme

# Using OMNeT++ for Edge/Fog simulations

The access network of the Fog/edge environment is simulated by using the OMNeT++ simulator tool plus INET, Veins and SUMO libraries. OMNet++ 5G libraries are extracted from 5G-Sim-V2I/N implementation that is available in this link:

Open Source 5G V2I / V2N Application-Level Simulation OMNeT++ framework: https://github.com/deinleinT/V2IV2Nsim

The framework 5G-Sim-V2I/N includes OMNeT++ version 5.6.2, INET-framework Version 3.7.0 and SimuLTE-framework version 1.1.0. 
Eclipse SUMO Version 1.8.0 is the one we have used to obtain the vehicle trajectories in the coverage area.

Some modification have been performed to Deinlein's Urban scenario file ```omnetpp.ini``` to implement the 5G access network composed of nine micro cell antennas in the geographical area of coverage of the city of Alicante, at the South East of Spain. The resulting ```omnetpp.ini``` file is left in this repository.

## Prepare SUMO simulations 

Depending on the desired density of traffic configured in the SUMO simulation, several scenarios can be prepared.  We have used the following command in order to obtain the trips file. Be aware that by changing the period value, the rate of cars being generated in the simulations is defined:

```<SUMO_HOME>/tools/randomTrips.py -n Alicante_centro_ciudad.net.xml -e 10000 --min-distance 100  --period 1 --route-file Alicante_routes.rou.xml```

For the example configuration of 4956 cars in a 10000 seconds simulation, the command used is:

```<SUMO_HOME>/tools/randomTrips.py -n Alicante_centro_ciudad.net.xml -e 10000 --min-distance 100  --period 2.0177 --route-file Alicante_4956_routes-rou.xml```

## Execute OMNeT++ simulations 

In order to obtain delay metrics of the access network over the simulation time, we have modified the configuration of the ```rlcDelayDl``` statistical variable in the code file ```LteRlc.ned``` of Deinlein's version of the SimuLTE library (http://www.ltesimulator.com/). The change is to get Radio Link Control (RLC) delay values along the simulation time, instead of obtaining a scalar delay performance value at the end of the simulation. The modified code of ```LteRlc.ned``` can be found in this repository.

OMNeT++ executions have been called by using this command at the UrbanALC project directory:

```./UrbanALC -m -u Cmdenv -c VideoDL_4956 -n .:../inet/src:../inet/examples:../inet/tutorials:../inet/showcases:../lteNR/simulationsNR:../lteNR/src/common:../lteNR/src/corenetwork:../lteNR/src/epc:../lteNR/src/nr/apps:../lteNR/src/nr/common:../lteNR/src/nr/corenetwork:../lteNR/src/nr/epc:../lteNR/src/nr/stack:../lteNR/src/nr/world:../lteNR/src/stack:../lteNR/src/world:../lteNR/src/x2:../veins/examples/veins:../veins/src/veins:../veins_inet3/src/veins_inet:../veins_inet3/examples/veins_inet --image-path=../inet/images:../lteNR/images:../veins/images:../veins_inet3/images -l ../inet/src/INET -l ../veins/src/veins -l ../veins_inet3/src/veins_inet omnetpp.ini ```
