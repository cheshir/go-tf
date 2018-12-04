FROM tensorflow/tensorflow

RUN add-apt-repository -y ppa:longsleep/golang-backports; \
    apt update; \
    apt install -y vim git wget golang-go; \
    go get -u github.com/golang/dep/cmd/dep; \
    
    # CPU version.
    wget -O libtensorflow.tar.gz https://storage.googleapis.com/tensorflow/libtensorflow/libtensorflow-cpu-linux-x86_64-1.12.0.tar.gz; \
    tar -xzf libtensorflow.tar.gz -C /usr/local

ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
ENV PATH=/root/go/bin:$PATH
