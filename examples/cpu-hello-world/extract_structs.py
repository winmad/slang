import argparse

def get_struct_name(str):
	return str[7:]


def main(name):
	struct_names = []
	res = ""
	with open(name + ".hlsl", "r") as f:
		program = f.read()

	lines = program.split("\n")

	in_struct = False
	for i in range(len(lines)):
		str = lines[i]
		if str[0:7] == "struct ":
			in_struct = True
			struct_name = get_struct_name(str)
			if "Intermediates" in struct_name:
				struct_names.append(struct_name)

		if in_struct:
			if (not "matrix<" in str) and (not "vector<" in str) and (not "half " in str):
				res += str + "\n"

		if str == "};" and in_struct:
			in_struct = False
			res += "\n"
	
	#print(struct_names)

	res += "struct Total\n"
	res += "{\n"
	i = 0
	for struct_name in struct_names:
		res += "    " + struct_name + " " + f"_data{i}" + ";\n"
		i += 1
	res += "};\n"

	with open(name + "_structs.h", "w") as f:
		f.write(res)
	

if __name__ == "__main__":
	parser = argparse.ArgumentParser()
	parser.add_argument("-name", type=str, default="recompute")
	args = parser.parse_args()
	main(args.name)
