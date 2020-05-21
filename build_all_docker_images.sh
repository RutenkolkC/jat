#!/bin/sh

cd jat_analyzer && docker build -t jat_analyzer . && cd ..
cd jat_frontend && docker build -t jat_frontend . && cd ..
cd jat_frontend && docker build -f Dockerglue -t jat_glue . && cd ..
cd jat_clojure_middleware && docker build -t jat_controller . && cd ..
cd jat_refactor && docker build -t jat_refactor . && cd ..

