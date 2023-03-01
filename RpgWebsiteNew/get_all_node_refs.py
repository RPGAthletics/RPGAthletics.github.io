from pathlib import Path
import re

file = Path(
    # r"C:\Users\hagab\Desktop\rpg.github.io\RpgWebsiteNew\TextureButtonLabel.tscn"
    r"C:\Users\hagab\Desktop\rpg.github.io\RpgWebsiteNew\RpgWebsite.tscn"
)
# text = list(
#     tuple("".join(j for j in i.split("=")[1] if j.isalpha())
#           for i in x.split()[1:])
#     for x in file.read_text().splitlines()
#     if "[node" in x
# )

d = {}
lol = []
for x in [a for a in file.read_text().splitlines() if "[node" in a][1:]:
    chars = [i.split("=")[1]
             for i in x.split()[1:]]
    stuffs = ["".join(a for a in x if a.isalnum() or a == "/") for x in chars]
    # print(stuffs)
    name = re.sub(r'(?<!^)(?=[A-Z])', '_', stuffs[0]).lower()
    if name not in d:
        d[name] = -1

    d[name] += 1
    print(stuffs)
    full = stuffs[0]
    if len(stuffs[2]) != 0:
        full = stuffs[2] + "/" + stuffs[0]
    lol.append(
        f"""onready var {name}{"" if d[name] == 0 else d[name]}: {stuffs[1]} = $\"{full}\"""")

with open("output.txt", "w") as f:
    f.writelines(sorted(x+"\n"for x in lol))
