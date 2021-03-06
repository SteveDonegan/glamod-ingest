#!/usr/bin/env python

"""
make-indexes-sqls.py
====================

Writes sql scripts to create partition indexes.

"""


import sys
sys.path.append('.')

from _common import *


outfile = open('create-indexes.sql', 'w')

# generate child tables
for year in range(START_YEAR, END_YEAR + 1):

    for station, values in stations.items():
    
        if values['start'] > year: continue
    
        for report in values['report']:
        
           table_name = '{}.observations_{}_{}_{}'.format( schema, year, station, report )
           table_short = 'observations_{}_{}_{}'.format( year, station, report )
           
           for idx_field in ('date_time', 'observed_variable'): 
               print('CREATE INDEX {}_{}_idx ON {} ({});'.format(table_short, idx_field, table_name, idx_field), file=outfile) 

           # gist index is the location index...
           print('CREATE INDEX {}_{}_gist_idx ON {} USING gist ( {} );'.format(table_short, 'location', table_name, 'location'), file=outfile)
           print(f'[INFO] Worked on: {table_name}')
           
outfile.close()


