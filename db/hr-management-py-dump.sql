/*
 Navicat Premium Data Transfer

 Source Server         : PG-SQL-Lokal
 Source Server Type    : PostgreSQL
 Source Server Version : 120013 (120013)
 Source Host           : localhost:5432
 Source Catalog        : hr_management
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 120013 (120013)
 File Encoding         : 65001

 Date: 07/08/2026 16:12:35
*/


-- ----------------------------
-- Sequence structure for absensi_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."absensi_id_seq";
CREATE SEQUENCE "public"."absensi_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for departemen_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."departemen_id_seq";
CREATE SEQUENCE "public"."departemen_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for detail_gaji_karyawan_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."detail_gaji_karyawan_id_seq";
CREATE SEQUENCE "public"."detail_gaji_karyawan_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for detail_slip_gaji_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."detail_slip_gaji_id_seq";
CREATE SEQUENCE "public"."detail_slip_gaji_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for gaji_karyawan_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."gaji_karyawan_id_seq";
CREATE SEQUENCE "public"."gaji_karyawan_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for jabatan_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."jabatan_id_seq";
CREATE SEQUENCE "public"."jabatan_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for jenis_cuti_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."jenis_cuti_id_seq";
CREATE SEQUENCE "public"."jenis_cuti_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for karyawan_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."karyawan_id_seq";
CREATE SEQUENCE "public"."karyawan_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for komponen_gaji_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."komponen_gaji_id_seq";
CREATE SEQUENCE "public"."komponen_gaji_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for pengajuan_cuti_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."pengajuan_cuti_id_seq";
CREATE SEQUENCE "public"."pengajuan_cuti_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for saldo_cuti_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."saldo_cuti_id_seq";
CREATE SEQUENCE "public"."saldo_cuti_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for slip_gaji_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."slip_gaji_id_seq";
CREATE SEQUENCE "public"."slip_gaji_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for users_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."users_id_seq";
CREATE SEQUENCE "public"."users_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for absensi
-- ----------------------------
DROP TABLE IF EXISTS "public"."absensi";
CREATE TABLE "public"."absensi" (
  "id" int4 NOT NULL DEFAULT nextval('absensi_id_seq'::regclass),
  "karyawan_id" int4 NOT NULL,
  "tanggal" date NOT NULL,
  "jam_masuk" time(6),
  "jam_keluar" time(6),
  "status" varchar(20) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'hadir'::character varying,
  "catatan" text COLLATE "pg_catalog"."default",
  "created_at" timestamp(6) NOT NULL DEFAULT now()
)
;

-- ----------------------------
-- Records of absensi
-- ----------------------------
INSERT INTO "public"."absensi" VALUES (1, 1, '2026-08-07', '09:47:20.427271', '10:03:16.889863', 'hadir', NULL, '2026-08-07 09:47:20.428212');

-- ----------------------------
-- Table structure for departemen
-- ----------------------------
DROP TABLE IF EXISTS "public"."departemen";
CREATE TABLE "public"."departemen" (
  "id" int4 NOT NULL DEFAULT nextval('departemen_id_seq'::regclass),
  "nama_departemen" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(6) NOT NULL DEFAULT now()
)
;

-- ----------------------------
-- Records of departemen
-- ----------------------------
INSERT INTO "public"."departemen" VALUES (1, 'IT', '2026-08-05 09:49:18.215354');
INSERT INTO "public"."departemen" VALUES (2, 'HR', '2026-08-05 09:49:18.215354');

-- ----------------------------
-- Table structure for detail_gaji_karyawan
-- ----------------------------
DROP TABLE IF EXISTS "public"."detail_gaji_karyawan";
CREATE TABLE "public"."detail_gaji_karyawan" (
  "id" int4 NOT NULL DEFAULT nextval('detail_gaji_karyawan_id_seq'::regclass),
  "gaji_karyawan_id" int4 NOT NULL,
  "komponen_gaji_id" int4 NOT NULL,
  "nominal" numeric(12,2) NOT NULL
)
;

-- ----------------------------
-- Records of detail_gaji_karyawan
-- ----------------------------

-- ----------------------------
-- Table structure for detail_slip_gaji
-- ----------------------------
DROP TABLE IF EXISTS "public"."detail_slip_gaji";
CREATE TABLE "public"."detail_slip_gaji" (
  "id" int4 NOT NULL DEFAULT nextval('detail_slip_gaji_id_seq'::regclass),
  "slip_gaji_id" int4 NOT NULL,
  "komponen_gaji_id" int4 NOT NULL,
  "nominal" numeric(12,2) NOT NULL
)
;

-- ----------------------------
-- Records of detail_slip_gaji
-- ----------------------------

-- ----------------------------
-- Table structure for gaji_karyawan
-- ----------------------------
DROP TABLE IF EXISTS "public"."gaji_karyawan";
CREATE TABLE "public"."gaji_karyawan" (
  "id" int4 NOT NULL DEFAULT nextval('gaji_karyawan_id_seq'::regclass),
  "karyawan_id" int4 NOT NULL,
  "gaji_pokok" numeric(12,2) NOT NULL,
  "berlaku_sejak" date NOT NULL,
  "created_at" timestamp(6) NOT NULL DEFAULT now()
)
;

-- ----------------------------
-- Records of gaji_karyawan
-- ----------------------------

-- ----------------------------
-- Table structure for jabatan
-- ----------------------------
DROP TABLE IF EXISTS "public"."jabatan";
CREATE TABLE "public"."jabatan" (
  "id" int4 NOT NULL DEFAULT nextval('jabatan_id_seq'::regclass),
  "nama_jabatan" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "level" int4 DEFAULT 0,
  "created_at" timestamp(6) NOT NULL DEFAULT now()
)
;

-- ----------------------------
-- Records of jabatan
-- ----------------------------

-- ----------------------------
-- Table structure for jenis_cuti
-- ----------------------------
DROP TABLE IF EXISTS "public"."jenis_cuti";
CREATE TABLE "public"."jenis_cuti" (
  "id" int4 NOT NULL DEFAULT nextval('jenis_cuti_id_seq'::regclass),
  "nama_cuti" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "kuota_default" int4 NOT NULL,
  "created_at" timestamp(6) NOT NULL DEFAULT now()
)
;

-- ----------------------------
-- Records of jenis_cuti
-- ----------------------------

-- ----------------------------
-- Table structure for karyawan
-- ----------------------------
DROP TABLE IF EXISTS "public"."karyawan";
CREATE TABLE "public"."karyawan" (
  "id" int4 NOT NULL DEFAULT nextval('karyawan_id_seq'::regclass),
  "nik" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "nama_lengkap" varchar(150) COLLATE "pg_catalog"."default" NOT NULL,
  "email" varchar(150) COLLATE "pg_catalog"."default" NOT NULL,
  "no_telepon" varchar(20) COLLATE "pg_catalog"."default",
  "tanggal_lahir" date,
  "tanggal_masuk" date NOT NULL,
  "departemen_id" int4,
  "jabatan_id" int4,
  "atasan_id" int4,
  "status" varchar(20) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'aktif'::character varying,
  "created_at" timestamp(6) NOT NULL DEFAULT now()
)
;

-- ----------------------------
-- Records of karyawan
-- ----------------------------
INSERT INTO "public"."karyawan" VALUES (1, 'EMP001', 'Budi Santoso', 'budi@xyz.com', NULL, NULL, '2024-01-15', 1, NULL, NULL, 'aktif', '2026-08-05 09:49:18.235061');
INSERT INTO "public"."karyawan" VALUES (3, 'EMP003', 'Rudi Janoko', 'rudijan@xyz.com', NULL, NULL, '2020-05-07', 1, NULL, NULL, 'aktif', '2026-08-05 13:27:03.609412');
INSERT INTO "public"."karyawan" VALUES (2, 'EMP002', 'siska', 'sisaeee@xyz.com', NULL, NULL, '2023-05-18', 1, NULL, NULL, 'aktif', '2026-08-05 10:25:07.25804');
INSERT INTO "public"."karyawan" VALUES (4, 'EMP004', 'Loklok', 'loklok@email.xyz', NULL, NULL, '2024-08-01', 1, NULL, NULL, 'aktif', '2026-08-07 08:24:19.751079');

-- ----------------------------
-- Table structure for komponen_gaji
-- ----------------------------
DROP TABLE IF EXISTS "public"."komponen_gaji";
CREATE TABLE "public"."komponen_gaji" (
  "id" int4 NOT NULL DEFAULT nextval('komponen_gaji_id_seq'::regclass),
  "nama_komponen" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "tipe" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(6) NOT NULL DEFAULT now()
)
;

-- ----------------------------
-- Records of komponen_gaji
-- ----------------------------

-- ----------------------------
-- Table structure for pengajuan_cuti
-- ----------------------------
DROP TABLE IF EXISTS "public"."pengajuan_cuti";
CREATE TABLE "public"."pengajuan_cuti" (
  "id" int4 NOT NULL DEFAULT nextval('pengajuan_cuti_id_seq'::regclass),
  "karyawan_id" int4 NOT NULL,
  "jenis_cuti_id" int4 NOT NULL,
  "tanggal_mulai" date NOT NULL,
  "tanggal_selesai" date NOT NULL,
  "jumlah_hari" int4 NOT NULL,
  "alasan" text COLLATE "pg_catalog"."default",
  "status" varchar(20) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'menunggu'::character varying,
  "disetujui_oleh" int4,
  "tanggal_keputusan" timestamp(6),
  "created_at" timestamp(6) NOT NULL DEFAULT now()
)
;

-- ----------------------------
-- Records of pengajuan_cuti
-- ----------------------------

-- ----------------------------
-- Table structure for saldo_cuti
-- ----------------------------
DROP TABLE IF EXISTS "public"."saldo_cuti";
CREATE TABLE "public"."saldo_cuti" (
  "id" int4 NOT NULL DEFAULT nextval('saldo_cuti_id_seq'::regclass),
  "karyawan_id" int4 NOT NULL,
  "jenis_cuti_id" int4 NOT NULL,
  "tahun" int4 NOT NULL,
  "kuota" int4 NOT NULL,
  "terpakai" int4 NOT NULL DEFAULT 0
)
;

-- ----------------------------
-- Records of saldo_cuti
-- ----------------------------

-- ----------------------------
-- Table structure for slip_gaji
-- ----------------------------
DROP TABLE IF EXISTS "public"."slip_gaji";
CREATE TABLE "public"."slip_gaji" (
  "id" int4 NOT NULL DEFAULT nextval('slip_gaji_id_seq'::regclass),
  "karyawan_id" int4 NOT NULL,
  "periode_bulan" int4 NOT NULL,
  "periode_tahun" int4 NOT NULL,
  "gaji_pokok" numeric(12,2) NOT NULL,
  "total_tunjangan" numeric(12,2) NOT NULL DEFAULT 0,
  "total_potongan" numeric(12,2) NOT NULL DEFAULT 0,
  "total_gaji" numeric(12,2) NOT NULL,
  "status" varchar(20) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'draft'::character varying,
  "created_at" timestamp(6) NOT NULL DEFAULT now()
)
;

-- ----------------------------
-- Records of slip_gaji
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "public"."users";
CREATE TABLE "public"."users" (
  "id" int4 NOT NULL DEFAULT nextval('users_id_seq'::regclass),
  "karyawan_id" int4,
  "username" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "password_hash" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "role" varchar(20) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'karyawan'::character varying,
  "is_active" bool NOT NULL DEFAULT true,
  "last_login" timestamp(6),
  "created_at" timestamp(6) NOT NULL DEFAULT now()
)
;

-- ----------------------------
-- Records of users
-- ----------------------------

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."absensi_id_seq"
OWNED BY "public"."absensi"."id";
SELECT setval('"public"."absensi_id_seq"', 7, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."departemen_id_seq"
OWNED BY "public"."departemen"."id";
SELECT setval('"public"."departemen_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."detail_gaji_karyawan_id_seq"
OWNED BY "public"."detail_gaji_karyawan"."id";
SELECT setval('"public"."detail_gaji_karyawan_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."detail_slip_gaji_id_seq"
OWNED BY "public"."detail_slip_gaji"."id";
SELECT setval('"public"."detail_slip_gaji_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."gaji_karyawan_id_seq"
OWNED BY "public"."gaji_karyawan"."id";
SELECT setval('"public"."gaji_karyawan_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."jabatan_id_seq"
OWNED BY "public"."jabatan"."id";
SELECT setval('"public"."jabatan_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."jenis_cuti_id_seq"
OWNED BY "public"."jenis_cuti"."id";
SELECT setval('"public"."jenis_cuti_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."karyawan_id_seq"
OWNED BY "public"."karyawan"."id";
SELECT setval('"public"."karyawan_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."komponen_gaji_id_seq"
OWNED BY "public"."komponen_gaji"."id";
SELECT setval('"public"."komponen_gaji_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."pengajuan_cuti_id_seq"
OWNED BY "public"."pengajuan_cuti"."id";
SELECT setval('"public"."pengajuan_cuti_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."saldo_cuti_id_seq"
OWNED BY "public"."saldo_cuti"."id";
SELECT setval('"public"."saldo_cuti_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."slip_gaji_id_seq"
OWNED BY "public"."slip_gaji"."id";
SELECT setval('"public"."slip_gaji_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."users_id_seq"
OWNED BY "public"."users"."id";
SELECT setval('"public"."users_id_seq"', 1, false);

-- ----------------------------
-- Indexes structure for table absensi
-- ----------------------------
CREATE INDEX "idx_absensi_tanggal" ON "public"."absensi" USING btree (
  "tanggal" "pg_catalog"."date_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table absensi
-- ----------------------------
ALTER TABLE "public"."absensi" ADD CONSTRAINT "absensi_karyawan_id_tanggal_key" UNIQUE ("karyawan_id", "tanggal");

-- ----------------------------
-- Checks structure for table absensi
-- ----------------------------
ALTER TABLE "public"."absensi" ADD CONSTRAINT "absensi_status_check" CHECK (status::text = ANY (ARRAY['hadir'::character varying, 'terlambat'::character varying, 'izin'::character varying, 'sakit'::character varying, 'alpha'::character varying, 'cuti'::character varying]::text[]));

-- ----------------------------
-- Primary Key structure for table absensi
-- ----------------------------
ALTER TABLE "public"."absensi" ADD CONSTRAINT "absensi_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table departemen
-- ----------------------------
ALTER TABLE "public"."departemen" ADD CONSTRAINT "departemen_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table detail_gaji_karyawan
-- ----------------------------
ALTER TABLE "public"."detail_gaji_karyawan" ADD CONSTRAINT "detail_gaji_karyawan_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table detail_slip_gaji
-- ----------------------------
ALTER TABLE "public"."detail_slip_gaji" ADD CONSTRAINT "detail_slip_gaji_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table gaji_karyawan
-- ----------------------------
ALTER TABLE "public"."gaji_karyawan" ADD CONSTRAINT "gaji_karyawan_karyawan_id_key" UNIQUE ("karyawan_id");

-- ----------------------------
-- Primary Key structure for table gaji_karyawan
-- ----------------------------
ALTER TABLE "public"."gaji_karyawan" ADD CONSTRAINT "gaji_karyawan_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jabatan
-- ----------------------------
ALTER TABLE "public"."jabatan" ADD CONSTRAINT "jabatan_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jenis_cuti
-- ----------------------------
ALTER TABLE "public"."jenis_cuti" ADD CONSTRAINT "jenis_cuti_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table karyawan
-- ----------------------------
CREATE INDEX "idx_karyawan_atasan" ON "public"."karyawan" USING btree (
  "atasan_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_karyawan_departemen" ON "public"."karyawan" USING btree (
  "departemen_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table karyawan
-- ----------------------------
ALTER TABLE "public"."karyawan" ADD CONSTRAINT "karyawan_nik_key" UNIQUE ("nik");
ALTER TABLE "public"."karyawan" ADD CONSTRAINT "karyawan_email_key" UNIQUE ("email");

-- ----------------------------
-- Checks structure for table karyawan
-- ----------------------------
ALTER TABLE "public"."karyawan" ADD CONSTRAINT "karyawan_status_check" CHECK (status::text = ANY (ARRAY['aktif'::character varying, 'nonaktif'::character varying, 'resign'::character varying]::text[]));

-- ----------------------------
-- Primary Key structure for table karyawan
-- ----------------------------
ALTER TABLE "public"."karyawan" ADD CONSTRAINT "karyawan_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Checks structure for table komponen_gaji
-- ----------------------------
ALTER TABLE "public"."komponen_gaji" ADD CONSTRAINT "komponen_gaji_tipe_check" CHECK (tipe::text = ANY (ARRAY['tunjangan'::character varying, 'potongan'::character varying]::text[]));

-- ----------------------------
-- Primary Key structure for table komponen_gaji
-- ----------------------------
ALTER TABLE "public"."komponen_gaji" ADD CONSTRAINT "komponen_gaji_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table pengajuan_cuti
-- ----------------------------
CREATE INDEX "idx_pengajuan_cuti_karyawan" ON "public"."pengajuan_cuti" USING btree (
  "karyawan_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_pengajuan_cuti_status" ON "public"."pengajuan_cuti" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Checks structure for table pengajuan_cuti
-- ----------------------------
ALTER TABLE "public"."pengajuan_cuti" ADD CONSTRAINT "pengajuan_cuti_status_check" CHECK (status::text = ANY (ARRAY['menunggu'::character varying, 'disetujui'::character varying, 'ditolak'::character varying]::text[]));
ALTER TABLE "public"."pengajuan_cuti" ADD CONSTRAINT "pengajuan_cuti_check" CHECK (tanggal_selesai >= tanggal_mulai);

-- ----------------------------
-- Primary Key structure for table pengajuan_cuti
-- ----------------------------
ALTER TABLE "public"."pengajuan_cuti" ADD CONSTRAINT "pengajuan_cuti_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table saldo_cuti
-- ----------------------------
ALTER TABLE "public"."saldo_cuti" ADD CONSTRAINT "saldo_cuti_karyawan_id_jenis_cuti_id_tahun_key" UNIQUE ("karyawan_id", "jenis_cuti_id", "tahun");

-- ----------------------------
-- Primary Key structure for table saldo_cuti
-- ----------------------------
ALTER TABLE "public"."saldo_cuti" ADD CONSTRAINT "saldo_cuti_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table slip_gaji
-- ----------------------------
ALTER TABLE "public"."slip_gaji" ADD CONSTRAINT "slip_gaji_karyawan_id_periode_bulan_periode_tahun_key" UNIQUE ("karyawan_id", "periode_bulan", "periode_tahun");

-- ----------------------------
-- Checks structure for table slip_gaji
-- ----------------------------
ALTER TABLE "public"."slip_gaji" ADD CONSTRAINT "slip_gaji_periode_bulan_check" CHECK (periode_bulan >= 1 AND periode_bulan <= 12);
ALTER TABLE "public"."slip_gaji" ADD CONSTRAINT "slip_gaji_status_check" CHECK (status::text = ANY (ARRAY['draft'::character varying, 'final'::character varying, 'dibayar'::character varying]::text[]));

-- ----------------------------
-- Primary Key structure for table slip_gaji
-- ----------------------------
ALTER TABLE "public"."slip_gaji" ADD CONSTRAINT "slip_gaji_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "users_karyawan_id_key" UNIQUE ("karyawan_id");
ALTER TABLE "public"."users" ADD CONSTRAINT "users_username_key" UNIQUE ("username");

-- ----------------------------
-- Checks structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "users_role_check" CHECK (role::text = ANY (ARRAY['admin'::character varying, 'hr'::character varying, 'manager'::character varying, 'karyawan'::character varying]::text[]));

-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table absensi
-- ----------------------------
ALTER TABLE "public"."absensi" ADD CONSTRAINT "absensi_karyawan_id_fkey" FOREIGN KEY ("karyawan_id") REFERENCES "public"."karyawan" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table detail_gaji_karyawan
-- ----------------------------
ALTER TABLE "public"."detail_gaji_karyawan" ADD CONSTRAINT "detail_gaji_karyawan_gaji_karyawan_id_fkey" FOREIGN KEY ("gaji_karyawan_id") REFERENCES "public"."gaji_karyawan" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."detail_gaji_karyawan" ADD CONSTRAINT "detail_gaji_karyawan_komponen_gaji_id_fkey" FOREIGN KEY ("komponen_gaji_id") REFERENCES "public"."komponen_gaji" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table detail_slip_gaji
-- ----------------------------
ALTER TABLE "public"."detail_slip_gaji" ADD CONSTRAINT "detail_slip_gaji_komponen_gaji_id_fkey" FOREIGN KEY ("komponen_gaji_id") REFERENCES "public"."komponen_gaji" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."detail_slip_gaji" ADD CONSTRAINT "detail_slip_gaji_slip_gaji_id_fkey" FOREIGN KEY ("slip_gaji_id") REFERENCES "public"."slip_gaji" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table gaji_karyawan
-- ----------------------------
ALTER TABLE "public"."gaji_karyawan" ADD CONSTRAINT "gaji_karyawan_karyawan_id_fkey" FOREIGN KEY ("karyawan_id") REFERENCES "public"."karyawan" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table karyawan
-- ----------------------------
ALTER TABLE "public"."karyawan" ADD CONSTRAINT "karyawan_atasan_id_fkey" FOREIGN KEY ("atasan_id") REFERENCES "public"."karyawan" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."karyawan" ADD CONSTRAINT "karyawan_departemen_id_fkey" FOREIGN KEY ("departemen_id") REFERENCES "public"."departemen" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."karyawan" ADD CONSTRAINT "karyawan_jabatan_id_fkey" FOREIGN KEY ("jabatan_id") REFERENCES "public"."jabatan" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table pengajuan_cuti
-- ----------------------------
ALTER TABLE "public"."pengajuan_cuti" ADD CONSTRAINT "pengajuan_cuti_disetujui_oleh_fkey" FOREIGN KEY ("disetujui_oleh") REFERENCES "public"."users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."pengajuan_cuti" ADD CONSTRAINT "pengajuan_cuti_jenis_cuti_id_fkey" FOREIGN KEY ("jenis_cuti_id") REFERENCES "public"."jenis_cuti" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."pengajuan_cuti" ADD CONSTRAINT "pengajuan_cuti_karyawan_id_fkey" FOREIGN KEY ("karyawan_id") REFERENCES "public"."karyawan" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table saldo_cuti
-- ----------------------------
ALTER TABLE "public"."saldo_cuti" ADD CONSTRAINT "saldo_cuti_jenis_cuti_id_fkey" FOREIGN KEY ("jenis_cuti_id") REFERENCES "public"."jenis_cuti" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."saldo_cuti" ADD CONSTRAINT "saldo_cuti_karyawan_id_fkey" FOREIGN KEY ("karyawan_id") REFERENCES "public"."karyawan" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table slip_gaji
-- ----------------------------
ALTER TABLE "public"."slip_gaji" ADD CONSTRAINT "slip_gaji_karyawan_id_fkey" FOREIGN KEY ("karyawan_id") REFERENCES "public"."karyawan" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "users_karyawan_id_fkey" FOREIGN KEY ("karyawan_id") REFERENCES "public"."karyawan" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
