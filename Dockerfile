FROM ubuntu:22.04

COPY e_book_bot /e_book_bot

ENV DEBIAN_FRONTEND noninteractive

# RUN export DEBIAN_FRONTEND=noninteractive &&         
RUN apt update &&                                    \
    apt install -y                                   \
    python3                                          \
    pip                                              \
    postgresql                                       

RUN pip  install -r /e_book_bot/requirements.txt  
    # && apt remove pip                                \
    # && apt clean                                     \
    # && rm -rf /var/lib/apt/lists/*                   \
    # && rm /e_book_bot/requirements.txt
    

WORKDIR /e_book_bot

CMD [ "python3", "/e_book_bot/main.py"]
