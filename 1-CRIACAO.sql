CREATE TABLE depto (
	cod_depto int not null,
	dsc_departamento varchar(30) not null ,
	constraint depto_pk primary key (cod_depto)); 
	
CREATE TABLE produto (
cod_produto      int     not null ,
dsc_produto      varchar(30)  not null ,
dsc_unidade      varchar(10) ,
vlr_unit   numeric(12,02) not null ,
constraint produto_pk primary key (cod_produto)); 

CREATE TABLE fornecedor (
cod_fornec int    not null ,
dsc_razao_social varchar(40)  not null ,
num_cgc    int    not null ,
num_cep    varchar(8)     not null ,
cod_cidade       varchar(4)     not null ,
dsc_endereco     varchar(40)  not null ,
cod_tipo_fornec  varchar(1) ,
tipo_fornec      varchar(5) ,
num_ins_est      varchar(11) ,
num_fone   varchar(13) ,
num_fax    varchar(11) ,
num_telex  varchar(11) ,
nom_contato      varchar(30) ,
dat_nasc_contato date ,
constraint fornec_pk primary key (cod_fornec)); 

CREATE TABLE solic_compra (num_solic  int     not null ,
cod_depto  int     not null ,
dat_emiss  date    not null ,
dat_previsao     date    not null ,
constraint solic_pk primary key (num_solic) ,
constraint solic_depto_fk foreign key (cod_depto) references depto (cod_depto)); 

CREATE TABLE pedido (num_pedido       int    not null ,
cod_fornec       int     not null ,
dat_emiss  date    not null ,
dat_entreg       date    not null ,
constraint pedido_pk primary key (num_pedido) ,
constraint pedido_fornec_fk foreign key (cod_fornec)      references fornecedor (cod_fornec)); 

CREATE TABLE item_solic (num_solic  int    not null ,
cod_produto      int     not null ,
qtd_solic  int     not null ,
constraint item_solic_pk primary key (num_solic, cod_produto) ,
constraint item_solic_produto_fk foreign key (cod_produto)      references produto (cod_produto) ,
constraint item_solic_solic_fk foreign key (num_solic)      references solic_compra (num_solic)); 

CREATE TABLE item_pedido (num_pedido       int     not null ,
cod_produto      int     not null ,
num_solic  int     not null ,
qtd_pedido       int not null ,
vlr_unit   numeric(7,2)   not null ,
constraint item_ped_pk primary key (num_solic, cod_produto, num_pedido) ,
constraint item_ped_item_solic_fk foreign key (num_solic, cod_produto)      references item_solic (num_solic, cod_produto) ,
constraint item_ped_pedido_fk foreign key (num_pedido)      references pedido (num_pedido));