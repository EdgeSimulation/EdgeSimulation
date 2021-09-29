CloudSim modules.zip

# Modules.zip
This archive file contains the ```/modules``` directory of the ```cloudsim-cloudsim-4.0``` project, wherein all changes to the original source code of CloudSum v4.0 have been made.

If you would like to incorporate these changes to a clean version of CloudSim v4.0 just replace the /modules directory content with the one provided in the archive.

If you want to merge the changes with other changes you have made, you will need to first check for differences and then carefully merge changes.

The main changes include:
* combined network/power datacentre that enables working with networking and power characteristics at the same time
    * location: ```modules/cloudsim/src/main/java/org.cloudbus.cloudsim.network_power.datacenter```
    * includes: 
        * new policies for VM placement and migration:
        * ```Network_PowerVmMigrationPolicyFogCommunityBased.java```
        * ```Network_PowerVmMigrationPolicyFogPredictiveCommunityBased.java```
        * ```OptimVMAllocationPolicy_FogCommunityBased_LB_SC.java```
* new example scenario setup in ```org.cloudbus.cloudsim.examples.network.datacenter```
    * ```Test_FatTree_Example_Power_FogPredictiveCommunityMigration_SUMO.java```
    * ```Test_FatTree_Example_Power_FogCommunityMigration_SUMO.java``` 
   * ```Test_FatTree_Example_Power_FogCommunityMigration.java```
* changes in a number of original CloudSim files that enable a service to be started and ended at a given specific time
* changes in a number of original CloudSim files made to use up the network bandwidth during the migration process
* bug fixes in a number of original CloudSim files
