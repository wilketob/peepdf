# peepdf
Who has trouble to install V8 engine for using peepdf - this Docker is for you

##Install

###Clone Repo
git clone 
cd peepdf

###Build Docker
docker build -t arch-peepdf .

###Run Docker
docker run --rm -it arch-peepdf /bin/bash

###Run PeePDF
peepdf -i <filename.pdf>

###Mount local directory into container and analyze the file 
docker run --rm -it -v $(pwd):/files arch-pee peepdf -i /files/<filename.pdf>
