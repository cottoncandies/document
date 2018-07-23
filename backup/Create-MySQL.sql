DROP TABLE IF EXISTS sys_ability_t;

DROP TABLE IF EXISTS sys_book_catalog_t;

DROP TABLE IF EXISTS sys_exam_abi_t;

DROP TABLE IF EXISTS sys_exam_kind_t;

DROP TABLE IF EXISTS sys_exam_kp_t;

DROP TABLE IF EXISTS sys_exam_t;

DROP TABLE IF EXISTS sys_favorite_t;

DROP TABLE IF EXISTS sys_know_point_t;

DROP TABLE IF EXISTS sys_my_paper_t;

DROP TABLE IF EXISTS sys_paper_exam_t;

DROP TABLE IF EXISTS sys_paper_t;

DROP TABLE IF EXISTS sys_subject_t;

DROP TABLE IF EXISTS sys_user_t;

CREATE TABLE sys_ability_t
(
	ng_id bigint NOT NULL,
	nt_section integer NOT NULL,
	ng_subject_id bigint NOT NULL,
	sz_caption varchar(127)	 NOT NULL,
	nt_state integer NOT NULL DEFAULT 0,
	tx_comment text,
	nt_old_id integer NOT NULL
)
;
ALTER TABLE sys_ability_t ADD CONSTRAINT sys_ability__pk PRIMARY KEY (ng_id);
CREATE INDEX sys_ability__select__i ON sys_ability_t (nt_section ASC,ng_subject_id ASC);

CREATE TABLE sys_book_catalog_t
(
	ng_id bigint NOT NULL,
	sz_num varchar(63) NOT NULL,
	sz_parent_num varchar(63)	,
	sz_caption varchar(255)	 NOT NULL,
	ng_parent_id bigint,
	nt_section integer,
	ng_subject_id bigint,
	nt_grade integer,
	nt_serial integer,
	sz_descr varchar(255)	,
	nt_show integer,
	tx_comment text,
	nt_old_id integer NOT NULL
);
ALTER TABLE sys_book_catalog_t ADD CONSTRAINT sys_book_catalog__pk
	PRIMARY KEY (ng_id);
CREATE INDEX sys_book_catalog__num__ui ON sys_book_catalog_t (sz_num ASC);
CREATE INDEX sys_book_catalog__select__pk ON sys_book_catalog_t (ng_id ASC);

CREATE TABLE sys_exam_abi_t
(
	ng_id bigint NOT NULL,
	ng_exam_id bigint NOT NULL,
	ng_abi_id bigint NOT NULL
);
ALTER TABLE sys_exam_abi_t ADD CONSTRAINT sys_exam_abi__pk PRIMARY KEY (ng_id);
ALTER TABLE sys_exam_abi_t ADD CONSTRAINT sys_exam_abi__select__ui UNIQUE (ng_abi_id,ng_exam_id);

CREATE TABLE sys_exam_kind_t
(
	ng_id bigint NOT NULL,
	nt_section integer NOT NULL,
	ng_subject_id bigint NOT NULL,
	sz_caption varchar(255)	 NOT NULL,
	nt_state integer DEFAULT 0,
	tx_comment text,
	nt_old_id integer
);
ALTER TABLE sys_exam_kind_t ADD CONSTRAINT sys_exam_kind__pk
	PRIMARY KEY (ng_id);
CREATE INDEX sys_exam_kind__select__pk ON sys_exam_kind_t (nt_section ASC,ng_subject_id ASC);

CREATE TABLE sys_exam_kp_t
(
	ng_id bigint NOT NULL,
	ng_exam_id bigint NOT NULL,
	ng_kp_id bigint NOT NULL,
	nt_old_id integer
);
ALTER TABLE sys_exam_kp_t ADD CONSTRAINT sys_exam_kp__pk
	PRIMARY KEY (ng_id);
ALTER TABLE sys_exam_kp_t ADD CONSTRAINT sys_exam_kp__select__ui UNIQUE (ng_kp_id,ng_exam_id);

CREATE TABLE sys_exam_t
(
	ng_id bigint NOT NULL,
	nt_num integer NOT NULL,
	ng_parent_id bigint,
	nt_parent_num integer,
	nt_sub_index integer DEFAULT 0,
	nt_section integer NOT NULL,
	ng_cat_id bigint,
	sz_cat_full varchar(255)	,
	ng_subject_id bigint NOT NULL,
	nt_grade integer,
	nt_term integer,
	nt_deep integer,
	sz_prov varchar(63)	,
	sz_city varchar(63)	,
	sz_infor_src varchar(255)	,
	sz_age varchar(63)	,
	sz_infor_kind varchar(63)	,
	nt_read_time integer,
	nt_answer_time integer,
	nt_score integer,
	sz_wenli varchar(63)	,
	sz_must varchar(63)	,
	nt_objective integer,
	nt_infor_trans integer,
	sz_chart_kind varchar(127)	,
	nt_in_paper integer,
	sz_paper_num varchar(63)	,
	sz_pager_level varchar(63)	,
	sz_paper_age varchar(63)	,
	sz_paper_index varchar(63)	,
	tx_keywords text,
	sz_listen varchar(63)	,
	nt_view_times integer DEFAULT 0,
	nt_using_times integer,
	ts_created datetime,
	ts_updated datetime,
	ts_auditing datetime,
	nt_audit integer,
	nt_state integer,
	tx_comment text,
	sz_kp_cap2 varchar(255)	,
	tx_comment2 text,
	tx_err_descr text,
	sz_old_textbook varchar(255)	,
	sz_chapter varchar(255)	,
	sz_segment varchar(255)	,
	sz_edition varchar(255)	,
	ng_kind_id bigint,
	sz_kind_name varchar(255)	,
	sz_abi_cap varchar(255)	,
	sz_kp_cap varchar(255)	,
	tx_mingti MediumText,
	tx_answer MediumText,
	tx_xuanxiang MediumText,
	tx_jiexi MediumText,
	tx_tigan MediumText
);
ALTER TABLE sys_exam_t ADD CONSTRAINT sys_exam__pk PRIMARY KEY (ng_id);

CREATE INDEX sys_exam__select_abi_cap ON sys_exam_t(sz_abi_cap);

CREATE INDEX sys_exam__select_by_cat_id__i ON sys_exam_t(nt_num, ng_cat_id);

CREATE INDEX sys_exam__select_by_grade_i ON sys_exam_t(ng_subject_id, nt_section, nt_grade);

CREATE INDEX sys_exam__select_deep_i ON sys_exam_t(nt_deep);

CREATE INDEX sys_exam__select_kind_name ON sys_exam_t(sz_kind_name);

CREATE INDEX sys_exam__select_section__i ON sys_exam_t(nt_section);

CREATE INDEX sys_exam__select_subject_id__i ON sys_exam_t(ng_subject_id);

CREATE TABLE sys_favorite_t
(
	ng_id bigint NOT NULL,
	ng_user_id bigint NOT NULL,
	nt_section integer NOT NULL,
	ng_subject_id bigint NOT NULL,
	ng_exam_id bigint NOT NULL,
	ts_created datetime NOT NULL
);
ALTER TABLE sys_favorite_t ADD CONSTRAINT sys_favorite__pk PRIMARY KEY (ng_id);
CREATE INDEX sys_favorite__select__i ON sys_favorite_t (ng_user_id ASC,nt_section ASC,ng_subject_id ASC);


CREATE TABLE sys_know_point_t
(
	ng_id bigint NOT NULL,
	sz_num varchar(63)	 NOT NULL,
	ng_parent_id bigint,
	sz_caption varchar(255)	 NOT NULL,
	ng_subject_id bigint,
	nt_section integer,
	nt_state integer,
	tx_comment text,
	nt_old_id integer
)
;
ALTER TABLE sys_know_point_t ADD CONSTRAINT sys_know_point__pk
	PRIMARY KEY (ng_id);
ALTER TABLE sys_know_point_t ADD CONSTRAINT sys_know_point__num__ui UNIQUE (sz_num);

CREATE INDEX sys_know_point__select_by_section__i ON sys_know_point_t (nt_section);

CREATE INDEX sys_know_point__select_by_subject_id__i ON sys_know_point_t(ng_subject_id);

CREATE TABLE sys_my_paper_t
(
	ng_id bigint NOT NULL,
	ng_user_id bigint NOT NULL,
	sz_caption varchar(255)	,
	nt_section integer,
	ng_subject_id bigint,
	nt_grade integer,
	sz_scope varchar(255)	,
	sz_time_len varchar(63)	,
	sz_person varchar(255)	,
	nt_total integer,
	nt_download_times integer NOT NULL DEFAULT 0,
	ts_finished datetime,
	tx_data longtext,
	nt_title_bar integer DEFAULT 1,
	nt_info_bar integer DEFAULT 1,
	nt_input_bar integer DEFAULT 1,
	nt_tongfen_bar integer DEFAULT 1,
	nt_pingfen_bar integer DEFAULT 1,
	nt_show_answer integer DEFAULT 1,
	nt_show_defen integer DEFAULT 1,
	nt_file_kind integer DEFAULT 1,
	sz_file_store varchar(255)	,
	sz_answer_store varchar(50)	,
	nt_page_size integer DEFAULT 1,
	nt_state integer NOT NULL DEFAULT 0
)
;
ALTER TABLE sys_my_paper_t ADD CONSTRAINT sys_my_paper__pk
	PRIMARY KEY (ng_id);
CREATE INDEX sys_my_paper__i ON sys_my_paper_t (ng_user_id ASC,nt_section ASC,ng_subject_id ASC);

CREATE TABLE sys_paper_exam_t
(
	ng_id bigint NOT NULL,
	ng_paper_id bigint NOT NULL,
	ng_exam_id bigint NOT NULL,
	nt_index integer,
	sz_kind varchar(127),
	tx_comment text,
	nt_old_id integer
)
;
ALTER TABLE sys_paper_exam_t ADD CONSTRAINT sys_paper_exam__pk
	PRIMARY KEY (ng_id);
CREATE INDEX sys_paper_exam__paper__i ON sys_paper_exam_t (ng_paper_id ASC,nt_index ASC);

CREATE TABLE sys_paper_t
(
	ng_id bigint NOT NULL,
	sz_num varchar(63)	,
	sz_caption varchar(255)	,
	sz_kind varchar(63)	,
	sz_age varchar(63)	,
	ng_cat_id bigint,
	nt_section integer,
	ng_subject_id bigint,
	sz_wenli varchar(63)	,
	sz_prov varchar(63)	,
	sz_city varchar(63)	,
	nt_term integer,
	nt_grade integer,
	nt_score integer DEFAULT 0,
	nt_score_ex integer DEFAULT 0,
	nt_cost_resp integer,
	ts_created datetime,
	ts_updated datetime,
	ts_auditing datetime,
	tx_comment text,
	sz_infor_src varchar(63)	,
	sz_infor_kind varchar(63)	,
	nt_old_id integer
)
;
ALTER TABLE sys_paper_t ADD CONSTRAINT sys_paper__pk PRIMARY KEY (ng_id);

CREATE TABLE sys_subject_t
(
	ng_id bigint NOT NULL,
	sz_caption varchar(63)	 NOT NULL,
	sz_sections varchar(63)	
)
;
ALTER TABLE sys_subject_t ADD CONSTRAINT sys_subject__pk
	PRIMARY KEY (ng_id);

CREATE TABLE sys_user_t
(
	ng_id bigint NOT NULL,
	sz_username varchar(63)	 NOT NULL,
	sz_password varchar(63),
	nt_section integer,
	ng_subject_id bigint,
	sz_nickname varchar(63)	 NOT NULL
)
;

ALTER TABLE sys_user_t ADD CONSTRAINT sys_user__pk	PRIMARY KEY (ng_id);
ALTER TABLE sys_user_t ADD CONSTRAINT sys_user__username__ui UNIQUE (sz_username);
