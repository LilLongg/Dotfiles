#!/usr/bin/env python

import json
import psutil

CPU_TEMP_SENSOR_PRIORITY = "coretemp"
TEMP_WARNING_THRESHOLD = 60
TEMP_CRITICAL_THRESHOLD = 75

DATA = psutil.sensors_temperatures()
temps = [temp.current for temp in DATA[CPU_TEMP_SENSOR_PRIORITY]]
temp = int(sum(temps) / len(temps)) if temps else 0

output = {"text": f"{temp}°C", "tooltip": "Cpu temperature"}

if temp < TEMP_WARNING_THRESHOLD:
    output["alt"] = "normal"
elif temp < TEMP_CRITICAL_THRESHOLD:
    output["alt"] = "warning"
    output["class"] = "warning"
else:
    output["alt"] = "critical"
    output["class"] = "critical"

print(json.dumps(output))
