## Mission Control Initialization scripts

A series of scripts to initialize a dev environment for the Mission Control project.

Installs docker & docker-compose, sources environment variables, and spins up an instance of the Prismatopia backend for Mission Control. A valid .env configuration file and the Mission Control repository are required for these scripts to be of any use besides installing Docker on your machine.

#### Get started:

1. Clone the Mission Control repo, which contains these init scripts
2. Configure your .env to match the credentials in the Mission Control documentation
```bash
cd init && make
```
3. Select your OS [MacOS, Arch, Ubuntu, Debian, CentOS, Fedora]
4. Automagical!
