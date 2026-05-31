## Setup

Clone the whole senior project repo into WSL. Then do these commands:
```bash
cd SENIOR-PROJECT/docker
./build.sh
./run.sh
```
The docker will open with two folders in /workspace: ASIC and MagicAndSpice.

MagicAndSpice has all the latest ADC files. Try running:
```bash
cd ~/workspace/MagicAndSpice
xschem
magic
LVS
```

ASIC is for running the ASIC synthesis, with:
```bash
cd ~/workspace/ASIC
make openlane
make showchip
```

To allow for easier access, open a new WSL tab and edit your bashrc file:
```bash
cd
vim .bashrc
```
Add this to the bottom of the file:
```bash
alias runsenior='cd && cd SENIOR-PROJECT/docker && ./run.sh'
```
Then close that tab and open a new WSL session. Now you can just type:
```bash
runsenior
```
To leave back to WSL, type:
```bash
exit
```