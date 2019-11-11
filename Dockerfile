FROM ubuntu:bionic

RUN apt update && \
    apt -q install --no-install-recommends -y \
    g++ \
    gcc \
    git \
    make \
    zip \
    unzip \
    ca-certificates \
    curl \
    libxml2 \
    libgirepository1.0-dev

RUN curl -L https://github.com/ldc-developers/ldc/releases/download/v1.16.0/ldc2-1.16.0-linux-x86_64.tar.xz >> ldc2.tar.xz
RUN tar -C /usr/local -xf ldc2.tar.xz
ENV PATH="/usr/local/ldc2-1.16.0-linux-x86_64/bin:${PATH}"

RUN curl -L https://github.com/ursa-labs/crossbow/releases/download/nightly-2019-10-25-0-azure-ubuntu-bionic/libarrow0_0.15.0.dev176-1_amd64.deb >> libarrow.deb
RUN curl -L https://github.com/ursa-labs/crossbow/releases/download/nightly-2019-10-25-0-azure-ubuntu-bionic/libarrow-dev_0.15.0.dev176-1_amd64.deb >> libarrow-dev.deb
RUN curl -L https://github.com/ursa-labs/crossbow/releases/download/nightly-2019-10-25-0-azure-ubuntu-bionic/libarrow-glib0_0.15.0.dev176-1_amd64.deb >> libarrow-glib.deb
RUN curl -L https://github.com/ursa-labs/crossbow/releases/download/nightly-2019-10-25-0-azure-ubuntu-bionic/gir1.2-arrow-1.0_0.15.0.dev176-1_amd64.deb >> gir-arrow.deb
RUN curl -L https://github.com/ursa-labs/crossbow/releases/download/nightly-2019-10-25-0-azure-ubuntu-bionic/libarrow-glib-dev_0.15.0.dev176-1_amd64.deb >> libarrow-glib-dev.deb
RUN curl -L https://github.com/ursa-labs/crossbow/releases/download/nightly-2019-10-25-0-azure-ubuntu-bionic/libparquet0_0.15.0.dev176-1_amd64.deb >> libparquet.deb
RUN curl -L https://github.com/ursa-labs/crossbow/releases/download/nightly-2019-10-25-0-azure-ubuntu-bionic/libparquet-dev_0.15.0.dev176-1_amd64.deb >> libparquet-dev.deb
RUN curl -L https://github.com/ursa-labs/crossbow/releases/download/nightly-2019-10-25-0-azure-ubuntu-bionic/libparquet-glib0_0.15.0.dev176-1_amd64.deb >> libparquet-glib.deb
RUN curl -L https://github.com/ursa-labs/crossbow/releases/download/nightly-2019-10-25-0-azure-ubuntu-bionic/gir1.2-parquet-1.0_0.15.0.dev176-1_amd64.deb >> gir-parquet.deb
RUN curl -L https://github.com/ursa-labs/crossbow/releases/download/nightly-2019-10-25-0-azure-ubuntu-bionic/libparquet-glib-dev_0.15.0.dev176-1_amd64.deb >> libparquet-glib-dev.deb

RUN apt install -y --no-install-recommends ./libarrow.deb ./libarrow-dev.deb ./libarrow-glib.deb ./gir-arrow.deb ./libarrow-glib-dev.deb ./libparquet.deb ./libparquet-dev.deb ./libparquet-glib.deb ./gir-parquet.deb ./libparquet-glib-dev.deb 

RUN mkdir /darrow
RUN git clone https://github.com/gtkd-developers/gir-to-d.git && cd /gir-to-d && git checkout 4d1d22f770b2a4bcbefef813bba0871f9dfdb81a && dub build
RUN git clone https://github.com/gtkd-developers/GtkD.git && cd /GtkD && git checkout tags/v3.8.3

RUN cd /gir-to-d && ./girtod --input /usr/share/gir-1.0/Arrow-1.0.gir --gir-directory /usr/share/gir-1.0/ --output /darrow
RUN rm /darrow/arrow/GIOOutputStream.d && \
    sed -i "s/public override DataType getValueType()/alias getValueType = Array.getValueType; public DataType getValueType()/" /darrow/arrow/ListArray.d && \
    sed -i "s/public bool isClosed(/public override bool isClosed(/" /darrow/arrow/FileT.d

RUN cd /gir-to-d && ./girtod --input /usr/share/gir-1.0/Parquet-1.0.gir --gir-directory /usr/share/gir-1.0/ --output /darrow

RUN ldc2 -O3 -release -shared -link-defaultlib-shared -of=/darrow/libdarrow.so \
    -I=/darrow -I=/GtkD/generated/gtkd -L-lparquet-glib -L-larrow-glib \
    /darrow/parquet/*.d /darrow/parquet/c/*.d /darrow/arrow/*.d \
    /GtkD/generated/gtkd/gobject/*.d /GtkD/generated/gtkd/glib/*.d /GtkD/generated/gtkd/gobject/c/*.d \
    /GtkD/generated/gtkd/glib/c/*.d /GtkD/generated/gtkd/gio/*.d /GtkD/generated/gtkd/gio/c/*.d \
    /GtkD/generated/gtkd/gtkd/Loader.d /GtkD/generated/gtkd/gtkd/paths.d /GtkD/generated/gtkd/gtkc/glibtypes.d \
    /GtkD/generated/gtkd/gtkc/gobjecttypes.d /GtkD/generated/gtkd/gtkc/giotypes.d
