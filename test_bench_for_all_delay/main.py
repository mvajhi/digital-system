def main():
    input_dict = get_input()
    print(input_dict)
    logic_list = create_logic_list(input_dict["count"])
    logical_transformations_list = create_logical_transformations_list(logic_list)
    output = create_verilog_code(logical_transformations_list, input_dict["sleep_time"])
    print("\nverilog code:\n")
    print(output)

def get_input():
    count = int(input("how many logic var do you have? "))
    sleep = int(input("How long to wait between each transformations (sleep time)? "))
    return {"count": count, "sleep_time": sleep}

def create_logic_list(var_count : int) -> list():
    output = list()
    last = "0" * var_count
    output.append(last)

    while last != "1" * var_count:
        last = increment_binary_string(last, var_count)
        output.append(last)
    
    print("list of logic: ", output)
    return output

def increment_binary_string(s, len):
  tmp = r'{:0' + str(len) + r'b}'
  return tmp.format(1 + int(s, 2))

def create_logical_transformations_list(logic_list: list):
    output = list()
    for index in range(len(logic_list)):
        for i in logic_list[index + 1:]:
            output.append(logic_list[index])
            output.append(i)
        output.append(logic_list[index])

    print("transformations list: ", output)
    return output

def create_verilog_code(transformations_list, sleep_time):
    output = str()
    
    tmp = "logic"
    for i in range(len(transformations_list[0])):
        tmp += " __" + str(i).zfill(2) + "__,"
    tmp = tmp[:-1] + ";\n"
    output += tmp

    output += "initial begin\n"
    for i in range(len(transformations_list)):
        tmp = "\t#" + str(sleep_time)
        for j in range(len(transformations_list[i])):
            tmp += " " + "__" + str(j).zfill(2) + "__"
            tmp += " = " + transformations_list[i][j] + ";"
        tmp += "\n"
        output += tmp
    output += "\t#" + str(sleep_time) + " $stop;\nend\n"

    return output

if __name__ == "__main__":
    main()