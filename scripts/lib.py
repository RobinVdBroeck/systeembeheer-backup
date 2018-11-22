import sys
import os
import logging

LOGGING_FORMAT = '%(asctime)-15s - %(name)s - %(levelname)s - %(message)s'

def print_info(info):
    logging.info(info)
    print(info)

def print_error(err):
    logging.error(err)
    print(err)
    sys.exit(1)

def get_log_location(name):
    log_file = "/var/log/scripts/%s.log" % (name)
    os.makedirs(
        os.path.dirname(log_file),
        exist_ok=True
    )
    return log_file
