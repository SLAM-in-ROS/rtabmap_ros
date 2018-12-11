FROM roslab/roslab:melodic-nvidia

USER root

RUN apt-get update \
 && apt-get install -yq --no-install-recommends \
    ros-melodic-rtabmap-ros \
    ros-melodic-find-object-2d \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY *.ipynb ${HOME}/

RUN chown -R ${NB_UID} ${HOME}

USER ${NB_USER}
WORKDIR ${HOME}
