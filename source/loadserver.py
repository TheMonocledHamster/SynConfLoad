import os

from fastapi import FastAPI, APIRouter
from pydantic import BaseModel
import numpy as np

from arrival_rates.gen_arrivals import slo_bins, dir, timeframe

class LoadSetter(BaseModel):
    slo: int
    freq: int

class LoadServer:
    def __init__(self):
        self.router = APIRouter()
        self.metrics = {
            "arrival_rate": 0.0,
            "util": [0,0]
        }
        self.router.add_api_route('/slo', self.set_load, methods=['PUT'])
        self.router.add_api_route('/load', self.get_load, methods=['POST', 'GET'])
        self.flag = False

    def set_load(self, load: LoadSetter):
        slo = load.slo
        self.freq = load.freq
        if not slo <= max(slo_bins)*1.5:
            raise Exception(f"SLO {slo} is too high")
        elif slo > max(slo_bins):
            slo_bin = max(slo_bins)
        else:
            slo_bin = min([bin for bin in slo_bins if bin > slo])
        self.arrivals = np.load(os.path.join(dir, f'load_{slo_bin}.npy'))
        self.weight = slo * 1e-3 / (len(self.arrivals) * timeframe)
        self.flag = True

    def calc_util(self):
        # TODO: fix this
        cpu_base = np.random.randint([4,8,6], [6,12,9])
        cutil = self.weight * cpu_base * self.freq
        mem_base = np.random.randint([4,8,16], [6,12,24])
        mutil = self.weight * mem_base * self.freq
        return [np.ndarray.tolist(cutil), np.ndarray.tolist(mutil)]

    def get_arrival(self):
        # TODO: recheck types
        for arrival in self.arrivals[:,1]:
            yield arrival

    def get_load(self):
        if not self.flag:
            raise Exception("SLO not set")
        self.metrics["arrival_rate"] = next(self.get_arrival()) * self.freq
        self.metrics["util"] = self.calc_util()
        return self.metrics



app = FastAPI()
load_server = LoadServer()
app.include_router(load_server.router)
load_server.set_load(LoadSetter(slo=100, freq=10000))
print(load_server.get_load())
