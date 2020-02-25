FROM local/hadoop-base:2.9.2

ADD config/bootstrap.sh /etc/bootstrap.sh

RUN chown root:root /etc/bootstrap.sh ; \
    chmod 700 /etc/bootstrap.sh

CMD ["/etc/bootstrap.sh"]