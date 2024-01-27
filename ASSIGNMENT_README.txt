This is a README file containing a brief summary of the file that were created for the assignment

/commands
    This folder contains both the csv file containing all the path, as well as the script to select them; 
    the command.txt file is a brief summary of the most used make command

/elaborate
    Here is the python script we used to analyze the data and generate the graphs images; 
    the results.txt file contains all the coverages for all the simulations we executed

/sbst
    This folder already contained all the files related to the sbst simulation; 
    in the test/ subfolder we added a .S file for each different test that we executed;
    The main.c file wasd changed accordingly and used to select end run the desired test

/tmax_generation
    This folder includes the script for the ATPG generation from tmax and the relative reports. 
    The script takes as input the netlist of the divider. The output of the synthesis 
    process is not present with this delivery for space reasons.

In the root directory there also other useful files:

-execute_basic.sh
    Bash script used to run a single instance of the simulation;
    it starts from the prime time generation, ending with the zoix simultion with K=1.05

-execute.sh
    This was the main script we used for running our simulation automatically;
    it needs to be called after compiling everything;
    it executes zoix simulation for every needed value of K, as was explained in the report

-extractor.sh
    This script, called by execute.sh after each simulation, looks into the generated report and extracts
    the value for the coverage.
    The value is appended in a new line of the output.txt file; 
    this way is easier to add all the coverage values to the sesults.txt file previously mentioned

