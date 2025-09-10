import pandas as pd
import json

# Load JSON file
with open("analyses/aeroplane_model.json", "r") as f:
    data = json.load(f)

# Normalize into rows
rows = []
for manufacturer, models in data.items():
    for model, attrs in models.items():
        row = {
            "manufacturer": manufacturer,
            "model": model,
            "max_seats": attrs["max_seats"],
            "max_weight": attrs["max_weight"],
            "max_distance": attrs["max_distance"],
            "engine_type": attrs["engine_type"]
        }
        rows.append(row)

df = pd.DataFrame(rows)
df.index = df.index + 1
df.index.names = ["id"]

df.to_csv("seeds/sample_raw/aeroplane_model.csv")
