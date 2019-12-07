# Download the sfdx tarball to the Downloads folder
wget https://developer.salesforce.com/media/salesforce-cli/sfdx-linux-amd64.tar.xz -P ~/Downloads

# Make a sfdx directory in the Downloads folder
mkdir ~/Downloads/sfdx

# Unpack the tarball into the created directory
tar xJf ~/Downloads/sfdx-linux-amd64.tar.xz -C ~/Downloads/sfdx --strip-components 1

# change to Downloads directory
cd ~/Downloads

# run the installation script for sfdx
./sfdx/install
