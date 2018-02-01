
#########################################################
# Run this script under ~/event/*json directory         #
# Change event_files_directory_path and output_filename #
#########################################################

import json
import glob
import sys
import pandas as pd
from collections import OrderedDict

seen = OrderedDict()
filenames = []
db = []

event_files_directory_path = '*.json'
output_filename = 'P11_events.json'

for fname in glob.glob(event_files_directory_path):
    with open(fname, 'r') as data:
        L = json.load(data)
        for d in L:
            d_id = d["id"]
            if d_id not in seen:
                seen[d_id] = d

with open(output_filename, 'w') as outfile:
    json.dump(seen.values(), outfile)