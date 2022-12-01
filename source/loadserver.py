import os

from fastapi import FastAPI, APIRouter
from pydantic import BaseModel
import numpy as np

from arrival_rates.gen_arrivals import slo_bins, dir, timeframe

class LoadSetter(BaseModel):
    slo: int
    freq: int

class BaseLoad(BaseModel):
    cpu: list
    mem: list

class LoadServer:
    def __init__(self):
        self.router = APIRouter()
        self.metrics = {
            "arrival_rate": 0.0,
            "load": [0,0],
            "latency":0.0,
            "done": False
        }
        self.router.add_api_route('/slo', self.set_load, methods=['PUT'])
        self.router.add_api_route('/base', self.set_base, methods=['PUT'])
        self.router.add_api_route('/load', self.get_load, methods=['GET'])

    def set_load(self, load:LoadSetter):
        self.slo = load.slo
        self.freq = load.freq
        if not self.slo <= max(slo_bins)*1.5:
            raise Exception(f"SLO {self.slo} is too high")
        elif self.slo > max(slo_bins):
            slo_bin = max(slo_bins)
        else:
            slo_bin = min([bin for bin in slo_bins if bin > self.slo])
        self.arrivals = np.load(os.path.join(dir, f'load_{slo_bin}.npy'))[:,1]
        self.ep_gen = self.episode_generator()
        self.new_episode()

    def set_base(self, base:BaseLoad):
        base.cpu = np.array(base.cpu)
        base.mem = np.array(base.mem)
        self.base = base
    
    def new_episode(self):
        self.metrics['done'] = False
        self.episode_lambda = next(self.ep_gen)
        rand_size = np.random.randint(10, len(self.arrivals))
        self.episode_arrivals = self.arrivals[0:rand_size]
        self.weight = self.freq * self.slo * 1e-3 / len(self.episode_arrivals)
        self.step_gen = self.step_generator()

    def episode_generator(self):
        for arrival in self.arrivals:
            yield arrival

    def step_generator(self):
        ratio = self.episode_lambda / sum(self.episode_arrivals)
        for arrival in self.episode_arrivals:
            yield arrival * ratio

    def calc_util(self):
        cutil = self.weight * self.base.cpu
        mutil = self.weight * self.base.mem
        return [np.ndarray.tolist(cutil), np.ndarray.tolist(mutil)]

    def calc_latency(self):
        return 0

    def get_load(self):
        if self.metrics['done']:
            self.new_episode()
        try:
            arrival_rate = next(self.step_gen)
            self.metrics["arrival_rate"] = arrival_rate * self.freq
            self.metrics["load"] = self.calc_util()
            self.metrics["latency"] = self.calc_latency()
        except StopIteration:
            self.metrics['done'] = True
        return self.metrics


app = FastAPI()
load_server = LoadServer()
app.include_router(load_server.router)

load_server.set_load(LoadSetter(slo=50, freq=20000))
load_server.set_base(BaseLoad(cpu=[4,8,6], mem=[8,32,16]))
for i in range(10):
    print(load_server.get_load())
