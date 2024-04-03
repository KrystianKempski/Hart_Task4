-- bieżąca informacja o towarach
create table tow 
(
    id         int
  , tow_kod    varchar(7)
  , cechy_list varchar(20)

  , constraint tow_pk primary key (id) 
);

-- informacja dodatkowa o towarach (1 rekord odpowiada 1 rekordowi w tabeli tow)
create table tow_info
(
    id            int
  , tow_id        int
  , data_cecha_df datetime

  , constraint tow_info_pk primary key (id) 
  , constraint tow_info_fk1 foreign key (tow_id) references tow(id)  
);

create index tow_info_idx1 on tow_info(tow_id);

-- historia modyfikacji tow
create table log_tow
(
    id         int
  , tow_id     int
  , data_m     datetime
  , cechy_list varchar(20)

  , constraint log_tow_pk primary key (id) 
  , constraint log_tow_fk1 foreign key (tow_id) references tow(id) 
);

create index log_tow_idx1 on log_tow(tow_id);