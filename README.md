### Hi there 👋

<!--
**EdgeSimulation/EdgeSimulation** is a ✨ _special_ ✨ repository because its `README.md` (this file) appears on your GitHub profile.

Here are some ideas to get you started:

- 🔭 I’m currently working on ...
- 🌱 I’m currently learning ...
- 👯 I’m looking to collaborate on ...
- 🤔 I’m looking for help with ...
- 💬 Ask me about ...
- 📫 How to reach me: ...
- 😄 Pronouns: ...
- ⚡ Fun fact: ...
-->

You can use https://demo.hedgedoc.org/ to create the content of the readme file, once you are done just copy paste it from there or upload the md file

 
HEADER COMMENTS
//
// Copyright (C) [year] by [copyright holders <email>]
// This code is licensed under a Creative Commons Attribution 4.0 International License. (see LICENSE.txt for details)
//
// General Description - what is it used for, how it works
//
[code starts here]
 
 
 E2E simulation workflow

# Simulation workflow


## STEP 1 - Run OMNET

how to run OMNET

## STEP 2 - Process OMNET log file

The OMNET log file which is the output of the OMNET simulation is used as input for the ```JupyterNotebooks/MobileHandover_and_Delay``` jupyter notebook that analyses the delay and handover information and generates consolidated delay ```.csv``` output and initial placement and migration ```.txt``` files needed for CloudSim.

Note: you may need to adjust the location of the log files relative to the jyputer notebook.

## STEP 3 - Run CloudSim

The initial placement and migration txt files obtained from the jupyter notebook should be placed in a ```/log``` folder located together with the ```CloudSim/1s_CloudSimSUMORun.jar```

The CloudSim simulation can be started using the following notation:
```java -jar 1s_CloudSimSUMORun.jar HOSTS TYPE PLACEMENT MIGRATION SERVICES initialPositioning.txt migrations.txt```

See the README.md file in /CloudSim for details on each of the parameters.

Note that sometimes the CloudSim scheduler may complain about concurrent events problems due to the way it is originally implemented in the simulator. This can be avoided by changing the start time of the problematic service to start a bit earlier.

## STEP 4 - Process e2e delay

Use PostProcess_E2Edelay that will read the .csv output from step 1 and the log file output from CloudSim and calculate the end to end delay from service to user. Two output files will be created:
* a detailed information about e2e delay
* binned e2e delay that is averaged over a given period of time 

## STEP 5 - Visualise results

 
 
# Related papers
 
 The work presented here is a result of a continuous evolution over time working first with CloudSim and then adding other capabilities, first SUMO and now OMNET too.
 The following papers provide a historical overview of the work on the matter:
 *
 *
 *
 
