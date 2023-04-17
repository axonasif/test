FROM axonasif/workspace-python:debug7

# Test python version
RUN python --version > ~/python_version_test

# Test installing python package from dockerfile
# Will not be accessible after workspace boot
# But we're adding the pyenv system packages path to the virtualenv, as a workaround.
RUN pip install cowsay
