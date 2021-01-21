<h1 align="center">asmfuzz</h1>
<p align="center">Web fuzzing 100% in assembly</p>

<p align="center">
 <a href="#tasks-list">Tasks List</a> •
 <a href="#cloning--compile">Compile</a> •
 <a href="https://github.com/blackbinn/asmfuzz/blob/master/LICENSE">License</a> •
 <a href="https://github.com/arisusec">Author</a>
</p>


<h2 align="center">Tasks List</h2>

- [x] Arguments
- [ ] Banner
- [ ] Informations
- [ ] Loading Wordlist
- [ ] Requests (HTTP)
- [ ] Requests (HTTPS)
- [ ] Flags

<h2 align="center">Cloning & Compile</h2>

First, we will need to clone the repository.

• `$ git clone https://github.com/blackbinn/asmfuzz`

Okay, now we will compile asmfuzz.

• `$ nasm -f elf32 asmfuzz.asm`

After compiling, we will create an asmfuzz link and make it a linux executable.

• `$ ld -m elf_i386 -o asmfuzz asmfuzz.o`

Now asmfuzz.o is no longer needed ... so we can delete it. (Optional)

• `$ rm -rf asmfuzz.o`

### Ready!! Your asmfuzz is already compiled and working.
