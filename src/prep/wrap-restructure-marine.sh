#!/bin/bash

cd /gws/smf/j04/c3s311a_lot2/astephen/glamod-ingest/
source venv/bin/activate
export PYTHONWARNINGS=ignore

cd src/prep/
python ./restructure-marine.py $@
