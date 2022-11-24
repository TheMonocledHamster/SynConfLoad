import os

from fastapi import FastAPI, APIRouter
import numpy as np

from .arrival_rates.gen_arrivals import slo_bins, dir


class LoadServer:
    def __init__(self):
        self.router = APIRouter()
        self.metrics = {
            "arrival_rate": [],
            "resources": [],
            "latency": 0.0
        }
        self.router.add_api_route('/slo', self.set_load, methods=['PUT'])
        self.router.add_api_route('/metrics', self.get_load, methods=['POST'])

    def set_load(self, slo:int, weight:int):
        if not slo <= max(slo_bins)*1.5:
            raise Exception(f"SLO {slo} is too high")
        elif slo > max(slo_bins):
            slo = max(slo_bins)
        else:
            slo = min([bin for bin in slo_bins if bin > slo])
        self.arrivals = np.load(os.path.join(dir, f'load_{slo}.npy'))
    
    def load(self):
        pass
    
    def get_load(self, action):
        return self.metrics


app = FastAPI()
load_server = LoadServer()
load_server.set_load(70,100)
app.include_router(load_server.router)
