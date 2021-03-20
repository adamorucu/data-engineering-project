#!/usr/bin/python3
import sys
filename = sys.argv[1]
times = int(sys.argv[2])
print(f'Replicating: {filename} {times} times.')

header_saved = False

with open(f'repli_{times}_{filename}', 'w') as fout:
    with open(filename) as f:
        header = next(f)
        if not header_saved:
            fout.write(header)
            header_saved = True
        content = f.read()
        for _ in range(times):
            fout.write(content)
