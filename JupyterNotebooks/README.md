Jupyter notebooks readme

# Jupyter notebooks

The Jupyter notebooks are used in the different stages of the workflow as described in the upper layer README document.

This is a short description of the functionalities of each notebook:
* mobileHandover_and_Delay - the notebook uses the OMNET log file as input and analyses the delay and mobile handover events. It creates the initial placement and migration files used as input for CloudSim and provides a consolidated output file with the mobile communication delay information.
* PostProcess_E2Edelay - the notebook uses output from CloudSim log files and output from mobileHandover_and_Delay notebook and combines the information to calculate the end-to-end delay for each service over time. It produces a detailed output with e2e delay information and a consolidated version with variable sized bins
* e2eDelay_bins_plot - 
