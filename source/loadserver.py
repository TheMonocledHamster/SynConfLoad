import csv
import os

from fastapi import FastAPI, APIRouter
import numpy as np

from arrival_rates.gen_arrivals import slo_bins

class LoadServer:
    def __init__(self):
        pass

    @classmethod
    def get_dir(cls):
        cls.dir = os.path.dirname(os.path.abspath(__file__))

    def set_load(self, slo:int):
        slo = min([bin for bin in slo_bins if bin > slo])
        self.load = np.load(os.path.join(self.dir, f'load_{slo}.npy'))
    
    def get_load(self):
        pass


app = FastAPI()
router = APIRouter()
load_server = LoadServer()

dir:str = os.path.dirname(os.path.abspath(__file__)) + "/arrival_rates/"
slo:int = None


@app.put("/slo")
def set_slo(spec_slo:int):
    pass

@app.post("/metrics")
def root(action:int, slo:int):
    response = main(action, slo)
    return response

def main(action):
    path = dir + "slo{}.csv".format(slo)
    with open() as f:
        reader = csv.reader(f)
        data = np.array(reader,shape=(144,2))
    print(data)

main(0)
        