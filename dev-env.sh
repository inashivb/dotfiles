# Install all required packages
sudo apt-get -y install libpcre2-dev build-essential autoconf \
automake libtool libpcap-dev libnet1-dev libyaml-0-2 libyaml-dev \
pkg-config zlib1g zlib1g-dev libcap-ng-dev libcap-ng0 make \
libmagic-dev libjansson-dev jq git-core sccache

# Install cbindgen
cargo install --force cbindgen

# Make dir
mkdir -p $HOME/Orgs/oisf
cd $HOME/Orgs/oisf

# Clone all projects
git clone git@github.com:inashivb/suricata.git
git clone git@github.com:inashivb/suricata-verify.git
git clone git@github.com:inashivb/suricata-update.git
git clone git@github.com:inashivb/suricata-intel-index.git

# Go to Suricata and build it
cd suricata

# Set upstream
git remote add upstream git@github.com:oisf/suricata.git

make clean

./autogen.sh
retval=$?

if [ $retval -ne 0 ]; then exit; fi

./configure CC="sccache gcc" CFLAGS="-fno-common -O0 -ggdb3 -Werror -Wchar-subscripts -fno-strict-aliasing -fstack-protector-all -fsanitize=address -fno-omit-frame-pointer -Wshadow" --prefix=/usr/ --sysconfdir=/etc/ --localstatedir=/var/ --disable-shared --enable-debug-validation --enable-debug
retval=$?

if [ $retval -ne 0 ]; then exit; fi

# Build if configured properly
make -j8
