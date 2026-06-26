from robot.api.deco import keyword

@keyword
def find_dict_by_key_value(data: list, key: str, value: str) -> dict:
    match = next((item for item in data if str(item.get(key)) == str(value)), None)
    if match is None:
        raise ValueError(f"No match found for {key}='{value}'")
    return match

@keyword
def are_lists_equal_in_length(list1: list, list2:list) -> bool:
    return  len(list1) == len(list2)

@keyword
def sort_dicts_by_key(data: list, key: str, reverse: bool = False) -> list:
    return sorted(data, key=lambda item: item[key], reverse=reverse)

@keyword
def cast_dict_field_to_float(data: list, key: str) -> list:
    for item in data:
        item[key] = float(item[key])
    return data

@keyword
def extract_field_from_dicts(data: list, key: str) -> list:
    return [item[key] for item in data]