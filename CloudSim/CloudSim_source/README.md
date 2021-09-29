CloudSim modules.zip

# Modules.zip
This archive file contains the ```/modules``` directory of the ```cloudsim-cloudsim-4.0``` project, wherein all changes to the original source code of CloudSum v4.0 have been made.

If you would like to incorporate these changes to a clean version of CloudSim v4.0 just replace the /modules directory content with the one provided in the archive.

If you want to merge the changes with other changes you have made, you will need to first check for differences and then carefully merge changes.

The main changes include:
* combined network/power datacentre that enables working with networking and power characteristics at the same time
    * location: ```modules/cloudsim/src/main/java/org.cloudbus.cloudsim.network_power.datacenter```
* new policies for VM placement
* new policies for VM migration
* new example scenario setup
* changes that enable a service to be started and ended at a given specific time
* changes made to use up the network bandwidth during the migration process
* bug fixes
