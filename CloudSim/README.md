CloudSim readme
# Using CloudSim for Edge/Fog simulations

For the purposes of simulating the Fog/Edge infrastructure available at a network service provider we use the original CloudSim v4.0 simulator with custom changes added.

## Run simulations
To run simulations you can use the readily available jar file.
In the shell script there are examples of calling the jar file with the required input parameters.

The general description of the call is as follows:
```java -jar 1s_CloudSimSUMORun.jar HOSTS TYPE PLACEMENT MIGRATION SERVICES initialPositioning.txt migrations.txt```
where
* HOSTS - number of server hosts
* TYPE - host type, 0 or 1
    * 0 = 4 CPU cores, 8 GB RAM, 1 Gbps net card, 100 GB storage
    * 1 = 6 CPU cores, 12 GB RAM, 1 Gbps net card, 100 GB storage
* PLACEMENT - placement policy is community based with second layer of optimisation that can be 
    * server consolidation (sc) or 
    * load balancing (lb)
* MIGRATION - migration policy is community based with second layer of optimisation that can be 
    * sc-mad - server consolidatio with Median Absolute Deviation
    * lb-mad - load balancing with Median Absolute Deviation
* SERVICES - total number of services
* initialPositioning.txt - information about start and end time and initial community of each service
* migrations.txt - information about time of each migration request with optimal destination community
    * these two files are obtained from a Jupyter notebook that analyses the output from OMNET

## General description

The implemented custom changes enable the creation of a distributed datacenter where clusters of servers are placed at multiple locations. At each location the servers are interconnected locally via access switches, while the whole infrastructure is then connected via distribution and core switches. 
In addition, all servers are power aware, so that both networking and power characteristics can be analysed in CloudSim.

On top of this infrastructure we use custom VM allocation and migration policies that are aware of the network topology in the datacenter and differentiate between locally available resources on the access layer, and distant resources available via the distribution and core layers. The main idea is to place/migrate the VM to be as close to the user location as possible.

Each fog/edge service is created at a given time stamp, with the requested amount of resources (cores, RAM, HD, BW) and is destroyed at a given time stamp.

The CloudSim log files provide information about the location of placement and migration attempts of each service, and power consumption in the infrastructure.

