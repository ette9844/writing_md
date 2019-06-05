CREATE TABLE customer (
    c_code      VARCHAR2(4)     CONSTRAINT pk_c_code PRIMARY KEY,
    c_name      VARCHAR2(30),
    c_ceo       VARCHAR2(12),
    c_addr      VARCHAR2(100),
    c_phone     VARCHAR2(13)
);

CREATE TABLE product (
    p_code      CHAR(3)         CONSTRAINT pk_p_code PRIMARY KEY,
    p_name      VARCHAR2(30),
    p_cost      NUMBER,
    p_group     VARCHAR2(30)
);

CREATE TABLE trade (
    t_seq       NUMBER          CONSTRAINT pk_t_seq PRIMARY KEY,
    p_code      CHAR(3),
    c_code      VARCHAR2(4),
    t_date      DATE,
    t_qty       NUMBER,
    t_cost      NUMBER,
    t_tax       NUMBER,
    CONSTRAINT fk_p_code
    FOREIGN KEY (p_code)        REFERENCES product (p_code),
    CONSTRAINT fk_c_code
    FOREIGN KEY (c_code)        REFERENCES customer (c_code)
);

CREATE TABLE stock (
    p_code      CHAR(3)         CONSTRAINT pk_p_code2 PRIMARY KEY,
    s_qty       NUMBER,
    s_lastdate  DATE,
    CONSTRAINT fk_p_code2
    FOREIGN KEY (p_code)        REFERENCES product (p_code)
);