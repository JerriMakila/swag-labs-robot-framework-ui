import csv
from robot.api.deco import keyword

@keyword
def read_csv_file(filepath:str, filename:str) -> dict:
    with open(f"{filepath}/{filename}.csv", 'r') as csv_file:
        csv_data = list(csv.DictReader(csv_file))
    return csv_data
        