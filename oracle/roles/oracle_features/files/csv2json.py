import csv
import sys
import json
import re

#
#USAGE:##
#python csv2json.py myCSVfile.txt
#
#EDIT THIS LIST WITH YOUR REQUIRED JSON KEY NAMES
def convert(args):
 csv_filename = args[0]
 recname = args[1]
 print(csv_filename)
 test = re.compile(r'feature')
 #if test.search(csv_filename):
 if recname == 'f':   
    featurenames=[ "host_name", "instance_name", "database_name", "open_mode", "database_role",
    " created", "dbid", "version", "banner", "product", "feature_being_used",
    "usage", "last_sample_date", "detected_usages", "total_samples",
    "currently_used", "first_usage_date", "last_usage_date", "extra_feature_info"
    ]
    print("features")
 else :
    featurenames=[ "host_name", "instance_name", "database_name", "open_mode", "database_role",
    " created", "dbid", "version", "banner", "gid", "con_id",
    "con_name", "product", "usage", "last_sample_date", "currently_used", "first_usage_date", "last_usage_date"
    ]
    print("products")
 #print "Opening CSV file: ",csv_filename
 f=open(csv_filename, 'r')
 csv_reader = csv.DictReader(f,fieldnames=featurenames)
 json_filename = csv_filename.split(".")[0]+".json"
 print "",json_filename
 jsonf = open(json_filename,'w')
 data = json.dumps([r for r in csv_reader])
 jsonf.write(data)
 f.close()
 jsonf.close()

if __name__=="__main__":
 convert(sys.argv[1:])
