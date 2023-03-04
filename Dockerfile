from archlinux:latest

workdir /lib

# Install required dependencies
run pacman -Syu \
    git \
    python-scipy \
    swig \
    cppunit \
    fftw \
    boost \
    boost-libs \
    gnuradio \
    gnuradio-osmosdr \
    libvolk \
    log4cpp \
    base-devel \
    cmake \
    wxgtk3 \
    python-wxpython \
    libuhd-firmware \
    gnuradio-companion \
    python-requests \
    --noconfirm

run python -m ensurepip --upgrade
run python -m pip install packaging

workdir /liquid

# Manual liquid-dsp install
run git clone https://github.com/jgaeddert/liquid-dsp.git . && \
    sh ./bootstrap.sh && \
    sh ./configure --prefix=/usr && \
    make && \
    make install

# Install gr-lora
workdir /src

arg CACHEBUST
run git clone https://github.com/kerbstomps/gr-lora.git . && \
    mkdir build && \
    cd build && \
    cmake ../ -DCMAKE_INSTALL_PREFIX=/usr && \
    make && \
    make install && \
    ldconfig

workdir /src/apps

expose 40868

