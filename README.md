# Zeus TPU 
## Basic Idea 
TPU's are the backbone of the recent AI breakthroughs and as a hardware technology seem to be less complex and more optimized than modern cpu's. 
All of these led to the decision of creating a tpu based on verilog as a personal project, to enhance the understanding of TPUS and AI and develop skills, specifically learning to create VLSI's with verilog. 
## Project Outline 
Since the creator of this repository is a complete beginner in all of these things it is better to break the process into smaller steps and targets before pushing through the creation of a complex general system.
## Inital steps for building the basic skills  
### Step 1: 
Create a register file as a structure in Verilog similar(or even almost identical) to the MIPS processor one and test it by reading and writing data on it.  
MIPS architecture was selected due to prior knowledge as well as availability of resources, though the register file will become RISC-V architecture in the near future.  
### Step 2:
Create a simple ALU capable of basic arithmetic operations(on the MIPS architecture as well and then enhance it).  
Make the ALU perform vector operations and maybe add floating point arithmetic(though not necessary for small 4-bit quantized models)
### Step 3: 
Connect all the parts together. Create a single cycle pipeline capable of performing basic operations.
### Step 4:
Add pipelining and finetune the architecture by creating a hazard mitigation unit and forwarding.  
### Step 5:
Create or use an existing MIPS assembler based on this specific architecture and test the system.
### Step 6:
Back to basics. Clean redesign of everything ISA, Cache and design choices. 
Create a complete and organized plan for the TPU architecture.
### NEXT STEPS 
Build, test, fail, iterate!  
