FROM gitpod/workspace-full

RUN <<EOR

cd /tmp
curl -fSsl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -qq awscliv2.zip
sudo ./aws/install --update

EOR