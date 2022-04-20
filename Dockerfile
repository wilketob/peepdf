FROM archlinux:base-devel
ENV LANG=en_US.UTF-8
RUN pacman -Sy python2 vim wget curl git unzip --noconfirm

WORKDIR /tmp

RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
RUN python2 get-pip.py

RUN pip install build
RUN wget https://files.pythonhosted.org/packages/01/0f/12a50ada4a3ff2a2c0c4c74e6fababf374eff037c9786745c51fdf246c8b/peepdf-0.4.2.tar.gz
RUN tar xzvf peepdf-0.4.2.tar.gz

RUN git clone https://github.com/emmetio/pyv8-binaries.git

WORKDIR /tmp/peepdf-0.4.2

RUN sed -i 's/==1.6.2//' setup.py
RUN sed -i 's/==0.3.7//' setup.py
RUN sed -i 's/>=0.16.0//' setup.py
RUN sed -i 's/==3.2.0//' setup.py
RUN sed -i 's/==1.0//' setup.py
RUN python2 -m build
RUN pip install dist/peepdf-0.4.2.tar.gz

WORKDIR /tmp/pyv8-binaries
RUN unzip pyv8-linux64.zip

RUN cp -a PyV8.py /usr/bin/
RUN cp -a _PyV8.so /usr/bin/
#RUN chmod +x /usr/bin/PyV8.py

WORKDIR /tmp

CMD ["/usr/bin/bash"]

