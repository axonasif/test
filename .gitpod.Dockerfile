FROM axonasif/workspace-python:debug2

# Test python version
RUN python --version > ~/python_version_test

# Test installing python package from dockerfile
RUN pip install cowsay
