import csv
from pathlib import Path
from robot.api.deco import keyword

@keyword
def read_csv_file(filepath:str, filename:str) -> list:
    full_path = Path(filepath) / f"{filename}.csv"
    with open(full_path, 'r') as csv_file:
        csv_data = list(csv.DictReader(csv_file))
    return csv_data
        