DROP TABLE IF EXISTS "app_key_t" CASCADE
;

DROP TABLE IF EXISTS "sys_org_t" CASCADE
;

DROP TABLE IF EXISTS "sys_publishing_t" CASCADE
;

DROP TABLE IF EXISTS "sys_subject_t" CASCADE
;

DROP TABLE IF EXISTS "sys_textbook_t" CASCADE
;

CREATE TABLE "app_key_t"
(
	"sz_id" varchar(36)	 NOT NULL,
	"sz_key" varchar(63)	 NOT NULL,
	"sz_ip_addrs" varchar(255)	 NOT NULL DEFAULT '0.0.0.0',
	"sz_org_id" varchar(36)	 NOT NULL,
	"nt_api_ver" integer NOT NULL DEFAULT 1,
	"ng_call_times" bigint NOT NULL DEFAULT 0,
	"ts_created" timestamp NOT NULL,
	"ts_updated" timestamp NOT NULL,
	"nt_row_state" integer NOT NULL DEFAULT 1,
	"nt_row_version" integer NOT NULL DEFAULT 1
)
;

CREATE TABLE "sys_org_t"
(
	"sz_id" varchar(36)	 NOT NULL,
	"sz_caption" varchar(127)	 NOT NULL,
	"sz_contacts" varchar(127)	 NOT NULL,
	"sz_tel" varchar(31)	,
	"sz_mobile" varchar(31)	,
	"sz_addr" varchar(255)	,
	"ts_created" timestamp NOT NULL,
	"ts_updated" timestamp NOT NULL,
	"nt_row_state" integer NOT NULL DEFAULT 1,
	"nt_row_version" integer NOT NULL DEFAULT 1
)
;

CREATE TABLE "sys_publishing_t"
(
	"sz_id" varchar(36)	 NOT NULL,
	"sz_caption" varchar(63)	 NOT NULL
)
;

CREATE TABLE "sys_subject_t"
(
	"sz_id" varchar(36)	 NOT NULL,
	"sz_caption" varchar(63)	 NOT NULL
)
;

CREATE TABLE "sys_textbook_t"
(
	"sz_id" varchar(36)	 NOT NULL,
	"sz_caption" varchar(127)	 NOT NULL,
	"sz_cover" varchar(255)	 NOT NULL DEFAULT '00000.jpg',
	"sz_edition" varchar(63)	,
	"sz_section" varchar(31)	 NOT NULL,
	"sz_grade" varchar(31)	 NOT NULL,
	"sz_subject_id" varchar(36)	 NOT NULL,
	"sz_pub_id" varchar(36)	 NOT NULL,
	"sz_insti" varchar(15)	 NOT NULL DEFAULT '633',
	"sz_store" varchar(255)	 NOT NULL,
	"sz_md5" varchar(63)	 NOT NULL,
	"ng_size" bigint NOT NULL DEFAULT 0,
	"sz_tag" varchar(255)	,
	"ts_created" timestamp NOT NULL,
	"ts_updated" timestamp NOT NULL,
	"nt_row_state" integer NOT NULL DEFAULT 1,
	"nt_row_version" integer NOT NULL DEFAULT 1
)
;

ALTER TABLE "app_key_t" ADD CONSTRAINT "app_key__pk"
	PRIMARY KEY ("sz_id")
;

ALTER TABLE "sys_org_t" ADD CONSTRAINT "sys_org__pk"
	PRIMARY KEY ("sz_id")
;

ALTER TABLE "sys_publishing_t" ADD CONSTRAINT "sys_publishing__pk"
	PRIMARY KEY ("sz_id")
;

ALTER TABLE "sys_subject_t" ADD CONSTRAINT "sys_subject__pk"
	PRIMARY KEY ("sz_id")
;

ALTER TABLE "sys_textbook_t" ADD CONSTRAINT "sys_textbook__pk"
	PRIMARY KEY ("sz_id")
;
