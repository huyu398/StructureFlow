# syntax = docker/dockerfile:experimental
FROM huyu398/deep_learning_env:cuda10_python3.7

WORKDIR /root/StructureFlow
COPY ./resample2d_package ./resample2d_package
COPY ./requirements.txt   ./requirements.txt

RUN --mount=type=cache,dst=/root/.cache/pip \
    pip install -r requirements.txt

RUN cd ./resample2d_package \
 && python setup.py install --user

RUN python -c "from torchvision import models; models.vgg19(pretrained=True)"

RUN pip install ipdb

COPY ./scripts            ./scripts
COPY ./src                ./src
COPY ./config.yaml        ./config.yaml
COPY ./main.py            ./main.py
COPY ./model_config.yaml  ./model_config.yaml
COPY ./test.py            ./test.py
COPY ./train.py           ./train.py

# ENTRYPOINT ["ls"]
ENTRYPOINT ["python"]
