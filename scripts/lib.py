import sys
import os
import logging
import re

LOGGING_FORMAT = '%(asctime)-15s - %(name)s - %(levelname)s - %(message)s'
ipv4_address = "193.191.177.180"
ipv6_address = "2001:6a8:2880:a077::b4"

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

def increase_serial(zone_file_location):
    with open(zone_file_location, "r") as file:
        content = file.read()

    match_serial_regex = r"(\d+)\s*;\s*Serial"

    try:
        original_serial = re.search(match_serial_regex, content).group(1)
    except IndexError:
        error = "Could not find serial for zone located at %s" % (zone_file_location)
        print_error(error)

    try:
        original_serial_as_int = int(original_serial)
        new_serial = original_serial_as_int + 1
    except ValueError:
        error = "Invalid serial %s for zone located at %s" % (original_serial, zone_file_location)
        print_error(error)

    new_serial_string = "%d\t; Serial" % (new_serial)
    new_content = re.sub(match_serial_regex,
                         new_serial_string,
     					 content)

    with open(zone_file_location, "w") as file:
        logging.info("Increasing serial from %d to %d" % (original_serial_as_int, new_serial))
        file.write(new_content)
