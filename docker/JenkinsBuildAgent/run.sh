docker run  -p 8084:8084 -v ${HOME}/.aws/credentials:/root/.aws/credentials:ro -v /tmp/logs:/home/nextw/logs:rw --env-file nw.env -i -t nw-$1:latest
