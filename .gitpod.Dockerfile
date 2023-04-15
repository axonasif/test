FROM axonasif/workspace-python:debug6

# Test python version
RUN python --version > ~/python_version_test

# Test installing python package from dockerfile
# Will not be accessible after workspace boot
RUN pip install cowsay
