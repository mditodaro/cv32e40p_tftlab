#!/usr/bin/python3

import sys 
import os
import datetime
from pprint import pprint
import pandas as pd

USAGE = \
"""
Usage gen_sdd_flist.py <float>
    
    <float>    A multiplier for the delay fault slacks
"""
GSF_CSV = os.environ['GSF_CSV']
TDF_RPT = os.environ['TDF_RPT'] 
SDD_RPT = os.environ['SDD_RPT']
TOPLEVEL = os.environ['TOPLEVEL']
CLK_NS = float(os.environ['CLK_NS'])

################
# sanity check #
################
if len(sys.argv) != 2: exit(USAGE)

try:
    K = float(sys.argv[1]) 
except:
    exit(USAGE)

# Save TDF faults into a list (will be used to filted the GSF)
tdf_list = []
with open(TDF_RPT) as fin:
    for line in fin:
        if line.strip() == 'FaultList{':
            break
    for line in fin:
        if line.strip() == '}':
            break
        fields = line.split()
        tdf_list.append([fields[1],fields[3][1:-2]])
    
df_tdf = pd.DataFrame(tdf_list, columns=['RF','site'])
    
#######################
# Delay should be     #
# CLK - SLACK         #
# Hence multiply with #
# (CLK - SLACK)*K     #
#######################

with open(GSF_CSV) as source, open(SDD_RPT, 'w') as dest:

    ######### HEADER INFORMATION #########
    print(f"Date(\"{datetime.datetime.now().strftime('%d/%m/%Y %H:%M:%S')}\")", file=dest)
    print(f"User(\"{os.getlogin()}\")"                                        , file=dest)
    print(f"Info(\"GSF-Based Small Delay Fault List\")"                       , file=dest)
    print(f"Tool(\"ZOIX\")\n"                                                 , file=dest)
    
    ######### FAULT LIST GENERATION #######
    print("FaultList{", file=dest)
    
    sdd_list = []
    source.readline()
    for line in source:
        fault_site, slow_to_rise, slow_to_fall = line.rstrip().split(',')
        fault_site = f"{TOPLEVEL}.{fault_site.replace(r'/', r'.')}"
        sdd_list.append(['F', fault_site, slow_to_fall])
        sdd_list.append(['R', fault_site, slow_to_rise])

    df_sdd = pd.DataFrame(sdd_list, columns=['RF', 'site', 'slack'])
    df_filtered_sdd = pd.merge(df_sdd, df_tdf, on=['RF', 'site'])
    
    for index, row in df_filtered_sdd.iterrows():
        rf, fault_site, slack = row['RF'], row['site'], row['slack']
        # '*' in gsf means INFINITY. Hence, use the default value since it'll be probably untestable #
        if slack != '*':
            print(f"\t NA {rf} ({(CLK_NS - float(slack)) * K:.2f}ns) {{PORT \"{fault_site}\"}}", file=dest) 
        else: 
            print(f"\t NA {rf} {{PORT \"{fault_site}\"}}", file=dest)

    print("}", file=dest)
    
print(f"Successfully generated SDD fault list \"{SDD_RPT}\"!")