# system-modeller-docs

This repository contains the Spyderisk System Modeller user documentation
source files along with the necessary tools to build the documentation website.

## Development Using Docker

### Pre-requisites

You need Linux, with `docker` and `docker-compose` installed.

Note: Windows is not supported, eg with Docker Desktop.

### Development

From the top-level folder of the repository, run `docker-compose up`. This will
build the documentation and serve it on `http://localhost:8000`. If a port
other than 8000 is required then set the environment variable `MKDOCS_PORT` to
the desired port before executing `docker-compose up`.

Edit the Markdown files in the `docs` folder. When you save a file, the output
files in `site` will be updated and the web browser will refresh as necessary.

## Contributors

The documentation was written by Nic Fair with some assistance from [Stephen C. Phillips](https://github.com/scp93ch).

## Licence

Copyright 2023 University of Southampton IT Innovation Centre and licensed under the Apache 2.0 license.

### 3rd Party Libraries

At time of writing, the licenses of the 3rd party dependencies are:

```
 Name                        Version  License                              
 Jinja2                      3.1.2    BSD License                          
 Markdown                    3.5      BSD License                          
 MarkupSafe                  2.1.3    BSD License                          
 PyYAML                      6.0.1    MIT License                          
 Pygments                    2.16.1   BSD License                          
 click                       8.1.7    BSD License                          
 ghp-import                  2.1.0    Apache Software License              
 importlib-metadata          6.8.0    Apache Software License              
 mergedeep                   1.3.4    MIT License                          
 mkdocs                      1.5.3    BSD License                          
 mkdocs-material             6.1.0    MIT License                          
 mkdocs-material-extensions  1.2      MIT License                          
 packaging                   23.2     Apache Software License; BSD License 
 pathspec                    0.11.2   Mozilla Public License 2.0 (MPL 2.0) 
 platformdirs                3.11.0   MIT License                          
 pymdown-extensions          10.3     MIT License                          
 python-dateutil             2.8.2    Apache Software License; BSD License 
 pyyaml_env_tag              0.1      MIT License                          
 six                         1.16.0   MIT License                          
 watchdog                    3.0.0    Apache Software License              
 zipp                        3.17.0   MIT License                   
```
