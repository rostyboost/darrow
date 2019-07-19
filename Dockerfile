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
    apt-transport-https \
    gnupg \
    lsb-core \
    lsb-release \
    curl

RUN curl -L https://github.com/ldc-developers/ldc/releases/download/v1.16.0/ldc2-1.16.0-linux-x86_64.tar.xz >> ldc2.tar.xz
RUN tar -C /usr/local -xf ldc2.tar.xz
ENV PATH="/usr/local/ldc2-1.16.0-linux-x86_64/bin:${PATH}"

RUN curl -L https://dl.bintray.com/apache/arrow/$(lsb_release --id --short | tr 'A-Z' 'a-z')/apache-arrow-keyring.gpg >> /usr/share/keyrings/apache-arrow-keyring.gpg
#RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 91D18FCF079F8007
RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/apache-arrow-keyring.gpg] https://dl.bintray.com/apache/arrow/$(lsb_release --id --short | tr 'A-Z' 'a-z')/ $(lsb_release --codename --short) main" >> /etc/apt/sources.list.d/apache-arrow.list
RUN echo "deb-src [signed-by=/usr/share/keyrings/apache-arrow-keyring.gpg] https://dl.bintray.com/apache/arrow/$(lsb_release --id --short | tr 'A-Z' 'a-z')/ $(lsb_release --codename --short) main" >> /etc/apt/sources.list.d/apache-arrow.list
RUN apt update
RUN apt -q install --no-install-recommends -y \
    libarrow-dev \
    libarrow-glib-dev \
    libparquet-dev \
    libparquet-glib-dev \
    libgirepository1.0-dev

RUN mkdir /darrow
RUN git clone https://github.com/gtkd-developers/gir-to-d.git && cd /gir-to-d && git checkout tags/v0.19.1 && dub build
RUN git clone https://github.com/gtkd-developers/GtkD.git && cd /GtkD && git checkout tags/v3.8.3

RUN cd /gir-to-d && ./girtod --input /usr/share/gir-1.0/Arrow-1.0.gir --gir-directory /usr/share/gir-1.0/ --output /darrow
RUN rm /darrow/arrow/GIOOutputStream.d && \
    sed -i "s/public Array cast(/public Array cast_(/" /darrow/arrow/Array.d && \
    sed -i "s/public override DataType getValueType()/alias getValueType = Array.getValueType; public DataType getValueType()/" /darrow/arrow/ListArray.d && \
    sed -i "s/public bool isClosed(/public override bool isClosed(/" /darrow/arrow/FileT.d && \
    sed -i '66s/public/\/*public/' /darrow/arrow/Table.d && \
    sed -i '76s/}/}*\//' /darrow/arrow/Table.d

RUN cd /gir-to-d && ./girtod --input /usr/share/gir-1.0/Parquet-1.0.gir --gir-directory /usr/share/gir-1.0/ --output /darrow

RUN ldc2 -O3 -release -shared -link-defaultlib-shared -of=/darrow/libdarrow.so \
    -I=/darrow -I=/GtkD/generated/gtkd -L-lparquet-glib -L-larrow-glib \
    /darrow/parquet/*.d /darrow/parquet/c/*.d /darrow/arrow/*.d \
    /GtkD/generated/gtkd/gobject/*.d /GtkD/generated/gtkd/glib/*.d /GtkD/generated/gtkd/gobject/c/*.d \
    /GtkD/generated/gtkd/glib/c/*.d /GtkD/generated/gtkd/gio/*.d /GtkD/generated/gtkd/gio/c/*.d \
    /GtkD/generated/gtkd/gtkd/Loader.d /GtkD/generated/gtkd/gtkd/paths.d /GtkD/generated/gtkd/gtkc/glibtypes.d \
    /GtkD/generated/gtkd/gtkc/gobjecttypes.d /GtkD/generated/gtkd/gtkc/giotypes.d
