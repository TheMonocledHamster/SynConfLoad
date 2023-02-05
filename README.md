# Synthetic Load Generation for Dynamic Cloud Configuration Management

1.  Install PostgreSQL 14 or later along with psql\
    <https://www.postgresql.org/>

2.  Clone the repository from Github or Zenodo\
    [https://github.com/TheMonocledHamster/SynConfLoad/\
    ](https://github.com/TheMonocledHamster/SynConfLoad/)<https://zenodo.org/badge/latestdoi/568378464>

3.  Download the Azure Traces dataset from <https://github.com/Azure/AzurePublicDataset/blob/ef8b2517b27357df0b418b6e6ca4efcdeb5117b0/AzureFunctionsDataset2019.md>

4.  From the dataset, copy 2 files, function_durations_percentiles.anon.d01.csv and invocations_per_function_md.anon.d01 into the source/traces/AzureFunctions/ directory. Your directory structure should look something like this:\
    ![](https://lh6.googleusercontent.com/5Ir4VH6pNqg6ItjqXNXt0w3ao1bxrg1wL-RLX6y_Asca8dn78iPs8ClRNi8zVseBPI2uY6l-v0rkU94eZ2N0OIPb4WzPSHb69iABmsjOAfJY5ULkZaRIEK7gwUVCNrCuvuOa-tR71OQfwE4VFq_Vnc4)

5.  Ensure that the PostgreSQL Database is properly installed and in operation.

6.  Run sudo -u postgres bash source/db/run.sh from the project root directory.

7.  The script may take anywhere from 1-3 hours to execute, with a max disk space requirement of around 10 GB.

8.  Upon completion, do the following:

1.  Install psycopg2 and numpy using\
    pip install psycopg2-binary\
    pip install numpy

2.  Navigate to source/arrival_rates/gen_arrivals.py

3.  Change the user to your username

4.  Run python  gen_arrivals.py

The final data should be populated into sub-folders within the arrival_rates directory, as .csv and .npy files for each SLO bin.
