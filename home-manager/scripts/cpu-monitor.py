#!/usr/bin/env python

import json
from sys import argv
from concurrent.futures import ThreadPoolExecutor

import psutil


N_LOGICAL_CORES = psutil.cpu_count()
N_PHYSICAL_CORES = psutil.cpu_count(logical=False)
EXTRA_CORES = N_LOGICAL_CORES - N_PHYSICAL_CORES
LOGICAL_CORE_MAP = [(0, 0)] * 16
for core in range(N_LOGICAL_CORES):
    if core < 2 * EXTRA_CORES:
        LOGICAL_CORE_MAP[core] = (core // 2, core - (core & 1))
    else:
        LOGICAL_CORE_MAP[core] = (core - EXTRA_CORES, core)

SAMPLE_DURATION = float(argv[1]) if len(argv) > 1 else 1.0
with ThreadPoolExecutor(max_workers=2) as executor:
    while True:
        TEMP = psutil.sensors_temperatures()["coretemp"]
        MAIN_TEMP = int(TEMP[0].current)
        CORES_TEMP = [
            int(core.current)
            for core in sorted(TEMP[1:], key=lambda core: int(core.label[5:]))
        ]

        LOAD_SAMPLE_TIME = 0.2
        GET_LOAD_TASK = executor.submit(psutil.cpu_percent, interval=SAMPLE_DURATION)
        GET_PERCORE_TASK = executor.submit(
            psutil.cpu_percent, interval=SAMPLE_DURATION, percpu=True
        )
        LOAD = GET_LOAD_TASK.result()
        CORES_LOAD = GET_PERCORE_TASK.result()

        OUTPUT = {
            "temp": MAIN_TEMP,
            "load": round(LOAD),
            "cores": [
                {
                    "temp": CORES_TEMP[physical_core],
                    "load": round(CORES_LOAD[logical_core]),
                }
                for physical_core, logical_core in LOGICAL_CORE_MAP
            ],
        }
        print(json.dumps(OUTPUT), flush=True)
