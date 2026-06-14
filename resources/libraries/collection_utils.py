from robot.api.deco import keyword

@keyword
def find_dict_by_key_value(data: list, key: str, value: str) -> dict:
    match = next((item for item in data if str(item.get(key)) == str(value)), None)
    if match is None:
        raise ValueError(f"No match found for {key}='{value}'")
    return match
