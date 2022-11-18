FROM ubuntu:22.04

# Install libraries
RUN apt-get update; apt-get install -y \
    g++ cmake

WORKDIR /app

COPY powercrust .

# Build powercrust
RUN make 

# Create an entry script for running powercrust
# and writing result.json
RUN echo "#!/usr/bin/env bash\
\n/app/powercrust \"\$@\"\
\necho \"{\\\"output\\\": \\\"axis.off\\\"}\" > result.json\
" >> run.sh && chmod +x run.sh

WORKDIR /data

ENTRYPOINT ["/app/run.sh"]
