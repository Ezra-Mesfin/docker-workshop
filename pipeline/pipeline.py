import pandas as pd
import sys
print("arguments", sys.argv)

# Check if an argument was provided
if len(sys.argv) < 2:
    print("Error: Please provide a month number (e.g., python pipeline.py 01)")
    sys.exit(1)

month = int(sys.argv[1])
print(f"Running pipeline for month {month}")

df = pd.DataFrame({"day": [1, 2], "pass mon": [3, 4]})
print(df.head())

df.to_parquet(f"output_month_{sys.argv[1]}.parquet")