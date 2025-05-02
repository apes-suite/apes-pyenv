# Python Environment for APES

This repository serves as a small gathering tool to provide a Python
virtual environment for the Python tools that are useful in development
and usage of the APES software.

Run `source apes-pyenv/activate` to activate this Python environment.

Then you can also install the APES applications into the environment
with:

```
FC=mpif90 bin/waf configure install --prefix=$VIRTUAL_ENV
```

For example to have Seeder and Musubi installed:
```
cd seeder
FC=mpif90 bin/waf configure install --prefix=$VIRTUAL_ENV
cd ../musubi
FC=mpif90 bin/waf configure install --targets=musubi,mus_harvesting --prefix=$VIRTUAL_ENV
```

Here Seeder would install all the smaller tools and libraries,
while Musubi only installs the two requested executables.

## Step by step instructions to setup a development environment

We'll use musubi in this example and use an `apes` directory in
our home (you could use any other directory of course) and we
use git with ssh, though you could of course also use any other
option to clone the repositories:

```
mkdir ~/apes
cd ~/apes
git clone git@github.com:apes-suite/apes-pyenv.git
source apes-pyenv/activate
git clone --recurse-submodules git@github.com:apes-suite/seeder.git
cd seeder
FC=mpif90 bin/waf configure install --prefix=$VIRTUAL_ENV
cd ..
git clone --recurse-submodules git@github.com:apes-suite/musubi.git
cd musubi
FC=mpif90 bin/waf configure install --targets=musubi,mus_harvesting --prefix=$VIRTUAL_ENV
```
