# Mobile edge computing simulation in 5G environment

This repository provides the tools needed to create edge computing simulations in a defined urban area where 5G infrastructure is placed.
For these purposes a combination of the 5G enabled OMNeT++ simulator together with an extended for edge computing CloudSim simulator is used.
In addition there are several Jupyter Notebooks that help connect these simulators together and manage the pre and post data processing.

The complete workflow with all the steps needed to create, run and post process a simulation is provided below.
In the different folders of the repository there are separate README files that describe how to use the different parts of the simulation tools. 



# Simulation workflow

## STEP 1 - Run OMNeT++

The definition of the area that is simulated with the number of mobile users and their mobility patterns, and the 5G infrastructure (location of base stations and their characteristics) is made in OMNeT++ that is augmented with a 5G module. The information about the urban area is taken from OpenStreetMaps, and fed into SUMO that is part of OMNeT++ and is in charge of the mobility of the mobile nodes.
Learn how to run an OMNeT++ 5G simulation by reading the README.md file that is located in the OMNET+5G folder. Once you setup and run the simulation, the output log file is used as an input to the next step.

## STEP 2 - Process OMNeT++ log file

The OMNET log file which is the output of the OMNeT++ simulation is used as input for the ```JupyterNotebooks/MobileHandover_and_Delay``` jupyter notebook that analyses the delay and handover information and generates consolidated delay ```.csv``` output and initial placement and migration ```.txt``` files needed for CloudSim.

Note: you may need to adjust the location of the log files relative to the jupyter notebook.

## STEP 3 - Run CloudSim

The initial placement and migration txt files obtained from the Jupyter Notebook should be placed in a ```/log``` folder located together with the ```CloudSim/1s_CloudSimSUMORun.jar```

The CloudSim simulation can be started using the following notation:
```java -jar 1s_CloudSimSUMORun.jar HOSTS TYPE PLACEMENT MIGRATION SERVICES initialPositioning.txt migrations.txt```

See the README.md file in /CloudSim for details on each of the parameters.

Note that sometimes the CloudSim scheduler may complain about concurrent events problems due to the way it is originally implemented in the simulator. This can be avoided by changing the start time of the problematic service to start a bit earlier.

## STEP 4 - Process CloudSim log file

CloudSim log files need to be post processed to obtain the necessary inforation for computing the services delays at the edge and cloud network. They are the input of the ```JupyterNotebooks/cloudsim_postprocess``` jupyter notebook that generates a set of files that are the input of the ```JupyterNotebooks/cloudsim_postpro_R``` notebook that computes the infrastructure network delay in an output file. The rest of the files obtained by the first notebook can be used for the generation of other figures showing more detailed resource management performance results.

Note: you may need to adjust the location of the log files relative to both jupyter notebooks

## STEP 5 - Process e2e delay

Use ```PostProcess_E2Edelay``` that will read the .csv output from step 1 and the [CHANGE .csv output file of step 4] log file output from CloudSim and calculate the end to end delay from service to user. Two output files will be created:
* a detailed information about e2e delay
* binned e2e delay that is averaged over a given period of time 

## STEP 6 - Visualise results


First simulation results can be obtained with the ```JupyterNotebooks/e2eDelay_plots``` jupyter notebook that generates several types of figures in per simulation and also with aggregated data of several simulations. Input data to this notebook are the e2e delay files generated by STEP 5.

Binned e2e delay boxplot figures  are created with the```JupyterNotebooks/e2eDelay_bins_plot``` jupyter notebook.

 
# Related papers
 
 The work presented here is a result of a continuous evolution over time working first with CloudSim and then adding other capabilities, first SUMO and now OMNET too.
 The following papers provide a historical overview of the work on the matter:

* Katja Gilly, Cristina Bernad, Pedro J. Roig, Salvador Alcaraz, Sonja Filiposka,"End-to-end simulation environment for mobile edge computing", Simulation Modelling Practice and Theory, Volume 121, 2022, 102657,
ISSN 1569-190X, https://doi.org/10.1016/j.simpat.2022.102657.
* Sonja Filiposka, Anastas Mishev, and Katja Gilly. "Mobile‐aware dynamic resource management for edge computing." Transactions on Emerging Telecommunications Technologies 30, no. 6 (2019): e3626. - introducing dynamic edge services placement and migration policies
* Katja Gilly, Sonja Filiposka, and Salvador Alcaraz. "Predictive Migration Performance in Vehicular Edge Computing Environments." Applied Sciences 11, no. 3 (2021): 944. - introducing predictive placement and migration policies in CloudSim
* Katja Gilly, Salvador Alcaraz, Noura Aknin, Sonja Filiposka, and Anastas Mishev. "Modelling edge computing in urban mobility simulation scenarios." In 2020 IFIP Networking Conference (Networking), pp. 539-543. IEEE, 2020. - introducing an edge simulation environment by combining CloudSim and SUMO, w/o mobile communication
* Thomas Deinlein, Reinhard German, and Anatoli Djanatliev. "5G-Sim-V2I/N: Towards a Simulation Framework for the Evaluation of 5G V2I/V2N Use Cases." In 2020 European Conference on Networks and Communications (EuCNC), pp. 353-357. IEEE, 2020. - introducing the last piece of the puzzle, the 5G module in OMNeT++
