FROM axonasif/workspace-python:latest

# Test installing python package from dockerfile
RUN pip install --user cowsay
