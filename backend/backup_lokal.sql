--
-- PostgreSQL database dump
--

\restrict obWH2zxciUP14KtFFDPmhcP2M2YZHyBFysRBVtWBRaJYuXps3GSYM8YihIEfkeS

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public."Transaksi" DROP CONSTRAINT IF EXISTS "Transaksi_anggotaId_fkey";
ALTER TABLE IF EXISTS ONLY public."TagihanPaylater" DROP CONSTRAINT IF EXISTS "TagihanPaylater_orderId_fkey";
ALTER TABLE IF EXISTS ONLY public."TagihanPaylater" DROP CONSTRAINT IF EXISTS "TagihanPaylater_anggotaId_fkey";
ALTER TABLE IF EXISTS ONLY public."Simpanan" DROP CONSTRAINT IF EXISTS "Simpanan_anggotaId_fkey";
ALTER TABLE IF EXISTS ONLY public."RiwayatSHU" DROP CONSTRAINT IF EXISTS "RiwayatSHU_periodeId_fkey";
ALTER TABLE IF EXISTS ONLY public."RiwayatSHU" DROP CONSTRAINT IF EXISTS "RiwayatSHU_anggotaId_fkey";
ALTER TABLE IF EXISTS ONLY public."Pinjaman" DROP CONSTRAINT IF EXISTS "Pinjaman_anggotaId_fkey";
ALTER TABLE IF EXISTS ONLY public."Pengaduan" DROP CONSTRAINT IF EXISTS "Pengaduan_anggotaId_fkey";
ALTER TABLE IF EXISTS ONLY public."PenarikanSimpanan" DROP CONSTRAINT IF EXISTS "PenarikanSimpanan_anggotaId_fkey";
ALTER TABLE IF EXISTS ONLY public."OrderItem" DROP CONSTRAINT IF EXISTS "OrderItem_produkId_fkey";
ALTER TABLE IF EXISTS ONLY public."OrderItem" DROP CONSTRAINT IF EXISTS "OrderItem_orderId_fkey";
ALTER TABLE IF EXISTS ONLY public."Notifikasi" DROP CONSTRAINT IF EXISTS "Notifikasi_anggotaId_fkey";
ALTER TABLE IF EXISTS ONLY public."MutasiSimpanan" DROP CONSTRAINT IF EXISTS "MutasiSimpanan_anggotaId_fkey";
ALTER TABLE IF EXISTS ONLY public."AuditTrail" DROP CONSTRAINT IF EXISTS "AuditTrail_userId_fkey";
ALTER TABLE IF EXISTS ONLY public."Angsuran" DROP CONSTRAINT IF EXISTS "Angsuran_pinjamanId_fkey";
DROP INDEX IF EXISTS public."User_username_key";
DROP INDEX IF EXISTS public."TagihanPaylater_orderId_key";
DROP INDEX IF EXISTS public."PeriodeSHU_tahun_key";
DROP INDEX IF EXISTS public."Anggota_nip_key";
DROP INDEX IF EXISTS public."Anggota_email_key";
ALTER TABLE IF EXISTS ONLY public."User" DROP CONSTRAINT IF EXISTS "User_pkey";
ALTER TABLE IF EXISTS ONLY public."Transaksi" DROP CONSTRAINT IF EXISTS "Transaksi_pkey";
ALTER TABLE IF EXISTS ONLY public."TagihanPaylater" DROP CONSTRAINT IF EXISTS "TagihanPaylater_pkey";
ALTER TABLE IF EXISTS ONLY public."Simpanan" DROP CONSTRAINT IF EXISTS "Simpanan_pkey";
ALTER TABLE IF EXISTS ONLY public."RiwayatSHU" DROP CONSTRAINT IF EXISTS "RiwayatSHU_pkey";
ALTER TABLE IF EXISTS ONLY public."Produk" DROP CONSTRAINT IF EXISTS "Produk_pkey";
ALTER TABLE IF EXISTS ONLY public."Pinjaman" DROP CONSTRAINT IF EXISTS "Pinjaman_pkey";
ALTER TABLE IF EXISTS ONLY public."PeriodeSHU" DROP CONSTRAINT IF EXISTS "PeriodeSHU_pkey";
ALTER TABLE IF EXISTS ONLY public."PengaturanUmum" DROP CONSTRAINT IF EXISTS "PengaturanUmum_pkey";
ALTER TABLE IF EXISTS ONLY public."Pengaduan" DROP CONSTRAINT IF EXISTS "Pengaduan_pkey";
ALTER TABLE IF EXISTS ONLY public."PenarikanSimpanan" DROP CONSTRAINT IF EXISTS "PenarikanSimpanan_pkey";
ALTER TABLE IF EXISTS ONLY public."Order" DROP CONSTRAINT IF EXISTS "Order_pkey";
ALTER TABLE IF EXISTS ONLY public."OrderItem" DROP CONSTRAINT IF EXISTS "OrderItem_pkey";
ALTER TABLE IF EXISTS ONLY public."Notifikasi" DROP CONSTRAINT IF EXISTS "Notifikasi_pkey";
ALTER TABLE IF EXISTS ONLY public."MutasiSimpanan" DROP CONSTRAINT IF EXISTS "MutasiSimpanan_pkey";
ALTER TABLE IF EXISTS ONLY public."LogAktivitas" DROP CONSTRAINT IF EXISTS "LogAktivitas_pkey";
ALTER TABLE IF EXISTS ONLY public."KasKoperasi" DROP CONSTRAINT IF EXISTS "KasKoperasi_pkey";
ALTER TABLE IF EXISTS ONLY public."JurnalUmum" DROP CONSTRAINT IF EXISTS "JurnalUmum_pkey";
ALTER TABLE IF EXISTS ONLY public."Chat" DROP CONSTRAINT IF EXISTS "Chat_pkey";
ALTER TABLE IF EXISTS ONLY public."AuditTrail" DROP CONSTRAINT IF EXISTS "AuditTrail_pkey";
ALTER TABLE IF EXISTS ONLY public."Angsuran" DROP CONSTRAINT IF EXISTS "Angsuran_pkey";
ALTER TABLE IF EXISTS ONLY public."Anggota" DROP CONSTRAINT IF EXISTS "Anggota_pkey";
ALTER TABLE IF EXISTS public."User" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public."Transaksi" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public."TagihanPaylater" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public."Simpanan" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public."RiwayatSHU" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public."Produk" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public."Pinjaman" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public."PeriodeSHU" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public."PengaturanUmum" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public."Pengaduan" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public."PenarikanSimpanan" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public."OrderItem" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public."Order" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public."Notifikasi" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public."MutasiSimpanan" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public."LogAktivitas" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public."KasKoperasi" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public."JurnalUmum" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public."Chat" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public."AuditTrail" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public."Angsuran" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public."Anggota" ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public."User_id_seq";
DROP TABLE IF EXISTS public."User";
DROP SEQUENCE IF EXISTS public."Transaksi_id_seq";
DROP TABLE IF EXISTS public."Transaksi";
DROP SEQUENCE IF EXISTS public."TagihanPaylater_id_seq";
DROP TABLE IF EXISTS public."TagihanPaylater";
DROP SEQUENCE IF EXISTS public."Simpanan_id_seq";
DROP TABLE IF EXISTS public."Simpanan";
DROP SEQUENCE IF EXISTS public."RiwayatSHU_id_seq";
DROP TABLE IF EXISTS public."RiwayatSHU";
DROP SEQUENCE IF EXISTS public."Produk_id_seq";
DROP TABLE IF EXISTS public."Produk";
DROP SEQUENCE IF EXISTS public."Pinjaman_id_seq";
DROP TABLE IF EXISTS public."Pinjaman";
DROP SEQUENCE IF EXISTS public."PeriodeSHU_id_seq";
DROP TABLE IF EXISTS public."PeriodeSHU";
DROP SEQUENCE IF EXISTS public."PengaturanUmum_id_seq";
DROP TABLE IF EXISTS public."PengaturanUmum";
DROP SEQUENCE IF EXISTS public."Pengaduan_id_seq";
DROP TABLE IF EXISTS public."Pengaduan";
DROP SEQUENCE IF EXISTS public."PenarikanSimpanan_id_seq";
DROP TABLE IF EXISTS public."PenarikanSimpanan";
DROP SEQUENCE IF EXISTS public."Order_id_seq";
DROP SEQUENCE IF EXISTS public."OrderItem_id_seq";
DROP TABLE IF EXISTS public."OrderItem";
DROP TABLE IF EXISTS public."Order";
DROP SEQUENCE IF EXISTS public."Notifikasi_id_seq";
DROP TABLE IF EXISTS public."Notifikasi";
DROP SEQUENCE IF EXISTS public."MutasiSimpanan_id_seq";
DROP TABLE IF EXISTS public."MutasiSimpanan";
DROP SEQUENCE IF EXISTS public."LogAktivitas_id_seq";
DROP TABLE IF EXISTS public."LogAktivitas";
DROP SEQUENCE IF EXISTS public."KasKoperasi_id_seq";
DROP TABLE IF EXISTS public."KasKoperasi";
DROP SEQUENCE IF EXISTS public."JurnalUmum_id_seq";
DROP TABLE IF EXISTS public."JurnalUmum";
DROP SEQUENCE IF EXISTS public."Chat_id_seq";
DROP TABLE IF EXISTS public."Chat";
DROP SEQUENCE IF EXISTS public."AuditTrail_id_seq";
DROP TABLE IF EXISTS public."AuditTrail";
DROP SEQUENCE IF EXISTS public."Angsuran_id_seq";
DROP TABLE IF EXISTS public."Angsuran";
DROP SEQUENCE IF EXISTS public."Anggota_id_seq";
DROP TABLE IF EXISTS public."Anggota";
DROP TYPE IF EXISTS public."StatusSHU";
DROP TYPE IF EXISTS public."StatusPinjaman";
DROP TYPE IF EXISTS public."StatusPengaduan";
DROP TYPE IF EXISTS public."StatusPencairanSHU";
DROP TYPE IF EXISTS public."StatusPenarikan";
DROP TYPE IF EXISTS public."StatusOrder";
DROP TYPE IF EXISTS public."StatusMutasi";
DROP TYPE IF EXISTS public."StatusAngsuran";
DROP TYPE IF EXISTS public."StatusAnggota";
DROP TYPE IF EXISTS public."SkemaBunga";
DROP TYPE IF EXISTS public."Role";
DROP TYPE IF EXISTS public."MetodePembayaran";
DROP TYPE IF EXISTS public."Kolektibilitas";
DROP TYPE IF EXISTS public."JenisTransaksi";
DROP TYPE IF EXISTS public."JenisSimpanan";
DROP TYPE IF EXISTS public."JenisMutasi";
--
-- Name: JenisMutasi; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."JenisMutasi" AS ENUM (
    'SETORAN',
    'PENARIKAN'
);


ALTER TYPE public."JenisMutasi" OWNER TO postgres;

--
-- Name: JenisSimpanan; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."JenisSimpanan" AS ENUM (
    'POKOK',
    'WAJIB',
    'SUKARELA'
);


ALTER TYPE public."JenisSimpanan" OWNER TO postgres;

--
-- Name: JenisTransaksi; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."JenisTransaksi" AS ENUM (
    'DEBIT',
    'KREDIT'
);


ALTER TYPE public."JenisTransaksi" OWNER TO postgres;

--
-- Name: Kolektibilitas; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."Kolektibilitas" AS ENUM (
    'LANCAR',
    'DPK',
    'KURANG_LANCAR',
    'DIRAGUKAN',
    'MACET'
);


ALTER TYPE public."Kolektibilitas" OWNER TO postgres;

--
-- Name: MetodePembayaran; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."MetodePembayaran" AS ENUM (
    'CASH',
    'TRANSFER',
    'POTONG_SALDO',
    'PAYLATER'
);


ALTER TYPE public."MetodePembayaran" OWNER TO postgres;

--
-- Name: Role; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."Role" AS ENUM (
    'SUPERADMIN',
    'ADMIN',
    'BENDAHARA',
    'PENGAWAS'
);


ALTER TYPE public."Role" OWNER TO postgres;

--
-- Name: SkemaBunga; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."SkemaBunga" AS ENUM (
    'FLAT',
    'MENURUN'
);


ALTER TYPE public."SkemaBunga" OWNER TO postgres;

--
-- Name: StatusAnggota; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."StatusAnggota" AS ENUM (
    'AKTIF',
    'NONAKTIF',
    'MENUNGGU_PERSETUJUAN',
    'KELUAR'
);


ALTER TYPE public."StatusAnggota" OWNER TO postgres;

--
-- Name: StatusAngsuran; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."StatusAngsuran" AS ENUM (
    'BELUM_BAYAR',
    'MENUNGGU_VERIFIKASI',
    'LUNAS'
);


ALTER TYPE public."StatusAngsuran" OWNER TO postgres;

--
-- Name: StatusMutasi; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."StatusMutasi" AS ENUM (
    'MENUNGGU_VERIFIKASI',
    'DISETUJUI',
    'DITOLAK'
);


ALTER TYPE public."StatusMutasi" OWNER TO postgres;

--
-- Name: StatusOrder; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."StatusOrder" AS ENUM (
    'PENDING',
    'SELESAI',
    'BATAL'
);


ALTER TYPE public."StatusOrder" OWNER TO postgres;

--
-- Name: StatusPenarikan; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."StatusPenarikan" AS ENUM (
    'MENUNGGU_PERSETUJUAN',
    'DIPROSES',
    'SELESAI',
    'DITOLAK'
);


ALTER TYPE public."StatusPenarikan" OWNER TO postgres;

--
-- Name: StatusPencairanSHU; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."StatusPencairanSHU" AS ENUM (
    'DITAHAN_DI_SIMPANAN',
    'DICAIRKAN_TUNAI',
    'DIPOTONG_TUNGGAKAN'
);


ALTER TYPE public."StatusPencairanSHU" OWNER TO postgres;

--
-- Name: StatusPengaduan; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."StatusPengaduan" AS ENUM (
    'OPEN',
    'IN_PROGRESS',
    'RESOLVED'
);


ALTER TYPE public."StatusPengaduan" OWNER TO postgres;

--
-- Name: StatusPinjaman; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."StatusPinjaman" AS ENUM (
    'PENDING_ADMIN',
    'PENDING_BENDAHARA',
    'PENDING_KETUA',
    'DICAIRKAN',
    'LUNAS',
    'DITOLAK',
    'DIRESTRUKTURISASI'
);


ALTER TYPE public."StatusPinjaman" OWNER TO postgres;

--
-- Name: StatusSHU; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."StatusSHU" AS ENUM (
    'DRAFT',
    'DISETUJUI',
    'DIBAGIKAN'
);


ALTER TYPE public."StatusSHU" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Anggota; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Anggota" (
    id integer NOT NULL,
    nip text,
    "namaLengkap" text NOT NULL,
    pangkat text,
    "unitKerja" text,
    email text,
    "noHp" text,
    "tempatLahir" text,
    "tanggalLahir" timestamp(3) without time zone,
    "alamatKantor" text,
    "noKtp" text,
    "alamatRumah" text,
    "noRekening" text,
    "fcSkStatus" text DEFAULT 'belum'::text,
    "fcSkUrl" text,
    "fotoProfilUrl" text,
    status public."StatusAnggota" DEFAULT 'AKTIF'::public."StatusAnggota" NOT NULL,
    password text,
    "fcmToken" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "deviceId" text,
    "deviceName" text
);


ALTER TABLE public."Anggota" OWNER TO postgres;

--
-- Name: Anggota_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Anggota_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Anggota_id_seq" OWNER TO postgres;

--
-- Name: Anggota_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Anggota_id_seq" OWNED BY public."Anggota".id;


--
-- Name: Angsuran; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Angsuran" (
    id integer NOT NULL,
    "pinjamanId" integer NOT NULL,
    "bulanKe" integer NOT NULL,
    "nominalPokok" double precision NOT NULL,
    "nominalBunga" double precision NOT NULL,
    "dendaKeterlambatan" double precision DEFAULT 0 NOT NULL,
    "totalTagihan" double precision NOT NULL,
    "jatuhTempo" timestamp(3) without time zone NOT NULL,
    status public."StatusAngsuran" DEFAULT 'BELUM_BAYAR'::public."StatusAngsuran" NOT NULL,
    "lampiranBuktiUrl" text,
    "isDivalidasiBank" boolean DEFAULT false NOT NULL,
    "tanggalBayar" timestamp(3) without time zone,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Angsuran" OWNER TO postgres;

--
-- Name: Angsuran_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Angsuran_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Angsuran_id_seq" OWNER TO postgres;

--
-- Name: Angsuran_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Angsuran_id_seq" OWNED BY public."Angsuran".id;


--
-- Name: AuditTrail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AuditTrail" (
    id integer NOT NULL,
    "userId" integer,
    action text NOT NULL,
    "entityName" text NOT NULL,
    "entityId" text NOT NULL,
    "oldData" text,
    "newData" text,
    "ipAddress" text,
    "userAgent" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."AuditTrail" OWNER TO postgres;

--
-- Name: AuditTrail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."AuditTrail_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."AuditTrail_id_seq" OWNER TO postgres;

--
-- Name: AuditTrail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."AuditTrail_id_seq" OWNED BY public."AuditTrail".id;


--
-- Name: Chat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Chat" (
    id integer NOT NULL,
    "pengirimId" text NOT NULL,
    "penerimaId" text NOT NULL,
    pesan text NOT NULL,
    "isRead" boolean DEFAULT false NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Chat" OWNER TO postgres;

--
-- Name: Chat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Chat_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Chat_id_seq" OWNER TO postgres;

--
-- Name: Chat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Chat_id_seq" OWNED BY public."Chat".id;


--
-- Name: JurnalUmum; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."JurnalUmum" (
    id integer NOT NULL,
    tanggal timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    keterangan text NOT NULL,
    jenis public."JenisTransaksi" NOT NULL,
    nominal double precision NOT NULL,
    "saldoSetelahnya" double precision NOT NULL,
    "referensiId" text,
    "tipeReferensi" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."JurnalUmum" OWNER TO postgres;

--
-- Name: JurnalUmum_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."JurnalUmum_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."JurnalUmum_id_seq" OWNER TO postgres;

--
-- Name: JurnalUmum_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."JurnalUmum_id_seq" OWNED BY public."JurnalUmum".id;


--
-- Name: KasKoperasi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."KasKoperasi" (
    id integer NOT NULL,
    saldo double precision DEFAULT 0 NOT NULL,
    "terakhirDiupdate" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."KasKoperasi" OWNER TO postgres;

--
-- Name: KasKoperasi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."KasKoperasi_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."KasKoperasi_id_seq" OWNER TO postgres;

--
-- Name: KasKoperasi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."KasKoperasi_id_seq" OWNED BY public."KasKoperasi".id;


--
-- Name: LogAktivitas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."LogAktivitas" (
    id integer NOT NULL,
    aksi text NOT NULL,
    entitas text NOT NULL,
    "entitasId" text,
    detail text,
    "ipAddress" text,
    "userAgent" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."LogAktivitas" OWNER TO postgres;

--
-- Name: LogAktivitas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."LogAktivitas_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."LogAktivitas_id_seq" OWNER TO postgres;

--
-- Name: LogAktivitas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."LogAktivitas_id_seq" OWNED BY public."LogAktivitas".id;


--
-- Name: MutasiSimpanan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MutasiSimpanan" (
    id integer NOT NULL,
    "anggotaId" integer NOT NULL,
    "jenisSimpanan" public."JenisSimpanan" NOT NULL,
    "jenisMutasi" public."JenisMutasi" NOT NULL,
    nominal double precision NOT NULL,
    keterangan text,
    "buktiUrl" text,
    status public."StatusMutasi" DEFAULT 'MENUNGGU_VERIFIKASI'::public."StatusMutasi" NOT NULL,
    "isDivalidasiBank" boolean DEFAULT false NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."MutasiSimpanan" OWNER TO postgres;

--
-- Name: MutasiSimpanan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."MutasiSimpanan_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."MutasiSimpanan_id_seq" OWNER TO postgres;

--
-- Name: MutasiSimpanan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."MutasiSimpanan_id_seq" OWNED BY public."MutasiSimpanan".id;


--
-- Name: Notifikasi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Notifikasi" (
    id integer NOT NULL,
    "anggotaId" integer NOT NULL,
    judul text NOT NULL,
    pesan text NOT NULL,
    "isRead" boolean DEFAULT false NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Notifikasi" OWNER TO postgres;

--
-- Name: Notifikasi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Notifikasi_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Notifikasi_id_seq" OWNER TO postgres;

--
-- Name: Notifikasi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Notifikasi_id_seq" OWNED BY public."Notifikasi".id;


--
-- Name: Order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Order" (
    id integer NOT NULL,
    "totalHarga" double precision NOT NULL,
    "metodePembayaran" public."MetodePembayaran" DEFAULT 'CASH'::public."MetodePembayaran" NOT NULL,
    status public."StatusOrder" DEFAULT 'SELESAI'::public."StatusOrder" NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Order" OWNER TO postgres;

--
-- Name: OrderItem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."OrderItem" (
    id integer NOT NULL,
    "orderId" integer NOT NULL,
    "produkId" integer NOT NULL,
    jumlah integer NOT NULL,
    "hargaSatuan" double precision NOT NULL
);


ALTER TABLE public."OrderItem" OWNER TO postgres;

--
-- Name: OrderItem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."OrderItem_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."OrderItem_id_seq" OWNER TO postgres;

--
-- Name: OrderItem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."OrderItem_id_seq" OWNED BY public."OrderItem".id;


--
-- Name: Order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Order_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Order_id_seq" OWNER TO postgres;

--
-- Name: Order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Order_id_seq" OWNED BY public."Order".id;


--
-- Name: PenarikanSimpanan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PenarikanSimpanan" (
    id integer NOT NULL,
    "anggotaId" integer NOT NULL,
    nominal double precision NOT NULL,
    "bankTujuan" text,
    "rekeningTujuan" text,
    status public."StatusPenarikan" DEFAULT 'MENUNGGU_PERSETUJUAN'::public."StatusPenarikan" NOT NULL,
    "buktiTransferUrl" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."PenarikanSimpanan" OWNER TO postgres;

--
-- Name: PenarikanSimpanan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."PenarikanSimpanan_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."PenarikanSimpanan_id_seq" OWNER TO postgres;

--
-- Name: PenarikanSimpanan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."PenarikanSimpanan_id_seq" OWNED BY public."PenarikanSimpanan".id;


--
-- Name: Pengaduan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Pengaduan" (
    id integer NOT NULL,
    "anggotaId" integer NOT NULL,
    kategori text NOT NULL,
    subjek text NOT NULL,
    deskripsi text NOT NULL,
    "lampiranUrl" text,
    status public."StatusPengaduan" DEFAULT 'OPEN'::public."StatusPengaduan" NOT NULL,
    "balasanAdmin" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Pengaduan" OWNER TO postgres;

--
-- Name: Pengaduan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Pengaduan_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Pengaduan_id_seq" OWNER TO postgres;

--
-- Name: Pengaduan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Pengaduan_id_seq" OWNED BY public."Pengaduan".id;


--
-- Name: PengaturanUmum; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PengaturanUmum" (
    id integer NOT NULL,
    kategori text NOT NULL,
    nilai text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."PengaturanUmum" OWNER TO postgres;

--
-- Name: PengaturanUmum_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."PengaturanUmum_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."PengaturanUmum_id_seq" OWNER TO postgres;

--
-- Name: PengaturanUmum_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."PengaturanUmum_id_seq" OWNED BY public."PengaturanUmum".id;


--
-- Name: PeriodeSHU; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PeriodeSHU" (
    id integer NOT NULL,
    tahun integer NOT NULL,
    "totalSHUKotor" double precision NOT NULL,
    "persenCadangan" double precision NOT NULL,
    "persenPengurus" double precision NOT NULL,
    "persenPendidikan" double precision NOT NULL,
    "persenJasaModal" double precision NOT NULL,
    "persenJasaAnggota" double precision NOT NULL,
    status public."StatusSHU" DEFAULT 'DRAFT'::public."StatusSHU" NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."PeriodeSHU" OWNER TO postgres;

--
-- Name: PeriodeSHU_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."PeriodeSHU_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."PeriodeSHU_id_seq" OWNER TO postgres;

--
-- Name: PeriodeSHU_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."PeriodeSHU_id_seq" OWNED BY public."PeriodeSHU".id;


--
-- Name: Pinjaman; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Pinjaman" (
    id integer NOT NULL,
    "anggotaId" integer NOT NULL,
    nominal double precision NOT NULL,
    tenor integer NOT NULL,
    "bungaPersen" double precision DEFAULT 1.0 NOT NULL,
    "skemaBunga" public."SkemaBunga" DEFAULT 'FLAT'::public."SkemaBunga" NOT NULL,
    "biayaAdmin" double precision DEFAULT 0 NOT NULL,
    "biayaAsuransi" double precision DEFAULT 0 NOT NULL,
    "nominalCair" double precision DEFAULT 0 NOT NULL,
    "plafonMaksimal" double precision,
    status public."StatusPinjaman" DEFAULT 'PENDING_ADMIN'::public."StatusPinjaman" NOT NULL,
    kolektibilitas public."Kolektibilitas" DEFAULT 'LANCAR'::public."Kolektibilitas" NOT NULL,
    "fileKtpUrl" text,
    "fileSlipGajiUrl" text,
    "tanggalCair" timestamp(3) without time zone,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Pinjaman" OWNER TO postgres;

--
-- Name: Pinjaman_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Pinjaman_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Pinjaman_id_seq" OWNER TO postgres;

--
-- Name: Pinjaman_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Pinjaman_id_seq" OWNED BY public."Pinjaman".id;


--
-- Name: Produk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Produk" (
    id integer NOT NULL,
    nama text NOT NULL,
    kategori text NOT NULL,
    "hargaJual" double precision NOT NULL,
    "hargaModal" double precision NOT NULL,
    stok integer NOT NULL,
    "gambarUrl" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Produk" OWNER TO postgres;

--
-- Name: Produk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Produk_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Produk_id_seq" OWNER TO postgres;

--
-- Name: Produk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Produk_id_seq" OWNED BY public."Produk".id;


--
-- Name: RiwayatSHU; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RiwayatSHU" (
    id integer NOT NULL,
    "periodeId" integer NOT NULL,
    "anggotaId" integer NOT NULL,
    "nominalJasaModal" double precision NOT NULL,
    "nominalJasaAnggota" double precision NOT NULL,
    "totalSHU" double precision NOT NULL,
    "statusPencairan" public."StatusPencairanSHU" DEFAULT 'DITAHAN_DI_SIMPANAN'::public."StatusPencairanSHU" NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."RiwayatSHU" OWNER TO postgres;

--
-- Name: RiwayatSHU_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."RiwayatSHU_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."RiwayatSHU_id_seq" OWNER TO postgres;

--
-- Name: RiwayatSHU_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."RiwayatSHU_id_seq" OWNED BY public."RiwayatSHU".id;


--
-- Name: Simpanan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Simpanan" (
    id integer NOT NULL,
    "anggotaId" integer NOT NULL,
    "jenisSimpanan" public."JenisSimpanan" NOT NULL,
    saldo double precision DEFAULT 0 NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Simpanan" OWNER TO postgres;

--
-- Name: Simpanan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Simpanan_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Simpanan_id_seq" OWNER TO postgres;

--
-- Name: Simpanan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Simpanan_id_seq" OWNED BY public."Simpanan".id;


--
-- Name: TagihanPaylater; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TagihanPaylater" (
    id integer NOT NULL,
    "orderId" integer NOT NULL,
    "anggotaId" integer NOT NULL,
    nominal double precision NOT NULL,
    status public."StatusAngsuran" DEFAULT 'BELUM_BAYAR'::public."StatusAngsuran" NOT NULL,
    "jatuhTempo" timestamp(3) without time zone NOT NULL,
    "tanggalBayar" timestamp(3) without time zone,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."TagihanPaylater" OWNER TO postgres;

--
-- Name: TagihanPaylater_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."TagihanPaylater_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."TagihanPaylater_id_seq" OWNER TO postgres;

--
-- Name: TagihanPaylater_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."TagihanPaylater_id_seq" OWNED BY public."TagihanPaylater".id;


--
-- Name: Transaksi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Transaksi" (
    id integer NOT NULL,
    "anggotaId" integer,
    "jenisTransaksi" public."JenisTransaksi" NOT NULL,
    kategori text NOT NULL,
    nominal double precision NOT NULL,
    keterangan text,
    "lampiranBuktiUrl" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Transaksi" OWNER TO postgres;

--
-- Name: Transaksi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Transaksi_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Transaksi_id_seq" OWNER TO postgres;

--
-- Name: Transaksi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Transaksi_id_seq" OWNED BY public."Transaksi".id;


--
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    id integer NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    role public."Role" DEFAULT 'ADMIN'::public."Role" NOT NULL,
    name text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."User_id_seq" OWNER TO postgres;

--
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;


--
-- Name: Anggota id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Anggota" ALTER COLUMN id SET DEFAULT nextval('public."Anggota_id_seq"'::regclass);


--
-- Name: Angsuran id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Angsuran" ALTER COLUMN id SET DEFAULT nextval('public."Angsuran_id_seq"'::regclass);


--
-- Name: AuditTrail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AuditTrail" ALTER COLUMN id SET DEFAULT nextval('public."AuditTrail_id_seq"'::regclass);


--
-- Name: Chat id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Chat" ALTER COLUMN id SET DEFAULT nextval('public."Chat_id_seq"'::regclass);


--
-- Name: JurnalUmum id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."JurnalUmum" ALTER COLUMN id SET DEFAULT nextval('public."JurnalUmum_id_seq"'::regclass);


--
-- Name: KasKoperasi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KasKoperasi" ALTER COLUMN id SET DEFAULT nextval('public."KasKoperasi_id_seq"'::regclass);


--
-- Name: LogAktivitas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LogAktivitas" ALTER COLUMN id SET DEFAULT nextval('public."LogAktivitas_id_seq"'::regclass);


--
-- Name: MutasiSimpanan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MutasiSimpanan" ALTER COLUMN id SET DEFAULT nextval('public."MutasiSimpanan_id_seq"'::regclass);


--
-- Name: Notifikasi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Notifikasi" ALTER COLUMN id SET DEFAULT nextval('public."Notifikasi_id_seq"'::regclass);


--
-- Name: Order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order" ALTER COLUMN id SET DEFAULT nextval('public."Order_id_seq"'::regclass);


--
-- Name: OrderItem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderItem" ALTER COLUMN id SET DEFAULT nextval('public."OrderItem_id_seq"'::regclass);


--
-- Name: PenarikanSimpanan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PenarikanSimpanan" ALTER COLUMN id SET DEFAULT nextval('public."PenarikanSimpanan_id_seq"'::regclass);


--
-- Name: Pengaduan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pengaduan" ALTER COLUMN id SET DEFAULT nextval('public."Pengaduan_id_seq"'::regclass);


--
-- Name: PengaturanUmum id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PengaturanUmum" ALTER COLUMN id SET DEFAULT nextval('public."PengaturanUmum_id_seq"'::regclass);


--
-- Name: PeriodeSHU id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PeriodeSHU" ALTER COLUMN id SET DEFAULT nextval('public."PeriodeSHU_id_seq"'::regclass);


--
-- Name: Pinjaman id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pinjaman" ALTER COLUMN id SET DEFAULT nextval('public."Pinjaman_id_seq"'::regclass);


--
-- Name: Produk id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Produk" ALTER COLUMN id SET DEFAULT nextval('public."Produk_id_seq"'::regclass);


--
-- Name: RiwayatSHU id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RiwayatSHU" ALTER COLUMN id SET DEFAULT nextval('public."RiwayatSHU_id_seq"'::regclass);


--
-- Name: Simpanan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Simpanan" ALTER COLUMN id SET DEFAULT nextval('public."Simpanan_id_seq"'::regclass);


--
-- Name: TagihanPaylater id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TagihanPaylater" ALTER COLUMN id SET DEFAULT nextval('public."TagihanPaylater_id_seq"'::regclass);


--
-- Name: Transaksi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transaksi" ALTER COLUMN id SET DEFAULT nextval('public."Transaksi_id_seq"'::regclass);


--
-- Name: User id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);


--
-- Data for Name: Anggota; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Anggota" (id, nip, "namaLengkap", pangkat, "unitKerja", email, "noHp", "tempatLahir", "tanggalLahir", "alamatKantor", "noKtp", "alamatRumah", "noRekening", "fcSkStatus", "fcSkUrl", "fotoProfilUrl", status, password, "fcmToken", "createdAt", "updatedAt", "deviceId", "deviceName") FROM stdin;
2157	199601202024211004	Giffari Romarnos Said, ST	Letda	SPKKL Manembo-Nembo	\N	081247782825	Ambon	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Perumahan Mahkota Permai Tual	1845660628	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	dummy-token	2026-06-27 12:42:12.408	2026-06-28 12:38:04.332	\N	\N
1937	11689/P	Adhik Indaryono, S.E	Kolonel Bakamla	Biro Umum	\N	085230699985	Ponorogo	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Komp. TWP TNI AL CC 3/5 RT 04/21 Ciangsana Bogor	1610993101	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	dummy-token	2026-06-27 12:42:11.658	2026-06-27 13:36:41.568	\N	\N
2317	199802152024211003	Muhamad Hafidz Buamona	Letda Bakamla	SPKKL Tual	\N	081280282891	Tual	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Karel Sadsuitubun Tual Maluku Tenggara	1845510480	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	dummy-token	2026-06-27 12:42:12.985	2026-06-27 14:33:25.881	\N	\N
1929	199311112024211010	Abdul Qadir Attamini	Serka	SPKKL Ambon	\N	082198651510	Ambon	1993-11-11 00:00:00	Alamat Kantor		Wayame RT 4/3	1845509598	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.604	2026-06-27 12:42:11.604	\N	\N
1930	199711082023211010	Abednego Christoper	IX	SPKKL Ambon	\N	085813630656	Surabaya	1997-08-11 00:00:00	Alamat Kantor		Taman Kenari Nusantara Pasundan 2 NO. 17 Bogor	1792737034	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.63	2026-06-27 12:42:11.63	\N	\N
1931	NIP-1782564131631-4	Achmad Rizal	PHL	Biro Umum	\N	081212678150	Jakarta	1990-12-09 00:00:00	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Jl. Lontar V NO. 31 RT 14/04 Jakarta Pusat	1610189858	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.633	2026-06-27 12:42:11.633	\N	\N
1932	199606142018021001	Achmad Romi		SPKKL Kupang	\N	082253649776	Serang	\N	Jl. M Praja Km. 5 Alak Kupang		Jl. M Praja Km. 5 Alak Kupang	1610189905	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.639	2026-06-27 12:42:11.639	\N	\N
1933	199407152022021001	Achmad Safrudin Ridho	0	SPKKL Kupang	\N	082226219995	Magelang	\N	Jl. M Praja Km. 5 Alak Kupang		Jl. Candi Pawon Kec. Borobudur Kab. Magelang Jawa Tengah 56553	1611717201	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.644	2026-06-27 12:42:11.644	\N	\N
1934	199012082019022005	Ade bayu Mustika	Sertu Bakamla	Biro Perencanaan dan Organisasi	\N	85782424564	Bandar LAmpung	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		The Manzil Bogor Blok D.16 Jl. Raya Ciherang Dramaga Kab Bogor	1613348478	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.648	2026-06-27 12:42:11.648	\N	\N
1935	199007162010121002	Ade Kurniawan	Pengatur Tk. I II.d	Biro Umum	\N	085697799276	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		KP. Cileduk 01/01 Pondok Kacang Barat Pondok Aren	1610202338	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.651	2026-06-27 12:42:11.651	\N	\N
1936	198503052024211003	Adhi Ardiansyah	Letda Bakamla/IX	KPIML	\N	081223338504	Bandung	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Denki I No. 337/203A RT 0108	1610213179	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.654	2026-06-27 12:42:11.654	\N	\N
1938	19921105201501001	Adi Bagus Murdianto	III.C Kapten Bakamla	Direktorat Operasi Udara Maritim	\N	085813007001	Sidoarjo	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Perum Coo Garden, Klapanunggal, Kab. Bogor	1613346695	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.661	2026-06-27 12:42:11.661	\N	\N
1939	100508	Adi Setiadi	Pelda	Direktorat Kebijakan	\N	081381021610	Bandung	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Citra Indah City Bukit Angsana AAU 37/12 RT 03/10	1610202713	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.664	2026-06-27 12:42:11.664	\N	\N
1940	NIP-1782564131665-13	Adi Tirta Kautsar			\N			\N				1610209480	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.667	2026-06-27 12:42:11.667	\N	\N
1941	199208092022021003	Aditiya Maulana	Lettu/IIIB	Biro Umum	\N	081294684968	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Raya Binong Lubang Buaya Cipayung Jakarta Timur	1613347995	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.67	2026-06-27 12:42:11.67	\N	\N
1942	198609282020121001	Aditya Akbar Taufiek, S.H.	Letda Bakamla/ III.a	Direktorat Hukum / Bakamla	\N	081802920304	Bandung	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Este Villa Regency Kav38, Karadenan, Cibinong Kab Bogor	1610210098	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.673	2026-06-27 12:42:11.673	\N	\N
1943	199904302023211003	Adli Farhan	Sersan Kepala	Direktorat Hukum / Bakamla	\N	085246636292	Banda Aceh	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Darma No.68 kp. Laksana	1792703151	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.677	2026-06-27 12:42:11.677	\N	\N
1944	198308032010121001	Adriansyah Putra Harahap	Penata Tingkat I/3D	Direktorat Hukum / Bakamla	\N	081280834761	Medan	1983-03-08 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Padasuka Komp. Suci Residen B/2	1613347859	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.682	2026-06-27 12:42:11.682	\N	\N
1945	200010182022011001	Adzka Rifqi Kuberadeva	Serka Bakaml	Direktorat Kebijakan	\N	085269559001	Sleman	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Kota Alam Permai Blok F19, Kota Bumi Selatan Lampung Utara	1610210225	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.688	2026-06-27 12:42:11.688	\N	\N
1946	199905192022012001	Agata Melinda Kristi	Serka Bakamla/II.c	Biro Umum	\N	085814595462	Ponorogo	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Dukuh Klepu RT 01/01 Desa Klepu Kec. Sooko Kab Ponorogo Jawa Timur	1610194552	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.692	2026-06-27 12:42:11.692	\N	\N
1947	199108172014021001	Agung Pramujiawan	Penata Muda /III.a	Biro Umum	\N	085213593659	Cilacap	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Hasan No. 80. C RT10/04 Penggilingan , Cakung Jakarta Timur	1610188287	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.702	2026-06-27 12:42:11.702	\N	\N
1948	198808152019021003	Agus Prasakti, S.Kom	III.B	Biro Umum	\N	082281628383	Bandar lampung	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Danau Toba No.24/4 Kedaton bandar Lampung	1611023143	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.705	2026-06-27 12:42:11.705	\N	\N
1949	199108232024211010	Agus santoso	Letda		\N	087882794937	Tangerang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Kp. Pulo No.8 RT 02/04 Sudimara Selatan Cileduk	1845509655	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.708	2026-06-27 12:42:11.708	\N	\N
1950	198704232010122001	Agustina Pamelya Riji Astuti	Penata Tk. 1 /IIId	Direktorat Kebijakan	\N	081261210600	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Kavling P&K I No. 3 Parung serab Ciledug Tangerang	1610206398	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.711	2026-06-27 12:42:11.711	\N	\N
1951	NIP-1782564131712-24	Agustini M			\N			\N				1845509688	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.714	2026-06-27 12:42:11.714	\N	\N
1952	199708132024211011	Agustinus Ilemandiri Anin	Serka VII	SPKKL Kupang	\N	081226476990	Rotendao	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Rotendao	1845509699	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.717	2026-06-27 12:42:11.717	\N	\N
1953	199002182023211023	Ahadian Mardani	IX	KPIML	\N	081394747989	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Komp. Puri Fajar Blok A6 No.5 Cibeber, Kota Cimahi	1611719253	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.721	2026-06-27 12:42:11.721	\N	\N
1954	199306192018021001	Ahmad Syairofi Attabiq	Sertu Bakamla/II.b	KPIML	\N	087727551936	Cirebon	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		ds. Gebang Kulon Perumnas Gebang Lestari B2/14-15	1611718103	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.724	2026-06-27 12:42:11.724	\N	\N
1955	198306262010121001	Ahmad Zamroni	Serma Bakamla	Direktorat Hukum / Bakamla	\N	087884785605	Magelang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Singosaren, Wukirsari, Imogiri, Bantul	1610203240	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.728	2026-06-27 12:42:11.728	\N	\N
1956	199409282022021002	Ahmad Zul Fadli, A.Md	Serma Bakamla	SPKKL Aceh	\N	082285447528	Padang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Kontrakan Belakang Mesjid Lamrado Deyah Kec. Kita Baro Aceh Besar	1611050542	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.73	2026-06-27 12:42:11.73	\N	\N
1957	199612242024212015	Ainun Halisah	Letda		\N	082195615316	Bima	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Ling VI Kel. Mapanget Barat Manado	1845509713	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.732	2026-06-27 12:42:11.732	\N	\N
1958	12563/P	Ainur Rofik	Kolonel	0	\N	081282693640	Surabaya	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Rumdistab TNI AL B25 Ciangsana Bogor	1611717165	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.737	2026-06-27 12:42:11.737	\N	\N
1959	199801282022021001	Aji Bayu Nugroho	Serka Bakamla/II.c	Kantor Zona Maritim Barat	\N	087750363769	Jombang	\N	Jl. Trans Barelang Jembatan II, Setokok Batam		Perum Cipta Green Ville Pinnata 19	1610993065	Sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.741	2026-06-27 12:42:11.741	\N	\N
1960	NIP-1782564131747-33	Akbar Ragil			\N			\N				1845659748	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.749	2026-06-27 12:42:11.749	\N	\N
1961	1992100420190210003	Akbar Zakaria, S.H.	Penata Muda Tk. 1/III.b	Direktorat Hukum / Bakamla	\N	085642292268	Sukoharjo	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Pucangan, Kartasura, Kartasura Sukoharjo	1610215315	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.752	2026-06-27 12:42:11.752	\N	\N
1962	NIP-1782564131753-35	Akhmad Ishak Muharom			\N			\N				1610210270	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.755	2026-06-27 12:42:11.755	\N	\N
1963	199505152022021001	Al Akbar		Direktorat Hukum / Bakamla	\N	082126974297	Palembang	1995-05-05 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. RA Busama Ir. Keluarga I RT 47/06 Palembang	1611023187	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.759	2026-06-27 12:42:11.759	\N	\N
1964	199512082024211006	Albertho Ricardo Silooy	Letda	Kantor Zona  Maritim Timur	\N	082238361872	Ambon	1995-08-12 00:00:00	Karpan Kota Ambon		Amahusu Kec. Nusaniwe Kota Ambon	1845660287	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.763	2026-06-27 12:42:11.763	\N	\N
1965	NIP-1782564131764-38	Albertus Harry			\N			\N				1610190400	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.766	2026-06-27 12:42:11.766	\N	\N
1966	198909012015012002	Alfiani Klasiningtyas Wardanastuti	Penata/-III.c	Biro Umum	\N	081234020639	Gunung Kidul	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Victoria Permai  D5-31 Babelan Kota Babelan Kota Bekasi	1610189961	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.771	2026-06-27 12:42:11.771	\N	\N
1967	199010102015011001	Alfiansyah	Serka	Biro Umum	\N	082227142546	Jakarta	1990-10-10 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Putri Tunggal II No. 37	1610196275	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.776	2026-06-27 12:42:11.776	\N	\N
1968	197608162024212003	Alfira Albrinda Assa, SE	Ahli Pertama	Biro Umum	\N	0816238976	Minahasa	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Griya Paniki Indah Jl. Dahlia Utama I C/9	1611050315	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.782	2026-06-27 12:42:11.782	\N	\N
1969	199610062024211010	Ali Mul Mukhtar Siregar	Letda	Direktorat Hukum / Bakamla	\N	085814342308		1996-06-10 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. R sanim Gg. Rembun No.64 KPC Beji Tanah Baru Depok	1845509735	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.787	2026-06-27 12:42:11.787	\N	\N
1970	1995072620201210012	Alieffandy Umra, S.H.	Penata Muda /III.a	Direktorat Hukum / Bakamla	\N	085275221370	Sigli	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Apartemen Rasuna Said Kuningan, Jakarta	1611716241	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.792	2026-06-27 12:42:11.792	\N	\N
1971	199703022023211010	Almando Ambri Budi Cahyono S.Psi	Letda	Biro Umum	\N	081230649494	Surabaya	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Puri Surya Gedongan B6/25	1613361409	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.798	2026-06-27 12:42:11.798	\N	\N
1972	198905192019021004	Alsa Bario Usman, ST	Lettu bakamla /IIIB	SPKKL Aceh	\N	085358843347	Samatiga	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Komplek Madova Desa Baet Kec. Baitussalam Kab. Aceh Besar	1611050291	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.803	2026-06-27 12:42:11.803	\N	\N
1973	NIP-1782564131805-46	Alvino Rivan Andriansyah		SPKKL Kupang	\N	082292652445	Biak	\N	Jl. M Praja Km. 5 Alak Kupang		Kebon sari Gg.VI No.28 RT 1/1 Tuban Jatim	1610190909	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.807	2026-06-27 12:42:11.807	\N	\N
1974	14896/P	Aman Kurniawan	Kolonel Bakamla	Direktorat Kerjasama	\N	081322552000	Pamekasan	\N	Jl. M Praja Km. 5 Alak Kupang		Jl. Pulau Bidadari E13 No. 03 RT 05/003 Kelapa Gading Barat	1787563062	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.812	2026-06-27 12:42:11.812	\N	\N
1975	199902092022011001	Amri Fahrizal	Pengatur II/C	Biro Sarana Dan Prasarana	\N	0822201004740	Demak	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Ds. Botosengon RT 01/01 Dempet Demak	1610205146	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.818	2026-06-27 12:42:11.818	\N	\N
1976	198902102019021007	Ana Suryana	Pengatur Muda Tk.I/II. B	Direktorat Kerjasama	\N	085711133358	Sukabumi	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Kp. Sindangsari RT 08/05 Desa/Kec Bantargadung Kab. Sukabumi Jawa Barat	1610215531	Sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.821	2026-06-27 12:42:11.821	\N	\N
1977	13976/P	Anang S	Kolonel Bakamla	Direktorat Kerjasama	\N	081231595891	Sukoharjo	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Cileungsi RT 019/009 Cipeucang Kab. Bogor	1611717245	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.824	2026-06-27 12:42:11.824	\N	\N
1978	199212282018022001	Andi Lidya Mitha Andhiny	Kolonel Bakamla	Direktorat Kerjasama	\N	08126019928	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Asrama Batalyon Arhanud 6 Jl. Lagoa Kanal T. Priok Jakut	1611023041	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.83	2026-06-27 12:42:11.83	\N	\N
1979	199207262020121011	Andika Agung	Letda Bakamla	Direktorat Kerjasama	\N	082256041055	Porsea	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Jend Soeprapto Gg II No.31 RT 03/08 Purwokerto Lor, Banyumas	1611720133	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.84	2026-06-27 12:42:11.84	\N	\N
1980	198710242023211021	Andika Gilang Budiansyah	Letda Bakamla /III.a	Biro Sarana Dan Prasarana	\N	08118741224	Jakarta	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Jl. Kp. Pwsanggrahan Meruya Utara Jakbar	1611716467	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.847	2026-06-27 12:42:11.847	\N	\N
1981	199104262018022001	Andini Tri Shandy	Sertu Bakamla/II B	SPKKL Kema	\N	087888336626	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Duri Utara No. 56	1611050359	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.851	2026-06-27 12:42:11.851	\N	\N
1982	NIP-1782564131853-55	Andreas Hadi Putra			\N			\N				1792737238	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.855	2026-06-27 12:42:11.855	\N	\N
1983	199408172020121015	Andri Agus Priyanto	Letda	SPKKL Sambas	\N	08992874309	Pontianak	\N	Jl. Penjajab (Samping SMKN 1 perikanan)		Jl. Khatulistiwa Gg. Usaha Bersama 2, Ke. Kec. Pontianak Utara Kel. Batulayang Pontianak	1611050417	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.86	2026-06-27 12:42:11.86	\N	\N
1984	198211162015011001	Andrianto Mutawari	Penata/III.c	Biro Perencanaan dan Organisasi	\N	082211249623	Garut	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		KP. Cikiray Kidul RT 03/10 Desa Sukamanah Ke. Cisaat Kab . Sukabumi	1610188980	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.864	2026-06-27 12:42:11.864	\N	\N
1985	NIP-1782564131867-58	Andry Ronaldo Humau		SPKKL Kupang	\N	081236611293	Kupang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Sumatra Gg. 1 No.12 RT 1/1 Tode Kisar	1815146471	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.869	2026-06-27 12:42:11.869	\N	\N
1986	198403102010121001	Angga Heryana, S.T.	Mayor Bakmla/III.d	SPKKL Kupang	\N	082367531191	Bandung	1984-10-03 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Marga Kencana Tenah No.31	1610208501	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.873	2026-06-27 12:42:11.873	\N	\N
1987	19870312209121001	Angga Reza Prabowo	Penata Tk. I/III.d	Direktorat Strategi	\N	082158829060	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Cempaka Putih Barat  XXI No.22	1613347735	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.876	2026-06-27 12:42:11.876	\N	\N
1988	1995021920180210001	Angger Setya Rahmatulloh	Sertu /II b	Direktorat Operasi Laut / Catamaran 5-04	\N	085741353144	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Palem Gedong RT 02/02 Kel. Tambak Aji Ngaliyen Semarang	1613347598	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.879	2026-06-27 12:42:11.879	\N	\N
1989	199110222019022011	Anggi Permata Hadwi, R.T.	Penata Muda Tk. I IV.b	KPIML	\N	081293410522	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Villa Indah Permai Blok H27/21 Teluk Pucung Bekasi Utara	1610212959	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.883	2026-06-27 12:42:11.883	\N	\N
1990	20004172022012001	Anggun Firani	Sersan Bakamla /2C	Biro Umum	\N	081325294957	Tangerang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Taman Walet SM08/23, Sindang Sari Pasar Kemis, Tangerang	1610190353	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.887	2026-06-27 12:42:11.887	\N	\N
1991	NIP-1782564131888-64	Angki Saputra			\N			\N				1792536495	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.889	2026-06-27 12:42:11.889	\N	\N
1992	199411162023212040	Anindya Tamara	penata muda/IX	KPIML	\N	081311289790	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Komp. HBTB Blok A6 No.1 Harjamukti Cimanggis Bogor	1792487436	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.893	2026-06-27 12:42:11.893	\N	\N
1993	200002092021012001	Anissa Uzzahrohtul Islam	Pengatur/II.C	Biro Umum	\N	085829701186	Malang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Perum Citra Pesona Buring Raya, Malang	1610194029	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.897	2026-06-27 12:42:11.897	\N	\N
1994	199907102022022001	Anita R.S Simaremare	Sersan Kepala	SPKKL Kupang	\N	081360924998	Tapian Nauli	1999-10-07 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Perumahan Citra Raya Cluster Avante A10/11 Tangerang	1613347973	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.9	2026-06-27 12:42:11.9	\N	\N
1995	198906022024411009	Ansori	Serka Bakamla	Direktorat Data Dan Informasi	\N	081210658417	Ngawi	1989-06-02 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Swadaya No.49 Manggarai Jaksel	1845509757	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.903	2026-06-27 12:42:11.903	\N	\N
1996	197506012010121001	Anton Hilman Fatoni	Penata Tk. I/III.d	Unit Penindakan Hukum	\N	081998279	Bandung	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Cikalang Raya No. 16 Rawamangun Jakarta Timur	1613346594	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.906	2026-06-27 12:42:11.906	\N	\N
1997	12652/P	Anton Pramudya	Kolonel	Biro Sarana Dan Prasarana	\N	08123286942	Surabaya	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Jl. Sarpawisesa No.17 Ujung Surabaya	1791084255	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.909	2026-06-27 12:42:11.909	\N	\N
1998	199405262018021003	Antonius Yuwono Adi Putro	Lettu Bakamla III.b	Unit Penindakan Hukum	\N	082266005754	Kulon Progo	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Polodadi RT 10/03 Kec. Temon Kab. Kulon Progo	1610213373	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.913	2026-06-27 12:42:11.913	\N	\N
1999	197304022010012001	Aprilidia	Penata Muda Tk. I/III	Inspektorat	\N	081318087373	Lampung	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Villa Nusa Indah II Blok GG 8 No 5+	1613348728	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.916	2026-06-27 12:42:11.916	\N	\N
2000	NIP-1782564131917-73	Aprilliano Rangga Pangestu Manusama			\N			\N				1610195227	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.919	2026-06-27 12:42:11.919	\N	\N
2001	NIP-1782564131921-74	Ardi Efendi			\N			\N				1792517767	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.923	2026-06-27 12:42:11.923	\N	\N
2002	198311052015011001	Ardian Noverianto	Penata/II.C	Biro Sarana Dan Prasarana	\N	082136627806	Semarang	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Gg. Cepersari RT 02/05 Srondol Kulon Banyumanik Semarang	1610204164	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.925	2026-06-27 12:42:11.925	\N	\N
2003	199602012023211001	Ari Raharjo	Penata/II.C	Biro Sarana Dan Prasarana	\N	08999010330	Bekasi	1996-01-02 00:00:00	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Bekasi	1727462044	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.93	2026-06-27 12:42:11.93	\N	\N
2004	198305062009012001	Ariana Listyawati	Penata Tk. I/III.d	Biro Umum	\N	085228090313	Gunung Kidul	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Perumahan Griya Karawaci Blok B1 No.11 Sukabakti Curug Tangerang	1610204823	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.934	2026-06-27 12:42:11.934	\N	\N
2005	197811042010121001	Arief Purwantono	Mayor Bakamla/III.d	Kantor Zona Maritim Barat	\N	081298234488	Pandak	\N	Jl. Trans Barelang Jembatan II, Setokok Batam		Desa Peradakan Pemangkat Kab. Sambas	1610205204	Sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.938	2026-06-27 12:42:11.938	\N	\N
2006	198503312009121001	Aris Hermawan	Letda Bakamla	Direktorat Kebijakan	\N	081287280026	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Komp. Setneg Blok N/47	1611716149	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.941	2026-06-27 12:42:11.941	\N	\N
2007	199606062022021001	Armanto Rahmat S.E	IIIa	Direktorat Kebijakan	\N	082385781654	Padang	1996-06-06 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. M Hatta No. 10 RT04/01 Kel. Anduring Kota Padang	1610187421	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.944	2026-06-27 12:42:11.944	\N	\N
2008	NIP-1782564131945-81	Ary Sanny Joelindon		SPKKL Kupang	\N	082235415778	Koblain	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl.  Jambu RT 016/007 Kelurahan Alak	1815146903	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.947	2026-06-27 12:42:11.947	\N	\N
2009	199501212024211009	Arya Bagaskara, S.H.	Letda Bakamla /IX	Biro Umum	\N	085715238035	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Kamp Kramat, Cililitan Kramat Jati Jakarta Timur	8210119952	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.95	2026-06-27 12:42:11.95	\N	\N
2010	199007172014021001	Aryanda Sugama	III.a	Biro umum	\N	08568850605	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Menteng Atas Selatan III	1611050473	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.954	2026-06-27 12:42:11.954	\N	\N
2011	12635/P	Asep Budiman	Kolonel	KPIML	\N	082261089493	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Pondok Benda RT 05/04 Jatirasa Jatiasih Kota Bekasi Jawa Barat	1611719117	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.958	2026-06-27 12:42:11.958	\N	\N
2012	198906152024211004	Asep Pupu Saeful Bachri	Kolonel	KPIML	\N	085220307770	Bandung	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Cigadung Raya Barat No. 28 Bandung	1845509779	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.961	2026-06-27 12:42:11.961	\N	\N
2013	198102222010121001	Asmawi	Serma Bakamla/II.d	Biro Umum	\N	081311007781	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Pisangan Baru Gg. Pelukis I RT 09/05 Ke. Matraman Kel. Pisangan Baru	1610187828	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.964	2026-06-27 12:42:11.964	\N	\N
2014	197911032009011002	Aspin Utoyo, S.Kom.	Mayor Bakamla/IIID	SPKKL Aceh	\N	081343900152	Jakarta	1979-03-11 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Lapan V No.2 Kalisari Pasar Rebo Jakarta Timur 13790	1610193875	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.967	2026-06-27 12:42:11.967	\N	\N
2015	200102262022012002	Asri Ancilla Nainggolan	Serka Bakamla/II.c	Direktorat Hukum / Bakamla	\N	082229283971	Tapion	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Percetakan Negara IV B No.25 Johar Baru	1611050348	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.971	2026-06-27 12:42:11.971	\N	\N
2016	199601082018022001	Atika Ratri Nur Aysah	Pengatur Muda Tk.I/II. B	Direktorat Kerjasama	\N	081287339099	Wonogiri	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Utan Jati 10/11 No. 100A, Pegadungan, Kalideres, Jakarta Barat 11830	1610188617	Sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.973	2026-06-27 12:42:11.973	\N	\N
2017	200002152022012002	Aulia Larissa Wardhani	Pengatur /II.c	Direktorat Kerjasama	\N	087878817936	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Taman Raflessia Jl. Lotus I Blok D/4 Bekasi Timur	1611050166	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.976	2026-06-27 12:42:11.976	\N	\N
2018	198412092009012001	Aulia Maulidina	Penata Tk.I/III.d	Biro Umum	\N	0818699923	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Kp. Pangkalan RT 06/07 Semanan Kalideres Jakarta Barat	1610206944	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.98	2026-06-27 12:42:11.98	\N	\N
2019	199906242024212011	Ayda Yuniadhanti	Serka/VII	Kantor Zona  Maritim Timur	\N	081347970309	Kediri	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Ds, Talalupu Kec. Shuamual Belakang Sekam Bag. Barat	1845509815	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.983	2026-06-27 12:42:11.983	\N	\N
2020	197911042014022001	Ayu Bulan Tisna	Mayor Bakamla /3d	Direktorat Hukum / Bakamla	\N	0811831259	Magelang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Potrobangsan, Magelang, jawa Tengah 56116	1610193911	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.986	2026-06-27 12:42:11.986	\N	\N
2021	199605252024212015	Ayunda Citra Maiyasa	Serka Bakamla	Biro Umum	\N	081515538700	Tulungagung	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Dsn Kauman RT 02/01 Kauman Tulungagung	1845509837	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.991	2026-06-27 12:42:11.991	\N	\N
2022	199701112022022002	Azmi Fadilah Ramadhani	Letda Bakamla /III.a	Biro Umum	\N	085720231710	Bogor	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Bumi Panyileukan P4 No.10 Kota Bandung	1613346764	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.994	2026-06-27 12:42:11.994	\N	\N
2023	19742042009011001	Bagus Darmadi	Penata TK 1/III.D	Biro Umum	\N	087889275022	Banyumas	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat			1610193659	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:11.997	2026-06-27 12:42:11.997	\N	\N
2024	198704102014021001	Bahrul Ulum, S.IK	III.a	SPKKL Kema	\N	082188908117	Majalengka	1987-10-04 00:00:00	Ds. Kema 2, Kec. Kema kab Minahasa Utara		Ds. Kema 1, Kec. Kema kab Minahasa Utara	1613348569	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12	2026-06-27 12:42:12	\N	\N
2025	199404232015011001	Bakhtiar Ady Pamungkas	III.a	SPKKL Kema	\N	081290901079	Kebumen	\N	Ds. Kema 2, Kec. Kema kab Minahasa Utara		Jl. Asri 1 No.10 Bekasi	1610208556	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.003	2026-06-27 12:42:12.003	\N	\N
2026	199109152022021001	Bayu Prasetya Aji	III.a	SPKKL Sambas	\N	081392603004	Klaten	\N	Ds. Kema 2, Kec. Kema kab Minahasa Utara		Jl. Cendana III Perumahan Ambar Waringin Jaya Blik C3 No.22 Ds. Waringin Jaya, Kec Bojonggede Kab. Bogor	1611716659	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.006	2026-06-27 12:42:12.006	\N	\N
2027	199301022024212022	Bianca Ramahlieka	Letda	Biro Perencanaan dan Organisasi	\N	081287221602	DEpok	1993-02-02 00:00:00	Ds. Kema 2, Kec. Kema kab Minahasa Utara		Jl. Damarlat 1 NO.28 Delah 16418	1613347893	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.009	2026-06-27 12:42:12.009	\N	\N
2028	199407282018032001	Billyna Raganasti Kusuma Wardani, A.Md	Serma Bakamla/Pengatur Tk.I/IID	Biro Sarana Dan Prasarana	\N	081291753482	Wonosobo	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Perumahan Kemala Dandelion Blok 32 E, Babelan Kab bekasi	1611716343	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.011	2026-06-27 12:42:12.011	\N	\N
2029	199906012022012002	Bintan Feticha Maharani	Serma Bakamla/Pengatur Tk.I/IID	Biro Umum	\N	081332001058	Kediri	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Ds. Resapombo RT 04/03 Doko Kab. Blitar	1613348423	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.014	2026-06-27 12:42:12.014	\N	\N
2030	198706022010122002	Blandina Wardhani	Penata Tk. 1 /IIId	KPIML	\N	081311381228	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Agra Kemala Bahagia Blok F10 Kel. Bahagia Kec. Babelan Kab. Bekasi	1610204914	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.018	2026-06-27 12:42:12.018	\N	\N
2031	198011072015011001	Bobby Dwi Adriadi, A.Md.	II.c/Pengatur	Direktorat Kerjasama	\N	087877990937	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Dukuh Utara No.12 RT 08/15 Semper Barat Cilincing Jakarta Utara 14130	1610204981	Sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.021	2026-06-27 12:42:12.021	\N	\N
2032	198308112009012001	Bobby Maria Sembiring, SE	IIId	Direktorat Kerjasama	\N	081779424509	Medan	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Mimosa 2 Blok C NO.5 Taman Century 1 Pekayon Bekasi	1610210463	Sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.023	2026-06-27 12:42:12.023	\N	\N
2033	199102272020121005	Bonie Hartanggi Usman	Letda Bakamla/III.A	Direktorat Kerjasama	\N	081234502224	Medan	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Harapan Jaya I No.16 Makasar Jakarta Timur	1610210928	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.028	2026-06-27 12:42:12.028	\N	\N
2034	198404122006041003	Budi Raharjo, SH.	Letda	Unit Penindakan Hukum	\N	081286583804	Banjarsari	1984-12-04 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Kota Banjar Jawa Barat	1610213431	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.031	2026-06-27 12:42:12.031	\N	\N
2035	197503152009121001	Budiyanto	Serma II.d	Biro Sarana Dan Prasarana	\N	081310634244	Bogor	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Desa Cimanggis RT 02/08 Ke. Bnojong Gede Bogor	1610204674	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.034	2026-06-27 12:42:12.034	\N	\N
2036	198804132023211024	Bugi Aditya Anggono	Letda Bakamla/Golongan IX	Direktorat Operasi Laut	\N	085697442151	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Perum Villa Pertiwi Blok I-3 Jl. Raya jakarta Bogor KM 37' Kota Depok	1611716944	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.038	2026-06-27 12:42:12.038	\N	\N
2037	12320/P	Caatje Robby Anakotta, S.Pi	Letkol	Direktorat Operasi Laut	\N	085216098633	12320/P	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Paniki Bawah Manado	1611050202	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.041	2026-06-27 12:42:12.041	\N	\N
2038	199505102022022003	Camelia Shara Fauzi	Letda Bakamla/ III.a	Biro Perencanaan dan Organisasi	\N	082273506566	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jati Kramat Indah 1, Jl. Dahlia VI No. 198, Kota Bekasi	1610194187	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.044	2026-06-27 12:42:12.044	\N	\N
2039	197011042009121001	Cecep Sofyan, S.A.B	Letda Bakamla/ III.a	Biro Umum	\N	081211661009	Bandung	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Komp. Permata Kopo Blok j B2 No. 1 Bandung	1613348434	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.048	2026-06-27 12:42:12.048	\N	\N
2040	198407082009012001	Cecillia Dyah Afsari	III.b	Biro Umum	\N	081384008017	Jakarta	1984-08-07 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Pondok Pekayon Indah Jl. Cendrawasih II Blok A8 No.12A	1610209809	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.052	2026-06-27 12:42:12.052	\N	\N
2041	199307212015011001	Cefi Rizky Pahlefi		Biro Sarana Dan Prasarana	\N	081380568873	Tegal	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		JL. Multi Karya I No.12 A Utan Kayu Utara Matraman Jakarta Timur	1611050586	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.057	2026-06-27 12:42:12.057	\N	\N
2042	19910901201821001	Cendra Duta Patria	Penata Tk. I/III.b	Direktorat Hukum / Bakamla	\N	08562367830	Karanganyar	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Komp. Mabad 60, Jl. Dahlia NO D.55, Rempoa, Ciputat Timur	1610195045	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.06	2026-06-27 12:42:12.06	\N	\N
2043	19881223223211015	Chendri Purnomo	Serka Bakamla/Golongan VII	Direktorat Operasi Laut	\N	082175297003	Kotabumi	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Widoro Payung RT 02/01 Desa Abung Jayo Kec. Abung Selatan Kab. Lampung Utara	1792737318	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.063	2026-06-27 12:42:12.063	\N	\N
2044	199504172024212017	Chrisenia Nadia Carelsz	Letda	SPKKL Ambon	\N	082199717148	Ambon	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Kec. Sirimau Desa Soya RT 02/08 Jl, Perumtel	1845509860	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.067	2026-06-27 12:42:12.067	\N	\N
2045	198809232024212006	Christi Yolanda Maringka A.Md.Keb	VII	SPKKL Manembo-Nembo	\N	081399997881	Nonapan	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Perum Rizky Girian Indah Blok B.72 Bitung Sulut	1845509871	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.071	2026-06-27 12:42:12.071	\N	\N
2046	199601202024212014	Cindy Jefanti Daebuka	Letda IX	Pangkalan Armada Kamla Serei/ Zona Timur	\N	081241026173	Serei	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Serei Jaya III Kec. Cikupang Barat Kab. Minahasa Utara	1845509893	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.073	2026-06-27 12:42:12.073	\N	\N
2047	198808162015012001	Cindy Lia Kawulur	III.C	Pangkalan Armada Kamla Serei/ Zona Timur	\N	081340072310	Jayapura	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Perum Duta Graha	1610206659	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.076	2026-06-27 12:42:12.076	\N	\N
2048	198508042015012001	Citra Dewi Lestari	Kapten/III.c	Direktorat Kerjasama	\N	08588533373	Malang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		JL. S Parman No.42 Kota Malang	1613348581	Sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.08	2026-06-27 12:42:12.08	\N	\N
2049	199211282022022001	Citra Rizki Amanda	Letda Bakamla/III.a	Biro Umum	\N	085694191281	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Podok Maritim Indah Blok DD NO.6 Suranaya	1610190068	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.083	2026-06-27 12:42:12.083	\N	\N
2050	198509192015012001	Dahniar	Penata /III.c	KPIML	\N	087784400970	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl, Putri Pelangi E19/14 Kela Gading Barat Jakarta Utara	1611719195	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.086	2026-06-27 12:42:12.086	\N	\N
2051	199306282018021001	Danang Eko Saputro	II.b	KPIML	\N	081290659875	Kulon Progo	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Harmoni Park	1610203636	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.089	2026-06-27 12:42:12.089	\N	\N
2052	199940226029400001	Dani Indra Praja	Letda	SPKKL Natuna	\N	085228858400	Kp. Baru Toar	\N	Jl. Panglima Hitam Bukit Senubing Panai Kota Natuna		Jl. Abdoerrauf LK. II Kel. Sungai Jering Kuantan Singingi	1611022809	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.091	2026-06-27 12:42:12.091	\N	\N
2053	198206162010121001	Daniel Sibarani, S.H.	Lettu Bakamla/III.B	SPKKL Natuna	\N	081383801234	Tobasa	\N	Jl. Panglima Hitam Bukit Senubing Panai Kota Natuna		Jl. Waringin Raya No. 6 kayu Putih	1610189020	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.094	2026-06-27 12:42:12.094	\N	\N
2054	198911032024211009	Daud Jamlaay	Serka Bakamla		\N	085254374803	Tual	1989-03-11 00:00:00	Jl. Panglima Hitam Bukit Senubing Panai Kota Natuna		Tual	1613346572	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.097	2026-06-27 12:42:12.097	\N	\N
2055	198907012024211009	Debi Kurniawan S. Sos	Letda IX	Kantor Zona Maritim Barat	\N	082287021502	Tanjung Pinang	1989-01-07 00:00:00	Jl. Panglima Hitam Bukit Senubing Panai Kota Natuna		Jl, D.I Panjaitan Gang Mekar Sari B.33	1845509917	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.1	2026-06-27 12:42:12.1	\N	\N
2056	1985072720101001	Dede Rudi	Serma Bakamla/II.C	Biro Umum	\N		Indramayu	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Mede Raya RT 01/01 Grand Natura Blok J No.12 Bekasi	1610205066	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.102	2026-06-27 12:42:12.102	\N	\N
2057	NIP-1782564132103-130	Dedi  Heru Laitabun		SPKKL Kupang	\N	081239902360	Kupang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Tuahur No. 5 RT 05/01 Kel. Desapa	1374544211	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.105	2026-06-27 12:42:12.105	\N	\N
2058	199805232024212012	Dela Meylinda	Letda	Direktorat Kerjasama	\N	083170533290	Bandaraji	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Arujajar Perum. Villa Taman Sari No.7	1845509939	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.108	2026-06-27 12:42:12.108	\N	\N
2059	,199309252015011001	Demo Putra	III.c	KPIML	\N	081279726305	Lubuk Linggau	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Cluster Taman Elok Blok E 19 Bekasi	1611050304	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.111	2026-06-27 12:42:12.111	\N	\N
2060	199503282014022001	Denda Widea	Serka	SPKKL Sambas	\N	081256964141	Pemangkat	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Asri Gg. Asri RT 3/6 Desa Lonam Kec. Pemnagkat Kab Sambas	1611050531	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.114	2026-06-27 12:42:12.114	\N	\N
2061	199212222018022001	Desi Sukowati	Serma Bakamla/II.D	Direktorat Operasi Laut	\N	087788567011	Banyumas	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Kp. Bintaro RT 03/02 Pesanggrahan jakarta Selatan	1611023110	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.117	2026-06-27 12:42:12.117	\N	\N
2062	199612032022022003	Desinta Puspa Ningrum	Letda Bakamla/III A	Direktorat Kerjasama	\N	0895364941329	Surabaya	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Sayuti II No. 4A Rawasari Cempaka Putih Jakarta Pusat	1610205339	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.12	2026-06-27 12:42:12.12	\N	\N
2063	197912162009122001	Desrinda Misiliani	II.d	Direktorat Kerjasama	\N	085693690462	Rangkasbitung Lebak	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Cilengsi	1611022887	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.123	2026-06-27 12:42:12.123	\N	\N
2064	199604172018022001	Dewi Ratri Adi Purwanti	Seru Bakamla/II.b	Biro Umum	\N	089532483424	Sidoarjo	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Merdeka Dalam No.16 Kebalen Kab. Bekasi	1611022843	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.126	2026-06-27 12:42:12.126	\N	\N
2065	199806132024211003	Dhalifa Galih Widodo	Letda	SPKKL Merauke	\N	082398504090	Merauke	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Gg. KPKN Spadem	1845509951	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.129	2026-06-27 12:42:12.129	\N	\N
2066	122057	Dhina Abharina	Serka Bakamla	Biro Umum	\N	081211111035	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Kav. Madani 7 Blok I NO. 2 Ke. Babelan kab Bekasi	1611050188	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.131	2026-06-27 12:42:12.131	\N	\N
2067	199308032014022001	Diah Ayu Putri Mawardi	IIC	SPKKL Merauke	\N	082335054572	Jombang	1993-03-08 00:00:00	Jl. Lampu Satu Samkai Distrik Merauke		Jl. Naori, Karang Indah, Distrik Merauke	1613347882	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.134	2026-06-27 12:42:12.134	\N	\N
2068	199205132022022001	Dian Arisma	Letda Bakamla/III.a	Direktorat Operasi Laut	\N	081918014469	Bogor	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Asrama Yon Bek Ang 1 RT 02806	1610189019	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.138	2026-06-27 12:42:12.138	\N	\N
2069	200011212024211001	Dian Rizky Simanjuntak	Letda	Direktorat Hukum / Bakamla	\N	082284400528	Medan	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		ASR Widuri BRT Beringin No. 41	1845509973	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.141	2026-06-27 12:42:12.141	\N	\N
2070	199205292004212013	Diananda Titus Primandani	Letda	Direktorat Hukum / Bakamla	\N	082333567245	Trenggalek	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Ds. Watulimo RT 9/3 Kec. Watulimo Trenggalek Jatim	1845509984	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.143	2026-06-27 12:42:12.143	\N	\N
2071	12873/P	Dicky Dharwaly	Kolonel	Direktorat Hukum / Bakamla	\N	08112127871	Bandung	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		JL. Ters BSM Utara No.244 Kiara Condong Bandung	1810092664	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.146	2026-06-27 12:42:12.146	\N	\N
2072	198206122010121001	Dicky Yuniar Rushartanto	III/d	Direktorat Strategi	\N	08121867000	Surabaya	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Pratama No. 50 RT 02/08 Pd. Kelapa Jaktim	1610188049	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.15	2026-06-27 12:42:12.15	\N	\N
2073	199208042019022005	Dika Maranti ,S.KOM	III/d	Direktorat Strategi	\N	082187952871	Surakarta	1992-04-08 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Gunung Kawi VII RT 004/010 Banjarsari surakarta	1613347939	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.154	2026-06-27 12:42:12.154	\N	\N
2074	199307262023211019	Diki Alber Hendri A.Md	Serka	Direktorat Strategi	\N	085264104485	Silago	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		JL. Ters BSM Utara No.244 Kiara Condong Bandung	1792737250	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.157	2026-06-27 12:42:12.157	\N	\N
2075	198204252009121001	Dikki Triwansanda	Mayor Bakamla/III.d	Direktorat Strategi	\N	081388638910	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Jumponi V 38/II Kelapa Gading	1613347860	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.16	2026-06-27 12:42:12.16	\N	\N
2076	199503182015011001	Dimas Pramudya Kiswara	Serka Bakamla /II.C	Biro Umum	\N	081283899798	Kulon Progo	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Perum Dephan Jl. Asri 4 No. 21 Blok B3 RT 02/011 Cibinong Bogor	1610208341	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.163	2026-06-27 12:42:12.163	\N	\N
2077	199305312018021002	Dimas Satrio Yudono	Serma Bakamla/II.d	Biro Sarana Dan Prasarana	\N	081390099539	Salatiga	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Jl. Fatmawati RT 011/001 Kel. Lopait Kec. Tuntang Kab. Semarang	1611719989	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.165	2026-06-27 12:42:12.165	\N	\N
2078	199508102022021003	Dimash Prandika	Pengatur II/C	Biro Sarana Dan Prasarana	\N	082217808293	Ciamis	1995-10-08 00:00:00	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Dsn Tidul Bumiseuri Cipaku Ciamis Jabar	1613348252	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.168	2026-06-27 12:42:12.168	\N	\N
2079	199810132018021001	Diotama Setia Waluyo	Sertu Bakamla/II.b	Biro Sarana Dan Prasarana	\N	089698173371	Malang	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Jl. Letjend S Parman 1/43 Malang	1610189382	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.171	2026-06-27 12:42:12.171	\N	\N
2080	200005062023212002	Dita Putri Cahyani	Serka /VII	Biro Umum	\N	087808783504	Bogor	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Griya Bukit Jaya Blok E9/9, RT 02/26 Tlajung Unik Gunung Putri Kab. Bogor	1792525122	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.175	2026-06-27 12:42:12.175	\N	\N
2081	198412172015012001	Diyah Widayanti	IIIC	Biro Umum	\N	085225821258	Semarang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Pemuda Rawamangun Jakarta Timur	1611022898	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.178	2026-06-27 12:42:12.178	\N	\N
2082	198209292009121001	Doby Sunja Anugrah, SE, MAP	Penata II.c	Biro Umum	\N	081314939290	Surabaya	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Sendang Agung Cluster Cimanggis Green Mansion No. 07 Mekarsari Depok	1610191028	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.182	2026-06-27 12:42:12.182	\N	\N
2083	198003172015011001	Donal Rinaldo Sitorus, R.T., M.M	Penata /III.c	Biro Sarana Dan Prasarana	\N	082111451000	Jakarta	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Jl. Depkes II No.32 JatiBening Bekasi	1610207835	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.184	2026-06-27 12:42:12.184	\N	\N
2084	198112272010121002	Dono Arye Prasetyo	Mayor Bakamla /III D	Direktorat Latihan	\N	081225144509	Magelang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Cluster Pakujaya Indah No. 25 Pakujaya Serpong Utara	1610189177	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.187	2026-06-27 12:42:12.187	\N	\N
2085	197711222009121001	Dony Nova Rusfandi	III.D	Direktorat Operasi Laut	\N	082125987080	Surabaya	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Pratama 50 02/08 Pondok Kelapa Jaktim	1610191562	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.191	2026-06-27 12:42:12.191	\N	\N
2086	9807/P	Dr. Irvansyah, S.H., CHRMP., M.Tr.Opsla.	Laksamana  Madya TNI	Bakamla	\N		Bengkulu	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Perumahan Mediterania Regency Cikunir Jl. Chrysan IV Blok C. No. 98 Jati Beninng Bekasi Kota Bekasi Bekasi Selatan Jawa Barat< ID 17146	1968051050	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.193	2026-06-27 12:42:12.193	\N	\N
2087	9864/P	Dr. Samuel H. Kowaas, M.Sc., CSBA	Laksamana Muda TNI	Deputi Bidang Informasi, Hukum dan Kerja sama	\N	0817407736	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Pulau Raya Blok E.14 No, 7 RT 15/003 Kel. Kelapa Gading Barat, Ke. Kelapa Gading Jakarta Utara	1652002781	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.196	2026-06-27 12:42:12.196	\N	\N
2088	198710112024211004	dr. Zainul Hafzurrahman	Lettu/X	Biro Umum	\N	085222251262	Medan	1987-11-10 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Ds. Anyata Utara Kab. Indramayu	1845663197	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.199	2026-06-27 12:42:12.199	\N	\N
2089	11305/P	Dr.Ir. Tunggul Puliwarna	Kolonel	Biro Umum	\N	081288858679	Malang	1969-01-11 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		TWP AL Grahayalayudha Blok BB 2/3 Ciangsan	1790231803	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.202	2026-06-27 12:42:12.202	\N	\N
2090	NIP-1782564132203-163	Dwi Dellila Waty		SPKKL Kupang	\N	081314631983	Kupang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl,. Cekdam 1 RT 21/7 Manutapen	1613361374	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.205	2026-06-27 12:42:12.205	\N	\N
2091	19980705218022001	Dwi Maria Fernanda Simbolon	Sertu Bakamla/Iib	Biro Umum	\N	087808075885	Tangerang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Larangan Selatan Tangerang	1610194303	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.209	2026-06-27 12:42:12.209	\N	\N
2092	199904262023211002	Dwi Prasetya Udara, A.Md	Serka Bakamla /VII	SPKKL Aceh	\N	085730200984	Magetan	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Takeran 01/01 Takeran Magetan	1792471935	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.212	2026-06-27 12:42:12.212	\N	\N
2093	199010112018021001	Dwi Santosa	Sertu	SPKKL Kupang	\N	085251713785	Barito Kuala	1990-11-10 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Simp. Kuin Selatan 68 17 Agustus Banjarmasin	1610190502	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.216	2026-06-27 12:42:12.216	\N	\N
2094	199903252022021001	Dwiki Aji Rinaldi	Serda	SPKKL Kupang	\N	082223356822	Cilacap	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Lontar RT 20/4 Debufu Oebobo	1610190013	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.219	2026-06-27 12:42:12.219	\N	\N
2095	199106142015012002	Dwina Anne Napitupulu	IIIB	SPKKL Kupang	\N	081572278886	Balige	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat			1610208760	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.222	2026-06-27 12:42:12.222	\N	\N
2096	199007212024211008	Dwipa Wijaya	Serka/VII	SPKKL Kupang	\N	085643459007	Bandung	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Nyutran MeII 1425 Yogyakarta	1845509995	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.226	2026-06-27 12:42:12.226	\N	\N
2097	199911242022012002	Dyah Ayu Kusuma Wardhani	Pengatur/II.C	Biro Sarana Dan Prasarana	\N	089601127830	Purworejo	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Kelurahan Genjoran Kidul Desa Sucen Juru Tengah RT 03/02 Kec. Bayan Kab Purworejo	1611717802	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.229	2026-06-27 12:42:12.229	\N	\N
2098	198902242015011001	Edy Setiawan	Letda Bakamla	Direktorat Operasi Udara Maritim	\N	081294429392	Pekalongan	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Jl. Kelapa Hijau Utan Kayu Selatan Matraman Jakarta Timur	1611717267	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.232	2026-06-27 12:42:12.232	\N	\N
2099	199604172018022002	Efriwita Nainggolan	Pengatur Muda Tk.I/II. B	Biro Sarana Dan Prasarana	\N	082175441919	Jangga Baru	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Cluster Victoria Permai Jl. Pulo Timaha RT 03/24 No. D6/11 Babelan Babelan Kota	1611050597	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.234	2026-06-27 12:42:12.234	\N	\N
2100	11338/P	Eka Satari	Laksamana Pertama	Direktorat Kerjasama	\N	08151617555	Bandung	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Teluk ratai V No. 19 010/010 Kelapa Gading Barat Kelapa Gading Jakarta Utara	1800397929	Sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.238	2026-06-27 12:42:12.238	\N	\N
2101	199807122024211002	Eki Muhammad Zafar	Serka		\N	082255383509	Tanjung	1998-12-07 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Anyer III	1845510004	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.242	2026-06-27 12:42:12.242	\N	\N
2102	198605102009121001	Eko Teguh Prayudianto	Penata Tk.I/III.d	Biro Perencanaan dan Organisasi	\N	081310182935	Bandung	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Cipta Graha Permai Blok H2 No. 5 Cibinong Bogor	1610194937	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.244	2026-06-27 12:42:12.244	\N	\N
2103	199410122020122022	Elisanti Sugitha Br Ginting	Pengatur / II.C	Biro Sarana Dan Prasarana	\N	082277087056	Medan	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Jl. Kemuning Dalam 1B No.12 A RT 07/06 Pejaten Timur Pasar Minggu	1613348740	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.248	2026-06-27 12:42:12.248	\N	\N
2104	NIP-1782564132249-177	Ella Novita Sari			\N			\N				1611022785	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.251	2026-06-27 12:42:12.251	\N	\N
2105	199410112022021004	Elton Sostenes	Pengatur / II.C	Biro Sarana Dan Prasarana	\N	082111413767	Air Bikuk	1994-11-10 00:00:00	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Desa Air Bikuk Pondok Suguh Mukomuko Bengkulu	1613348241	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.254	2026-06-27 12:42:12.254	\N	\N
2106	197503202009122001	Elva Susanti	Penata TK.1/III.d	Direktorat Strategi	\N	081374188224	Bengkulu	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Jatiwangi 2 No. 213 JatiCempaka Pondok Gede Bekasi	1610188458	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.256	2026-06-27 12:42:12.256	\N	\N
2107	199507182019022004	Emily Azizah Putri S KOM	Pengatur / II.C	Direktorat Strategi	\N	088995221813	Depok	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Petamburan VII NO.42 RT 06/06 Petamburan Tanah Abang Jakpus	1610186982	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.26	2026-06-27 12:42:12.26	\N	\N
2108	198908282024211004	Emmanuel Prausta Sinathan	IX	SPKKL Manembo-Nembo	\N	081225372824	Sleman	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Nusupan Trihanggo Gamping Sleman Yogyakarta	1845510015	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.263	2026-06-27 12:42:12.263	\N	\N
2109	NIP-1782564132263-182	Encep Koswara			\N			\N				1845510026	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.265	2026-06-27 12:42:12.265	\N	\N
2110	198708312024212005	Engglika Tjan	IX	Kantor Zona Maritim Tengah	\N	085299910733	Payahe	\N	Jl. Diponegoro No.126 95112 Manado Sulawesi		Kel. Manembo Nembo Atas Ling 01/2 Matuari Bitung	1845510037	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.269	2026-06-27 12:42:12.269	\N	\N
2111	197712152014022001	Enni Parikawati	Penata Tk. I/3.d	Biro Perencanaan dan Organisasi	\N	081235408140	Kediri	\N	Jl. Diponegoro No.126 95112 Manado Sulawesi		Jl. Khairil Anwar No.20 Kediri Jawa Timur	1610193514	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.271	2026-06-27 12:42:12.271	\N	\N
2112	198808212020121007	Eren Jatmika	Letda Bakamla/IIIa	KPIML	\N	081283806549	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Komp. Graha Jala Yudha Blok 119 No.1 Ciangsanan Kab . Bogor	1610213011	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.274	2026-06-27 12:42:12.274	\N	\N
2113	199009262024211010	Erick Septia Hadiyanto	Letda	SPKKL Tarakan	\N	081351778118	Tarakan	\N	Tarakan Kalimantan Utara		Jl. P. Flores R 6 Kampung 1/Sikip	1845510048	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.277	2026-06-27 12:42:12.277	\N	\N
2114	199702162023212017	Erin Putri Fadhilah	Letda Bakamla/IX	Biro Umum	\N	08980785800	Medan	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		JL. Karantina, Asrama Singgasana III Medan	1792472010	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.28	2026-06-27 12:42:12.28	\N	\N
2115	NIP-1782564132281-188	Erna Sulistiawati			\N			\N				1792471957	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.283	2026-06-27 12:42:12.283	\N	\N
2116	199309012024211006	Ervan Mursyahrizal	Letda Bakamla/IX	Kantor Zona Maritim Barat	\N	081365555360	Tanjung Pinang	1993-01-09 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		KP. Mekasari	1845510059	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.285	2026-06-27 12:42:12.285	\N	\N
2117	198705282014021001	Ervan Reri Nugrah	Penata Muda Tk.1/3 b	Biro Umum	\N	081317702119	Gunung Kidul	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Pakulonan Barat, Kelapa Dua Tangerang	1613346640	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.288	2026-06-27 12:42:12.288	\N	\N
2118	199308222019021003	Esnawan Wira yudha, S.H.	Penata Muda TK. I/III.b	Direktorat Hukum / Bakamla	\N	081323423933	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Anggrek Cendrawasih X K/30, Kemanggisan Palmerah Jakarta Barat	1610217050	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.29	2026-06-27 12:42:12.29	\N	\N
2119	198205102010122001	Evi Puspitaningrum	II D	Direktorat Kebijakan	\N	081220891281	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Komp. DPR - RI Blok E No. 13	1610195679	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.293	2026-06-27 12:42:12.293	\N	\N
2120	199402172024211003	Fahri Ramadhan Daud	Letda	Kantor Zona Maritim Tengah	\N	085340081404	MAnado	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Malendeng Lingkungan I Kec. Padi Dua Kota Manado	1845510071	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.295	2026-06-27 12:42:12.295	\N	\N
2121	198602252010121002	Faiq Muizzudin	Penata Muda Tk.I/III.b	Biro Umum	\N	085244765737	Jepara	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Dago Elos I RT 01/02 Kel. Dago Kota Bandung	1610186880	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.299	2026-06-27 12:42:12.299	\N	\N
2122	199312012024211003	Fajar Agian Langkamane	Letda	SPKKL KEMA	\N	085299233308	Mobagu	1993-01-12 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		JL. Golkar Kel. Biga Kec Kota MOBAGU	1845510082	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.301	2026-06-27 12:42:12.301	\N	\N
2123	19950817202121016	Fajar Muktian	Penata Tingkat I/III D	SPKKL KEMA	\N	089602672757	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Zivit RT 01/13 Jatirangga Jatisampurna Kota Bekasi	1611022741	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.304	2026-06-27 12:42:12.304	\N	\N
2124	199301152022021001	Fajriansyah Noor Hidayat, S.Kom			\N	082194036768	Surabaya	\N			Jl. Pantai Firdaus kema II	1610192714	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.308	2026-06-27 12:42:12.308	\N	\N
2125	199109042024212008	Fanny Septiani	Letda Bakamla IX	SPKKL Tarakan	\N	081347430646	Tarakan	1991-04-09 00:00:00			Asrama Militer Batalyon Infanteri G13 Tarakan Kaltara	1610188389	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.311	2026-06-27 12:42:12.311	\N	\N
2126	198706172024211005	Faris Wuryanto	Serka Bakamla	SPKKL Batam	\N	08568833373	Pasuruan	\N			Kav. Seitering Blik BI No.22 Tj. Sengkuang Batam	1610187613	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.314	2026-06-27 12:42:12.314	\N	\N
2127	199811012022021003	Farrel Varian Eka Putra	Serka Bakamla /IIC	SPKKL Batam	\N	081216847244	Pasuruan	1998-01-11 00:00:00			Dusun Barek RT 04/2 Ngadiluhur Kec. Balen Kab. Bojonegoro	1610190669	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.317	2026-06-27 12:42:12.317	\N	\N
2128	200003312024212005	Fatiha Meliana Kurniawati	Serka Bakamla /IIC	Direktorat Kebijakan	\N	081545114742	Sukoharjo	\N			Jl. R.A Kartini Gang Jatayu I RT 01/08 Slawi Kulon Tegal	1845510093	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.32	2026-06-27 12:42:12.32	\N	\N
2129	198308242009011001	Fatkhurrokhman	Penata Tingkat 1	Direktorat Latihan	\N	08568776320	Jakarta	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		JL. Pembangunan No.4 RT 01/05 Jatibening Baru Bekasi	1610209990	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.322	2026-06-27 12:42:12.322	\N	\N
2130	19960220202424010	Faustino Rika Asprilla	Letda Bakamla Gol IX	Biro Umum	\N	081992057303	Ponorogo	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Jl. Sumber Mulyo Gundih Bubutan Surabaya	1845510106	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.325	2026-06-27 12:42:12.325	\N	\N
2131	199401232024211007	Febriansyah	Letda IX	Biro Umum	\N	082181438171	Gading	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Jl. SD 46 rt 01/01 Bukitsari Pangkal Pinang	1845510117	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.328	2026-06-27 12:42:12.328	\N	\N
2132	199412202024212014	Femy Trigita Sentani	Letda /IX	Direktorat Kebijakan	\N	085702089217	Bekasi	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Jl. Soka Blok B3 No.33 Jatibening Permai	1845510139	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.332	2026-06-27 12:42:12.332	\N	\N
2133	198109242009122002	Fenny Sefhirany	Mayor Bakamla/III.d	Direktorat Kerjasama	\N	085777999274	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Kav Blok A No. 34 RT 10/02	1610206875	Sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.334	2026-06-27 12:42:12.334	\N	\N
2134	199510232022022003	Fenty Nofitalia	Letda/III.A	Biro Umum	\N	081219090036	Tangerang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Kl. Rawa Papan No. 62 RT 14/06 Bintaro Pesanggrahan Jakarta Selatan	1610208942	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.338	2026-06-27 12:42:12.338	\N	\N
2135	198707082024…..	Ferdinandus Kristyatmoko	Letda	SPKKL Bali	\N	081213217729	Surabaya	1987-07-08 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Palas Gunung 2/23 Surabaya	1845510151	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.341	2026-06-27 12:42:12.341	\N	\N
2136	198002062015011001	Feri Susandi	Penata/ III-C	Direktorat Kebijakan	\N	08128954969	Batang Silasih	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Sukahati Cibinong Bogor	1613348536	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.343	2026-06-27 12:42:12.343	\N	\N
2137	197908082009011001	Ferry Darmawan	Penata Tingkat Pertama /III D	Direktorat Operasi Udara Maritim	\N	08122552223	Jepara	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Ambar Cibinong Blok A8/9	1610209388	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.347	2026-06-27 12:42:12.347	\N	\N
2138	1980021420090110002	Ferry Rindo Dolfa	Mayor Bakamla /3d	Direktorat Hukum / Bakamla	\N	081287400707	Cianjur	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Kalibaru Timur 6 No. 293 Kel. Utan Panjang Kemayoran Jakpus	1611050428	Sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.35	2026-06-27 12:42:12.35	\N	\N
2139	10085/P	Ferry Supriady, ST. MM. MTr. Opsla. CIGAR	Laksamana Pertama	Direktorat Kebijakan	\N	081348129191	Majalengka	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Flat TNI AL Sunter KODAMAR	1645921125	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.352	2026-06-27 12:42:12.352	\N	\N
2140	197612022009011002	Fery Haryanto	Penata Tk I/III d	Direktorat Kebijakan	\N	081297113773	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl Lontar A NO.17 RT 03/15 Kel. Tugu Utara Jakarta Utara	1610206014	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.355	2026-06-27 12:42:12.355	\N	\N
2141	199309102024211004	Fidel Calvin Rumagit	Serka/6	SPKKL Kema	\N	082376772110	Tatelu	1993-10-09 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Wasian Kec Dimembe	1845510162	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.359	2026-06-27 12:42:12.359	\N	\N
2142	199607202024212011	Fiqriany Karepesina	Letda	Kantor Zona  Maritim Timur	\N	081327263898	Ambon	\N	Jl. Inatuni No. 1 karang Panjang		Air Kuning RT 1/18 Batu Merah Sirimau Ambon	1845510173	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.362	2026-06-27 12:42:12.362	\N	\N
2143	199712232018021001	Firanzy Fadillah	II.b	Kantor Zona  Maritim Timur	\N	082169993329	Pekanbaru	\N	Jl. Inatuni No. 1 karang Panjang		Jl. Kartama Gang bambu No.85 Pekanbaru Riau	1610993145	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.364	2026-06-27 12:42:12.364	\N	\N
2144	199905132018022001	Firda Choliratul Rosyida	Sertu/II a	Biro Umum	\N	085895042684	Mojokerto	\N	Jl. Inatuni No. 1 karang Panjang			1610208862	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.368	2026-06-27 12:42:12.368	\N	\N
2145	199005032023211018	Firman Syawlana	VII	KPIML	\N	08119502305	Tangerang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Setia Warga Kp. Ciater Serpong Tangsel	1792737078	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.37	2026-06-27 12:42:12.37	\N	\N
2146	199103062024212012	Fitria Pambudi	Serka /Gol VII	Biro Umum	\N	081392239093	Jakarta	1991-06-03 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jakarta	1845510184	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.373	2026-06-27 12:42:12.373	\N	\N
2147	199502102018022001	Fitriyani Labobar	Pengatur Tk. I/II.d	Direktorat Operasi Laut	\N	081331660013	Ambon	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Martha Alfonz Poka Ambon	1613347611	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.376	2026-06-27 12:42:12.376	\N	\N
2148	10755/P	Frandinanto Suwarno, S.T.	Laksamana Pertama	Direktorat Operasi Laut	\N	08179073993	Bitung	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Tanjung Karang	1645863014	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.38	2026-06-27 12:42:12.38	\N	\N
2149	198512202015012001	Franzieska Dyah Sulistyarini	Penata III c	Direktorat Kebijakan	\N	08129977830	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Swasembada Timur VIII /23	1610204732	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.383	2026-06-27 12:42:12.383	\N	\N
2150	199006102020121007	Fredy Wiratama	Serda	SPKKL Natuna	\N	081266455977	Magetan	1990-10-06 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Batu Kilane Kel. Ranai Kota Kab. Natuna	1613348183	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.386	2026-06-27 12:42:12.386	\N	\N
2151	198902092023211019	Frengky Jezua	Letda	SPKKL Kupang	\N	081339805480	Maumere	1989-09-02 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Yos Sudarso Kel. Namosain Kec. Alak	1613347962	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.39	2026-06-27 12:42:12.39	\N	\N
2152	199702132024211006	Frenly Maabuat	Letda/IX	Biro Perencanaan dan Organisasi	\N	081244291395	Manado	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Dusun III, Desa Tule Kec. Melonguane Timur	1845510208	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.393	2026-06-27 12:42:12.393	\N	\N
2153	200103072022011001	Galih		Biro Perencanaan dan Organisasi	\N	08971997908	Jepara	2001-07-03 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Desa Welahan RT 03/01 Welahan Jepara	1610192260	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.395	2026-06-27 12:42:12.395	\N	\N
2154	199704192022021004	Galih Dwi Putra	IIc	Biro Perencanaan dan Organisasi	\N	082213162418	Labuhan Batu	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Puri Granit Indah, Darussalam Merat Barat Karimun	1610211615	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.399	2026-06-27 12:42:12.399	\N	\N
2155	199904082024211005	Galih Prasetya Widodo	Letda	Direktorat Data Dan Informasi	\N	085211646675	Purwokerto	1999-08-04 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Sultan Agung No.65 RT 7/3 Teluk Purwokerto Selatan	1845510219	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.402	2026-06-27 12:42:12.402	\N	\N
2156	200008072022011001	Giandi Putra Dwi Adnanta	Serka/II.c	Direktorat Kerjasama	\N	085693376900	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Sundoro No.149 Blok J Megapolitan Cinere	1610189892	Sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.404	2026-06-27 12:42:12.404	\N	\N
2158	199510052018021001	Gilang Beck	Sertu Bakamla /II.b	Biro Umum	\N	082127324772	Cirebon	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Bijaksana No.82 Gandul Cinere Depok	1610193966	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.411	2026-06-27 12:42:12.411	\N	\N
2159	199304172018021001	Gilang Ramadan Amd.Kop	II.d	Biro Umum	\N	082255726161	Desa baru	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Kp. Citayam RT 02/05 Kab Bogor	1611719729	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.415	2026-06-27 12:42:12.415	\N	\N
2160	199510232022022002	Gita Oktaviana	Letda /IIIA		\N	082219077337	Bandung	\N			Jl. Caringin No.49 RT 01/02 Kota Bandung	1610204302	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.42	2026-06-27 12:42:12.42	\N	\N
2161	12222/P	Gontri Nopel	Kolonel	Direktorat Kebijakan	\N	081244125569	Batu Payung	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Trisula No. 15 K. Pilang Surabaya	1644901700	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.425	2026-06-27 12:42:12.425	\N	\N
2162	13945/P	Gugun Saeful Rachman	Kolonel /Eselon III	Biro Umum	\N	081218964798	Subang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Komplek Bumi Abdi Praja Kav.83, Sukamelang, Subang Jawa Barat	1798793388	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.429	2026-06-27 12:42:12.429	\N	\N
2163	89832	Hadiyanto	Serka Bakamla	Biro Umum	\N	081217716516	Purworejo	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Enggram Raya, No. 66 RT 06/05 Sawangan Depok Jawa Barat	1610194824	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.431	2026-06-27 12:42:12.431	\N	\N
2164	199521012024211011	Hafiz Bim Hamim	Letda	SPKKL Tual	\N	085230502273	Maluku Tenggara	\N	Fiditan		Dusun Dumar	1845510231	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.434	2026-06-27 12:42:12.434	\N	\N
2165	199802152022022003	Hafiza Fitri Rada, A.Md.T	Serka	SPKKL Tual	\N	088271966204	Solok	\N	Fiditan		Dusun Dumar	1610992958	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.437	2026-06-27 12:42:12.437	\N	\N
2166	199802052021011002	Haggai Kriston F.	IIC	Inspektorat	\N	082112783037	Jakarta	1998-05-02 00:00:00	Fiditan		Jl. Binalontar II No. 135 RT 7/9	1613348706	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.44	2026-06-27 12:42:12.44	\N	\N
2167	197903222010121001	Halilintar	Mayor Bakamla/III.d	Kantor Zona Maritim Barat	\N	0811446131	Ujung Pandang	\N	Jl. Trans Barelang Jembatan II, Setokok Batam		Jl. H. Muahammad RT 03/01 Kel. Batu Besar Kec. Mongso Kota Batam	1610992947	Sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.442	2026-06-27 12:42:12.442	\N	\N
2168	199607062024211005	Handy Arsauly Amirullah	Serka/Gol VII	Biro Umum	\N	081249584150	Surabaya	1996-06-06 00:00:00	Jl. Trans Barelang Jembatan II, Setokok Batam		Perum Jalagriya DV/15 Candi Sidoarjo	1845510242	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.444	2026-06-27 12:42:12.444	\N	\N
2169	198510052009011001	Happy Aliwartaya	Penata/III.c	Direktorat Kerjasama	\N	085640226433	Kudus	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Ambar waringin Jaya, Bojonggede, Bogor	1610205511	Sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.448	2026-06-27 12:42:12.448	\N	\N
2170	198507252015012001	Happy Nurhidayah P	Kapten/III.c	Direktorat Kerjasama	\N	081321714131	Bandung	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. H Ridan Cluster Banjar Rewa Indah Blok R6 Cipondoh Tangerang	1610203228	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.452	2026-06-27 12:42:12.452	\N	\N
2171	198105202015011001	Hardiansyah	Kapten/III.C	Biro Sarana Dan Prasarana	\N	085327161086	Kananga Bolo	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Pondok Pekayon Indah CC 12 No.6 Bekasi	1610205420	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.456	2026-06-27 12:42:12.456	\N	\N
2172	198910252015011001	Hari Mugti Subroto	Penata Muda /IIIc	Direktorat Hukum / Bakamla	\N	081398559854	Kotabumi	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		JL. Ciputat Raya SMEA IX No. 150 RT 005/001, Pondo Pinang	1611050382	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.46	2026-06-27 12:42:12.46	\N	\N
2173	198303222010121002	Hariyadi	Serma Bakamla	Biro Umum	\N	087770101144	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Sawah Dalam	1610202600	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.463	2026-06-27 12:42:12.463	\N	\N
2174	NIP-1782564132463-247	Harobin Syaputra			\N			\N				1792737294	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.465	2026-06-27 12:42:12.465	\N	\N
2175	199704202018021001	Harun Al Rasyid	Sertu Bakamla/II.b	Biro Umum	\N	082245943693	Jombang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Cendana 2 NO.1 RT 06/02 Kauman Batang Jawa Tengah	1673003009	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.468	2026-06-27 12:42:12.468	\N	\N
2176	NIP-1782564132469-249	Haryando Simbolon		Biro Umum	\N	082258769480	Bekasi	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Perum Griya Asri Bahagia G2/07 RT 10/33 Kel. Bahagia Kec. Babelan Kab. Bekasi	1610993292	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.471	2026-06-27 12:42:12.471	\N	\N
2177	11842/P	Hendarwan Setiawan	Kolonel	Biro Umum	\N	081245824242	Tasikmalaya	1969-06-02 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl.Bronggolan 2F No. 75A Surabaya	1610206999	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.474	2026-06-27 12:42:12.474	\N	\N
2178	198406122024211005	Hendra Pontoh, SH	Arsiparis Ahli Pertama/IX	Biro Umum	\N	081244992486	Mobagu	1984-12-06 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Ds. Jayakarsa Likupang	1610191222	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.478	2026-06-27 12:42:12.478	\N	\N
2179	NIP-1782564132479-252	Hendra Purnama			\N			\N				1611716693	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.48	2026-06-27 12:42:12.48	\N	\N
2180	197711062014021001	Hendra Wahyu Utama	Lettu Bakamla / Penata Muda Tk.I/III.b.	Direktorat Kebijakan	\N	081905338977	Surabaya	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Komplek TNI AL KODAMAR 21 Putri Pelangi E.19	1610207686	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.484	2026-06-27 12:42:12.484	\N	\N
2181	199105052024211007	Hendri Afrian Filandra	Letda Bakamla/IX	Unit Penindakan Hukum	\N	082133111014	Baturaja	1991-05-05 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Desa Gumawang Kec. Belitang Kab Okut Sumsel	1845510253	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.49	2026-06-27 12:42:12.49	\N	\N
2182	198404192024211005	Hendrik Pangalila AMD	Serka Bakamla	Pangkalan Armada Kamla Serei/ Zona Timur	\N	085173381926	Malei	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Sukur Likupang Wasian Jaga IV Dimembe Minahasa Utara Sulut	1610214752	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.493	2026-06-27 12:42:12.493	\N	\N
2183	199111212014022001	Heni Fauzia	Penata Muda/III.a	Biro Umum	\N	085781024407	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Perumahan Griya Exotica Cianangka Blok J3, Jl. Abdul Wahab gg H. Nimin II, Cinangka Sawangan Depok	1611050279	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.496	2026-06-27 12:42:12.496	\N	\N
2184	198510202024211004	Herdianto Naulu	Letda/IX	Unit Penindakan Hukum	\N	081353243599	Sorong	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		JL. Selat Obi Km. 95	1845510264	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.499	2026-06-27 12:42:12.499	\N	\N
2185	199302122024211008	Heriyantho Yoshua Febriyan	Letda/IX	Unit Penindakan Hukum	\N	082292018697	Ambon	1993-12-02 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Ling.II Kel. Taler Tondano Timur Minahasa	1613348648	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.502	2026-06-27 12:42:12.502	\N	\N
2186	198403302010121001	Herlambang Adhi Pradhana	Penata Tk I/III d	Direktorat Kebijakan	\N	081258465455	Surabaya	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Wijaya Blok A No. 26 RT 06/15 Jakasampurna Bekasi	1610187034	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.504	2026-06-27 12:42:12.504	\N	\N
2187	199505052022021001	Herman Tiko	Letda	Direktorat Kebijakan	\N	085696636323	Tongke-Tongke	1995-05-05 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat	1611023018	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.506	2026-06-27 12:42:12.506	\N	\N
2188	198605202015011001	Herry Zulkarnaen	Penata Muda/IIA	KPIML	\N	085795542040	Ciamis	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Komplek Griya Jatinangor II Blok A28 No.6 Sumedang	1611719208	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.509	2026-06-27 12:42:12.509	\N	\N
2189	199404252024211005	Heryanto Mustari A.md,Tra	Serka VII	SPKKL Jayapura	\N	085243234737	Enrekang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Samratulangi RT 12/20	1845510275	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.512	2026-06-27 12:42:12.512	\N	\N
2190	199406122022021001	Hijria Permana	IIIa	SPKKL Jayapura	\N	081288880795	Depok	1994-12-06 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Kembang V NO.22 Depok, Pancoran Mas, Kota Depok	1610187715	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.515	2026-06-27 12:42:12.515	\N	\N
2191	12677/P	Hilman Panungkunan	Kolonel TNI	Biro Sarana Dan Prasarana	\N	08128196821	Jakarta	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Cileungsi Bogor	1791925165	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.52	2026-06-27 12:42:12.52	\N	\N
2192	198308232009011002	Huzul Fahzan	Pembina Tk,I/IV.b	Direktorat Hukum / Bakamla	\N	082187100997	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Zambrud I No. C4 Cilandak	1845510286	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.525	2026-06-27 12:42:12.525	\N	\N
2193	NIP-1782564132528-266	I B Anindya Jaya Keniten			\N			\N				1845510297	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.53	2026-06-27 12:42:12.53	\N	\N
2194	199306132014021001	I Gede Ardi Suandika	Pembina Tk,I/IV.b	Direktorat Hukum / Bakamla	\N	081293361598	Ujung	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Br. Dinas Tumbu Kec. Karanfasem Kab. Karangasem Bali	1611050484	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.532	2026-06-27 12:42:12.532	\N	\N
2195	198001272015011001	I Gede Landra	Pembina Tk,I/IV.b	Direktorat Hukum / Bakamla	\N	082144859685	Gerobog	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Br. Dinas Tumbu Kec. Karanfasem Kab. Karangasem Bali	1610204958	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.535	2026-06-27 12:42:12.535	\N	\N
2196	199110072014021001	I Kadek Darmawan	Serka/II.c	RHIB 87-04 Bali	\N	082236099812	Seraya Barat	1991-07-10 00:00:00	Jl. Taman Ujung -Seraya Karangasem Bali		Br. Dinas Kalanganyar Kab. Karanasem Prov. Bali	1610204618	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.54	2026-06-27 12:42:12.54	\N	\N
2197	199203082010121001	I Kadek Deny Sucrisma	Serka/II.c	RHIB 87-04 Bali	\N	082291788277	Karangasem	1992-08-03 00:00:00	Jl. Taman Ujung -Seraya Karangasem Bali		Jl. Anggrek II No02 Perumnas Padangkerta Karangasem Bali	1610203772	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.543	2026-06-27 12:42:12.543	\N	\N
2198	13889/P	I Made Kurniawan SA , ST.,M.Tr. Hanla	Kolonel Bakamla	Biro Sarana Dan Prasarana	\N	081330946989	Bojonegoro	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		JL. PB. Soedirman144. Kupang Jetis Mojokerto	1823290072	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.546	2026-06-27 12:42:12.546	\N	\N
2199	15447/P	I Nyoman Armenthia Widyarsana	Kolonel Bakamla	Kantor Zona Maritim Barat	\N	081213731168	Surabaya	\N	Jl. Trans Barelang Jembatan II, Setokok Batam		Ikan Cumi-cumi 4 RT 03/02 Perak Barat Krembangan	944841258	Sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.55	2026-06-27 12:42:12.55	\N	\N
2200	197608082014021001	I Nyoman Gelbel	Kolonel Bakamla	Kantor Zona Maritim Barat	\N	085237782943	Seraya	1976-08-08 00:00:00	Jl. Trans Barelang Jembatan II, Setokok Batam		Jl. Anggrek II No02 Perumnas Padangkerta Karangasem Bali	1610208352	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.554	2026-06-27 12:42:12.554	\N	\N
2201	198612312014021001	I Nyoman Renita	Kolonel Bakamla	Kantor Zona Maritim Barat	\N	082247537658	Grobog	\N	Jl. Trans Barelang Jembatan II, Setokok Batam		Jl. Anggrek II No02 Perumnas Padangkerta Karangasem Bali	1610189439	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.56	2026-06-27 12:42:12.56	\N	\N
2202	198601142014021001	I Wayan Giriana	Kolonel Bakamla	Kantor Zona Maritim Barat	\N	085338053789	Ujung	\N	Jl. Trans Barelang Jembatan II, Setokok Batam		Jl. Anggrek II No02 Perumnas Padangkerta Karangasem Bali	1610204801	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.565	2026-06-27 12:42:12.565	\N	\N
2203	NIP-1782564132568-276	I Wayan Suparta	Honorer	SPKKL Bali	\N	085238818082	Merajan	1981-12-03 00:00:00	Jl. Taman Ujung -Seraya Barat Karangasem Bali		Merajan Seraya Barat Kec. Karangasem Kab. Karangasem Prov Bali	1610205599	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.569	2026-06-27 12:42:12.569	\N	\N
2204	198009192009011003	Ibnu Mufid Inung	Penata Tingkat I/III D	Direktorat Data Dan Informasi	\N	081332056717	Surabaya	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Perum Pesanggrahan Indah C3/6 Cilebut, Bogor	1610186948	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.572	2026-06-27 12:42:12.572	\N	\N
2205	NIP-1782564132573-278	Ibrahim		SPKKL Aceh	\N	085260624667	Krueng raya	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Ds. Lambunot Paya Kuta Baro Aceh Besar	1610206081	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.575	2026-06-27 12:42:12.575	\N	\N
2206	0	Ika Budiawati	0		\N	081382388878	Jakarta	\N			Jl. Calung V No. 427 Depok Tengah	1613346980	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.579	2026-06-27 12:42:12.579	\N	\N
2207	199708252019022001	Ika Sri Inderawati	Serma Bakamla / IId	Biro Umum	\N	081224784231	Bandung	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Chandraqa 6 No. 1 RT 09/08 Kel. Baru Kec. Pasar Rebo Jakarta	1611717018	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.582	2026-06-27 12:42:12.582	\N	\N
2208	19930913244021001	Ikhsan Triyogo	Penata Muda III.a	Biro Umum	\N	081280797147	Kulon Progo	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Madrasah No. 12 G Cinere Depok Jawa Barat	1610188163	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.585	2026-06-27 12:42:12.585	\N	\N
2209	19810111200912001	Ilham	Kapten	Biro Umum	\N	081378281623	Cilacap	1981-11-01 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Perumahan GVC Bekasi	1610207574	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.588	2026-06-27 12:42:12.588	\N	\N
2210	NIP-1782564132590-283	Ilham H. Mobilingo		Biro Umum	\N	085394153761	Buloila	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Desa Biau Kec. Biau Kab. Gorontalo Utara	1610191459	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.592	2026-06-27 12:42:12.592	\N	\N
2211	200101132023211001	Ilham Muhammad Aurum	Letnan II/IX	Biro Perencanaan dan Organisasi	\N	085732437281	Sampit	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Lintang Selatan 3 No.31, Tangerang	1792517756	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.597	2026-06-27 12:42:12.597	\N	\N
2212	198908102023211024	Imam Agus	Serka	Biro Perencanaan dan Organisasi	\N	081374704602	Serantas	1989-10-08 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		JL. Hanrjebat Ranai Kab Natuna Kepri	1792539123	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.602	2026-06-27 12:42:12.602	\N	\N
2213	199204072023211027	Imam Maliki	Serka Bakamla/IIC	Biro Perencanaan dan Organisasi	\N	081237023991	Temukus	1992-07-04 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Ds Temukus Banjar Bulelelng Bali	1792487414	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.605	2026-06-27 12:42:12.605	\N	\N
2214	199506102024212025	Indah Istiqamah Soulisa	Letda/IX	SPKKL Ambon	\N	081320386065	Ambon	1995-10-06 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Gadihu Dusun Kiru RT 2/13 Batu Merah Sirimau Ambon	1845660811	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.61	2026-06-27 12:42:12.61	\N	\N
2215	199801012020122009	Indah Puji Dwiyanda	Letda/III.A	Direktorat Kerjasama	\N	081212234799	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		JL. Griya Jatinangor II Blok a2a RT 03/03 Cinanjung Tanjungsari	1611050406	Sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.613	2026-06-27 12:42:12.613	\N	\N
2216	198408282015011001	Indra Agustina	Penata Muda /III.a	Direktorat Kerjasama	\N	085691626022	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Masjid Raya No.62 RT/01/05 LAR Selatan	1610187498	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.617	2026-06-27 12:42:12.617	\N	\N
2217	198808122018021001	Indra Agustira	Sertu Bakamla /II.b	Direktorat Latihan	\N	085724114443	Kuningan	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Blok Pilang Tonggo RT 01/01 Pilangsari Kadawung Kab. Cirebon	1613347791	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.62	2026-06-27 12:42:12.62	\N	\N
2218	198912072018021001	Indra Karmaka	Pengatur Muda Tk. I/II.b	Biro Umum	\N	089683646710	Bandung	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Malakasari Residence Blok C.7 Bale Endah Bandung	1613348412	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.622	2026-06-27 12:42:12.622	\N	\N
2219	199810042018021001	Indra Tri Laksono	Sertu Bakamla	Biro Umum	\N	081299099149	Purworejo	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Desa Krandegan RT 01/05 Kec. Bayan Kab. Purworejo	1610187001	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.625	2026-06-27 12:42:12.625	\N	\N
2220	199508312023212032	Indri Puspita Sari	IX	Inspektorat	\N	085883693022	BOgor	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Bojong Gede Kab. Bogor Jawa Barat	1792471991	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.629	2026-06-27 12:42:12.629	\N	\N
2221	199404212024212025	Inggrid	Letda	SPKKL KEMA	\N	082188951255	Tomohon	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Kel. Tingkulu Lingkungan II Kec. Wanea Manado	1845510300	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.634	2026-06-27 12:42:12.634	\N	\N
2222	199410042018021001	Ingrat O. Sigalingging, S.H.	Penata Muda Tk. I/IIIb	Direktorat Hukum / Bakamla	\N	081228325054	Siborongborong	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Kav. Diskum AD Jl. Cakra Wijaya VII Blok V-5 RT/RW 006/002, Kel. Cipinang Muara, Kec. Jatinegara, Kota Jakarta Timur	1613347622	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.638	2026-06-27 12:42:12.638	\N	\N
2223	198601192010121002	Insan Aulia ST	IIId	Direktorat Hukum / Bakamla	\N	081284486584	Tebing Tinggi	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Taman Duta 1 No. 5 Cimanggis Depok	1613346516	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.642	2026-06-27 12:42:12.642	\N	\N
2224	199809022024212007	Intan salmon	Letda		\N	081247275262	Wayame	1998-02-09 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Menteng Jaya	1613348445	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.645	2026-06-27 12:42:12.645	\N	\N
2225	198211212009012001	Irma Sahara	Letkol Bakamla/IV.a	Direktorat Latihan	\N	082112644827	Jakarta	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Jl. Cempaka Sari No.12	1611718056	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.648	2026-06-27 12:42:12.648	\N	\N
2226	198304332014021001	Irpan Dadi	Serka Bakamla	Kantor Zona Maritim Barat	\N	081371295520	Jakarta	\N	Jl. Trans Barelang Jembatan II, Setokok Batam		Perum Legenda Malaka  Blok B6. No.14	1610187556	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.65	2026-06-27 12:42:12.65	\N	\N
2227	198402292009122001	Ismiyarti, S.I.Kom	Penata Muda /III.a	Biro Umum	\N	081280289496	Gunung Kidul	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Komplek TWP TNI AL D22/20 Ciangsana	1610189542	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.654	2026-06-27 12:42:12.654	\N	\N
2228	199507122024212017	Isnaini Putri Jannati, S.Pd.	Letda Bakamla /IX	Biro Umum	\N	085770140414	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. PPA Bambu Apus, RT 05/01 Kel. Bambu Apus Kec. Cipayung Jaktim	1613346458	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.656	2026-06-27 12:42:12.656	\N	\N
2229	199603242022021002	Ivandy Berutu	Letda Bakamla	SPKKL Sambas	\N	085270817177	Simalungun	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Huta IV Simpang Tiga Desa Sordang Bolon Ujung Panjdang Simalungun	1611022934	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.659	2026-06-27 12:42:12.659	\N	\N
2230	13838/P	Jan Lucky Boy Siburian	Kolonel	SPKKL Sambas	\N	08111917044	Bangkalan	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Aralia HY 30/43 Harapan Indah Bekasi	1612212663	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.663	2026-06-27 12:42:12.663	\N	\N
2231	199508252024211002	Jansen Wattimury	Serka Bakamla	Kantor Zona Maritim Tengah	\N	082289107345	Ambon	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Dusun XII Komp Perumahan Permata Hijau Sumatera Utara	1845510311	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.669	2026-06-27 12:42:12.669	\N	\N
2232	198912192018021001	Jarot Mustaghfirin	Serma/II.d	Biro Sarana Dan Prasarana	\N	082338354882	Kendal	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Ds.  Winong  RT 04/02 Kec. Ngampel Kab. Kendal	1611023176	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.673	2026-06-27 12:42:12.673	\N	\N
2233	NIP-1782564132673-306	Jeckson Salamor	Honorer	Biro Sarana Dan Prasarana	\N	081247352430	Latulahat	1999-06-05 00:00:00	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Jl. Dr Sam Ratulangi No.52 Mandala Jayapura Utara Kota Jayapura	1613348025	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.675	2026-06-27 12:42:12.675	\N	\N
2234	19980429202102001	Jemmima Rachmadita	Pengatur II/C	Biro Sarana Dan Prasarana	\N	0895383231720	Rejang Lebong	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		RT 01/10 Taman Winangun Indah, Kebumen	1611716434	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.679	2026-06-27 12:42:12.679	\N	\N
2235	199607022024211009	Jendri Rompis	Serka/VII	SPKKL Kema	\N	082271647392	Tondano	1996-02-07 00:00:00	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		ungkungan II, RT 4/2 Kel. Girian Permai Kec. Irian Kota Bitung	1845510322	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.682	2026-06-27 12:42:12.682	\N	\N
2236	199601022020121010	Jepriyaman	III.a	SPKKL Kema	\N	082284878988	Batam	1996-02-02 00:00:00	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Villa Pesona Asri Blok A19 No.23 Manado	1613348149	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.685	2026-06-27 12:42:12.685	\N	\N
2237	198605302023211013	Jermi M. Saduk	Letda	SPKKL Kupang	\N	081237767929	Kupang	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Jl. Samratulangi RT 38/17 Kel. Kelapa Lima	1611716570	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.689	2026-06-27 12:42:12.689	\N	\N
2238	199201232019021002	Jhony Rian Setiawan Saragih, S.Kom	Letda	SPKKL Tanjung Balai Karimun	\N	081378828853	Pekanbaru	\N	Jl. Lingkar Coastal Area, Teluk Air, Karimun		Perumahan Bukit Permai Blok E No.1 Teluk Air Karimun	1610211706	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.692	2026-06-27 12:42:12.692	\N	\N
2239	NIP-1782564132701-312	Jizreel Pandey			\N			\N				1845510333	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.703	2026-06-27 12:42:12.703	\N	\N
2240	NIP-1782564132704-313	Johannes S			\N			\N				1613347145	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.706	2026-06-27 12:42:12.706	\N	\N
2241	199310132023211022	Jon Ruben Simbolon	VII-c	SPKKL Tanjung Balai Karimun	\N	085296570722	Sawah II	\N	Tlk. Air Kec. Karimun Kab. Karimun Kep. Riau		Baloi Kolam RT 07/16 Kel. Sungai Panas Kec. Batam Kota Provinsi Kepulauan Riau	1792737114	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.709	2026-06-27 12:42:12.709	\N	\N
2242	196805311992031001	Joni Junaidi	Kolonel/Pembina Tk I, Ivb	Direktorat Kebijakan	\N	081210001289	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Tangerang	1611718410	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.711	2026-06-27 12:42:12.711	\N	\N
2243	NIP-1782564132713-316	Jopi Jakobus Menoh		SPKKL Kupang	\N	081239248727	Kenamoen	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Salak RT 16/07 Oepura maulafa	1610189814	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.714	2026-06-27 12:42:12.714	\N	\N
2244	200009122022011001	Jos Armando Himang	Serka Bakamla/II.c	Biro Umum	\N	085158884386	Pontianak	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Jangli Perbalan Timur III, Kota Semarang	1610190126	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.718	2026-06-27 12:42:12.718	\N	\N
2245	199707292018021001	Julian Yudha Pratama	Sertu /Iib	Direktorat Operasi Laut / Catamaran 5-04	\N	085225857632	Pemalang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Seminggus RT 03/04 Pemalang	1610189188	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.721	2026-06-27 12:42:12.721	\N	\N
2246	NIP-1782564132724-319	Justan Parlindungan Tampubolon			\N			\N				1792525155	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.726	2026-06-27 12:42:12.726	\N	\N
2247	198903152015012001	Kadek Lis Martiaveni	Kapten/III.C	Direktorat Operasi Laut / Catamaran 5-04	\N	081911666663	Tumbu	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Br. Dinas Penatahan Kelod Desa Penatahan Kec. Penebel Kab. Tabanan Bali	1610203614	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.73	2026-06-27 12:42:12.73	\N	\N
2248	118531	Karmo Wijaya	Serka	Biro Umum	\N	085695006021	BOgor	1993-01-03 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Cilandak	1613346800	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.733	2026-06-27 12:42:12.733	\N	\N
2249	199925052021012001	Kartika Pertiwi	Serka	Biro Umum	\N	087845616846	Semarang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Sumurup RT 15/4 No.23 Asinan Bawen Semarang	1610189337	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.737	2026-06-27 12:42:12.737	\N	\N
2250	198507302009122001	Kartika Pusakaningrum	Penata Tk.1/III.d	Biro Perencanaan dan Organisasi	\N	085655808990	Madiun	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Usadasari No.12 Madiun Jawa Timur	1610195374	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.74	2026-06-27 12:42:12.74	\N	\N
2251	199408092023212034	Ketty Ruth Leonita	Serka Bakamla/VII	Biro Umum	\N	085710740471	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		JL. Tebet Timur Dalam VI B, No.8 RT 06/11 Kel. Tebet Timur Kec. Tebet Jaksel 12820	1792737158	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.743	2026-06-27 12:42:12.743	\N	\N
2252	198106112010122001	Khaerunnufus	Penata Tk.I/III.d	Biro Perencanaan dan Organisasi	\N	081218602563	Bima	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl,. Beriman 1 No 6 RT 01/12 Cibubur Jakarta Timur	1613346811	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.747	2026-06-27 12:42:12.747	\N	\N
2253	199710122022022002	Kharisma Endah Sapuan	Letda Bakamla/III.a	Direktorat Kerjasama	\N	082121676611	Bogor	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Perum TNI AL Blok AA 6 No. 1 Jonggo; Jawa Barat	1610194154	Sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.75	2026-06-27 12:42:12.75	\N	\N
2254	199601102022021001	Kiki Almanda	Serda /II.a	Direktorat Kerjasama	\N	087819628700	Muaka Pulutan	1996-10-01 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Muara Pulutan Kab. Bengkulu Selatan	1613347815	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.753	2026-06-27 12:42:12.753	\N	\N
2255	1996022102022021004	Kow Fitrianto Saputro	Serda		\N	085800609410	Surakarta	\N			Kulon Progo	1611721013	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.757	2026-06-27 12:42:12.757	\N	\N
2256	199804042022022004	Krismona Apriyani	III/a	Biro Umum	\N	0895603281135	Gunung Kidul	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Banaran 1 RT 01/01 Banaran Playen Gunung Kidul	1610203104	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.761	2026-06-27 12:42:12.761	\N	\N
2257	199009142018021001	Kuntoro, A.Md.	Serma Bakamla/IID	Unit Penindakan Hukum	\N	081328655538	Purworejo	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Seren RT 01/06 Gebang Purworejo Jawa Tengah	1610993327	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.771	2026-06-27 12:42:12.771	\N	\N
2258	198511142010122001	Kurnialis Baktiajeng Chairany	Penata Tk. I/III.d	Direktorat Hukum / Bakamla	\N	081325703473	Semarang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Perum Bumi Cimanggis Indah 2 Kav. 5B, Jl. Kp.Kebayunan Tapos , Depok	1611050520	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.778	2026-06-27 12:42:12.778	\N	\N
2259	198512212010122001	Kustriyani	Penata Tk.I/III.d	Direktorat Kerjasama	\N	085216135098	Trenggalek	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Perumahan Villa Dago Tol Block C.28 No.6	1610202452	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.782	2026-06-27 12:42:12.782	\N	\N
2260	199212262024211005	Lalu Hadi Lutfikurrahman	Serka/VII		\N	087846998145	Masbagik	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Kp. Padang Lombok Timur	1845510344	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.785	2026-06-27 12:42:12.785	\N	\N
2261	199908182022011003	Lalu Reinald Ansyari Wirayuda	Serka Bakamla/II.C	0	\N	085858204258	Malang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jalan Anyer II. NO.8	1611022854	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.788	2026-06-27 12:42:12.788	\N	\N
2262	19810701215011001	Laode Samsudin	II b	Biro Sarana Dan Prasarana	\N	081219519308	Pongo	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Wanci	1610206911	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.792	2026-06-27 12:42:12.792	\N	\N
2263	199812062022021001	Laurentsius Joshua Sibuea	Serka	Biro Sarana Dan Prasarana	\N	082367999953	Simalungun	1998-06-12 00:00:00	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Perumnas Tiga Dolok Dolok Panribuan Kab. Simalungun	1613348003	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.795	2026-06-27 12:42:12.795	\N	\N
2264	NIP-1782564132797-337	Leni			\N			\N				1610211365	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.799	2026-06-27 12:42:12.799	\N	\N
2265	198807252020121007	Leonard David	III.a	Direktorat Hukum / Bakamla	\N	081288203141	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Premier Estate 2, Blok M 12, Kodau, Pondok Melati	1610191108	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.801	2026-06-27 12:42:12.801	\N	\N
2266	NIP-1782564132803-339	Lerry Apreldy Pattipawae			\N			\N				1792517790	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.805	2026-06-27 12:42:12.805	\N	\N
2267	199902202024212003	Lilik Fatmawati	Letda Bakamla	Inspektorat	\N	085776406118	Pekalongan	\N			Desa Salit Pekalongan Jateng	1845510366	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.81	2026-06-27 12:42:12.81	\N	\N
2268	199007092018022001	Lina Warlina	Serma Bakamla /II d	Biro Umum	\N	08561113325	Sumedang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Sunter	1613346617	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.814	2026-06-27 12:42:12.814	\N	\N
2269	195711292022021001	Lisandi Novisra	Letda Bakamla /Iia	Kantor Zona Maritim Barat	\N	08116832395	Banda Aceh	\N	Jl. Trans Barelang Jembatan II, Setokok Batam		Jl. Trans Barelang Jembatan II, Setokok Batam	1610188367	Sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.819	2026-06-27 12:42:12.819	\N	\N
2270	NIP-1782564132820-343	Lonardo Falentino Tutuarima			\N			\N				1845510377	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.822	2026-06-27 12:42:12.822	\N	\N
2271	197601172010122001	Lorentina Herawati	Mayor Bakamla/III.d	Direktorat Kerjasama	\N	081808281249	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Yudhistira NO.10 Kec. Cilodong Kota Depok	1613356910	Sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.824	2026-06-27 12:42:12.824	\N	\N
2272	NIP-1782564132826-345	Ludwi Nugroho			\N			\N				1611716853	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.828	2026-06-27 12:42:12.828	\N	\N
2273	198510292009011001	Lukman Nurhakim	Mayor Bakamla/III.d	Direktorat Kerjasama	\N	087831546872	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Komp. Setneg Blok B. 13	1610186813	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.831	2026-06-27 12:42:12.831	\N	\N
2274	199303302023211023	Luthfi Fajri, A.Md.	Serka Bakamla/II.c	Direktorat Hukum / Bakamla	\N	081809004372	Bandung	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. H. Kurdi Selatan Gg. Babakan Raksa No. 21 06/06 Pelindung Hewan Astanya Anyar Kota Bandung	1792536473	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.834	2026-06-27 12:42:12.834	\N	\N
2275	NIP-1782564132836-348	M Yuda Mashuri			\N			\N				1792702953	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.838	2026-06-27 12:42:12.838	\N	\N
2276	NIP-1782564132840-349	M. Abdul Aziz	PHL	Biro Umum	\N	08125930966	Surakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat	3502090702660000	Coper Kulon RT.01 RW 02 Desa Coper Kecamatan Jetis Kab. Ponorogo Jawa Timur	1613361476	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.842	2026-06-27 12:42:12.842	\N	\N
2277	198710272009121001	M. Afrizal	Serma Bakamla/II.d	Biro Umum	\N	082347892527	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Utan Panjang II. RT010/008 Kel. Utan Panjang Kec. Kemayoran Jakarta Pusat	1610189654	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.848	2026-06-27 12:42:12.848	\N	\N
2278	199512192022021002	M. faried Mandala Putra	Serda	SPKKL Kupang	\N	082349749511	Ujung Pandang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Jembatan Lama No.1 2/6 Mandai Bentoa Maros	1611022989	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.853	2026-06-27 12:42:12.853	\N	\N
2279	198502202014021001	M. Reza Febrino	Letda Bakamla	Biro Umum	\N	081255212026	Banten	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		-	1610993189	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.857	2026-06-27 12:42:12.857	\N	\N
2280	199602042020121009	M.A Yogi Sutejo	Serka Bakamla /II.C	Biro Sarana Dan Prasarana	\N	085377011234	Batam	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Jl. Sekip Berok Koba Bangka tengah Bangka Belitung	1613347644	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.86	2026-06-27 12:42:12.86	\N	\N
2281	199906142023211001	M.A. Malik Alghani, A.Md	Serka	Biro Sarana Dan Prasarana	\N	081272940341	Palembang	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Jl. Sekip Berok Koba Bangka tengah Bangka Belitung	1792536440	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.863	2026-06-27 12:42:12.863	\N	\N
2282	199506182019021001	Mahfud Hidayat	Sertu	Biro Sarana Dan Prasarana	\N	085230740808	Probolinggo	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Jl. Sekip Berok Koba Bangka tengah Bangka Belitung	1611719832	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.867	2026-06-27 12:42:12.867	\N	\N
2283	199605282022021002	Maizarli	Sertu	Biro Sarana Dan Prasarana	\N	085374275410	Gauang	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Jorong bansa Desa Gauang Kubung Solok Sumatera Barat	1610190499	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.87	2026-06-27 12:42:12.87	\N	\N
2284	198503052010122001	Margaretha Kirana Lestari, S.E	Mayor Bakamla	Biro Sarana Dan Prasarana	\N	081364106612	Palembang	1985-05-03 00:00:00	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Legenda Malaka Blok B6 No. 14 Batam	1613346684	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.872	2026-06-27 12:42:12.872	\N	\N
2285	199507162018022001	Maria Ulfa Yasinta	Sertu Bakamla	Direktorat Kebijakan	\N	081221606500	Tasikmalaya	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat			1611050337	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.876	2026-06-27 12:42:12.876	\N	\N
2286	199511212024211006	Marjohn Leasa	Letda	SPKKL Ambon	\N	081247471685	Ambon	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Latuhalat Waemanu II	1845510388	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.88	2026-06-27 12:42:12.88	\N	\N
2287	199212082024211004	Marladi	Serka	Kantor Zona  Maritim Timur	\N	081219924825	Ambon	1992-08-12 00:00:00	Karpan Kota Ambon		Taeno Bawah Desa Rumah Tiga RT 3/10	1845510399	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.884	2026-06-27 12:42:12.884	\N	\N
2288	199200052018021001	Martin Agus Setiyawan	Serka	Biro Umum	\N	085842930390	Magelang	1992-05-08 00:00:00	Karpan Kota Ambon		malangan Magelang	1610212530	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.889	2026-06-27 12:42:12.889	\N	\N
2289	19900402202411009	Maryo Apryanto Risakotta	Serka	Kantor Zona  Maritim Timur	\N	082248824648	Amahusu	1990-02-04 00:00:00	Karpan Kota Ambon		Ambon	1845510402	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.893	2026-06-27 12:42:12.893	\N	\N
2290	199402022024212015	Masriyani	Serka	Kantor Zona  Maritim Timur	\N	081377114727	Bahung Kahean	1994-02-02 00:00:00	Karpan Kota Ambon		Huta IV Bahung Kahean Kec. Duluk Batu Nanggar Simalungun	1845510413	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.895	2026-06-27 12:42:12.895	\N	\N
2291	197012182009121001	Mat Nasir	Pengatur Tk. I/IV.d	Direktorat Hukum / Bakamla	\N	081296347339	Bogor	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		KP. Cimanggus, RT.02 RW.08 Bojonggede, Bogor	1611022865	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.898	2026-06-27 12:42:12.898	\N	\N
2292	199311262024211005	Matheos Lucky Saija	Letda /IX	SPKKL Ambon	\N	082238851112	Makale	\N	Latulahat		l. Dukuh Gg Dos No.21 Uriteru Kec. Sirimau Ambon	1845510424	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.901	2026-06-27 12:42:12.901	\N	\N
2293	199909112024211001	Maulana Arrosyid	Letda /IX	Biro Umum	\N	081779418406	Jakarta	1999-11-09 00:00:00	Latulahat		Komp. TWP TNI AL. Blok CC 10. No. 13 Ciangsana	1845510435	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.904	2026-06-27 12:42:12.904	\N	\N
2294	199403232024211013	Maulana Ruswa Latubonu	Letda	Kantor Zona  Maritim Timur	\N	085380228883	Tulehu	\N	Latulahat		Bedundungan Hilir Jakarta	1845510446	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.907	2026-06-27 12:42:12.907	\N	\N
2295	199509092019022006	Mawaddatus Su'Udah	IIIb	Kantor Zona  Maritim Timur	\N	085717753276	Gresik	1995-09-09 00:00:00	Latulahat		Jl. Anyer No.1 Menteng Jakarta Barat	1610206263	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.91	2026-06-27 12:42:12.91	\N	\N
2296	198003062009012001	Maya Veraningsih	Kolonel Bakamla/II A	Direktorat Kerjasama	\N	08229866656	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Tomang Pulo 05/06 Tahpulo Palmerah Jakarta Barat	1610208090	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.913	2026-06-27 12:42:12.913	\N	\N
2297	198903082019021003	Medi Aditya ST	IIIb	Direktorat Kerjasama	\N	082198984197	Merauke	1989-08-03 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Sultan Syahrir, Kel. Kamundu, Distrik Merauke	1613347871	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.918	2026-06-27 12:42:12.918	\N	\N
2298	198505182024211007	Meinhard Berkin Pieter Paulus S, Amd	Serka Bakamla VII	Direktorat Data Dan Informasi	\N	081372600746	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Perumahan Benih Raya Blok  C2 No. 06 RT 02/20 Marina Batam Kepri	1610189938	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.921	2026-06-27 12:42:12.921	\N	\N
2299	NIP-1782564132924-372	Mia Anggraini Zega			\N			\N				1845510457	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.926	2026-06-27 12:42:12.926	\N	\N
2300	198408302009122001	Mia Mantophani	Mayor Bakamla /IIId	Direktorat Kebijakan	\N	087882233858	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Pengadegan Timur I/30 Jakarta Selatan	1611050268	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.929	2026-06-27 12:42:12.929	\N	\N
2301	199710012018021001	Miftah Ghifari Sakti	Mayor Bakamla /IIId	Biro Umum	\N	081296623820	Bandung	1997-01-10 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Kandaatmaja No.23A Citeureup Cimahi Utara	1610215440	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.932	2026-06-27 12:42:12.932	\N	\N
2302	1991062720201210008	Mikhael Yosua Kamasi	Letda	Biro Umum	\N	081219855119	Cikimi	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Perum Bumi Insani	1612212696	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.935	2026-06-27 12:42:12.935	\N	\N
2303	198806032018021001	Misbahul Munir	II.b	Kantor Zona Maritim Barat	\N	085747076151	CilaCap	1988-03-06 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Karangsalam RT 2/4 Grugu Kawunganten Cilacap	1613347928	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.94	2026-06-27 12:42:12.94	\N	\N
2304	199201182020121006	Moch Rinaldo Krisnanto SH	IIIa	Kantor Zona Maritim Barat	\N	089818823279	Bogor	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Perumahan Kebun Raya Bogor Blok A6/12 Pamoyanan Bogor Selatan	1610993372	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.943	2026-06-27 12:42:12.943	\N	\N
2305	198012132009011003	Moh Nurul Burhan	Mayor	Inspektorat	\N	081514513188	Banyuwangi	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Jambu I No.2L RT 03/01 Tanjung Barat	1610188118	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.946	2026-06-27 12:42:12.946	\N	\N
2306	198909232023211032	Mohamad Ibnusito	Golongan VII	Direktorat Hukum / Bakamla	\N	089530614079	Banyumas	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Lontar, Menteng Atas Setiabudi Jaksel 12960	1792703117	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.949	2026-06-27 12:42:12.949	\N	\N
2307	199701202022021002	Mohamad Yanuarizki Ramadhian	II.a	Kantor Zona Maritim Barat	\N	085797481119	Cirebon	\N	Jl. RE Martadinata Tj. Pinggir Sekupang Batam		Jl. Abdi Negara VII No. 46 RT 6/7 Tukmundal Sumber Cirebon	1610193183	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.952	2026-06-27 12:42:12.952	\N	\N
2308	NIP-1782564132953-381	Mohammad Abyanara Fatah			\N			\N				1845661349	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.956	2026-06-27 12:42:12.956	\N	\N
2309	199706302024211003	Mohammad Aditya Suhud	II.a		\N	089655495156	Bandung	\N	Jl. RE Martadinata Tj. Pinggir Sekupang Batam		Gg. BBK Ciseureuh Timur RT 01/05	1845510468	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.959	2026-06-27 12:42:12.959	\N	\N
2310	199010142023211016	Mohammad Irvan Spriyanto, S.H.	Penata Muda/IX	Direktorat Strategi	\N	08562046944	Bandung	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Bumi Panyileukan F 1 No. 11 Kota Bandung	1792517698	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.961	2026-06-27 12:42:12.961	\N	\N
2311	198705112023211022	Mohammad Syaoqi Sudrahat	Serka Bakamla /Gol. VII	Biro Umum	\N	08111334599	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. H. Naman Raya No. 5a Bekasi Barat	1792736982	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.964	2026-06-27 12:42:12.964	\N	\N
2312	199101112019022003	Monica Novrina	Serma Bakamla/II d	Biro Umum	\N	089693085391	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		The Address Cluster Utama BII4, Depok	1613346639	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.968	2026-06-27 12:42:12.968	\N	\N
2313	NIP-1782564132969-386	Moses Richard Lapa		SPKKL Kupang	\N	085253322740	Jayapura	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Tanjungkarang Osmok RT 20/1	1610205861	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.971	2026-06-27 12:42:12.971	\N	\N
2314	NIP-1782564132973-387	Muh Arfah Mustari			\N			\N				1845510479	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.975	2026-06-27 12:42:12.975	\N	\N
2315	NIP-1782564132977-388	Muh Yasser Huath	Honorer	SPKKL Jayapura	\N	081343374871	Ureng	1992-03-03 00:00:00	Jl. Tanjung Ria III Bas-G Kel. Tanjung Ria RT 5/11 Tanjung Ria Kec. Jayapura Utara Kota Jayapura Papua 99117		Jl. Entrop	1613346662	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.979	2026-06-27 12:42:12.979	\N	\N
2316	12231/P	Muhamad Amin, S.pd.,MA.P.	Kolonel	Direktorat Kebijakan	\N	081231411998	Buatan II	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Flat Perwira 2 KODAMAR Jl. Sentosa Raya Kelapa Gading	1610993178	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.982	2026-06-27 12:42:12.982	\N	\N
2318	199112092023211017	Muhamad Prawira Yudha	IX	KPIML	\N	081517418237	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Lubang Buaya RT06/01 Jakarta	1610189111	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.989	2026-06-27 12:42:12.989	\N	\N
2319	199404142022021003	Muhamad Rizky	Penata Muda /IIIa	KPIML	\N	085319379606	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Amarilis IV No. 28, Bogor	1610213055	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.992	2026-06-27 12:42:12.992	\N	\N
2320	199108032022021001	Muhammad Agus Wahyudi	Penata Muda /IIIa	KPIML	\N	081911932862	Jakarta	1991-03-08 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Swasembada Barat XV No.13 RT 05/14 Kel, Kebon Bawang Kec. Tj. Priok Jakarta Utara	1613348296	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:12.995	2026-06-27 12:42:12.995	\N	\N
2321	199512252024211014	Muhammad Akbar A Md	Serka VII	Biro Umum	\N	085324578860	Garut	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Perum Nyamplang City View Blok 17/11 Desa Kolot Cilawu Garut	1845661702	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13	2026-06-27 12:42:13	\N	\N
2322	198904112010121004	Muhammad Ardiayanto Soleh	2c	Biro Umum	\N	081311407055	Cianjur	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Srama Yon BEKANG 1 Cibinong Kab Bogor	1610195421	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.004	2026-06-27 12:42:13.004	\N	\N
2323	199807152018021001	Muhammad Arief Boedhiantoro	Sertu Bakamla/II.b	Biro Umum	\N	085866543813	Gunung Kidul	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Bulak Jaya RT 04/08 PuloGebang Cawang Jakarta Timur	1610189428	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.008	2026-06-27 12:42:13.008	\N	\N
2324	198305012010121002	Muhammad Azhari, S.H.	Mayor/ III.d	Direktorat Hukum / Bakamla	\N	081371074343	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Kp. Gaga Semanan Kalideres Jakarta Barat	1610189291	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.011	2026-06-27 12:42:13.011	\N	\N
2325	199411302023211012	Muhammad Azis Nurfalah	Serka Bakamla/VII	Biro Umum	\N	089624859414	Bandung	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		KP. Babakan Harja RT 05/01 Rancaekek Wetan Rancaekek Kab Bandung	1792737192	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.014	2026-06-27 12:42:13.014	\N	\N
2326	199309132024211005	Muhammad Bustomi	Serka Bakamla VII	SPKKL Merauke	\N	081234430438	Bantul	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Langung Bradang Lamongan Jatim	1845510491	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.02	2026-06-27 12:42:13.02	\N	\N
2327	NIP-1782564133024-400	Muhammad Caesar Amin			\N			\N				1793724647	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.027	2026-06-27 12:42:13.027	\N	\N
2328	19950808202121014	Muhammad Chaecaarrio Riyatna, A.Md.T	Serka	SPKKL Batam	\N	081268916171	Jakarta	1995-08-08 00:00:00	Teluk Mata Ikan, Sambau, Nongsa Batam		Perum Taman Lestari Blk D13/9, Batu Aji	1613360074	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.031	2026-06-27 12:42:13.031	\N	\N
2329	198911302015011001	Muhammad Edo Novrada, S.H.	Penata/III.c	Biro Sarana dan Prasarana	\N	081297260786	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Praja Dalam F. No.34 RT 011/002 Kebayoran Lama Selatan Jakarta Selatan	1610209887	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.035	2026-06-27 12:42:13.035	\N	\N
2330	199610052022021001	Muhammad Fadzilla Angga Kusuma	Serda bakamla/IIA	Direktorat Operasi Laut / Catamaran 5-05	\N	085335935995	Kudus	1996-05-10 00:00:00	Jl. Penjajab (Samping SMKN 1 perikanan)		Jl. Gurung Lor RT 7/2 Desa Garung Lor Kaliwungu	1613348058	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.041	2026-06-27 12:42:13.041	\N	\N
2331	199701142022021001	Muhammad Fahmi Ramadhan	Letda Bakamla / IIIA	SPKKL Aceh	\N	087809837331	Palembang	\N	Jl. Penjajab (Samping SMKN 1 perikanan)		Jl. Persahabatan Cikumpa 67 02/07 Sukmajaya Depok	1610202292	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.044	2026-06-27 12:42:13.044	\N	\N
2332	199504172019031003	Muhammad Faqih Sulaiman	Penata Muda Tk. I/III.b	KPIML	\N	087783875910	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Lubang Buaya RT06/01 Jakarta	1611717041	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.05	2026-06-27 12:42:13.05	\N	\N
2333	198709192020121004	Muhammad Fathurohman, S.I.P	Penata Muda/III.A	KPIML	\N	081311614000	MAgelang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		White House Premier 3 Blok F-48, Jl. Kapitan Raya Sukatani Tapos Depok	1610191890	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.053	2026-06-27 12:42:13.053	\N	\N
2334	197505292024211002	Muhammad Fauzy	Serka	Inspektorat	\N	08111632899	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		KP. Nipan Gg. Kapua RT 6/2 Papanggo Jakut 14340	1845510504	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.057	2026-06-27 12:42:13.057	\N	\N
2335	199611222022021002	Muhammad Haidar Halim, S.AP	Serka	Inspektorat	\N	081319390611	Sukabumi	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Perum Babakan Damai Blok A5 No11 Sukabumi	1610194472	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.06	2026-06-27 12:42:13.06	\N	\N
2336	NIP-1782564133064-409	Muhammad Harun Arrasyid		Biro Sarana Dan Prasarana	\N	081231262599	Bekasi	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Jl. Banteng Gg. Nayar 1 RT 02/012 Kranji Bekasi Barat	1610205601	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.066	2026-06-27 12:42:13.066	\N	\N
2337	19958102024211008	Muhammad Husni	Letda	Bakamla	\N	085387330702	Barong Tongkok	1995-10-08 00:00:00	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Jl. Melawai RT 4 Barong Tongkok	1845510515	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.072	2026-06-27 12:42:13.072	\N	\N
2338	199807172024211006	Muhammad Julian	Letda	KPIML	\N	08994111211	Bandar LAmpung	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Ciapus Mountain View Pasir Eurih Tamansari	1845510526	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.076	2026-06-27 12:42:13.076	\N	\N
2339	199403022019021004	Muhammad Kurnianto Kuntjoro	Penata Muda Tk.I/III.b	Direktorat Hukum / Bakamla	\N	081273477493	Palembang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Lontar, Menteng Atas Setiabudi Jaksel 12960	1610190444	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.08	2026-06-27 12:42:13.08	\N	\N
2340	199301192018021002	Muhammad Lutfi Hakim	Sertu Bakamla	Biro Sarana Dan Prasarana	\N	082111428987	Temanggung	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Gang Lontar V No. 8 RT 011/005 Duri Utara Tambora	1610202984	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.084	2026-06-27 12:42:13.084	\N	\N
2341	199303012023211018	Muhammad Luthfi Naufal	Serka Bakamla/Golongan VII	Direktorat Operasi Laut	\N	082175961390	Bandar LAmpung	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Griya Gedung Meneng Indah, Blok B4 No.11 Rajabasa Bandar Lampung	1792487447	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.088	2026-06-27 12:42:13.088	\N	\N
2342	197103072009121001	Muhammad Nasrun , S.A.P	IIIA	Biro Umum	\N	085695523631	Klaten	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		JL. KH Muh. Musa RT 01/025	1610204051	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.092	2026-06-27 12:42:13.092	\N	\N
2343	199703212022021002	Muhammad Nurhidayat	Serda /II.a	RHIB 87-04 Bali	\N	081515162672	Malang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Plaosan RT 03/01 Wonosari malang Jawa Timur	1610203998	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.095	2026-06-27 12:42:13.095	\N	\N
2344	199808132023211004	Muhammad Rakha Harisma	Letda	RHIB 87-04 Bali	\N	082186077227	Tangerang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		PSP Jl. Salak I NO.II RT 05/14 Sukatani Tapos Depok Jawa Barat 16454	1792487378	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.1	2026-06-27 12:42:13.1	\N	\N
2345	NIP-1782564133101-418	Muhammad Raufu			\N			\N				1845510537	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.103	2026-06-27 12:42:13.103	\N	\N
2346	199412312023211022	Muhammad Rizal F	Serka /IIC	Biro Sarana Dan Prasarana	\N	089675287944	Sukabumi	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Kp. Kalapa Condong 026/009 SundaJaya Girang Sukabumi	1792737012	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.107	2026-06-27 12:42:13.107	\N	\N
2347	199106132023211028	Muhammad Rizky	Pengatur /VII	Biro Sarana Dan Prasarana	\N	082123889595	Jakarta	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Arinda Permai 2 NO 14A Pondok Aren Tangsel	1792737283	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.111	2026-06-27 12:42:13.111	\N	\N
2348	199709072022021002	Mujiburrahman			\N	081234880275	Bireuen	1997-07-09 00:00:00			Aceh	1610202962	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.115	2026-06-27 12:42:13.115	\N	\N
2349	199701142022021001-DUP-422	Mukhlis	Serka Bakamla/IIC	SPKKL Aceh	\N	087809837331	Aceh Besar	1982-06-06 00:00:00			Desa Cucum Kec. Kuto Baru Kab. Aceh Besar	1610208158	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.119	2026-06-27 12:42:13.119	\N	\N
2350	198001152009011002	Mukhlis, S.St.Pi	Letkol Bakamla/Iva	Direktorat Operasi Laut	\N	081218812341	Banda Aceh	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Komp. Mina Bakti No. 6A RT 04/03 Kel. Cikaret Kec. Bogor Selatan Bogor	1610208997	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.123	2026-06-27 12:42:13.123	\N	\N
2351	199005222014022001	Murniyati Ningsih	Penata Tk.I/II.d	Biro Perencanaan dan Organisasi	\N	085780477047	Brebes	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Gang Ustad Sidon No. 7 RT 03/01 Jelupang Serpong Utara Tangerang Selatan Banten 15323	1610198670	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.128	2026-06-27 12:42:13.128	\N	\N
2352	199408132018021001	Muslikin	II.b/Sertu Bakamla	Sub. Protokol	\N	082258733826	Demak	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Kumetul 12/03 Susukan Kab. Semarang	1610217639	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.132	2026-06-27 12:42:13.132	\N	\N
2353	199503212018021001	Mustahit salman Farisi	Sertu Bakamla	Biro Umum	\N	085363408141	Tegal	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Talok RT 03/01 Pangkah Tegal	1611720745	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.137	2026-06-27 12:42:13.137	\N	\N
2354	17786/P	Mustaqim	Letkol Bakamla	Biro Umum	\N	081329078670	Boyolali	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Perintis Kemerdekaan NO. 56 Menteng Jakarta Pusat	1611050213	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.141	2026-06-27 12:42:13.141	\N	\N
2355	198905242023211020	Muthohhar Mahdi	Serka/7	KPIML	\N	081285344994	Tegal	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Nasir NO. 17 RT 05/06 Kel. Grogol Utara Kec. Kebayoran Lama Jaksel	1792517701	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.145	2026-06-27 12:42:13.145	\N	\N
2356	199703302022022001	Nabilla Umari	Penata Muda //III.A	Biro Sarana Dan Prasarana	\N	081290871005	Jakarta	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Komp. HBTB Blok Z No.12 RT 05/11 Cimanggis Depok	1610208216	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.15	2026-06-27 12:42:13.15	\N	\N
2357	199304302022022001	Nada Fitriah	Letda /IIIA	Biro Sarana Dan Prasarana	\N	089528665637	Jakarta	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Jl. Rawa Simprug  V RT 08/09 No.50 Kebayoran Lama	1611050575	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.154	2026-06-27 12:42:13.154	\N	\N
2358	19790814201421001	Nadil Bethel Riko L. Tobing	Penata Muda /III a	Biro Umum	\N	082114704077	Sitarealaman	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Kakap 8 No.97 RT 04/03 Karawaci Tangerang	1610946843	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.158	2026-06-27 12:42:13.158	\N	\N
2359	198210142010121001	Nanang Saehu, S.A.P	Penata Muda Tk.I/III.b	Biro Umum	\N	083823199309	Majalengka	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Sukahaji Majalengka	1610208624	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.163	2026-06-27 12:42:13.163	\N	\N
2360	19752162009121001	Nara Nazimuddin, S.Kom.,M.T	Penata Tk I/IIId	Direktorat Strategi	\N	082231020399	Oku	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Alam Cilebut Permai A2 No.4 Kab Bogor	1611023154	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.167	2026-06-27 12:42:13.167	\N	\N
2361	199908202021012001	Naura Dwiputi Cahyaningrum	Pengatur/II.c	Inspektorat	\N	087884888760	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Cilungkup Indah No.40 Duren Sawit Jakarta Timur	1610188979	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.171	2026-06-27 12:42:13.171	\N	\N
2362	1993032803930001	Nicodemus Wisnu Pratama	Letnan II Bakamla	Direktorat Strategi	\N	089681661661	Klaten	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Perum Korpri No. 145 RT 02/06 Kebumen Jawa Tengah	1792525202	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.176	2026-06-27 12:42:13.176	\N	\N
2363	197807182010121002	Niko Dwi Suryanto	Letnan II Bakamla	Direktorat Strategi	\N	0895426088884	Yogyakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Sidodadi No. 92c DIY	1610193478	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.18	2026-06-27 12:42:13.18	\N	\N
2364	199408292024211006	Niko Panduwinata	Serka/7	Kantor Zona Maritim Barat	\N	081216476189	Tanjung Batu	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. H.M. Nawawie RT 2/7 Tanjung Batu Kepri	1845510559	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.184	2026-06-27 12:42:13.184	\N	\N
2365	199902142022012002	Nila Febrina	Pengatur II/C	Biro Sarana Dan Prasarana	\N	081261517656	Padang	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Rimbo Tarok RT 01/11 Gunung Sarik Kuranji Kota Padang 25158	1610205725	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.189	2026-06-27 12:42:13.189	\N	\N
2366	199701292023212018	Nina Puji Lestari	Penata Muda/III/a	Biro Perencanaan dan Organisasi	\N	085204819408	Banyuwangi	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Tambak II Blok C-33, Pegangsaan Menteng Jakpus	1792517723	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.193	2026-06-27 12:42:13.193	\N	\N
2367	198301242023212033	Nira Susanti	Serka /IIC	Biro Sarana Dan Prasarana	\N	082133385687	Lampung	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Jl. Raya Hankam GG Melati II Kota Bekasi	1792487390	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.198	2026-06-27 12:42:13.198	\N	\N
2368	199609212024212009	Nori Malini	Letda	Direktorat Kerjasama	\N	081290681873	Padang	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Jl. Durian Tarung RT 4/7 Padang	1613346742	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.202	2026-06-27 12:42:13.202	\N	\N
2369	198411232009012003	Novi Sandra Mayangsari	Mayor Bakamla/III.d	Direktorat Hukum / Bakamla	\N	081585823823	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Perumahan Jatinegara Indah Jl. Gn Bromo, Blok AG2, No. 1 Jakarta Timur 13910	1610194879	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.205	2026-06-27 12:42:13.205	\N	\N
2370	198911252015011001	Novian Setyo Wicaksono	Pengatur IIC	Direktorat Hukum / Bakamla	\N	08125054123	Tegal	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Kramat Kab Tegal	1610211332	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.21	2026-06-27 12:42:13.21	\N	\N
2371	198911102015011001	Novianto Hary Adiatmaja	Letda/III.a	Direktorat Hukum / Bakamla	\N	081297775455	Wonogiri	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Lipi 1 Blok C14/14 Rawa Panjang Bojong Gede	1613348671	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.214	2026-06-27 12:42:13.214	\N	\N
2372	198811272010122002	Novita Sari Dewi, S.E.	Lettu Bakamla / Penata Muda Tk.I/III.b.	Biro Umum	\N	085691919676	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Komp. Cipinang Indah I, Jl. Pinang Merah Blok L-3, Kel. Cipinang Muara Kec. Jatinegara Jaktim 13420	1610187090	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.219	2026-06-27 12:42:13.219	\N	\N
2373	NIP-1782564133222-446	Novy Jemmy Tapilatu			\N			\N				1610211069	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.224	2026-06-27 12:42:13.224	\N	\N
2374	199311252024211008	Novy Lerry Lumimbe	Serka Bakamla/7	Pangkalan Armada Kamla Serei/ Zona Timur	\N	081315267883	Akas	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Serei jaga 3 Likupang Barat Minahasa Utara Sulawesi Utara	1610214718	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.228	2026-06-27 12:42:13.228	\N	\N
2375	197411302010122001	Novy Poedjawati	Penata Tk. I/III-d	Biro Umum	\N	08568563452	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Cempaka Baru Timur DKI Jakarta	1611718181	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.232	2026-06-27 12:42:13.232	\N	\N
2376	200003072022012001	Nufus	Pengatur II/C	Biro Sarana Dan Prasarana	\N	085960105059	Tangerang	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		JL. Teluk Rantai No.47 Kelapa Gading	1613346447	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.236	2026-06-27 12:42:13.236	\N	\N
2377	199411222024212014	Nugrah Novianti	Lettu Bakamla/Gol X	Biro Umum	\N	082290373427	Konawe Selatan	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Ling UI RT 2/3 Kec. Lalowaru Konawe Selatan	1845510560	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.241	2026-06-27 12:42:13.241	\N	\N
2378	198101242010122001	Nunuk Tri Muranjari	Penata Tingkat I/III.d	Biro Umum	\N	081318633412	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Kakop 8 No. 97 Perumnas I Tangerang, Banten 15116	1610188221	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.244	2026-06-27 12:42:13.244	\N	\N
2379	198807122019022004	Nur Fanny Iraini	Lettu Bakamla / Penata Muda Tk.I/III.b.	Direktorat Kebijakan	\N	087782513972	Ambon	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Citra Grand Cluster West Point T5 No.10	1613347112	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.248	2026-06-27 12:42:13.248	\N	\N
2380	19991026202421005	Nur Fiqih Annisa	Serka VII	Direktorat Penelitian dan Pengembangan	\N	081366767214	Medan	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Dusun IV Patumbak II Deli Serdang Sumatera Utara	1845510571	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.253	2026-06-27 12:42:13.253	\N	\N
2381	198709252015011001	Nur Rachman	Kapten	SPKKL Sambas	\N	082150204807	Pemangkat	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Abdul Kadir Kasim RT 2/3 Ds. Gugah Sejahtera Ec. Pemangkat Kab Sambas	1610187147	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.258	2026-06-27 12:42:13.258	\N	\N
2382	NIP-1782564133259-455	Nurdin Zaelani	Kapten Bakamla/III.C	Biro Sarana Dan Prasarana	\N	082112648737	Jakarta	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		JL. Asri Kec. Makasar Kel. Halim PK Jaktim	1610203794	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.261	2026-06-27 12:42:13.261	\N	\N
2383	199503232020121009	Nurhadi Indra	Serka Bakamla Gol.II.c	Kantor Zona Maritim Barat	\N	082173135306	Batam	\N	Jl. Trans Barelang Jembatan II, Setokok Batam		Kampung Melayu SEI Panas Blok IV No. 47	1610993076	Sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.264	2026-06-27 12:42:13.264	\N	\N
2384	199306032018022001	Nurindah Jained Marasing	Sertu Bakamla	Direktorat Latihan	\N	0895701170306	Kema II	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Kema 1 Jaga 4	1613348682	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.268	2026-06-27 12:42:13.268	\N	\N
2385	198811292015012001	Nurmala Imaniyah	Penata/III.c	Direktorat Hukum / Bakamla	\N	081212658191	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Perumahan Bumi Cimanggis Indah 2 Kav. 8C Tapos Depok	1625133886	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.272	2026-06-27 12:42:13.272	\N	\N
2386	198601042015011001	Nurman Arifin	Kapten Bakamla/III.c	Direktorat Kebijakan	\N	08990050016	Semarang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Gurame I. Kota Bekasi	1610196650	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.276	2026-06-27 12:42:13.276	\N	\N
2387	198010012009012002	Nursakti Asia	Mayor Bakamla /III D	Biro Perencanaan dan Organisasi	\N	081318468141	Kulon Progo	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Cluster Pakujaya Indah No. 25 Pakujaya Serpong Utara	1644901813	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.282	2026-06-27 12:42:13.282	\N	\N
2388	0-DUP-461	Nursalim	0	Biro Sarana Dan Prasarana	\N	085894511653	BOgor	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Ciherang Bong RT 02/07 Ciherang Dramaga	1610207766	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.285	2026-06-27 12:42:13.285	\N	\N
2389	199805082024212013	Nurul Hidayah	Serka	Biro Umum	\N	085364631707	Perawang	1998-08-05 00:00:00	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Jl. Bonang	1845510582	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.289	2026-06-27 12:42:13.289	\N	\N
2390	199211032024211009	Nurul Ikhsan Filemon	Letda Bakamla		\N	082330930630	Macege	1992-03-11 00:00:00	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		BTN Mustika B4 No.15 Tanete Riattang Bone	1845510593	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.292	2026-06-27 12:42:13.292	\N	\N
2391	199206042024211005	Nurul Mukmin	Letda	SPkKL Tarakan	\N	082251474131	Tarakan	1992-04-06 00:00:00	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Jl. Belimbing RT 13/ Tarakan Timur	1845510605	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.294	2026-06-27 12:42:13.294	\N	\N
2392	199506252023212039	Nurul Nurjanah, A.M.d.M	Serka Bakamla/II.c	Direktorat Kerjasama	\N	081223962846	Bogor	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Ciburial RT 01/04 Ciparigi Bogor Utara Kota Bogor	1792737136	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.3	2026-06-27 12:42:13.3	\N	\N
2393	198111182009121001	Nurul Yudo Suparman	Penata Tk.I/III.d	Biro Umum	\N	082125943030	Tangerang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Bintara VI No.134 RT 01/06 Bekasi 17134	1610209515	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.304	2026-06-27 12:42:13.304	\N	\N
2394	198910182014022002	Octa Musfawanty	Letda	SPKKL Sambas	\N	085245672949	Sambas	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Merdeka RT 10/10 Desa Lorong Sambas	1610190568	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.308	2026-06-27 12:42:13.308	\N	\N
2395	9797/P	Octavianus Budi Susanto	Laksamana Pertama	Kantor Zona Maritim Tengah	\N	081252918988	Surabaya	\N	JL. Diponegoro No.126 Ngakeret Timur manado		Gembili 3/1 RT 3/7 Jogir Wonokromo Suranaya Jatim	1737072834	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.312	2026-06-27 12:42:13.312	\N	\N
2396	198310312009121001	Octavianus Yuda Satyanegara	Penata Tingkat I	Direktorat Operasi Udara Maritim	\N	08118778908	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Serpong Jaya The View Blok IX VH 10 Tangsel	1612212674	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.318	2026-06-27 12:42:13.318	\N	\N
2397	199009052020121011	Oksianes Rein Hard Bawmbang	III.a	Direktorat Operasi Udara Maritim	\N	085365079225	Makassar	1990-05-09 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Perum GPI Jl. Ceri E No.23 Manado	1610209366	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.321	2026-06-27 12:42:13.321	\N	\N
2398	199807192021012001	Olivia Rizky Dwi Putri	Serka Bakamla/II.c	Biro Umum	\N	087882565797	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Harapan Jaya I NO.16 Makasar Jakarta	1611717824	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.325	2026-06-27 12:42:13.325	\N	\N
2399	NIP-1782564133328-472	Ora Cynthia Wati			\N			\N				1612212595	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.33	2026-06-27 12:42:13.33	\N	\N
2400	198809102015011001	Ordan Radiori	Kapten Bakamla/IIIc	KPIML	\N	082245023168	Magetan	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Proklamasi No. 56 Jakarta Pusat	1610212915	Sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.335	2026-06-27 12:42:13.335	\N	\N
2401	198611192024211005	Orion Manalu	Serka	Direktorat Kebijakan	\N	081314401163	Sibanbanon	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat			1845510627	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.339	2026-06-27 12:42:13.339	\N	\N
2402	199005162015011001	Peik Sugiarto	Penata/III.C	Direktorat Kebijakan	\N	085726236464	Brebes	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat			1610189495	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.342	2026-06-27 12:42:13.342	\N	\N
2403	199411092022022001	Poppy Novita Sari	Letda Bakamla/III.A	KPIML	\N	08117300911	Bengkulu	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Anyelir Blok P.10 Pasir Jaya Bogor Barat Kta Bogor	1613347134	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.347	2026-06-27 12:42:13.347	\N	\N
2404	198609192024211005	Prabowo	Letda IX	Direktorat Data Dan Informasi	\N	085772147517	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Kp. Tipar Tengah No. 03/01/10 Depok	1845661951	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.352	2026-06-27 12:42:13.352	\N	\N
2405	198208022009011001	Prabu Airlangga	Mayor Bakamla	Direktorat Operasi Laut / Catamaran 5-04	\N	08129596082	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Komp. DPA RI No. 2A Srengseng Kembangan	1610210509	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.355	2026-06-27 12:42:13.355	\N	\N
2406	199108092018021003	Pradhiptya Khrisna, S.H.	Lettu Bakamla / Penata Muda Tk.I/III.b.	Direktorat Hukum / Bakamla	\N	081327903861	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Lengkuas III A. VII/11	1612212618	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.359	2026-06-27 12:42:13.359	\N	\N
2407	198412012023211012	Pradita Jayagiri	Pengatur/VII	Direktorat Hukum / Bakamla	\N	087872010914	Jakarta	1984-01-12 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		JL. Cikole Dalam II No,10 Kota Sukabumi	1792536519	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.364	2026-06-27 12:42:13.364	\N	\N
2408	199108172024211010	Pratondo Ario Seno Sudiro	Letda/IX	Direktorat Penelitian dan Pengembangan	\N	081293384309	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Angsana Np. 6 RT 2/6 Komp. AL Pondok Labu Jaksel	1845510649	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.368	2026-06-27 12:42:13.368	\N	\N
2409	199901172021011002	Prayoga Kukuh Baktiar	Serka /II.C	Biro Sarana Dan Prasarana	\N	081288307042	Bogor	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Dsn. Pakis RT 02/01 Songgon Banyuwangi	1610203727	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.372	2026-06-27 12:42:13.372	\N	\N
2410	11812/P	Priyambodo, S.H.	Laksamana Pertama Bakamla	Direktorat Hukum / Bakamla	\N	081372570369	Slawi	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Mes TNI AL Lantamal III Jati Negara, Jakarta Timur.	1787981079	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.376	2026-06-27 12:42:13.376	\N	\N
2411	198706272009121001	Puguh Hariyadi	Penata Muda TK. I/IIIa	Biro Umum	\N	085694250773	Surabaya	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Komp. TNI AL Blok D22/20 Ciangsana Gn Putri Bogor	1611716988	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.38	2026-06-27 12:42:13.38	\N	\N
2412	199008272024212015	Puji Astuti Ningrum	Serka		\N	085648522401	Lamongan	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Sunan Giri Gg. Beringin Indah No.22 Lamongan	1611050280	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.382	2026-06-27 12:42:13.382	\N	\N
2413	198508312018021001	Purmomo Adi Yuwono	Sertu Bakamla/II.b	0	\N	082123357655	Demak	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		ds. Pilangrejo RT 02/02 Kec.Wono Salam Kab. Demak	1611717880	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.385	2026-06-27 12:42:13.385	\N	\N
2414	79610	Purnomo	Letda	0	\N	081291011473	Jakarta	1973-08-03 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jalan Kapling Pertambangan Tanjung Balai Karimun	1610187501	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.389	2026-06-27 12:42:13.389	\N	\N
2415	199201292022021001	Purnomo	Letda	0	\N	085207668109	Bukit Lalang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Tiban Lama Sekupang Batam	1611022945	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.392	2026-06-27 12:42:13.392	\N	\N
2416	NIP-1782564133393-489	Puspa Pratama Purbasari			\N			\N				1845510650	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.395	2026-06-27 12:42:13.395	\N	\N
2417	199504142024211219	Putri Sara Bella Citra Pranandari	Letda	SPKKL Merauke	\N	085254241834	Merauke	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Martadinata Komplex Angkasa Merauke	1845510661	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.398	2026-06-27 12:42:13.398	\N	\N
2418	199810192018022001	Putri Syahdila Eksa Wijati	Sertu Bakamla/II.b	Biro Umum	\N	087820672429	Serang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Taman Banten Lestari Blok C 16A Serang Banten	1610206525	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.401	2026-06-27 12:42:13.401	\N	\N
2419	199101122019021003	Putu Gede Hermawan Surapradnya	Lettu /IIIB	Biro Umum	\N	087860984282	Denpasar	1991-12-01 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Arjuna Gg II No.1a Denpasar Bali	1613348194	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.403	2026-06-27 12:42:13.403	\N	\N
2420	198912052024211006	R. Dhilan Dwisatya	Serka/VII	Direktorat Hukum / Bakamla	\N	081284276611	Kulon Progo	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Ngoto RT 6/ Bangunharjo Sewon Bantul	1845510672	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.406	2026-06-27 12:42:13.406	\N	\N
2421	198705152020121011	R. Nuzulul Ary Setiawan	Penata Muda Tk. I /IIIb	Biro Umum	\N	082257469668	Sidoarjo	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Karangan Mulya 5 No. 17 Surabaya	1611716897	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.409	2026-06-27 12:42:13.409	\N	\N
2422	200001052022012005	Rachel Indah	Pengatur II/C	Biro Sarana Dan Prasarana	\N	088271865128	Jakarta	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur			1613346753	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.412	2026-06-27 12:42:13.412	\N	\N
2423	NIP-1782564133413-496	Rachmad Setiadi Raja			\N			\N				1792737216	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.414	2026-06-27 12:42:13.414	\N	\N
2424	199202042018022001	Raini Alfarida	II.B	Biro Sarana Dan Prasarana	\N	085364882552	Bukit Senang	1992-04-02 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Sidorejo Indah 2 Blok I No.2 Tanjung Balai Karimun	1610211570	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.418	2026-06-27 12:42:13.418	\N	\N
2425	199701232018021001	Raka Januar Putra	Sertu Bakamla/II.b	Direktorat Latihan	\N	083148445495	Cirebon	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Dusun 01, RT 02/03 Desa Karangwangi, Kec. Karangwareng, Kab. Cirebon 45186	1611717697	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.421	2026-06-27 12:42:13.421	\N	\N
2426	1998122220182001	Ramadhiantie Karnain	Sertu Bakamla/II.b	Direktorat Operasi Laut	\N	082213855279	Medan	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. PLN No. 35 Depok Jawa Barat	1610190692	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.424	2026-06-27 12:42:13.424	\N	\N
2427	199611052024211006	Raymon Nurcahya	Letda	Biro Perencanaan dan Organisasi	\N	087742229073	Letda	1996-05-11 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Komp. Griya Winaya Blok B8 No.36	1845510694	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.428	2026-06-27 12:42:13.428	\N	\N
2428	198910082018021001	Razi Abubakar Noorman	III.b	Unit Penindakan Hukum	\N	085659621324	Bandung	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		JL. Triwulan III No.29 Cimahi	1613347156	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.431	2026-06-27 12:42:13.431	\N	\N
2429	199505022022021002	Religious Girsang	III.b	Unit Penindakan Hukum	\N	085591147332	Pangembatan	1995-02-05 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Aren jaya Bekasi Timur	1610192317	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.433	2026-06-27 12:42:13.433	\N	\N
2430	NIP-1782564133434-503	Rengga Wicaksono			\N			\N				1845510707	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.436	2026-06-27 12:42:13.436	\N	\N
2431	199706022024211006	Restu Tea Dinata	Letda		\N	082286894042	Tembilahan	1997-02-06 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. N No.13 RS Tubun 3 Jakarta Barat	1613348570	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.439	2026-06-27 12:42:13.439	\N	\N
2432	199503192023211016	Reza Zulfahmi	VII	KPIML	\N	085218817494	Banda Aceh	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Anyer 2 Menteng Jakarta Pusat	1792536508	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.442	2026-06-27 12:42:13.442	\N	\N
2433	200001032022021002	Rezki Misbah Ramadan	VII	KPIML	\N	085852709267	Cilacap	2000-03-01 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Dusun Cijeruk RT 4/1Surusunda Ke. Karangpicung Kab. Cilacap jawa Tengah	1610205464	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.445	2026-06-27 12:42:13.445	\N	\N
2434	198609252023211021	Rhino Sabriliyanto	Letda Bakamla/IX	Inspektorat	\N	082188304120	Surabaya	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Angin Pasat No. 30 B, Dewa Ruci, Kel. Seper Barat Cilincing Jakarta Utara	1610189224	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.449	2026-06-27 12:42:13.449	\N	\N
2435	199301012023211037	Ria Ependi	penata muda/IX	KPIML	\N	082298522776	Umbul Sari	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Kemang Bogor Regency Blik D2 No. 6 Hambulu Desa Tegal, Kemang Kab. Kab Bogor Jawa Barat	1792737307	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.451	2026-06-27 12:42:13.451	\N	\N
2436	NIP-1782564133452-509	Rian			\N			\N				1845510718	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.454	2026-06-27 12:42:13.454	\N	\N
2437	200103262024211001	Rian Putra Mayer Masihor	penata muda/IX	Kantor Zona Maritim Tengah	\N	082253270198	Kalekube	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Kamp. Kalekube Kec. Tabukan Utara Kab. Sangihe Prov. Sulut	1845510729	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.456	2026-06-27 12:42:13.456	\N	\N
2438	198112222009121001	Riandi Yudha Gunawan, S.IP.,M.Han.	Penata Tk.1 /III.d	Direktorat Kerjasama	\N	081291872028	Bandung	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl Puri 3 Blok C1/18 Jakasampurna, Bekasi Barat Kota Bekasi	1610205340	Sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.459	2026-06-27 12:42:13.459	\N	\N
2439	199504052023211004	Ricky Abdillah	Serka Bakamla/II.c	Biro Umum	\N	082306141498	Gelumbang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Cenek I RT 05/03 Kel pEsanggerahan Kec. Pesanggerahan	1727456198	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.461	2026-06-27 12:42:13.461	\N	\N
2440	197807202010121001	Ridwan Basuki	Mayor Bakamla	Direktorat Operasi Laut	\N	081553255988	Sidoarjo	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Proklamasi No. 56 Jakarta Pusat	1610210779	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.464	2026-06-27 12:42:13.464	\N	\N
2441	199406012023211014	Ridwan Hadi Pranoto	Letda Bakamla/IX	Biro Umum	\N	08133331390	Tangerang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Sukamulya II RT 03/08 Kel. Serua Indah, Kec. Ciputat Kota Tangerang Selatan 1541	1792737056	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.468	2026-06-27 12:42:13.468	\N	\N
2442	199407292024211008	Ridwanto	Serka Bakamla	SPKKL Tarakan	\N	085787602979	Merubung	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Sambas kalbar	1845510730	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.472	2026-06-27 12:42:13.472	\N	\N
2443	198404052010121001	Rifan Aprianta	Mayor Bakamla	Biro Umum	\N	085695641630	BOgor	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Cibinong - Bogor	1644907043	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.475	2026-06-27 12:42:13.475	\N	\N
2444	199609142023211010	Riki Krisdianto, S. Kom.	Golngan IX	Direktorat Hukum / Bakamla	\N	085383035371	Tekad	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Air Naningan Dusun Talang Tebta, Desa Tekad	1792525133	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.48	2026-06-27 12:42:13.48	\N	\N
2445	199406062022022002	Rima Rehulina Br. Tarigan A.Md	Golngan IX	SPKKL Aceh	\N	085360460106	Blangkejeren	1994-06-06 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Kebun raja No.7 Lemasen Ulee Kareng Kota Banda Aceh Aceh	1610206230	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.484	2026-06-27 12:42:13.484	\N	\N
2446	199310212023212032	Rina Setiawati	Letda Bakamla/IX	Biro Umum	\N	082138214556	Magelang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Ahmad Yani 75 Magelang	1792517734	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.488	2026-06-27 12:42:13.488	\N	\N
2447	199012062020122010	Rindi Nurlaila Sari	Letda Bakamla/III.a	Direktorat Latihan	\N	081223344820	Surakarta	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Jl. Jayawijaya 6-14 B Mojosongo Surakarta 57127	1613348456	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.492	2026-06-27 12:42:13.492	\N	\N
2448	199407122022021002	Rio Pranata	Letda Bakamla/III.a	Direktorat Latihan	\N	089609848944	Way Petai	1994-12-07 00:00:00	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Perum Panindo Blok F No.1 Batam	1610194336	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.496	2026-06-27 12:42:13.496	\N	\N
2449	198905152024212014	Ririn Astria ,Spd	Letda	Biro Umum	\N	082281374518	Ps. Ujung Kepahiang	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Jl. Garuda No. 53 kel Bandung Kanan Kota Lubuk Linggau	1845510741	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.5	2026-06-27 12:42:13.5	\N	\N
2450	199111122023212037	Rita Mulliyana	Letda Bakamla/IX	Biro Umum	\N	081212504108	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Perum Bekasi Regensi Cibitung Kab. Bekasi Jawa Barat	1792472009	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.504	2026-06-27 12:42:13.504	\N	\N
2451	199709112024211005	Rivaldo Kondoj	Serka	Kantor Zona Maritim Tengah	\N	0895804846785	Lansot	1997-11-09 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jaga I Desa Lamset Kec. Tareran	1845510763	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.508	2026-06-27 12:42:13.508	\N	\N
2452	199810242022011002	Rizky Adiyanto	Serka/II,c	Biro Sarana Dan Prasarana	\N	085893270905	Wonogiri	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Jl. Ahmad Yani RT 30/03 Desa Pagelaran Kab. Malang	1615081022	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.511	2026-06-27 12:42:13.511	\N	\N
2453	199407942020121008	Rizky Agil Zulkarnaen	Serda Bakamla/II A	Biro Umum	\N	085697967002	Jakarta	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Gg. Nangka No.3 RT 1/10 Ciputat	1610189609	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.515	2026-06-27 12:42:13.515	\N	\N
2454	199007012010121001	Rizky Setiawan,S.M	III.a	Biro Umum	\N	085642555610	Batang Silasih	1990-01-07 00:00:00	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Taman Cikunir Blok C4/RT 01/01 Jakamulya Bekasi Selatan	1613346866	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.52	2026-06-27 12:42:13.52	\N	\N
2455	199612202024211002	Rizxy Insanh Timur	Letda Bakamla/IX	Direktorat Penelitian dan Pengembangan	\N	085294350145	Subang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Komp. Bumiwangi RT 20/05 Ds. Bumiwangi Kab. Bandung	1845510774	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.524	2026-06-27 12:42:13.524	\N	\N
2456	198304022010121001	Rohman	Serka Bakamla /II.d	Biro Umum	\N	08568068146	Tangerang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Priyang Kel. Pondik Jagung Kec. Serpong Utara Banten	1613347917	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.529	2026-06-27 12:42:13.529	\N	\N
2457	199310152022021001	Rois, S.Kom	Letda	Biro Umum	\N	08985724802	Blora	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Teluk Mata Ikan, Sambau, Nongsa Batam	1613347510	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.533	2026-06-27 12:42:13.533	\N	\N
2458	197111182009121001	Romadhon Ponco Seno	II.D	Biro Umum	\N	081381345142	Surabaya	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Rambutan Raya Blok E-3, Kompl Angkasa Puri Jatimekar	1610213500	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.538	2026-06-27 12:42:13.538	\N	\N
2459	200002242022021001	Romina Setya Panca Husodo	II.D	Biro Umum	\N	081575853504/082155662137	Kebumen	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Dk. Pejarakan RT 01/01 Adiwarno Buayan Kebumen Jateng	1613347837	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.541	2026-06-27 12:42:13.541	\N	\N
2460	199410082024212014	Rosa Ocyavia Damayanti	Letda IX		\N	081917241459	Jakarta	1994-08-10 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl.Menteng Atas Selatan III RT 04/05 No.17	1610204288	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.546	2026-06-27 12:42:13.546	\N	\N
2461	198609122010121001	Royadi	Lettu Bakamla / III B	Biro Umum	\N	081806990722	Tangerang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Kebon Nanas RT 03/02 Tangerang	1610197586	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.549	2026-06-27 12:42:13.549	\N	\N
2462	9835/P	Rudi Parulian Simorangkir , S.E.	Laksamana Pertama Bakamla	Biro Sarana Dan Prasarana	\N	08111519907	Jakarta	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Jl. P. Temiang V No.12 015/03 Kelapa Gading Barat Kelapa gading Jakarta Utara	1659321610	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.554	2026-06-27 12:42:13.554	\N	\N
2463	199903022024211005	Rudianto Ari Nugroho	Serka VII	KPIML	\N	085693302572	Sragen	1999-02-03 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Perum Bukit Tiara Blok A1/4 RT 25/05 Cikupa Tangerang	1845510785	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.558	2026-06-27 12:42:13.558	\N	\N
2464	NIP-1782564133560-537	Ruhmadi Tolib			\N			\N				1792737272	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.563	2026-06-27 12:42:13.563	\N	\N
2465	197712052099121001	Rusdi	II.d	Biro Umum	\N	081270520969	Tangerang	1905-05-30 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Kampung Sawah Dalam 05/04	1610208272	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.566	2026-06-27 12:42:13.566	\N	\N
2466	199104132018022001	Safitri Aprilia Ramadhani	Sertu Bakamla/II.b	Biro Umum	\N	0818888213	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Pancawarga 6 No. 16 RT 10/01 Cipinang Besar Selatan Jatinegara Jakarta Timur	1611050246	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.571	2026-06-27 12:42:13.571	\N	\N
2467	197510302009011002	Sahlani	Penata Tk.I/III.d	Direktorat Latihan	\N	08158136970	Tangerang	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		JL. H. Yusuf NO.32 RT 03/10 Paninggilan Ciledug	1610204197	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.574	2026-06-27 12:42:13.574	\N	\N
2468	1971041820091121001	Samina	Serma 11/d	Biro Sarana Dan Prasarana	\N	0895322319292	Gunung Kidul	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Kop. Kopassus Kedayutama Jl. Tongkol II	1610210054	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.578	2026-06-27 12:42:13.578	\N	\N
2469	198602232015011001	Santaki, S.Kom	Penata Muda /II.b	KPIML	\N	082122568306	Tangerang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Komplek PU Sapta Taruna IV, Jl. Sumur Batu Kec. Bantar Gebang, Kota Bekasi	1610212879	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.582	2026-06-27 12:42:13.582	\N	\N
2470	199211102024211011	Sapto Rahyono	Letda IX	Direktorat Data Dan Informasi	\N	08127999592	Kurungan Nyawa	1992-10-11 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Persada II LK II Kemiling Raya	1845510796	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.587	2026-06-27 12:42:13.587	\N	\N
2471	199704032024212009	Sarah Ageng Rizkiyah	serka		\N	081386127944	Ciamis	1997-03-04 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Juriman No.39 Ds Battembat Kab. Cirebon	1845510810	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.591	2026-06-27 12:42:13.591	\N	\N
2472	198705032024212008	Sarimah	Serka	Biro Umum	\N	081216838101	Teluk Belitung	1987-03-05 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Perum Green Blok 22 Kota Batam	1610188606	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.595	2026-06-27 12:42:13.595	\N	\N
2473	NIP-1782564133597-546	Sartika			\N			\N				1792702782	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.599	2026-06-27 12:42:13.599	\N	\N
2474	199310072018021002	Satria Ananda Sasmi	Penata Muda III.a	Direktorat OPSLA	\N	081284027246	Medan	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Depok	1613347906	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.603	2026-06-27 12:42:13.603	\N	\N
2475	199210052018021001	Satrio Nurhuda Utomo	Penata Tk. I/III.b	Direktorat Hukum / Bakamla	\N	081255554951	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Petamburan VII, Kec, Tanah Abang Jakarta Barat	1613348036	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.607	2026-06-27 12:42:13.607	\N	\N
2476	198505162024211003	Satriyo Endiutomo	Letda	Direktorat Hukum / Bakamla	\N	081315920500	Surabaya	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Metland Menteng Cluster Victoria Blok II No. 65 Cakung Jaktim	1610188775	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.611	2026-06-27 12:42:13.611	\N	\N
2477	199712102018021001	Satriyo Wibisono	Sertu Bakamla	Direktorat Operasi Laut / Catamaran 5-04	\N	081617030459	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		JL. S Bengawan Solo RT 22/01 No.46	1610189586	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.614	2026-06-27 12:42:13.614	\N	\N
2478	197710122009011003	Sawal Perangin Angin	Penata Tk.3/III.d	Kantor Zona Maritim Barat	\N	082171112013	Medan	\N	Jl. Trans Barelang Jembatan II, Setokok Batam		Perumahan Renggali Residen Blok AC/18	1610188301	Sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.619	2026-06-27 12:42:13.619	\N	\N
2479	198902192020121004	Sayuthi	IIA	SPKKL Aceh	\N	085260179689	Aceh Besar	\N	Jl. Laksamana Malahayati Durung Kec. Mesjid Raya Kab. Aceh Besar Aceh 23373		Desa Cot Suruy Kec. Ingin Jaya Aceh Besar	1610205781	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.623	2026-06-27 12:42:13.623	\N	\N
2480	13575/P	Senly Dj N Manitik, S.Pd.MH	Letkol	SPKKL Aceh	\N	081332187211	Sendangan	\N	Jl. Laksamana Malahayati Durung Kec. Mesjid Raya Kab. Aceh Besar Aceh 23373		Perum Rizky Maumbi Kec. Kalawat	1610211092	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.627	2026-06-27 12:42:13.627	\N	\N
2481	199709052018021001	Septian Bayu Kresna	Seru Bakamla II.b	SPKKL Aceh	\N	081225002884	BOgor	1997-05-09 00:00:00	Jl. Laksamana Malahayati Durung Kec. Mesjid Raya Kab. Aceh Besar Aceh 23373		JL. Gunung Putri Selatan RT 01/06 Kab Bogor	1611717596	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.632	2026-06-27 12:42:13.632	\N	\N
2482	199605242022021001	Shandy Syahputra	Serda Bakamla /II.a	Biro Umum	\N	0895365914900	Bandung	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Kp. Leuwimalng RT 02/10 Desa Cangkuang Wetan Kec. Dyeuh Kolot Kab. Bandung 40238	1611050257	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.634	2026-06-27 12:42:13.634	\N	\N
2483	199608232020122017	Shella Monica Ciptari	Serka Bakamla Gol.II.c	Kantor Zona Maritim Barat	\N	087771228840	Abepura	\N	Jl. Trans Barelang Jembatan II, Setokok Batam		Perum. Dreamland 1 Blok D1 No. 1A	1610188470	Sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.64	2026-06-27 12:42:13.64	\N	\N
2484	198506012015012001	Siti Badiah	III C	Direktorat Strategi	\N	081281919178	Tangerang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Tangerang	1610187657	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.645	2026-06-27 12:42:13.645	\N	\N
2485	199707252024212020	Siti Himdatul Akmal	Letda IX		\N	0895393854347	Tangerang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Trikora Perum Liang Anggang Indah Permai Kalsel	1845510821	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.649	2026-06-27 12:42:13.649	\N	\N
2486	1993082024212011	Siti Muthoharoh	Serka	0	\N	082347892523	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Utan Panjang II RT 10/8 jakpus	1845510843	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.652	2026-06-27 12:42:13.652	\N	\N
2487	199005312018022001	Siti Nurmala	Serma	Biro Umum	\N	081219454931	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Komplek PU Sapta Taruna IV, Blik I No.7 Kec. Bantar Gebang, Kota Bekasi	1610209173	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.655	2026-06-27 12:42:13.655	\N	\N
2488	198104152010122001	Siti Supriwati	Penata Muda /IIIa	Biro Umum	\N	087886660001	BAnyumas	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Damar Laut No.147 Depok Jawa Barat	1610195261	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.659	2026-06-27 12:42:13.659	\N	\N
2489	198501172009121001	Sony Tri Nugraha	Penata Muda /IIIa	Biro Umum	\N	085770119476	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		JL. Cempaka Putih Barat 14 A No.21	1610194405	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.662	2026-06-27 12:42:13.662	\N	\N
2490	198909152020121009	Stevanus Marselino Lariwu	Penata Muda /IIIa	Biro Umum	\N	081143200854	Manado	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Link 3 Paniki 1 Mapanget Manado	1610189632	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.667	2026-06-27 12:42:13.667	\N	\N
2491	198306262010121002	Steven E Fransye	Serma	Biro Umum	\N	081306006300	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Perum Grand Nusa Indah Cileungsi	1625133897	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.67	2026-06-27 12:42:13.67	\N	\N
2492	199602022023212040	Suci Aulia,A.Md	II.c/Pengatur	Biro Umum	\N	082390251723	Tikalak	1996-02-02 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Tikalak Kec.X Koto Singkarak Kab Solok Sumbar	1792737170	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.674	2026-06-27 12:42:13.674	\N	\N
2493	198701102010122001	Suci Utami, A.Md	Lettu Bakamla	Biro Umum	\N	087887486669	Lubuk Pakam	1987-10-01 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Gg. Spoor II Dalam Kemayoran Jakarta Pusat	1610208476	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.679	2026-06-27 12:42:13.679	\N	\N
2494	198609202014021001	Sudarsawang, S.Sos.	III.d	Biro Umum	\N	081355216495	Labbakang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		JL. Diponegoro NO. 126 Manado	1611717096	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.682	2026-06-27 12:42:13.682	\N	\N
2495	199301262019021005	Sukma Prasetya	Lettu	SPKKL Sambas	\N	089614784725	Landak	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Bumi Utomo Komp. Suryakencana II No. B7 Pontianak	1610205996	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.686	2026-06-27 12:42:13.686	\N	\N
2496	198504282024211007	Sukri	Letda Bakamla /9	Biro Umum	\N	081257835725	Pemangkat	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Bumi Utomo Komp. Suryakencana II No. B7 Pontianak	1610206706	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.69	2026-06-27 12:42:13.69	\N	\N
2497	197505112010121001	Sulaeman Rusdi, S.T	III.d	Biro Umum	\N	081807085107	Makassar	1975-11-05 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Palmerah Utara I No.11	1613348739	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.694	2026-06-27 12:42:13.694	\N	\N
2498	199611242022021001	Sulis Setiawan	III.d	Biro Umum	\N	081210458046	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		JL. Sano Cipete Utara Jakarta	1613348285	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.697	2026-06-27 12:42:13.697	\N	\N
2499	199108052023211024	Sulistya Yusuf	Terampil-Penata Komputer /2C	KPIML	\N	085770703872	Cirebon	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		KP. Pisangan RT 02/04 Penggilingan Cakung Jakarta Timur	1792737261	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.701	2026-06-27 12:42:13.701	\N	\N
2500	198607252024211005	Surya Irawan ST	Letda	Pangkalan Armada Batam	\N	082384555196	Medan	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Batu Besar	1845510854	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.704	2026-06-27 12:42:13.704	\N	\N
2501	19801224200121001	Suwarno	Serma Bakamla/IId	Biro Umum	\N	085811294475	Jombang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Perum Graha Prima Blok C3/20 Mangun Jaya Tambun Selatan	1610203909	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.708	2026-06-27 12:42:13.708	\N	\N
2502	199403252024211009	Syahadatullah	Letda /IX	SPKKL Kema	\N	085241832402	Pare Pare	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		BTN Lapadde Mas Blok E 15 Kota Pare Pare Sulsel	1845510865	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.712	2026-06-27 12:42:13.712	\N	\N
2503	199204282020121011	Syarif Mu' Minin	Serda Bakamla /Iia	Biro Umum	\N	082130872619	Blora	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Ds. Jimbung RT. 03/04 Kedungtuban Blora	1610190932	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.715	2026-06-27 12:42:13.715	\N	\N
2504	NIP-1782564133717-577	Syifa Ramadhani			\N			\N				1845510876	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.719	2026-06-27 12:42:13.719	\N	\N
2505	11440/P	Tatang	Kolonel	Direktorat Kerjasama	\N	087809742168	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Citra Indah Bukit Menteng A5/20 Jonggol Bogor	1610211172	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.723	2026-06-27 12:42:13.723	\N	\N
2506	199409232019021003	Taufiq Hariz Septiawan	Lettu Bakamla / Penata Muda Tk.I/III.b.	Biro Umum	\N	082121924676	Purbalingga	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Gg. Moncokerto VIII No. 3 Cluster Moncokerto No. B6 Utan Kayu Matraman Jaktim	1611717518	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.725	2026-06-27 12:42:13.725	\N	\N
2507	198507092024211003	Tedy Gunawan	IX		\N	082198821377	Jakarta	1985-09-07 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Kampung Beting Jaya No.29 Jakarta Utara	1610203658	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.73	2026-06-27 12:42:13.73	\N	\N
2508	12664/P	Teguh Sukrisno, S.T.,M.T.	Kolonel	0	\N	081357451099	Bondowoso	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Perum Jalagriya Blok T-V No.2 Candi Sidoarjo	1817042516	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.733	2026-06-27 12:42:13.733	\N	\N
2509	197307012009061004	Theolipus Dalipang	IX	0	\N	085216200212	Samarinda	1973-01-07 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Selat Manipa G1/14 Duren Sawit Jakarta Timur	1644904687	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.754	2026-06-27 12:42:13.754	\N	\N
2510	13843/P	Tio Togap Pasaribu	Kolonel	0	\N	081250433335	Medan	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Johar 4 Rewwin RT 1/8 Wedoro Waru Sidoarjo	1610209683	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.759	2026-06-27 12:42:13.759	\N	\N
2511	198408302015011001	Tito Adhikurniawan,S.Or.,M.Pd	Penata/III.C	0	\N	08176717065	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Cluster Griya Melati NO.B9 RT 05/03 Jati Murni	1611022967	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.762	2026-06-27 12:42:13.762	\N	\N
2512	199008132019021002	Tito Agung Yoga Pratama	Penata Muda Tk.I/III.B	0	\N	089622512440	Temanggung	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		0	1610192883	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.765	2026-06-27 12:42:13.765	\N	\N
2513	13472/P	Tri Haryo Yudanto	Penata Muda Tk.I/III.B	0	\N	081212937390	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Perum Asabri Indah Blok M.16 No.194 Bekasi	1610190182	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.769	2026-06-27 12:42:13.769	\N	\N
2514	19850629 201902 1 003	Tri Nurdianto	Penata Muda Tk.I / III.b	Biro Umum	\N			\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat			1610192656	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.773	2026-06-27 12:42:13.773	\N	\N
2515	198109192015011001	Triwibawa Adisanjoyo	Penata /III.C		\N	08129400439	Jakarta	\N			JL. Muara Bahari RT 04/01 No.7 Sunter	1610202327	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.775	2026-06-27 12:42:13.775	\N	\N
2516	198301162010121001	Ujang Rusmana. S.Si. M.T.	Penata Tingkat I/III .D	Biro Umum	\N	085222300328	Sukabumi	\N			Komplek Oma Indah 2 Blok A No. 4 Depok	1610194744	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.779	2026-06-27 12:42:13.779	\N	\N
2517	199501212024212014	Ulan Dari Suriyadi	Serka	Kantor Zona  Maritim Timur	\N	082214626573	Ambon	\N	Karpan Kota Ambon		Jl. I.R.M Putuhena Wayame Ambon Maluku	1845510887	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.782	2026-06-27 12:42:13.782	\N	\N
2518	199106092019022007	Uning Juningsih	Penata Muda Tk. I/III.b	KPIML	\N	081932664456	Kuningan	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Widuri III/11 Komp. Atsiri Permai Kel. Ragajaya Citayam	1613347123	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.785	2026-06-27 12:42:13.785	\N	\N
2519	199303232024211008	Valiant Diangga	Letda	KPIML	\N	082287482655	Kota Agung	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Cimandala Kab. Bogor	1845510898	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.788	2026-06-27 12:42:13.788	\N	\N
2520	199805292021011001	Vegga Chrisdiansyah Diwan	Serka Bakamla /II.c	Biro Umum	\N	08118336768	Kediri	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		JL. mAwar No. 22 RT07/01 Cijantung Jaktim	1610194438	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.796	2026-06-27 12:42:13.796	\N	\N
2521	197712132010122001	Veronica Fletcia Mokalu	II.d	Biro Umum	\N	085256786869	Minut	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		MGI III FSU Manado	1611717121	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.799	2026-06-27 12:42:13.799	\N	\N
2522	199208012015012001	Vida Gessy Zerlina	Penata/III.c	Direktorat Kerjasama	\N	081210625879	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. P. Halmahera No. 363 Perumnas 3 Bekasi Timur	1613348592	Sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.802	2026-06-27 12:42:13.802	\N	\N
2523	198808132018021002	Vincentius Ardila Andriyawan Rustomo	Penata Tk.I /III B	Direktorat Strategi	\N	081392224151	Klaten	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jambon RT 19/10 Sabranglor Trucuk Klaten	1613346731	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.804	2026-06-27 12:42:13.804	\N	\N
2524	NIP-1782564133806-597	Vinny Sophia Irene Adriaansz			\N			\N				1845510901	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.808	2026-06-27 12:42:13.808	\N	\N
2525	199507132024212018	Vio Ericha Siahaan	Letda IX	Direktorat Kerjasama	\N	082384659168	Surabaya	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Karet Pedurenan Jakarta Selatan	1845510912	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.812	2026-06-27 12:42:13.812	\N	\N
2526	198609172009122001	Vita Melia Nugraheni	Pembina /IV.a	Direktorat Strategi	\N	08111098636	Malang	1986-09-17 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Cluster Calgary F17 Kota Deltamas Cikarang Kab. Bekasi	1613348525	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.814	2026-06-27 12:42:13.814	\N	\N
2527	199708292022021002	Wada Kaligula Budiargo	Letda Bakamla/IIIA	Direktorat Strategi	\N	08212505490	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Dasana Indah Blok UB 3 NO.01 Kelapa Dua Bojong Nangka Tangerang Banten	1610190738	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.818	2026-06-27 12:42:13.818	\N	\N
2528	199203182023211022	Wahid Ikhsan	III/A	KPIML	\N	081298178474	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		KP. Pulo RT 04/01 Bojonggede Bogor	1792737090	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.822	2026-06-27 12:42:13.822	\N	\N
2529	198303132010121001	Wahyu Adi Yuniarsa	Mayor Bakamla  IIId	Biro Sarana Dan Prasarana	\N	081328809923	Gunung Kidul	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Perum Griya Karawaci B1 No.11 Kab Tangerang	1610204119	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.825	2026-06-27 12:42:13.825	\N	\N
2530	199704132024211011	Wahyu Arham	Letda		\N	081996310341	Bonto Tangnga	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur			1845510923	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.83	2026-06-27 12:42:13.83	\N	\N
2531	199910212022011002	Wahyu Bounty Abdriztya	Serka Bakamla/Pengatur IIC	Biro Umum	\N	087866206435	Blitar	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Blitar Jawa Timur	1610190794	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.834	2026-06-27 12:42:13.834	\N	\N
2532	198701092010121004	Wahyu Pratomo	Lettu Bakamla	Biro Umum	\N	081381917678	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Pura Bojonggede Blok C4 No. 04 RT 03/16 Bogor	1610189745	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.838	2026-06-27 12:42:13.838	\N	\N
2533	198109212009011002	Wahyu sigit Purwoko	Penata Tk. 1 /IIId	KPIML	\N	081382709989	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Bangka VIII, Pela Mampang Jaksel	1610195476	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.841	2026-06-27 12:42:13.841	\N	\N
2534	197901162015011001	Wahyu Wibowo	Kapten	KPIML	\N	081299211144	Sleman	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Griya Exotica Cinangka Blok E NO 6 Cinangka Sawangan Depok Jawa Barat	1610203488	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.844	2026-06-27 12:42:13.844	\N	\N
2535	199511042015011001	Wahyudi	Serka Bakamla/II.c	Biro Umum	\N	081247077538	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Kalibaru Barat RT 10/06 Kalibaru Cilincing Jakarta Utara	1610204482	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.847	2026-06-27 12:42:13.847	\N	\N
2536	198102192009011002	Wahyudidin Makka	IIId	Biro Umum	\N	0818674244	Tajuncu	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Rappokalling Raya 1 No.18 Makassar	1610209752	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.851	2026-06-27 12:42:13.851	\N	\N
2537	1969004062009011001	Wakhid Ma'Mun	Penata Tk.I/III.d	Biro Umum	\N	085885233310	Solo	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Kotabatu Ciomas Bogor	1625133900	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.854	2026-06-27 12:42:13.854	\N	\N
2538	200006192019022001	Wanda Sintya Pratiwi	Sertu/II.b	Direktorat Kerjasama	\N	081327606760	Semarang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Dakota K-38/5 RT 04/02 Kembangarum Kec. Semarang Barat Kota Semarang	1610202757	Sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.859	2026-06-27 12:42:13.859	\N	\N
2539	198501022010121001	Waskito Alm Hadi Prabowo	Sertu/II.b	Direktorat Kerjasama	\N	0818525826	Kediri	1985-02-01 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Bogor	1610208602	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.862	2026-06-27 12:42:13.862	\N	\N
2540	199006222024211010	Wendra Arief Hidayat	Letda /IX	Biro Umum	\N	081234573234	Lampung Utara	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Karangan Mulya 5/17 Wiyung Surabaya	1845510934	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.864	2026-06-27 12:42:13.864	\N	\N
2541	198909192024211005	WernherVon Haba	Serka		\N	082213349776	Kupang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Kupang	1845662795	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.87	2026-06-27 12:42:13.87	\N	\N
2542	NIP-1782564133872-615	Wesley Hendriko Rondonuwu			\N			\N				1845510945	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.874	2026-06-27 12:42:13.874	\N	\N
2543	199508012022022003	Widiawaty Simanjuntak	Serka Bakamla Gol.II.c	Kantor Zona Maritim Barat	\N	089653194426	Batam	\N	Jl. Trans Barelang Jembatan II, Setokok Batam		Kav. Bukit Seroja Blok 1 No. 112	1613361216	Sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.877	2026-06-27 12:42:13.877	\N	\N
2544	198005242015011001	Widyawan Prabowo	Penata/III.C	Biro Sarana Dan Prasarana	\N	082112767303	Bojonegoro	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Kedunguneng Kec. Bangsal Kab. Bojonegoro Jawa Timur	1610193581	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.881	2026-06-27 12:42:13.881	\N	\N
2545	199910082024212005	Windy Okuandifa	Serka Bakamla	Biro Umum	\N	08988890525	Jakarta	1995-08-10 00:00:00	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		JL. Cikondo Barat Dalam 2/4 Pancoran Jaksel	1845510956	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.883	2026-06-27 12:42:13.883	\N	\N
2546	199507232018022004	Witari Setyadini	Sertu	SPKKL Sambas	\N	082154287873	Pontianak	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Jl. Husein Hamzah Gg. Gunung Rinjani Sungai Jawi Pontianak Barat	1611716604	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.885	2026-06-27 12:42:13.885	\N	\N
2547	198507152010121001	Wiwit Sutrisno	Letda Bakamla	SPKKL Sambas	\N	081384384120	Pontianak	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Jl,. Datto Tonggara RT 01/011 Kramat Jati Jaktim	1611022990	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.891	2026-06-27 12:42:13.891	\N	\N
2548	199705102022022001	Xena Zitni Rabbi Radhiyyah	Letda Bakamla/III.a	Biro Umum	\N	081380650309	Tangerang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		JL. Karyawan III, Karang Tengah, Tangerang,15157.	1610195964	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.893	2026-06-27 12:42:13.893	\N	\N
2549	198608042020121004	Yance Romah Tua Simamora	Letda Bakamla/III.a	Kantor Zona Maritim Barat	\N	081390596979	Surabaya	\N	Jl. Trans Barelang Jembatan II, Setokok Batam		Green Laguna Residnce A4 No. 8	1610188527	Sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.895	2026-06-27 12:42:13.895	\N	\N
2550	198907202024212011	Yanti Harimu	Letda	SPKKL Manembo-Nembo	\N	0852402006819	siau tagulandang biaro	\N	Jl. Trans Barelang Jembatan II, Setokok Batam		Kel. Aertembaga Dua Kota Bitung	1845510967	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.9	2026-06-27 12:42:13.9	\N	\N
2551	199501222023211012	Yaumil Akbar Syahputra	Serka /VII	Biro Umum	\N	08172341995	Bandar Lampung	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Cluster Flora Aryana Blok E3-20 RT 05/12 Sukabakti Curug Kab. Tangerang	1792539145	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.902	2026-06-27 12:42:13.902	\N	\N
2552	198405152006042026	Yeanry Maryanthy Olang	Mayor	SPKKL Kupang	\N	08113815327	Kupang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat	1611022876	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.905	2026-06-27 12:42:13.905	\N	\N
2553	199812082018022001	Yemanisa Yola	Sertu Bakamla	Biro Umum	\N	082282010973	Bandar LAmpung	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Kepayang No. 57 A Rajabasa Bandar Lampung	1610206569	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.91	2026-06-27 12:42:13.91	\N	\N
2554	199101042014072001	Yetha Marsalina E. manobi	Kapten Bakamla/IIIC	Biro Umum	\N	082397169294	Jayapura	1991-04-01 00:00:00	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Pipa Argapura No.16 Jayapura Selatan Kota Jayapura Papua	1613346470	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.913	2026-06-27 12:42:13.913	\N	\N
2555	198501262019022003	Yoanna Royske Pamona,S.T	Penata Muda Tk.I/III.b	Biro Umum	\N	082196036231	Betania	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Malalayang Dua LK  V Manado	1610188505	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.915	2026-06-27 12:42:13.915	\N	\N
2556	199409282022021001	Yogi Nugroho	Serda Bakamla/II.a	Kantor Zona Maritim Barat	\N	081266700720	Klaten	\N	Jl. Trans Barelang Jembatan II, Setokok Batam		Jl. Garuda Perum Kenangan Jaya, Tanjung Pinang	1610216986	Sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.919	2026-06-27 12:42:13.919	\N	\N
2557	NIP-1782564133921-630	Yoka Precilia Sethromi saudale		SPKKL Kupang	\N	081258083433	Koblain	\N	Jl. Trans Barelang Jembatan II, Setokok Batam		jl. Grbang Madya Kelapa Lima	1815152305	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.923	2026-06-27 12:42:13.923	\N	\N
2558	199610062024211008	Yosaphat Harso Tamban	Serka	Biro Umum	\N	081256182445	Purworejo	1996-06-10 00:00:00	Jl. Trans Barelang Jembatan II, Setokok Batam		Jl. Lamtoro Gung II Blok G No.226 Kota Palangkaraya Kalten	1845510978	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.926	2026-06-27 12:42:13.926	\N	\N
2559	NIP-1782564133928-632	Yovi Padli			\N			\N				1610214106	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.93	2026-06-27 12:42:13.93	\N	\N
2560	199909092021012001	Yovita Intan Safitri	Serka Bakamla /II.c	Biro Umum	\N	085290289616	Pemalang	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Desa pesucen RT 01/03 Petarukan Pemalang	1610194619	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.933	2026-06-27 12:42:13.933	\N	\N
2561	198407022024211003	Yuda Dwi Tanggara	Letda	SPKKL Kupang	\N	081225177148	Sumbawa	1984-02-07 00:00:00	Jl. Trans Barelang Jembatan II, Setokok Batam		Jl. Air Lobang 3 RT 37/15 Kel. Sikuhana Kec. Maulafa Kota Kupang	1845510989	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.936	2026-06-27 12:42:13.936	\N	\N
2562	13820/P	Yudi Priyatno	Kolonel	SPKKL Kupang	\N	081372736398	Surabaya	1975-07-09 00:00:00	Jl. Trans Barelang Jembatan II, Setokok Batam		Perum Permata Jingga JL. Rpj IV/18 Malang	1613346855	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.94	2026-06-27 12:42:13.94	\N	\N
2563	198309242015011001	Yuhanes Antara, S. Pd	Kapten Bakamla/III.c	Biro Umum	\N	081210228129	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Perumahan Buana Gardenia Cluster Amarillys Blok E8/23, Kel. Pinang Kec. Pinang Kota Tangerang	1610190240	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.942	2026-06-27 12:42:13.942	\N	\N
2564	198707132010121001	Yuliadi Prasetiono	Letda	SPKKL Kupang	\N	082213107562	Trenggalek	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Soekarno Hatta Dusun Kauman Desa Pagu	1610210134	sudah	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.944	2026-06-27 12:42:13.944	\N	\N
2565	198607042019021002	Yulian Nopico	Penata Muda Tk.1/IIIb	KPIML	\N	082326307304	Payakumbuh	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Angsana 1 Gang An Nur NO.60 RT 03/06 Pejaten Timur	1613347951	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.948	2026-06-27 12:42:13.948	\N	\N
2566	NIP-1782564133950-639	Yuliana Sovianti			\N			\N				1792487389	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.952	2026-06-27 12:42:13.952	\N	\N
2567	199208172020122018	Yulis Haryati, SH	Letda Bakamla /IIIA	SPKKL Aceh	\N	08116888426	Durung	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat	1611050519	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.955	2026-06-27 12:42:13.955	\N	\N
2568	198701102010122001-DUP-641	Yunica Riana,SE	Letda Bakamla/III.a	Direktorat Data Dan Informasi	\N	081808581420	Jakarta	\N	Jl. Proklamasi No. 56, Kelurahan Pegangsaan, Kec, Menteng, Kota Jakarta Pusat		Kemang Ifi Graha Blok CI NO.18 Jatiasih Bekasi	1610209956	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.959	2026-06-27 12:42:13.959	\N	\N
2569	198305012009012001	Yusnita Budi Pramesti, S.E. M. Pd	Penata Tk. I/III.d	Biro Sarana Dan Prasarana	\N	081511675247	Klaten	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Jl. Banteng No.66 RT 02/15 Kranji Bekasi Barat	1610206376	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.962	2026-06-27 12:42:13.962	\N	\N
2570	NIP-1782564133963-643	Zaini	Letkol Bakamla	Biro Sarana Dan Prasarana	\N	081310013507	Jakarta	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Temiang III /13 Kelapa Gading Jakarta Utara	1610205736	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.965	2026-06-27 12:42:13.965	\N	\N
2571	NIP-1782564133967-644	Zainul Hafizurrahman			\N			\N				1845663197	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.969	2026-06-27 12:42:13.969	\N	\N
2572	198508012023211023	Zulham Endar Saputra, S.E.	Letda Bakamla/IX	0	\N	081246443483	Jakarta	\N	Jl. Pemuda Kav.52 Rawamangun Pulogadung Jakarta Timur		Jl. Kayu IV No.18 RT 06/05 Kayu Putih Jaktim	1610213690	belum	\N	\N	AKTIF	$2b$10$2KXYAtje4Ii7d3Fmy0EtdOXiWQd3JNyCvBVBzHma2J6pvV6iQN3Du	\N	2026-06-27 12:42:13.972	2026-06-27 12:42:13.972	\N	\N
\.


--
-- Data for Name: Angsuran; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Angsuran" (id, "pinjamanId", "bulanKe", "nominalPokok", "nominalBunga", "dendaKeterlambatan", "totalTagihan", "jatuhTempo", status, "lampiranBuktiUrl", "isDivalidasiBank", "tanggalBayar", "createdAt", "updatedAt") FROM stdin;
67	10	1	2000000	100000	0	2100000	2024-09-03 00:00:00	LUNAS	\N	t	2024-09-03 00:00:00	2024-09-03 08:00:00	2024-09-03 08:00:00
68	10	2	2000000	100000	0	2100000	2024-10-03 00:00:00	BELUM_BAYAR	\N	f	\N	2024-09-03 08:00:00	2024-09-03 08:00:00
69	10	3	2000000	100000	0	2100000	2024-11-03 00:00:00	BELUM_BAYAR	\N	f	\N	2024-09-03 08:00:00	2024-09-03 08:00:00
70	10	4	2000000	100000	0	2100000	2024-12-03 00:00:00	BELUM_BAYAR	\N	f	\N	2024-09-03 08:00:00	2024-09-03 08:00:00
71	10	5	2000000	100000	0	2100000	2025-01-03 00:00:00	BELUM_BAYAR	\N	f	\N	2024-09-03 08:00:00	2024-09-03 08:00:00
72	11	1	1083333.333333333	16666.66666666674	0	1100000	2024-09-03 00:00:00	LUNAS	\N	t	2024-09-03 00:00:00	2024-09-03 08:00:00	2024-09-03 08:00:00
73	11	2	1083333.333333333	16666.66666666674	0	1100000	2024-10-03 00:00:00	BELUM_BAYAR	\N	f	\N	2024-09-03 08:00:00	2024-09-03 08:00:00
74	11	3	1083333.333333333	16666.66666666674	0	1100000	2024-11-03 00:00:00	BELUM_BAYAR	\N	f	\N	2024-09-03 08:00:00	2024-09-03 08:00:00
75	11	4	1083333.333333333	16666.66666666674	0	1100000	2024-12-03 00:00:00	BELUM_BAYAR	\N	f	\N	2024-09-03 08:00:00	2024-09-03 08:00:00
76	11	5	1083333.333333333	16666.66666666674	0	1100000	2025-01-03 00:00:00	BELUM_BAYAR	\N	f	\N	2024-09-03 08:00:00	2024-09-03 08:00:00
77	11	6	1083333.333333333	16666.66666666674	0	1100000	2025-02-03 00:00:00	BELUM_BAYAR	\N	f	\N	2024-09-03 08:00:00	2024-09-03 08:00:00
78	11	7	1083333.333333333	16666.66666666674	0	1100000	2025-03-03 00:00:00	BELUM_BAYAR	\N	f	\N	2024-09-03 08:00:00	2024-09-03 08:00:00
79	11	8	1083333.333333333	16666.66666666674	0	1100000	2025-04-03 00:00:00	BELUM_BAYAR	\N	f	\N	2024-09-03 08:00:00	2024-09-03 08:00:00
80	11	9	1083333.333333333	16666.66666666674	0	1100000	2025-05-03 00:00:00	BELUM_BAYAR	\N	f	\N	2024-09-03 08:00:00	2024-09-03 08:00:00
81	11	10	1083333.333333333	16666.66666666674	0	1100000	2025-06-03 00:00:00	BELUM_BAYAR	\N	f	\N	2024-09-03 08:00:00	2024-09-03 08:00:00
82	11	11	1083333.333333333	16666.66666666674	0	1100000	2025-07-03 00:00:00	BELUM_BAYAR	\N	f	\N	2024-09-03 08:00:00	2024-09-03 08:00:00
83	11	12	1083333.333333333	16666.66666666674	0	1100000	2025-08-03 00:00:00	BELUM_BAYAR	\N	f	\N	2024-09-03 08:00:00	2024-09-03 08:00:00
84	12	1	1476000	95940	0	1571940	2024-09-03 00:00:00	LUNAS	\N	t	2024-09-03 00:00:00	2024-09-03 08:00:00	2024-09-03 08:00:00
85	12	2	1476000	95940	0	1571940	2024-10-03 00:00:00	BELUM_BAYAR	\N	f	\N	2024-09-03 08:00:00	2024-09-03 08:00:00
86	12	3	1476000	95940	0	1571940	2024-11-03 00:00:00	BELUM_BAYAR	\N	f	\N	2024-09-03 08:00:00	2024-09-03 08:00:00
87	12	4	1476000	95940	0	1571940	2024-12-03 00:00:00	BELUM_BAYAR	\N	f	\N	2024-09-03 08:00:00	2024-09-03 08:00:00
88	12	5	1476000	95940	0	1571940	2025-01-03 00:00:00	BELUM_BAYAR	\N	f	\N	2024-09-03 08:00:00	2024-09-03 08:00:00
\.


--
-- Data for Name: AuditTrail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."AuditTrail" (id, "userId", action, "entityName", "entityId", "oldData", "newData", "ipAddress", "userAgent", "createdAt") FROM stdin;
1	\N	PUT	MutasiSimpanan	7302	\N	{"old":25000,"new":50000}	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-28 08:31:38.495
2	\N	PUT	MutasiSimpanan	7302	\N	{"old":50000,"new":25000}	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-28 08:33:35.387
3	\N	POST SEND_BROADCAST	Chat	UNKNOWN	\N	{"title":"test","message":"test"}	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-28 07:00:02.513
4	\N	POST CREATE_PRODUK	Produk	1	\N	{"nama":"Test","kategori":"Sembako","hargaModal":1000,"hargaJual":2000,"stok":2,"gambarUrl":""}	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-28 08:02:14.015
\.


--
-- Data for Name: Chat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Chat" (id, "pengirimId", "penerimaId", pesan, "isRead", "createdAt") FROM stdin;
1	admin	2157	cek	f	2026-06-27 13:25:04.651
2	admin	2157	halo	f	2026-06-27 13:25:24.913
3	2157	admin	halo	t	2026-06-27 14:02:20.158
4	admin	2157	p	f	2026-06-27 14:02:37.518
5	2157	admin	test	t	2026-06-27 14:09:54.001
6	2157	admin	test	t	2026-06-27 14:10:01.065
7	admin	2157	test	f	2026-06-27 14:39:04.177
8	2157	admin	test	t	2026-06-28 01:18:51.312
\.


--
-- Data for Name: JurnalUmum; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."JurnalUmum" (id, tanggal, keterangan, jenis, nominal, "saldoSetelahnya", "referensiId", "tipeReferensi", "createdAt") FROM stdin;
\.


--
-- Data for Name: KasKoperasi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."KasKoperasi" (id, saldo, "terakhirDiupdate") FROM stdin;
1	1000000000	2026-06-28 11:28:32.177
\.


--
-- Data for Name: LogAktivitas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."LogAktivitas" (id, aksi, entitas, "entitasId", detail, "ipAddress", "userAgent", "createdAt") FROM stdin;
1	EDIT	MutasiSimpanan	7302	Mengubah nominal dari 25000 menjadi 50000 (Delta: 25000)	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-28 08:15:45.675
2	EDIT	MutasiSimpanan	7302	Mengubah nominal dari 50000 menjadi 25000 (Delta: -25000)	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-28 08:19:49.018
\.


--
-- Data for Name: MutasiSimpanan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MutasiSimpanan" (id, "anggotaId", "jenisSimpanan", "jenisMutasi", nominal, keterangan, "buktiUrl", status, "isDivalidasiBank", "createdAt", "updatedAt") FROM stdin;
6376	2031	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6377	2031	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6378	2031	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6379	2031	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6380	2031	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6381	2032	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6382	2032	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6383	2032	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6384	2032	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6385	2032	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6386	2032	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6387	2032	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6388	2032	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6389	2032	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6390	2033	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6391	2033	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6392	2033	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6393	2033	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6394	2033	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6395	2033	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6396	2033	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6397	2034	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6398	2034	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6399	2034	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6400	2034	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6401	2034	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6402	2034	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6403	2034	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6404	2034	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6405	2034	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6406	2035	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6407	2035	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6408	2035	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6409	2035	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6410	2035	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6411	2035	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6412	2035	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6413	2036	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6414	2036	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6415	2036	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6416	2036	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6417	2036	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6418	2036	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6419	2036	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6420	2037	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6421	2037	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6422	2037	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6423	2037	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6424	2037	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6425	2037	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6426	2037	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6427	2037	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6428	2037	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6429	2038	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6430	2038	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6431	2038	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6432	2038	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6433	2038	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6434	2038	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6435	2038	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6436	2038	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6437	2038	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6438	2039	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6439	2039	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6440	2039	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6441	2039	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6442	2039	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6443	2039	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6444	2039	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6445	2040	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6446	2040	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6447	2040	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6448	2040	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6449	2040	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7302	2157	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2026-06-28 01:33:35.389
6450	2040	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6451	2040	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6452	2041	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6453	2041	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6454	2041	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6455	2041	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6456	2041	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6457	2041	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6458	2041	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6459	2041	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6460	2041	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6461	2042	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6462	2042	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6463	2042	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6464	2042	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6465	2042	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6466	2042	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6467	2042	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6468	2042	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6469	2042	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6470	2043	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6471	2043	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6472	2043	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6473	2043	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6474	2043	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6475	2043	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6476	2044	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6477	2044	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6478	2044	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6479	2044	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6480	2044	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6481	2044	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6482	2044	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6483	2045	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6484	2045	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6485	2045	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6486	2045	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6487	2045	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6488	2045	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6489	2045	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6490	2046	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6491	2046	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6492	2046	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6493	2046	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6494	2047	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6495	2047	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6496	2047	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6497	2047	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6498	2047	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6499	2047	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6500	2047	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6501	2047	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6502	2047	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6503	2048	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6504	2048	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6505	2048	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6506	2048	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6507	2049	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6508	2049	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6509	2049	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6510	2049	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6511	2049	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6512	2049	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6513	2049	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6514	2049	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6515	2049	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6516	2050	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6517	2050	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6518	2050	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6519	2050	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6520	2050	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6521	2050	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6522	2050	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6523	2050	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6524	2050	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6525	2051	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6526	2051	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6527	2051	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6528	2051	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6529	2052	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6530	2053	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6531	2053	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6532	2053	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6533	2053	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6534	2053	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6535	2053	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6536	2053	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6537	2054	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6538	2054	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6539	2054	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6540	2054	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6541	2054	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6542	2054	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6543	2054	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6544	2055	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6545	2055	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6546	2055	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6547	2055	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6548	2055	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6549	2055	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6550	2055	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6551	2056	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6552	2057	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6553	2057	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6554	2057	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6555	2057	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6556	2057	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6557	2057	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6558	2058	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6559	2058	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6560	2058	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6561	2058	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6562	2058	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6563	2058	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6564	2058	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6565	2059	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6566	2059	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6567	2059	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6568	2059	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6569	2059	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6570	2059	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6571	2059	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6572	2059	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6573	2059	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6574	2060	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6575	2060	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6576	2060	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6577	2060	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6578	2060	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6579	2060	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6580	2060	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6581	2060	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6582	2060	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6583	2061	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6584	2061	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6585	2061	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6586	2061	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6587	2061	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6588	2061	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6589	2062	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6590	2062	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6591	2062	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6592	2062	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6593	2062	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6594	2062	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6595	2062	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6596	2062	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6597	2062	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6598	2063	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6599	2063	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6600	2063	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6601	2063	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6602	2063	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6603	2063	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6604	2063	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6605	2064	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6606	2064	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6607	2064	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6608	2064	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6609	2064	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6610	2064	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6611	2064	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6612	2065	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6613	2065	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6614	2065	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6615	2065	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6616	2065	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6617	2065	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6618	2065	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6619	2066	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6620	2066	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6621	2066	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6622	2066	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6623	2066	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6624	2066	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6625	2066	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6626	2066	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6627	2067	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6628	2067	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6629	2067	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6630	2067	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6631	2068	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6632	2068	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6633	2068	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6634	2068	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6635	2068	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6636	2068	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6637	2068	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6638	2069	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6639	2069	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6640	2069	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6641	2069	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6642	2069	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6643	2069	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6644	2069	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6645	2070	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6646	2070	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6647	2070	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6648	2070	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6649	2070	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6650	2070	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6651	2070	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6652	2070	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
5658	1929	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5659	1929	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5660	1929	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5661	1929	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5662	1929	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5663	1929	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
5664	1929	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5665	1930	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5666	1930	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5667	1930	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5668	1930	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5669	1930	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5670	1930	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
5671	1930	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5672	1931	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
5673	1931	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
5674	1931	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5675	1931	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5676	1931	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5677	1931	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5678	1931	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5679	1931	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
5680	1931	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5681	1932	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
5682	1932	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
5683	1932	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5684	1932	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5685	1932	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5686	1932	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5687	1932	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5688	1932	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
5689	1932	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5690	1933	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
5691	1933	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
5692	1933	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5693	1933	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5694	1933	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5695	1933	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5696	1933	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5697	1933	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
5698	1933	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5699	1934	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5700	1934	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5701	1934	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
5702	1934	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5703	1935	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
5704	1935	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
5705	1935	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5706	1935	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5707	1935	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5708	1935	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5709	1935	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5710	1935	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
5711	1935	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5712	1936	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5713	1937	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
5714	1937	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
5715	1937	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5716	1937	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5717	1937	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5718	1937	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5719	1937	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5720	1937	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
5721	1937	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5722	1938	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
5723	1938	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
5724	1938	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5725	1938	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5726	1938	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5727	1938	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5728	1938	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5729	1938	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
5730	1938	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5731	1939	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
5732	1939	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
5733	1939	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5734	1939	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5735	1939	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5736	1939	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5737	1939	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5738	1939	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
5739	1939	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5740	1940	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5741	1940	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5742	1940	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5743	1940	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5744	1940	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5745	1940	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
5746	1940	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5747	1941	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
5748	1941	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
5749	1941	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5750	1941	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5751	1941	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5752	1941	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5753	1941	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5754	1941	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
5755	1941	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5756	1942	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
5757	1942	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
5758	1942	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5759	1942	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5760	1942	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5761	1942	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5762	1942	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5763	1942	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
5764	1942	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5765	1943	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
5766	1943	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
5767	1943	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5768	1943	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5769	1943	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5770	1943	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5771	1944	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
5772	1944	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
5773	1944	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5774	1944	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5775	1944	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5776	1944	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5777	1944	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5778	1944	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
5779	1944	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5780	1945	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
5781	1945	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
5782	1945	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5783	1945	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5784	1945	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5785	1945	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5786	1945	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5787	1945	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
5788	1945	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5789	1946	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
5790	1946	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
5791	1946	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5792	1946	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5793	1946	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5794	1946	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5795	1946	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5796	1946	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
5797	1946	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5798	1947	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
5799	1947	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
5800	1947	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5801	1947	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5802	1947	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5803	1947	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5804	1947	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5805	1947	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
5806	1947	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5807	1948	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5808	1949	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5809	1949	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5810	1949	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5811	1949	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5812	1949	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5813	1949	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
5814	1949	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5815	1950	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
5816	1950	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
5817	1950	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5818	1950	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5819	1950	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5820	1950	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5821	1950	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5822	1950	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
5823	1950	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5824	1951	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5825	1951	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5826	1951	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5827	1951	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5828	1951	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5829	1951	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
5830	1951	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5831	1952	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5832	1952	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5833	1952	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5834	1952	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5835	1952	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5836	1952	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
5837	1952	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5838	1953	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
5839	1953	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
5840	1953	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5841	1953	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5842	1953	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5843	1953	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5844	1954	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5845	1954	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5846	1954	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
5847	1954	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5848	1955	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5849	1955	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5850	1955	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5851	1955	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5852	1955	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5853	1955	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
5854	1955	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5855	1956	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5856	1956	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5857	1956	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5858	1956	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5859	1956	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5860	1956	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
5861	1956	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5862	1957	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5863	1958	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
5864	1958	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
5865	1958	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5866	1958	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5867	1958	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5868	1959	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
5869	1959	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
5870	1959	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5871	1959	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5872	1959	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5873	1959	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5874	1959	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5875	1959	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
5876	1959	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5877	1960	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5878	1960	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5879	1960	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5880	1960	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5881	1961	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
5882	1961	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
5883	1961	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5884	1961	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5885	1961	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5886	1961	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5887	1962	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5888	1962	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5889	1962	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5890	1962	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5891	1963	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
5892	1963	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
5893	1963	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5894	1963	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5895	1963	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5896	1963	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5897	1964	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5898	1964	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5899	1964	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5900	1964	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5901	1964	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5902	1964	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
5903	1964	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5904	1965	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5905	1965	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5906	1965	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5907	1965	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5908	1965	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5909	1965	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
5910	1965	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5911	1966	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
5912	1966	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
5913	1966	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5914	1966	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5915	1966	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5916	1966	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5917	1966	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5918	1966	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
5919	1966	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5920	1967	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
5921	1967	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
5922	1967	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5923	1967	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5924	1967	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5925	1967	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5926	1967	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5927	1967	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
5928	1967	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5929	1968	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5930	1968	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5931	1968	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5932	1968	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5933	1968	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5934	1968	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
5935	1968	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5936	1969	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5937	1969	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5938	1969	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5939	1969	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5940	1969	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5941	1969	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
5942	1969	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5943	1970	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5944	1970	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5945	1970	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5946	1971	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5947	1971	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5948	1971	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5949	1971	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5950	1971	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5951	1971	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
5952	1971	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5953	1972	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
5954	1972	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
5955	1972	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5956	1972	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5957	1972	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5958	1972	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5959	1972	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5960	1972	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7335	2162	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
5961	1972	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5962	1973	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5963	1974	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5964	1974	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5965	1974	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5966	1974	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5967	1974	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5968	1974	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
5969	1974	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5970	1975	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
5971	1975	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
5972	1975	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5973	1975	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5974	1975	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5975	1975	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5976	1975	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5977	1975	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
5978	1975	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5979	1976	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5980	1976	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5981	1976	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5982	1976	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5983	1977	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
5984	1977	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
5985	1977	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5986	1977	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5987	1977	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5988	1977	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5989	1977	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5990	1977	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
5991	1977	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
5992	1978	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
5993	1978	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
5994	1978	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
5995	1978	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
5996	1978	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
5997	1978	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
5998	1978	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
5999	1978	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6000	1978	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6001	1979	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6002	1979	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6003	1979	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6004	1979	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6005	1979	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6006	1979	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6007	1979	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6008	1979	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6009	1979	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6010	1980	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6011	1980	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6012	1980	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6013	1980	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6014	1980	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6015	1980	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6016	1980	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6017	1981	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6018	1981	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6019	1981	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6020	1981	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6021	1982	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6022	1982	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6023	1982	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6024	1982	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6025	1982	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6026	1982	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6027	1982	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6028	1983	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6029	1983	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6030	1983	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6031	1983	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6032	1983	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6033	1983	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6034	1983	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6035	1984	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6036	1984	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6037	1984	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6038	1984	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6039	1984	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6040	1984	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6041	1984	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6042	1984	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6043	1984	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6044	1985	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6045	1985	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6046	1985	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6047	1985	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6048	1985	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6049	1985	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6050	1985	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6051	1985	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6052	1985	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6053	1986	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6054	1986	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6055	1986	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6056	1986	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6057	1987	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6058	1987	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6059	1987	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6060	1987	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6061	1987	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6062	1987	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6063	1987	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6064	1988	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6065	1988	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6066	1988	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6067	1988	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6068	1988	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6069	1988	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6070	1988	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6071	1988	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6072	1988	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6073	1989	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6074	1989	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6075	1989	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6076	1989	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6077	1989	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6078	1989	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6079	1989	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6080	1989	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6081	1989	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6082	1990	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6083	1990	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6084	1990	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6085	1990	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6086	1990	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6087	1990	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6088	1990	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6089	1991	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6090	1991	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6091	1991	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6092	1991	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6093	1992	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6094	1992	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6095	1992	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6096	1992	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6097	1992	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6098	1992	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6099	1992	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6100	1992	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6101	1992	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6102	1993	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6103	1993	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6104	1993	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6105	1993	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6106	1993	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6107	1993	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6108	1993	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6109	1994	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6110	1994	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6111	1994	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7637	2203	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6112	1994	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6113	1994	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6114	1994	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6115	1994	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6116	1995	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6117	1995	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6118	1995	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6119	1995	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6120	1995	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6121	1995	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6122	1995	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6123	1996	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6124	1996	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6125	1996	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6126	1996	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6127	1996	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6128	1996	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6129	1996	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6130	1996	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6131	1996	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6132	1997	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6133	1997	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6134	1997	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6135	1997	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6136	1997	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6137	1997	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6138	1998	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6139	1998	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6140	1998	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6141	1998	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6142	1998	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6143	1998	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6144	1998	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6145	1998	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6146	1998	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6147	1999	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6148	1999	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6149	1999	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6150	1999	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6151	2000	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6152	2000	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6153	2000	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6154	2000	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6155	2000	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6156	2000	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6157	2000	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6158	2001	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6159	2001	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6160	2001	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6161	2001	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6162	2001	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6163	2001	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6164	2001	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6165	2002	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6166	2002	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6167	2002	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6168	2002	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6169	2002	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6170	2002	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6171	2002	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6172	2002	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6173	2002	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6174	2003	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6175	2003	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6176	2003	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6177	2003	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6178	2003	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6179	2003	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6180	2004	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6181	2004	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6182	2004	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6183	2004	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6184	2004	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6185	2004	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6186	2004	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6187	2004	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6188	2004	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6189	2005	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6190	2005	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6191	2005	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6192	2005	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6193	2005	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6194	2005	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6195	2005	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6196	2005	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6197	2005	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6198	2006	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6199	2006	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6200	2006	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6201	2006	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6202	2006	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6203	2006	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6204	2006	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6205	2007	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6206	2007	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6207	2007	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6208	2007	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6209	2007	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6210	2007	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6211	2007	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6212	2007	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6213	2007	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6214	2008	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6215	2008	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6216	2008	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6217	2008	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6218	2008	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6219	2008	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6220	2009	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6221	2009	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6222	2009	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6223	2009	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6224	2010	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6225	2010	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6226	2010	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6227	2010	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6228	2010	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6229	2010	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6230	2010	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6231	2010	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6232	2010	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6233	2011	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6234	2011	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6235	2011	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6236	2011	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6237	2011	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6238	2011	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6239	2011	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6240	2011	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6241	2011	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6242	2012	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6243	2012	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6244	2012	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6245	2012	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6246	2012	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6247	2012	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6248	2012	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6249	2013	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6250	2013	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6251	2013	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6252	2013	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6253	2013	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6254	2013	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6255	2013	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6256	2014	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6257	2014	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6258	2014	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6259	2014	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6260	2014	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6261	2014	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6262	2015	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6263	2015	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6264	2015	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6265	2015	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6266	2015	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6267	2015	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6268	2015	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6269	2016	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6270	2016	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6271	2016	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6272	2016	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6273	2016	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6274	2016	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6275	2016	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6276	2017	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6277	2017	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6278	2017	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6279	2017	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6280	2017	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6281	2017	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6282	2017	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6283	2017	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6284	2017	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6285	2018	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6286	2018	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6287	2018	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6288	2018	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6289	2018	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6290	2018	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6291	2018	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6292	2018	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6293	2018	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6294	2019	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6295	2019	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6296	2019	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6297	2019	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6298	2019	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6299	2019	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6300	2019	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6301	2020	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6302	2020	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6303	2020	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6304	2020	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6305	2020	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6306	2020	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6307	2020	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6308	2020	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6309	2020	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6310	2021	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6311	2021	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6312	2021	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6313	2021	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6314	2021	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6315	2021	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6316	2021	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6317	2022	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6318	2022	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6319	2022	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6320	2022	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6321	2023	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6322	2023	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6323	2023	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6324	2023	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6325	2023	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6326	2023	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6327	2023	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6328	2023	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6329	2023	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6330	2024	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6331	2024	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6332	2024	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6333	2025	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6334	2025	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6335	2025	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6336	2025	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6337	2025	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6338	2025	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6339	2025	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6340	2026	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6341	2026	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6342	2026	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6343	2026	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6344	2027	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6345	2027	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6346	2027	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6347	2027	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6348	2027	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6349	2027	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6350	2027	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6351	2028	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6352	2028	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6353	2028	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6354	2028	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6355	2028	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6356	2028	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6357	2028	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6358	2029	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6359	2029	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6360	2029	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6361	2029	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6362	2029	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6363	2029	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6364	2029	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6365	2030	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6366	2030	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6367	2030	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6368	2030	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6369	2030	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6370	2030	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6371	2030	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6372	2030	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6373	2030	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6374	2031	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6375	2031	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6653	2070	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6654	2071	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6655	2071	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6656	2071	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6657	2071	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6658	2071	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6659	2071	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6660	2071	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6661	2071	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6662	2072	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6663	2072	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6664	2072	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6665	2072	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6666	2072	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6667	2072	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6668	2073	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6669	2073	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6670	2073	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6671	2073	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6672	2073	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6673	2073	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6674	2073	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6675	2073	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6676	2073	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6677	2074	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6678	2074	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6679	2074	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6680	2074	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6681	2074	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6682	2074	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6683	2074	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6684	2075	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6685	2075	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6686	2075	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6687	2075	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6688	2075	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6689	2075	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6690	2075	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6691	2075	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6692	2075	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6693	2076	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6694	2076	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6695	2076	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6696	2076	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6697	2076	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6698	2076	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6699	2076	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6700	2077	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6701	2077	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6702	2077	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6703	2077	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6704	2077	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6705	2077	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6706	2077	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6707	2078	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6708	2078	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6709	2078	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6710	2078	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6711	2078	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6712	2078	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6713	2078	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6714	2078	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6715	2078	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6716	2079	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6717	2079	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6718	2079	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6719	2079	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6720	2079	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6721	2079	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6722	2079	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6723	2079	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6724	2079	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6725	2080	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6726	2080	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6727	2080	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6728	2080	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6729	2080	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6730	2080	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6731	2080	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6732	2080	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6733	2080	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6734	2081	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6735	2081	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6736	2081	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6737	2081	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6738	2081	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6739	2081	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6740	2081	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6741	2081	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6742	2081	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6743	2082	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6744	2082	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6745	2082	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6746	2082	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6747	2082	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6748	2082	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6749	2082	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6750	2083	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6751	2083	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6752	2083	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6753	2083	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6754	2083	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6755	2083	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6756	2083	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6757	2084	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6758	2084	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6759	2084	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6760	2084	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6761	2084	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6762	2084	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6763	2084	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6764	2084	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6765	2084	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6766	2085	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6767	2085	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6768	2085	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6769	2085	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6770	2085	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6771	2085	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6772	2085	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6773	2085	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6774	2085	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6775	2086	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6776	2086	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6777	2086	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6778	2086	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6779	2086	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6780	2086	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6781	2086	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6782	2087	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6783	2087	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6784	2087	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6785	2087	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6786	2087	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6787	2087	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6788	2087	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6789	2087	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6790	2087	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6791	2088	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6792	2088	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6793	2088	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6794	2089	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6795	2089	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6796	2089	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6797	2089	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6798	2089	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6799	2089	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6800	2089	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6801	2089	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6802	2089	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6803	2090	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6804	2090	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6805	2090	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6806	2090	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6807	2090	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6808	2090	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6809	2090	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6810	2090	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6811	2090	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6812	2091	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6813	2091	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6814	2091	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6815	2091	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6816	2091	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6817	2091	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6818	2091	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6819	2091	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6820	2091	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6821	2092	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6822	2092	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6823	2092	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6824	2092	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6825	2092	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6826	2092	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6827	2092	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6828	2092	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6829	2092	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6830	2093	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6831	2093	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6832	2093	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6833	2093	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6834	2093	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6835	2093	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6836	2094	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6837	2094	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6838	2094	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6839	2094	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6840	2095	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6841	2095	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6842	2095	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6843	2095	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6844	2095	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6845	2095	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6846	2095	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6847	2095	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6848	2095	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6849	2096	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6850	2096	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6851	2096	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6852	2096	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6853	2096	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6854	2096	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6855	2096	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6856	2097	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6857	2097	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6858	2097	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6859	2097	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6860	2097	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6861	2097	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6862	2097	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6863	2097	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6864	2097	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6865	2098	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6866	2098	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6867	2098	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6868	2098	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6869	2098	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6870	2098	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6871	2098	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6872	2098	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6873	2098	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6874	2099	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6875	2099	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6876	2099	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6877	2099	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6878	2099	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6879	2099	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6880	2099	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6881	2099	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6882	2099	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6883	2100	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6884	2100	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6885	2100	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6886	2100	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6887	2100	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6888	2100	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6889	2100	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6890	2100	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6891	2100	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6892	2101	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6893	2101	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6894	2101	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6895	2101	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6896	2101	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6897	2101	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6898	2101	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6899	2102	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6900	2102	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6901	2102	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6902	2102	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6903	2102	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6904	2102	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6905	2102	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6906	2102	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6907	2102	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6908	2103	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6909	2103	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6910	2103	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6911	2103	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6912	2103	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6913	2103	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6914	2103	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6915	2103	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6916	2103	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6917	2104	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6918	2104	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6919	2104	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6920	2104	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6921	2104	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6922	2104	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6923	2104	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6924	2105	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6925	2105	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6926	2105	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6927	2105	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6928	2106	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6929	2106	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6930	2106	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6931	2106	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6932	2106	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6933	2106	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6934	2106	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6935	2106	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6936	2106	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6937	2107	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6938	2107	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6939	2107	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6940	2107	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6941	2107	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6942	2107	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6943	2107	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6944	2107	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6945	2108	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6946	2108	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6947	2108	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6948	2108	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6949	2108	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6950	2108	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6951	2108	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6952	2109	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6953	2109	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6954	2109	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6955	2109	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6956	2109	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6957	2109	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6958	2109	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6959	2110	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6960	2110	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6961	2110	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6962	2110	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6963	2110	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6964	2110	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6965	2110	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6966	2111	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6967	2111	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6968	2111	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6969	2111	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6970	2111	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6971	2111	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6972	2111	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6973	2112	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6974	2112	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6975	2112	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6976	2112	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6977	2112	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6978	2112	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6979	2112	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6980	2112	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6981	2112	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6982	2113	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6983	2113	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6984	2113	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6985	2113	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6986	2113	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6987	2113	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6988	2113	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6989	2114	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
6990	2114	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
6991	2114	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6992	2114	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
6993	2114	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
6994	2114	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
6995	2114	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
6996	2114	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
6997	2114	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
6998	2115	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
6999	2115	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7000	2115	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7001	2115	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7002	2115	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7003	2115	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7004	2115	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7005	2116	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7006	2116	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7007	2116	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7008	2116	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7009	2116	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7010	2116	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7011	2116	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7012	2117	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7013	2117	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7014	2117	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7015	2117	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7016	2117	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7017	2117	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7018	2117	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7019	2118	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7020	2118	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7021	2118	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7022	2118	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7023	2119	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7024	2119	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7025	2119	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7026	2119	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7027	2119	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7028	2119	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7029	2119	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7030	2120	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7031	2120	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7032	2120	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7033	2120	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7034	2120	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7035	2120	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7036	2120	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7037	2121	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7038	2121	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7039	2121	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7040	2121	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7041	2121	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7042	2121	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7043	2121	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7044	2121	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7045	2121	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7046	2122	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7047	2123	POKOK	SETORAN	100000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7048	2123	WAJIB	SETORAN	50000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7049	2123	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7050	2123	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7051	2123	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7052	2123	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7053	2123	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7054	2123	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7055	2123	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7056	2124	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7057	2125	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7058	2125	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7059	2125	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7060	2125	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7061	2125	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7062	2125	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7063	2125	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7064	2126	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7065	2126	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7066	2126	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7067	2126	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7068	2126	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7069	2126	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7070	2126	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7071	2127	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7072	2127	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7073	2127	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7074	2127	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7075	2127	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7076	2127	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7077	2127	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7078	2127	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7079	2127	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7080	2128	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7081	2128	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7082	2128	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7083	2128	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7084	2128	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7085	2128	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7086	2128	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7087	2129	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7088	2129	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7089	2129	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7090	2129	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7091	2129	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7092	2129	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7093	2129	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7094	2129	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7095	2129	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7096	2130	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7097	2130	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7098	2130	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7099	2130	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7100	2130	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7101	2130	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7102	2130	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7103	2131	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7104	2131	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7105	2131	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7106	2131	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8245	2283	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7107	2131	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7108	2131	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7109	2131	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7110	2132	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7111	2132	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7112	2132	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7113	2132	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7114	2132	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7115	2132	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7116	2132	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7117	2133	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7118	2134	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7119	2134	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7120	2134	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7121	2134	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7122	2134	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7123	2134	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7124	2134	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7125	2135	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7126	2135	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7127	2135	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7128	2135	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7129	2135	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7130	2135	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7131	2135	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7132	2136	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7133	2136	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7134	2136	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7135	2136	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7136	2136	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7137	2136	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7138	2136	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7139	2136	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7140	2136	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7141	2137	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7142	2137	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7143	2137	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7144	2137	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7145	2138	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7146	2138	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7147	2138	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7148	2138	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7149	2138	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7150	2138	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7151	2138	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7152	2138	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7153	2138	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7154	2139	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7155	2139	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7156	2139	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7157	2139	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7158	2139	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7159	2140	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7160	2140	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7161	2140	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7162	2140	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7163	2140	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7164	2140	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7165	2140	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7166	2140	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7167	2140	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7168	2141	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7169	2141	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7170	2141	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7171	2141	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7172	2141	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7173	2141	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7174	2141	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7175	2142	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7176	2142	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7177	2142	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7178	2142	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7179	2142	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7180	2142	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7181	2142	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7182	2143	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7183	2143	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7184	2143	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7185	2143	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7186	2143	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7187	2143	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7188	2143	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7189	2143	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7190	2143	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7191	2144	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7192	2144	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7193	2144	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7194	2144	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7195	2144	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7196	2144	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7197	2144	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7198	2144	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7199	2144	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7200	2145	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7201	2145	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7202	2145	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7203	2145	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7204	2145	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7205	2145	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7206	2145	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7207	2145	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7208	2145	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7209	2146	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7210	2146	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7211	2146	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7212	2146	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7213	2146	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7214	2146	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7215	2146	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7216	2147	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7217	2147	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7218	2147	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7219	2147	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7220	2147	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7221	2147	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7222	2147	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7223	2147	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7224	2147	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7225	2148	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7226	2148	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7227	2148	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7228	2148	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7229	2148	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7230	2148	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7231	2148	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7232	2148	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7233	2148	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7234	2149	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7235	2149	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7236	2149	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7237	2149	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7238	2149	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7239	2149	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7240	2149	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7241	2149	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7242	2149	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7243	2150	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7244	2150	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7245	2150	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7246	2151	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7247	2151	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7248	2151	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7249	2151	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7250	2151	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7251	2151	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7252	2151	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7253	2151	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7254	2151	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7255	2152	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7256	2152	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7257	2152	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7258	2152	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7259	2152	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7260	2152	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7261	2152	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7262	2153	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7263	2153	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7264	2153	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7265	2153	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7266	2153	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7267	2153	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7268	2153	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7269	2153	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7270	2153	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7271	2154	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7272	2154	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7273	2154	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7274	2154	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7275	2154	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7276	2154	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7277	2154	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7278	2154	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7279	2154	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7280	2155	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7281	2155	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7282	2155	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7283	2155	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7284	2155	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7285	2155	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7286	2155	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7287	2156	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7288	2156	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7289	2156	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7290	2156	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7291	2156	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7292	2156	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7293	2156	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7294	2156	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7295	2156	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7296	2157	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7297	2157	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7298	2157	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7299	2157	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7300	2157	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7301	2157	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7303	2158	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7304	2158	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7305	2158	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7306	2158	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7307	2158	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7308	2158	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7309	2158	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7310	2159	POKOK	SETORAN	100000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7311	2159	WAJIB	SETORAN	50000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7312	2159	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7313	2159	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7314	2159	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7315	2159	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7316	2159	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7317	2159	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7318	2159	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7319	2160	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7320	2160	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7321	2160	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7322	2160	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7323	2160	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7324	2160	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7325	2160	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7326	2161	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7327	2161	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7328	2161	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7329	2161	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7330	2161	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7331	2161	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7332	2161	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7333	2161	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7334	2161	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7336	2162	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7337	2162	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7338	2162	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7339	2162	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7340	2162	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7341	2162	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7342	2162	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7343	2162	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7344	2163	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7345	2163	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7346	2163	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7347	2163	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7348	2163	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7349	2163	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7350	2163	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7351	2164	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7352	2164	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7353	2164	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7354	2164	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7355	2164	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7356	2164	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7357	2164	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7358	2165	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7359	2165	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7360	2165	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7361	2165	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7362	2165	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7363	2165	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7364	2165	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7365	2165	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7366	2165	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7367	2167	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7368	2167	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7369	2167	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7370	2167	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7371	2167	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7372	2167	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7373	2167	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7374	2168	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7375	2168	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7376	2168	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7377	2168	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7378	2168	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7379	2168	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7380	2168	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7381	2169	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7382	2169	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7383	2169	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7384	2169	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7385	2169	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7386	2169	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7387	2169	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7388	2170	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7389	2170	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7390	2170	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7391	2170	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7392	2170	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7393	2170	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7394	2170	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7395	2171	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7396	2171	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7397	2171	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7398	2171	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7399	2171	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7400	2171	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7401	2171	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7402	2171	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7403	2171	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7404	2172	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7405	2172	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7406	2172	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7407	2172	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7408	2172	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7409	2172	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7410	2173	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7411	2173	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7412	2173	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7413	2173	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7414	2173	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7415	2173	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7416	2173	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7417	2174	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7418	2174	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7419	2174	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7420	2174	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7421	2174	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7422	2174	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7423	2174	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7424	2175	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7425	2175	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7426	2175	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7427	2175	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7428	2175	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7429	2175	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7430	2175	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7431	2176	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7432	2176	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7433	2176	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7434	2176	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7435	2176	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7436	2176	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7437	2176	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7438	2176	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7439	2176	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7440	2177	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7441	2177	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7442	2177	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7443	2177	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7444	2177	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7445	2177	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7446	2177	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7447	2177	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7448	2177	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7449	2178	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7450	2178	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7451	2178	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7452	2178	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7453	2178	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7454	2178	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7455	2178	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7456	2179	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7457	2179	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7458	2179	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7459	2179	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7460	2179	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7461	2179	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7462	2179	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7463	2180	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7464	2180	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7465	2180	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7466	2180	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7467	2180	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7468	2180	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7469	2180	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7470	2180	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7471	2180	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7472	2181	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7473	2181	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7474	2181	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7475	2181	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7476	2181	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7477	2181	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7478	2181	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7479	2182	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7480	2182	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7481	2182	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7482	2182	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7483	2182	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7484	2182	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7485	2182	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7486	2183	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7487	2183	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7488	2183	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7489	2183	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7490	2183	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7491	2183	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7492	2183	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7493	2184	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7494	2184	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7495	2184	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7496	2184	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7497	2184	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7498	2184	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7499	2184	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7500	2185	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7501	2185	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7502	2185	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7503	2185	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7504	2185	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7505	2185	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7506	2185	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7507	2187	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7508	2187	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7509	2187	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7510	2187	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7511	2187	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7512	2187	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7513	2187	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7514	2187	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7515	2187	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7516	2188	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7517	2188	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7518	2188	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7519	2188	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7520	2188	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7521	2188	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7522	2188	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7523	2188	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7524	2189	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7525	2189	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7526	2189	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7527	2189	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7528	2189	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7529	2189	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7530	2189	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7531	2190	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7532	2190	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7533	2190	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7534	2190	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7535	2190	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7536	2190	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7537	2190	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7538	2191	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7539	2191	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7540	2191	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7541	2191	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7542	2191	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7543	2191	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7544	2191	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7545	2191	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7546	2191	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7547	2192	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7548	2192	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7549	2192	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7550	2192	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7551	2193	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7552	2193	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7553	2193	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7554	2193	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7555	2193	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7556	2193	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7557	2193	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7558	2194	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7559	2194	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7560	2194	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7561	2194	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7562	2194	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7563	2194	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7564	2194	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7565	2195	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7566	2195	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7567	2195	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7568	2195	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7569	2195	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7570	2195	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7571	2195	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7572	2195	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7573	2195	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7574	2196	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7575	2196	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7576	2196	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7577	2196	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7578	2196	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7579	2196	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7580	2196	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7581	2196	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7582	2196	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7583	2197	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7584	2197	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7585	2197	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7586	2197	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7587	2197	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7588	2197	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7589	2197	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7590	2197	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7591	2197	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7592	2198	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7593	2198	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7594	2198	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7595	2198	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7596	2198	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7597	2198	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7598	2198	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7599	2198	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7600	2198	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7601	2199	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7602	2199	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7603	2199	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7604	2199	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7605	2199	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7606	2199	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7607	2199	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7608	2199	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7609	2199	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7610	2200	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7611	2200	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7612	2200	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7613	2200	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7614	2200	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7615	2200	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7616	2200	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7617	2200	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7618	2200	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7619	2201	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7620	2201	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7621	2201	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7622	2201	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7623	2201	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7624	2201	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7625	2201	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7626	2201	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7627	2201	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7628	2202	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7629	2202	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7630	2202	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7631	2202	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7632	2202	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7633	2202	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7634	2202	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7635	2202	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7636	2202	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7638	2203	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7639	2203	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7640	2203	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7641	2203	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7642	2204	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7643	2204	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7644	2204	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7645	2204	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7646	2204	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7647	2204	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7648	2204	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7649	2205	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7650	2205	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7651	2205	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7652	2205	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7653	2205	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7654	2205	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7655	2205	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7656	2205	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7657	2205	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7658	2206	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7659	2206	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7660	2206	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7661	2206	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7662	2206	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7663	2206	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7664	2207	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7665	2207	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7666	2207	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7667	2207	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7668	2207	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7669	2207	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7670	2207	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7671	2208	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7672	2208	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7673	2208	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7674	2208	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7675	2208	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7676	2208	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7677	2209	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7678	2209	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7679	2209	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7680	2209	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7681	2210	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7682	2210	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7683	2210	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7684	2210	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7685	2210	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7686	2210	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7687	2210	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7688	2210	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7689	2210	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7690	2211	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7691	2211	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7692	2211	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7693	2211	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7694	2211	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7695	2211	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7696	2211	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7697	2211	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7698	2211	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7699	2212	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7700	2212	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7701	2212	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7702	2212	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7703	2212	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7704	2212	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7705	2212	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7706	2212	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7707	2212	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7708	2213	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7709	2213	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7710	2213	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7711	2213	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7712	2213	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7713	2213	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7714	2213	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7715	2213	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7716	2213	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7717	2214	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7718	2214	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7719	2214	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7720	2214	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7721	2214	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7722	2214	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7723	2214	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7724	2215	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7725	2215	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7726	2215	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7727	2215	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7728	2215	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7729	2215	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7730	2215	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7731	2215	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7732	2215	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7733	2216	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7734	2216	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7735	2216	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7736	2216	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7737	2216	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7738	2216	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7739	2216	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7740	2216	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7741	2216	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7742	2217	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7743	2217	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7744	2217	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7745	2217	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7746	2217	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7747	2217	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7748	2217	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7749	2218	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7750	2218	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7751	2218	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7752	2218	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7753	2218	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7754	2218	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7755	2218	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7756	2219	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7757	2219	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7758	2219	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7759	2219	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7760	2219	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7761	2219	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7762	2219	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7763	2220	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7764	2220	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7765	2220	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7766	2220	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7767	2220	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7768	2220	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7769	2220	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7770	2220	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7771	2220	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7772	2221	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7773	2221	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7774	2221	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7775	2221	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7776	2221	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7777	2221	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7778	2221	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7779	2222	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7780	2222	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7781	2222	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7782	2222	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7783	2222	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7784	2222	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7785	2222	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7786	2222	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7787	2222	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7788	2223	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7789	2223	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7790	2223	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7791	2223	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7792	2223	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7793	2223	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7794	2223	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7795	2223	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7796	2223	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7797	2224	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7798	2224	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7799	2224	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7800	2224	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7801	2224	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7802	2224	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7803	2224	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7804	2225	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7805	2225	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7806	2225	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7807	2225	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7808	2225	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7809	2225	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7810	2225	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7811	2226	POKOK	SETORAN	100000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7812	2226	WAJIB	SETORAN	50000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7813	2226	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7814	2226	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7815	2226	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7816	2227	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7817	2227	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7818	2227	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7819	2227	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7820	2227	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7821	2227	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7822	2227	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7823	2228	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7824	2228	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7825	2228	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7826	2228	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7827	2228	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7828	2228	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7829	2228	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7830	2229	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7831	2229	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7832	2229	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7833	2229	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7834	2229	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7835	2229	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7836	2229	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7837	2229	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7838	2229	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7839	2230	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7840	2230	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7841	2230	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7842	2230	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7843	2230	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7844	2230	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7845	2231	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7846	2231	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7847	2231	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7848	2231	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7849	2231	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7850	2231	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7851	2231	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7852	2232	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7853	2232	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7854	2232	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7855	2232	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7856	2232	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7857	2232	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7858	2232	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7859	2233	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7860	2233	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7861	2233	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7862	2233	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7863	2233	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7864	2233	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7865	2234	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7866	2234	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7867	2234	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7868	2234	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7869	2234	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7870	2234	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7871	2234	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7872	2234	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7873	2234	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7874	2235	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7875	2235	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7876	2235	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7877	2235	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7878	2236	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7879	2236	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7880	2236	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7881	2236	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7882	2236	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7883	2236	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7884	2236	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7885	2236	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7886	2236	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7887	2237	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7888	2237	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7889	2237	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7890	2237	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7891	2237	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7892	2237	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7893	2237	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7894	2238	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7895	2238	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7896	2238	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7897	2238	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7898	2238	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7899	2238	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7900	2238	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7901	2239	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7902	2239	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7903	2239	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7904	2239	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7905	2239	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7906	2239	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7907	2239	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7908	2240	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7909	2240	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7910	2240	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7911	2240	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7912	2240	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7913	2240	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7914	2240	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7915	2241	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7916	2241	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7917	2241	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7918	2241	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7919	2241	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7920	2241	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7921	2241	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7922	2242	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7923	2242	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7924	2242	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7925	2242	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7926	2242	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7927	2242	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7928	2242	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7929	2242	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7930	2242	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7931	2243	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7932	2243	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7933	2243	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7934	2243	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7935	2243	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7936	2243	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7937	2243	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7938	2243	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7939	2243	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7940	2244	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7941	2244	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7942	2244	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7943	2244	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7944	2245	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7945	2245	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7946	2245	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7947	2245	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7948	2245	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7949	2245	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7950	2245	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7951	2245	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7952	2245	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7953	2246	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7954	2246	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7955	2246	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7956	2246	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7957	2246	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7958	2246	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7959	2246	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7960	2247	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7961	2247	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7962	2247	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7963	2247	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7964	2247	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7965	2247	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7966	2247	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7967	2248	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7968	2248	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7969	2248	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7970	2248	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7971	2248	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7972	2248	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7973	2248	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7974	2249	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7975	2249	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7976	2249	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7977	2249	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7978	2249	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7979	2249	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7980	2249	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7981	2250	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7982	2250	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7983	2250	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7984	2250	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7985	2250	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7986	2250	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7987	2251	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
7988	2251	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
7989	2251	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7990	2251	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7991	2251	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7992	2251	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
7993	2251	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
7994	2251	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
7995	2251	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
7996	2252	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
7997	2252	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
7998	2252	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
7999	2252	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8000	2252	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8001	2252	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8002	2252	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8003	2253	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8004	2253	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8005	2253	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8006	2253	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8007	2253	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8008	2253	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8009	2253	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8010	2253	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8011	2253	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8012	2254	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8013	2254	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8014	2254	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8015	2254	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8016	2254	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8017	2254	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8018	2254	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8019	2254	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8020	2254	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8021	2256	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8022	2256	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8023	2256	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8024	2256	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8025	2256	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8026	2256	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8027	2256	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8028	2256	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8029	2256	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8030	2257	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8031	2257	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8032	2257	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8033	2257	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8034	2257	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8035	2257	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8036	2258	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8037	2258	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8038	2258	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8039	2258	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8040	2258	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8041	2258	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8042	2258	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8043	2258	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8044	2258	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8045	2259	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8046	2259	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8047	2259	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8048	2259	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8049	2259	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8050	2259	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8051	2259	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8052	2259	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8053	2259	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8054	2260	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8055	2260	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8056	2260	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8057	2260	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8058	2260	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8059	2260	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8060	2260	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8061	2261	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8062	2261	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8063	2261	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8064	2261	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8065	2261	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8066	2261	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8067	2261	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8068	2261	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8069	2261	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8070	2262	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8071	2262	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8072	2262	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8073	2262	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8074	2262	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8075	2262	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8076	2262	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8077	2263	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8078	2263	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8079	2263	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8080	2263	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8081	2263	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8082	2263	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8083	2263	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8084	2263	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8085	2263	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8086	2264	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8087	2264	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8088	2264	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8089	2264	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8090	2264	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8091	2264	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8092	2264	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8093	2265	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8094	2265	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8095	2265	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8096	2265	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8097	2265	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8098	2265	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8099	2265	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8100	2266	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8101	2266	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8102	2266	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8103	2266	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8104	2266	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8105	2266	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8106	2266	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8107	2267	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8108	2267	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8109	2267	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8110	2267	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8111	2267	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8112	2267	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8113	2267	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8114	2268	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8115	2268	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8116	2268	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8117	2268	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8118	2268	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8119	2268	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8120	2268	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8121	2268	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8122	2268	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8123	2269	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8124	2269	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8125	2269	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8126	2269	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8127	2269	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8128	2269	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8129	2269	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8130	2269	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8131	2269	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8132	2270	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8133	2270	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8134	2270	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8135	2270	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8136	2270	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8137	2270	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8138	2270	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8139	2271	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8140	2271	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8141	2271	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8142	2271	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8143	2271	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8144	2271	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8145	2271	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8146	2271	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8147	2271	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8148	2272	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8149	2272	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8150	2272	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8151	2272	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8152	2272	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8153	2272	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8154	2272	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8155	2273	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8156	2273	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8157	2273	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8158	2273	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8159	2273	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8160	2273	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8161	2273	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8162	2273	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8163	2273	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8164	2274	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8165	2274	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8166	2274	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8167	2274	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8168	2274	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8169	2274	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8170	2274	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8171	2274	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8172	2274	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8173	2275	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8174	2275	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8175	2275	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8176	2275	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8177	2275	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8178	2275	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8179	2275	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8180	2275	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8181	2275	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8182	2276	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8183	2276	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8184	2276	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8185	2276	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8186	2276	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8187	2276	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8188	2276	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8189	2276	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8190	2276	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8191	2277	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8192	2277	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8193	2277	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8194	2277	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8195	2277	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8196	2277	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8197	2277	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8198	2277	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8199	2277	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8200	2278	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8201	2278	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8202	2278	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8203	2278	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8204	2278	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8205	2278	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8206	2278	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8207	2278	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8208	2278	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8209	2279	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8210	2279	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8211	2279	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8212	2279	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8213	2279	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8214	2279	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8215	2279	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8216	2279	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8217	2279	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8218	2280	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8219	2280	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8220	2280	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8221	2280	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8222	2280	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8223	2280	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8224	2280	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8225	2280	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8226	2280	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8227	2281	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8228	2281	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8229	2281	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8230	2281	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8231	2281	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8232	2281	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8233	2281	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8234	2281	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8235	2281	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8236	2282	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8237	2282	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8238	2282	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8239	2282	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8240	2282	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8241	2282	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8242	2282	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8243	2282	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8244	2282	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8246	2283	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8247	2283	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8248	2283	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8249	2283	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8250	2283	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8251	2284	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8252	2284	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8253	2284	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8254	2284	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8255	2284	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8256	2284	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8257	2284	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8258	2284	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8259	2284	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8260	2285	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8261	2285	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8262	2285	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8263	2285	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8264	2285	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8265	2285	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8266	2285	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8267	2286	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8268	2286	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8269	2286	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8270	2286	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8271	2286	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8272	2286	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8273	2286	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8274	2287	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8275	2287	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8276	2287	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8277	2287	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8278	2287	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8279	2287	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8280	2287	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8281	2288	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8282	2288	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8283	2288	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8284	2288	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8285	2288	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8286	2288	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8287	2288	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8288	2289	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8289	2289	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8290	2289	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8291	2289	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8292	2289	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8293	2289	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8294	2289	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8295	2290	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8296	2290	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8297	2290	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8298	2290	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8299	2290	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8300	2290	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8301	2290	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8302	2291	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8303	2291	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8304	2291	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8305	2291	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8306	2291	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8307	2291	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8308	2291	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8309	2291	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8310	2291	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8311	2292	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8312	2292	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8313	2292	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8314	2292	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8315	2292	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8316	2292	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8317	2292	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8318	2293	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8319	2293	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8320	2293	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8321	2293	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8322	2293	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8323	2293	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8324	2293	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8325	2294	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8326	2294	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8327	2294	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8328	2294	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8329	2295	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8330	2295	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8331	2295	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8332	2295	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8333	2295	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8334	2295	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8335	2295	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8336	2295	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8337	2295	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8338	2296	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8339	2296	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8340	2296	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8341	2296	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8342	2296	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8343	2296	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8344	2296	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8345	2296	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8346	2296	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8347	2297	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8348	2298	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8349	2298	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8350	2298	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8351	2298	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8352	2299	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8353	2299	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8354	2299	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8355	2299	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8356	2299	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8357	2299	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8358	2299	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8359	2300	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8360	2300	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8361	2300	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8362	2300	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8363	2300	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8364	2300	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8365	2300	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8366	2300	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8367	2300	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8368	2301	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8369	2301	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8370	2301	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8371	2301	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8372	2301	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8373	2301	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8374	2301	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8375	2301	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8376	2301	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8377	2302	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8378	2302	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8379	2302	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8380	2302	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8381	2302	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8382	2302	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8383	2302	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8384	2302	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8385	2302	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8386	2303	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8387	2303	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8388	2303	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8389	2303	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8390	2303	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8391	2303	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8392	2303	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8393	2303	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8394	2303	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8395	2304	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8396	2304	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8397	2304	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8398	2304	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8399	2304	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8400	2304	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8401	2305	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8402	2305	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8403	2305	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8404	2305	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8405	2305	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8406	2305	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8407	2305	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8408	2306	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8409	2306	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8410	2306	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8411	2306	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8412	2306	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8413	2306	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8414	2306	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8415	2306	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8416	2306	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8417	2307	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8418	2307	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8419	2307	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8420	2307	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8421	2307	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8422	2307	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8423	2307	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8424	2307	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8425	2307	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8426	2308	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8427	2308	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8428	2308	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8429	2308	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8430	2309	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8431	2309	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8432	2309	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8433	2309	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8434	2309	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8435	2309	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8436	2309	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8437	2310	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8438	2310	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8439	2310	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8440	2310	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8441	2310	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8442	2310	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8443	2310	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8444	2310	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8445	2310	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8446	2311	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8447	2311	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8448	2311	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8449	2311	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8450	2311	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8451	2311	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8452	2311	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8453	2312	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8454	2312	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8455	2312	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8456	2312	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8457	2312	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8458	2312	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8459	2312	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8460	2313	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8461	2313	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8462	2313	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8463	2313	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8464	2313	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8465	2313	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8466	2314	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8467	2314	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8468	2314	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8469	2314	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8470	2314	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8471	2314	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8850	2367	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8472	2314	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8473	2315	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8474	2315	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8475	2316	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8476	2316	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8477	2316	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8478	2316	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8479	2316	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8480	2316	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8481	2316	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8482	2316	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8483	2317	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8484	2317	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8485	2317	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8486	2317	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8487	2318	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8488	2318	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8489	2318	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8490	2318	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8491	2318	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8492	2318	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8493	2318	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8494	2318	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8495	2318	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8496	2319	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8497	2319	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8498	2319	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8499	2319	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8500	2319	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8501	2319	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8502	2319	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8503	2319	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8504	2319	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8505	2320	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8506	2320	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8507	2320	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8508	2320	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8509	2320	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8510	2320	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8511	2320	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8512	2320	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8513	2320	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8514	2321	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8515	2321	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8516	2321	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8517	2321	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8518	2321	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8519	2321	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8520	2321	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8521	2322	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8522	2322	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8523	2322	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8524	2322	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8525	2322	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8526	2322	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8527	2322	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8528	2323	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8529	2323	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8530	2323	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8531	2323	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8532	2323	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8533	2323	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8534	2323	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8535	2324	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8536	2324	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8537	2324	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8538	2324	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8539	2324	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8540	2324	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8541	2325	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8542	2325	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8543	2325	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8544	2325	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8545	2325	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8546	2325	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8547	2325	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8548	2325	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8549	2325	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8550	2326	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8551	2326	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8552	2326	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8553	2326	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8554	2326	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8555	2326	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8556	2326	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8557	2327	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8558	2327	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8559	2327	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8560	2327	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8561	2327	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8562	2327	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8563	2327	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8564	2328	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8565	2328	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8566	2328	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8567	2328	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8568	2328	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8569	2328	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8570	2328	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8571	2329	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8572	2329	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8573	2329	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8574	2329	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8575	2329	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8576	2329	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8577	2329	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8578	2329	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8579	2329	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8580	2330	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8581	2330	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8582	2330	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8583	2330	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8584	2330	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8585	2330	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8586	2330	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8587	2331	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8588	2331	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8589	2331	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8590	2331	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8591	2332	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8592	2332	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8593	2332	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8594	2332	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8595	2332	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8596	2332	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8597	2332	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8598	2333	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8599	2333	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8600	2333	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8601	2333	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8602	2333	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8603	2333	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8604	2333	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8605	2334	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8606	2334	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8607	2334	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8608	2334	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8609	2334	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8610	2334	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8611	2334	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8612	2335	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8613	2335	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8614	2335	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8615	2335	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8616	2335	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8617	2335	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8618	2335	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8619	2335	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8620	2335	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8621	2336	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8622	2336	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8623	2336	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8624	2336	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8625	2336	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8626	2336	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8627	2336	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8628	2336	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8629	2336	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8630	2337	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8631	2337	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8632	2337	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8633	2337	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8634	2338	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8635	2338	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8636	2338	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8637	2338	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8638	2339	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8639	2339	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8640	2339	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8641	2339	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8642	2339	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8643	2339	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8644	2339	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8645	2339	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8646	2339	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8647	2340	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8648	2340	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8649	2340	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8650	2340	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8651	2340	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8652	2340	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8653	2340	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8654	2341	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8655	2341	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8656	2341	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8657	2341	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8658	2341	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8659	2341	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8660	2341	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8661	2342	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8662	2342	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8663	2342	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8664	2342	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8665	2342	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8666	2342	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8667	2342	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8668	2343	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8669	2343	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8670	2343	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8671	2343	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8672	2343	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8673	2343	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8674	2343	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8675	2344	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8676	2344	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8677	2344	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8678	2344	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8679	2345	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8680	2345	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8681	2345	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8682	2345	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8683	2345	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8684	2345	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8685	2345	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8686	2346	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8687	2346	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8688	2346	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8689	2346	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8690	2346	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8691	2346	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8692	2346	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8693	2347	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8694	2347	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8695	2347	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8696	2347	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8697	2347	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8698	2347	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8699	2347	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8700	2348	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8701	2331	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8702	2331	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8703	2331	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8704	2331	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8705	2331	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8706	2331	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8707	2331	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8708	2331	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8709	2331	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8710	2350	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8711	2350	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8712	2350	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8713	2350	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8714	2350	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8715	2350	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8716	2350	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8717	2351	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8718	2351	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8719	2351	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8720	2351	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8721	2351	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8722	2351	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8723	2351	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8724	2352	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8725	2352	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8726	2352	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8727	2352	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8728	2352	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8729	2352	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8730	2352	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8731	2352	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8732	2353	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8733	2353	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8734	2353	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8735	2353	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8736	2353	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8737	2353	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8738	2353	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8739	2354	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8740	2354	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8741	2354	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8742	2354	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8743	2354	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8744	2354	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8745	2354	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8746	2354	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8747	2354	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8748	2355	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8749	2355	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8750	2355	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8751	2355	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8752	2355	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8753	2355	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8754	2355	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8755	2355	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8756	2355	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8757	2356	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8758	2356	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8759	2356	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8760	2356	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8761	2356	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8762	2356	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8763	2356	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8764	2356	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8765	2356	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8766	2357	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8767	2357	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8768	2357	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8769	2357	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8770	2357	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8771	2357	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8772	2357	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8773	2357	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8774	2357	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8775	2358	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8776	2358	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8777	2358	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8778	2358	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8779	2358	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8780	2358	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8781	2358	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8782	2358	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8783	2358	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8784	2359	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8785	2359	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8786	2359	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8787	2359	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8788	2359	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8789	2359	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8790	2359	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8791	2359	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8792	2359	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8793	2360	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8794	2360	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8795	2360	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8796	2360	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8797	2360	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8798	2360	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8799	2360	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8800	2361	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8801	2361	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8802	2361	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8803	2361	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8804	2361	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8805	2361	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8806	2361	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8807	2361	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8808	2361	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8809	2362	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8810	2362	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8811	2362	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8812	2362	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8813	2362	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8814	2362	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8815	2362	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8816	2363	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8817	2363	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8818	2363	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8819	2363	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8820	2363	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8821	2363	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8822	2363	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8823	2363	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8824	2363	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8825	2364	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8826	2364	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8827	2364	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8828	2364	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8829	2364	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8830	2364	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8831	2364	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8832	2365	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8833	2365	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8834	2365	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8835	2365	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8836	2365	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8837	2365	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8838	2365	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8839	2365	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8840	2365	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8841	2366	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8842	2366	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8843	2366	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8844	2366	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8845	2366	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8846	2366	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8847	2366	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8848	2366	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8849	2366	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8851	2367	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8852	2367	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8853	2367	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8854	2367	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8855	2367	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8856	2367	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8857	2367	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8858	2367	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8859	2368	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8860	2368	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8861	2368	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8862	2368	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8863	2368	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8864	2368	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8865	2368	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8866	2369	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8867	2369	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8868	2369	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8869	2369	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8870	2369	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8871	2369	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8872	2369	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8873	2369	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8874	2369	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8875	2370	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8876	2371	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8877	2371	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8878	2371	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8879	2371	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8880	2371	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8881	2371	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8882	2371	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8883	2371	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8884	2371	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8885	2372	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8886	2372	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8887	2372	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8888	2372	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8889	2372	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8890	2372	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8891	2372	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8892	2372	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8893	2372	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8894	2373	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8895	2373	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8896	2373	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8897	2373	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8898	2373	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8899	2373	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8900	2373	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8901	2374	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8902	2374	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8903	2374	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8904	2374	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8905	2374	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8906	2374	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8907	2374	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8908	2375	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8909	2375	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8910	2375	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8911	2375	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8912	2375	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8913	2375	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8914	2375	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8915	2375	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8916	2375	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8917	2376	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8918	2376	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8919	2376	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8920	2376	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8921	2376	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8922	2376	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8923	2376	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8924	2377	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8925	2377	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10285	2565	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8926	2377	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8927	2377	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8928	2377	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8929	2377	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8930	2377	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8931	2378	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8932	2378	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8933	2378	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8934	2378	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8935	2378	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8936	2378	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8937	2378	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8938	2378	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8939	2378	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8940	2379	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8941	2379	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8942	2379	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8943	2379	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8944	2379	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8945	2379	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8946	2379	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8947	2379	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8948	2379	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8949	2380	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8950	2380	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8951	2380	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8952	2380	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8953	2380	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8954	2380	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8955	2380	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8956	2381	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8957	2381	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8958	2381	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8959	2381	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8960	2381	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8961	2381	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8962	2381	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8963	2382	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8964	2382	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8965	2382	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8966	2382	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8967	2383	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8968	2383	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8969	2383	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8970	2383	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8971	2383	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8972	2383	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8973	2383	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8974	2384	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8975	2384	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8976	2384	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8977	2384	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8978	2384	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8979	2384	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8980	2384	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8981	2385	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8982	2385	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8983	2385	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8984	2385	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8985	2385	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8986	2385	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8987	2385	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8988	2385	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8989	2385	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8990	2386	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
8991	2386	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
8992	2386	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
8993	2386	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
8994	2386	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
8995	2386	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
8996	2386	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
8997	2386	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
8998	2386	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
8999	2387	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9000	2387	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9001	2387	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9002	2387	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9003	2387	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9004	2387	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9005	2387	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9006	2388	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9007	2388	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9008	2388	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9009	2389	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9010	2389	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9011	2389	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9012	2389	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9013	2389	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9014	2389	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9015	2389	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9016	2390	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9017	2390	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9018	2390	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9019	2390	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9020	2390	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9021	2390	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9022	2390	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9023	2391	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9024	2391	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9025	2391	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9026	2391	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9027	2391	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9028	2391	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9029	2391	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9030	2392	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9031	2392	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9032	2392	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9033	2392	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9034	2392	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9035	2392	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9036	2392	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9037	2392	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9038	2392	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9039	2393	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9040	2393	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9041	2393	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9042	2393	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9043	2393	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9044	2393	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9045	2393	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9046	2393	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9047	2393	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9048	2394	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9049	2394	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9050	2394	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9051	2394	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9052	2394	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9053	2394	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9054	2394	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9055	2394	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9056	2394	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9057	2395	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9058	2395	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9059	2395	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9060	2395	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9061	2395	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9062	2395	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9063	2395	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9064	2395	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9065	2395	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9066	2396	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9067	2396	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9068	2396	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9069	2396	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9070	2396	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9071	2396	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9072	2396	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9073	2397	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9074	2397	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9075	2397	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9076	2397	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9077	2397	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9078	2397	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9079	2397	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9080	2397	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9081	2397	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9082	2398	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9083	2398	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9084	2398	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9085	2398	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9086	2398	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9087	2398	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9088	2398	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9089	2398	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9090	2398	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9091	2399	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9092	2399	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9093	2399	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9094	2399	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9095	2400	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9096	2401	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9097	2401	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9098	2401	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9099	2401	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9100	2401	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9101	2401	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9102	2401	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9103	2402	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9104	2402	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9105	2402	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9106	2402	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9107	2402	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9108	2402	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9109	2402	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9110	2402	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9111	2402	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9112	2403	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9113	2403	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9114	2403	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9115	2403	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9116	2403	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9117	2403	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9118	2403	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9119	2403	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9120	2403	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9121	2404	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9122	2404	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9123	2404	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9124	2404	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9125	2404	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9126	2404	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9127	2404	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9128	2405	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9129	2405	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9130	2405	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9131	2405	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9132	2405	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9133	2405	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9134	2405	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9135	2405	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9136	2405	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9137	2406	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9138	2406	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9139	2406	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9140	2406	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9141	2406	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9142	2406	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9143	2406	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9144	2406	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9145	2406	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9146	2407	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9147	2407	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9148	2407	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9149	2407	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9150	2407	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9151	2407	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9152	2407	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9153	2408	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9154	2408	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9155	2408	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9156	2408	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9157	2408	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9158	2408	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9159	2408	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9160	2409	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9161	2409	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9162	2409	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9163	2409	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9164	2409	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9165	2409	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9166	2409	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9167	2410	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9168	2410	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9169	2410	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9170	2410	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9171	2410	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9172	2410	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9173	2410	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9174	2410	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9175	2410	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9176	2411	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9177	2412	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9178	2412	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9179	2412	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9180	2412	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9181	2412	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9182	2412	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9183	2412	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9184	2413	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9185	2413	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9186	2413	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9187	2413	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9188	2413	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9189	2413	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9190	2413	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9191	2413	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9192	2413	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9193	2414	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9194	2414	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9195	2414	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9196	2414	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9197	2414	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9198	2414	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9199	2414	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9200	2414	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9201	2414	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9202	2415	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9203	2415	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9204	2415	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9205	2415	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9206	2415	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9207	2415	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9208	2415	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9209	2416	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9210	2416	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9211	2416	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9212	2416	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9213	2416	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9214	2416	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9215	2416	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9216	2417	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9217	2417	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9218	2417	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9219	2417	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9220	2417	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9221	2417	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9222	2417	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9223	2418	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9224	2418	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9225	2418	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9226	2418	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9227	2418	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9228	2418	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9229	2418	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9230	2419	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9231	2419	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9232	2419	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9233	2419	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9234	2420	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9235	2420	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9236	2420	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9237	2420	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9238	2420	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9239	2420	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9240	2420	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9241	2421	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9242	2421	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9243	2421	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9244	2421	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9245	2421	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9246	2421	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9247	2421	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9248	2421	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9249	2421	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9250	2422	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9251	2422	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9252	2422	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9253	2422	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9254	2423	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9255	2423	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9256	2423	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9257	2423	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9258	2423	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9259	2423	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9260	2423	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9261	2424	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9262	2424	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9263	2424	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9264	2424	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9265	2424	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9266	2424	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9267	2424	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9268	2425	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9269	2425	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9270	2425	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9271	2425	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9272	2425	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9273	2425	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9274	2425	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9275	2425	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9276	2425	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9277	2426	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9278	2426	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9279	2426	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9280	2426	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9281	2426	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9282	2426	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9283	2426	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9284	2426	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9285	2426	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9286	2427	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9287	2427	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9288	2427	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9289	2427	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9290	2427	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9291	2427	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9292	2427	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9293	2428	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9294	2428	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9295	2428	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9296	2428	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9297	2428	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9298	2428	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9299	2428	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9300	2429	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9301	2429	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9302	2429	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9303	2429	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9304	2429	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9305	2429	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9306	2429	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9307	2429	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9308	2429	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9309	2430	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9310	2430	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9311	2430	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9312	2430	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9313	2430	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9314	2430	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9315	2430	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9316	2431	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9317	2431	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9318	2431	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9319	2431	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9320	2431	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9321	2431	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9322	2431	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9323	2432	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9324	2432	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9325	2432	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9326	2432	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9327	2432	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9328	2432	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9329	2432	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9330	2432	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9331	2432	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9332	2433	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9333	2433	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9334	2433	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9335	2433	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9336	2433	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9337	2433	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9338	2433	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9339	2433	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9340	2433	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9341	2435	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9342	2435	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9343	2435	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9344	2435	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9345	2435	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9346	2435	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9347	2435	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9348	2436	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9349	2436	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9350	2436	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9351	2436	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9352	2437	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9353	2437	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9354	2437	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9355	2437	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9356	2437	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9357	2437	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9358	2437	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9359	2438	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9360	2438	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9361	2438	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9362	2438	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9363	2438	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9364	2438	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9365	2438	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9366	2439	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9367	2439	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9368	2439	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9369	2439	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9370	2439	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9371	2439	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9372	2439	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9373	2439	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9374	2439	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9375	2440	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9376	2440	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9377	2440	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9378	2440	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9379	2440	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9380	2440	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9381	2440	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9382	2441	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9383	2441	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9384	2441	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9385	2441	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9386	2441	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9387	2441	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9388	2441	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9389	2441	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9390	2441	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9391	2442	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9392	2442	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9393	2442	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9394	2442	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9395	2442	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9396	2442	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9397	2442	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9398	2443	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9399	2443	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9400	2443	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9401	2443	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9402	2443	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9403	2443	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9404	2443	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9405	2443	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9406	2443	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9407	2444	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9408	2444	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9409	2444	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9410	2444	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9411	2444	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9412	2444	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9413	2444	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9414	2444	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9415	2444	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9416	2445	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9417	2445	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9418	2445	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9419	2445	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9420	2445	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9421	2445	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9422	2445	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9423	2445	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9424	2445	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9425	2446	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9426	2446	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9427	2446	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9428	2446	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9429	2446	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9430	2446	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9431	2446	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9432	2447	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9433	2447	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9434	2447	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9435	2447	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9436	2447	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9437	2447	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9438	2447	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9439	2447	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9440	2447	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9441	2448	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9442	2448	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9443	2448	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9444	2448	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9445	2448	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9446	2448	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9447	2448	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9448	2449	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9449	2449	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9450	2449	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9451	2449	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9452	2450	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9453	2450	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9454	2450	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9455	2450	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9456	2450	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9457	2450	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9458	2450	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9459	2450	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9460	2450	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9461	2451	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9462	2451	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9463	2451	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9464	2451	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9465	2451	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9466	2451	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9467	2451	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9468	2452	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9469	2452	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9470	2452	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9471	2452	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9472	2452	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9473	2452	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9474	2452	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9475	2452	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9476	2452	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9477	2453	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9478	2453	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9479	2453	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9480	2453	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9481	2453	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9482	2453	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9483	2453	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9484	2454	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9485	2454	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9486	2454	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9487	2454	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9488	2454	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9489	2454	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9490	2454	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9491	2454	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9492	2454	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9493	2455	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9494	2455	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9495	2455	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9496	2455	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9497	2455	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9498	2455	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9499	2455	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9500	2456	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9501	2456	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9502	2456	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9503	2456	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9504	2456	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9505	2456	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9506	2456	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9507	2457	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9508	2457	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9509	2457	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9510	2458	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9511	2458	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9512	2458	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9513	2458	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9514	2458	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9515	2458	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9516	2458	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9517	2459	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9518	2459	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9519	2459	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9520	2459	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9521	2459	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9522	2459	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9523	2459	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9524	2459	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9525	2460	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9526	2460	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9527	2460	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9528	2460	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9529	2460	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9530	2460	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9531	2460	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9532	2461	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9533	2461	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9534	2461	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9535	2461	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9536	2461	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9537	2461	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9538	2461	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9539	2461	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9540	2461	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9541	2462	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9542	2462	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9543	2462	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9544	2462	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9545	2462	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9546	2462	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9547	2462	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9548	2462	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9549	2462	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9550	2463	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9551	2463	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9552	2463	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9553	2463	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9554	2463	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9555	2463	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9556	2463	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9557	2464	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9558	2464	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9559	2464	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9560	2464	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9561	2464	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9562	2464	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9563	2464	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9564	2465	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9565	2465	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9566	2465	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9567	2465	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9568	2465	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9569	2465	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9570	2466	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9571	2466	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9572	2466	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9573	2466	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9574	2466	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9575	2466	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9576	2466	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9577	2467	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9578	2467	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9579	2467	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9580	2467	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9581	2467	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9582	2467	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9583	2467	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9584	2468	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9585	2468	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9586	2468	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9587	2468	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9588	2468	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9589	2468	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9590	2468	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9591	2469	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9592	2469	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9593	2469	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9594	2469	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9595	2469	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9596	2469	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9597	2469	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9598	2469	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9599	2469	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9600	2470	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9601	2470	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9602	2470	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9603	2470	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9604	2470	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9605	2470	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9606	2470	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9607	2471	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9608	2471	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9609	2471	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9610	2471	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9611	2471	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9612	2471	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9613	2471	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9614	2472	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9615	2472	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9616	2472	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9617	2472	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9618	2472	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9619	2472	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9620	2472	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9621	2473	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9622	2473	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9623	2473	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9624	2473	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9625	2473	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9626	2473	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9627	2473	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9628	2474	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9629	2475	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9630	2475	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9631	2475	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9632	2475	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9633	2475	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9634	2475	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9635	2476	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9636	2476	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9637	2476	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9638	2476	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9639	2476	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9640	2476	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9641	2476	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9642	2477	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9643	2477	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9644	2477	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9645	2477	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9646	2477	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9647	2477	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9648	2477	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9649	2477	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9650	2477	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9651	2478	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9652	2478	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9653	2478	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9654	2478	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9655	2478	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9656	2478	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9657	2478	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9658	2478	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9659	2478	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9660	2479	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9661	2479	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9662	2479	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9663	2479	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9664	2479	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9665	2479	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9666	2479	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9667	2479	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9668	2479	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9669	2480	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9670	2480	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9671	2480	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9672	2480	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9673	2480	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9674	2480	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9675	2480	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9676	2480	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9677	2480	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9678	2481	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9679	2481	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9680	2481	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9681	2481	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9682	2481	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9683	2481	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9684	2481	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9685	2482	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9686	2482	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9687	2482	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9688	2482	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9689	2482	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9690	2482	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9691	2482	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9692	2482	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9693	2482	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9694	2483	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9695	2483	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9696	2483	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9697	2483	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9698	2483	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9699	2483	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9700	2483	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9701	2483	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9702	2483	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9703	2484	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9704	2484	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9705	2484	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9706	2484	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9707	2484	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9708	2484	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9709	2484	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9710	2485	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9711	2485	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9712	2485	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9713	2485	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9714	2485	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9715	2485	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9716	2485	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9717	2486	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9718	2486	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9719	2486	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9720	2486	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9721	2486	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9722	2486	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9723	2486	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9724	2487	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9725	2487	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9726	2487	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9727	2487	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9728	2487	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9729	2487	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9730	2487	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9731	2488	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9732	2488	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9733	2488	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9734	2488	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9735	2488	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9736	2488	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9737	2488	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9738	2488	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9739	2488	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9740	2489	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9741	2489	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9742	2489	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9743	2489	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9744	2489	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9745	2489	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9746	2489	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9747	2489	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9748	2489	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9749	2490	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9750	2490	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9751	2490	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9752	2490	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9753	2490	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9754	2490	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9755	2490	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9756	2491	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9757	2491	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9758	2491	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9759	2491	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9760	2491	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9761	2492	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9762	2492	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9763	2492	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9764	2492	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9765	2492	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9766	2492	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9767	2492	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9768	2492	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9769	2492	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9770	2493	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9771	2493	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9772	2493	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9773	2493	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9774	2494	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9775	2494	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9776	2494	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9777	2494	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9778	2494	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9779	2494	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9780	2495	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9781	2495	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9782	2495	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9783	2495	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9784	2495	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9785	2495	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9786	2495	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9787	2495	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9788	2495	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9789	2496	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9790	2496	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9791	2496	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9792	2496	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9793	2496	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9794	2496	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9795	2496	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9796	2497	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9797	2497	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9798	2497	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9799	2497	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9800	2497	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9801	2497	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9802	2497	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9803	2497	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9804	2497	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9805	2498	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9806	2498	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9807	2498	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9808	2499	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9809	2499	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9810	2499	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9811	2499	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9812	2499	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9813	2499	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9814	2499	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9815	2500	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9816	2500	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9817	2500	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9818	2500	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9819	2500	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9820	2500	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9821	2500	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9822	2501	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9823	2501	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9824	2501	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9825	2501	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9826	2501	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9827	2501	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9828	2501	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9829	2501	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9830	2501	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9831	2502	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9832	2502	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9833	2502	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9834	2502	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9835	2502	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9836	2502	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9837	2502	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9838	2503	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9839	2503	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9840	2503	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9841	2503	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9842	2503	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9843	2503	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9844	2503	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9845	2503	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9846	2503	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9847	2504	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9848	2504	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9849	2504	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9850	2504	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9851	2504	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9852	2504	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9853	2504	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9854	2505	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9855	2505	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9856	2505	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9857	2505	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9858	2506	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9859	2506	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9860	2506	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9861	2506	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9862	2506	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9863	2506	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9864	2506	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9865	2506	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9866	2506	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9867	2507	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9868	2507	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9869	2507	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9870	2507	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9871	2508	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9872	2508	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9873	2508	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9874	2508	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9875	2508	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9876	2508	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9877	2508	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9878	2508	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9879	2509	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9880	2509	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9881	2509	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9882	2509	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9883	2509	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9884	2509	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9885	2509	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9886	2509	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9887	2509	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9888	2510	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9889	2510	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9890	2510	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9891	2510	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9892	2510	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9893	2510	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9894	2510	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9895	2510	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9896	2510	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9897	2511	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9898	2511	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9899	2511	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9900	2511	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9901	2511	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9902	2511	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9903	2511	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9904	2512	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9905	2512	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9906	2512	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9907	2512	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9908	2512	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9909	2512	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9910	2512	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9911	2512	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9912	2512	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9913	2513	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9914	2513	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9915	2513	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9916	2513	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9917	2513	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9918	2513	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9919	2513	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9920	2513	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9921	2513	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9922	2514	POKOK	SETORAN	100000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9923	2514	WAJIB	SETORAN	50000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9924	2514	WAJIB	SETORAN	50000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9925	2514	WAJIB	SETORAN	50000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9926	2514	WAJIB	SETORAN	50000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9927	2514	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9928	2514	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9929	2514	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9930	2514	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9931	2515	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9932	2515	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9933	2515	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9934	2515	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9935	2515	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9936	2515	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9937	2515	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9938	2515	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9939	2515	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9940	2516	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
9941	2516	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
9942	2516	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9943	2516	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9944	2516	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9945	2516	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9946	2516	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9947	2516	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9948	2516	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9949	2517	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9950	2517	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9951	2517	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9952	2518	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9953	2518	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9954	2518	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9955	2518	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9956	2518	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9957	2518	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9958	2518	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9959	2519	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9960	2519	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9961	2519	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9962	2519	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9963	2519	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9964	2519	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9965	2519	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9966	2520	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9967	2520	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9968	2520	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9969	2520	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9970	2520	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9971	2520	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9972	2520	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9973	2521	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9974	2521	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9975	2521	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9976	2521	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9977	2521	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9978	2521	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9979	2521	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9980	2522	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9981	2522	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9982	2522	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9983	2522	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9984	2523	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9985	2523	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9986	2523	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9987	2523	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9988	2523	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9989	2523	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9990	2523	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9991	2524	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9992	2524	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
9993	2524	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
9994	2524	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
9995	2524	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
9996	2524	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
9997	2524	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
9998	2525	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
9999	2525	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10000	2525	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10001	2525	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10002	2525	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10003	2525	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10004	2525	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10005	2526	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
10006	2526	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
10007	2526	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10008	2526	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10009	2526	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10010	2526	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10011	2526	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10012	2526	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10013	2526	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10014	2527	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
10015	2527	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
10016	2527	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10017	2527	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10018	2527	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10019	2527	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10020	2527	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10021	2527	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10022	2527	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10023	2528	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10024	2528	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10025	2528	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10026	2528	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10027	2528	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10028	2528	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10029	2528	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10030	2529	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
10031	2529	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
10032	2529	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10033	2529	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10034	2529	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10035	2529	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10036	2529	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10037	2529	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10038	2529	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10039	2530	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10040	2530	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10041	2530	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10042	2530	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10043	2530	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10044	2530	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10045	2530	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10046	2531	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
10047	2531	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
10048	2531	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10049	2531	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10050	2531	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10051	2531	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10052	2531	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10053	2531	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10054	2531	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10055	2532	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
10056	2532	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
10057	2532	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10058	2532	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10059	2532	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10060	2532	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10061	2532	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10062	2532	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10063	2532	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10064	2533	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10065	2533	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10066	2533	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10067	2533	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10068	2533	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10069	2533	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10070	2533	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10071	2534	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
10072	2534	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
10073	2534	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10074	2534	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10075	2534	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10076	2534	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10077	2534	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10078	2534	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10079	2534	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10080	2535	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10081	2535	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10082	2535	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10083	2535	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10084	2535	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10085	2535	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10086	2535	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10087	2536	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
10088	2536	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
10089	2536	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10090	2536	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10091	2536	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10092	2536	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10093	2536	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10094	2536	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10095	2536	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10096	2537	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
10097	2537	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
10098	2537	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10099	2537	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10100	2537	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10101	2537	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10102	2537	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10103	2537	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10104	2537	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10105	2538	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10106	2538	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10107	2538	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10108	2538	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10109	2538	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10110	2538	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10111	2538	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10112	2539	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10113	2539	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10114	2539	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10115	2539	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10116	2539	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10117	2539	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10118	2539	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10119	2540	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10120	2540	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10121	2540	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10122	2540	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10123	2541	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10124	2541	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10125	2541	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10126	2541	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10127	2541	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10128	2541	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10129	2541	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10130	2542	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10131	2542	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10132	2542	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10133	2542	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10134	2542	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10135	2542	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10136	2542	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10137	2543	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
10138	2543	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
10139	2543	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10140	2543	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10141	2543	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10142	2543	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10143	2543	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10144	2543	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10145	2543	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10146	2544	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10147	2544	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10148	2544	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10149	2544	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10150	2544	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10151	2544	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10152	2544	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10153	2545	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10154	2545	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10155	2545	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10156	2545	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10157	2545	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10158	2545	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10159	2545	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10160	2546	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
10161	2546	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
10162	2546	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10163	2546	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10164	2546	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10165	2546	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10166	2546	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10167	2546	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10168	2546	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10169	2548	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10170	2548	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10171	2548	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10172	2548	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10173	2548	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10174	2548	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10175	2548	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10176	2549	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
10177	2549	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
10178	2549	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10179	2549	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10180	2549	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10181	2549	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10182	2549	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10183	2549	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10184	2549	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10185	2550	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10186	2550	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10187	2550	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10188	2550	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10189	2551	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
10190	2551	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
10191	2551	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10192	2551	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10193	2551	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10194	2551	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10195	2551	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10196	2551	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10197	2551	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10198	2552	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
10199	2552	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
10200	2552	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10201	2552	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10202	2552	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10203	2552	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10204	2552	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10205	2552	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10206	2552	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10207	2553	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
10208	2553	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
10209	2553	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10210	2553	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10211	2553	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10212	2553	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10213	2553	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10214	2553	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10215	2553	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10216	2554	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10217	2554	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10218	2554	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10219	2554	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10220	2554	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10221	2554	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10222	2554	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10223	2555	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
10224	2555	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
10225	2555	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10226	2555	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10227	2555	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10228	2555	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10229	2555	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10230	2555	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10231	2555	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10232	2556	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
10233	2556	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
10234	2556	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10235	2556	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10236	2556	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10237	2556	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10238	2556	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10239	2556	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10240	2556	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10241	2557	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
10242	2557	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
10243	2557	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10244	2557	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10245	2557	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10246	2557	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10247	2557	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10248	2557	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10249	2557	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10250	2558	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10251	2558	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10252	2558	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10253	2558	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10254	2558	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10255	2558	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10256	2558	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10257	2559	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10258	2560	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
10259	2560	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
10260	2560	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10261	2560	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10262	2560	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10263	2560	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10264	2560	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10265	2560	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10266	2560	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10267	2561	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10268	2562	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10269	2563	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10270	2563	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10271	2563	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10272	2563	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10273	2563	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10274	2563	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10275	2563	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10276	2564	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
10277	2564	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
10278	2564	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10279	2564	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10280	2564	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10281	2564	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10282	2564	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10283	2564	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10284	2564	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10286	2565	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
10287	2565	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10288	2565	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10289	2565	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10290	2565	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10291	2565	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10292	2565	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10293	2565	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10294	2566	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10295	2566	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10296	2566	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10297	2566	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10298	2566	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10299	2566	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10300	2566	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10301	2567	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
10302	2567	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
10303	2567	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10304	2567	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10305	2567	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10306	2567	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10307	2567	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10308	2567	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10309	2567	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10310	2493	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
10311	2493	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
10312	2493	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10313	2493	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10314	2493	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10315	2493	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10316	2493	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10317	2493	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10318	2493	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10319	2569	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
10320	2569	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
10321	2569	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10322	2569	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10323	2569	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10324	2569	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10325	2569	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10326	2569	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10327	2569	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10328	2570	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
10329	2570	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
10330	2570	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10331	2570	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10332	2570	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10333	2570	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10334	2570	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10335	2570	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10336	2570	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10337	2571	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10338	2571	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10339	2571	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10340	2571	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10341	2571	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10342	2571	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10343	2571	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
10344	2572	POKOK	SETORAN	50000	Simpanan Pokok	\N	DISETUJUI	t	2024-05-01 01:00:00	2024-05-01 01:00:00
10345	2572	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-06-01 01:00:00	2024-06-01 01:00:00
10346	2572	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-07-01 01:00:00	2024-07-01 01:00:00
10347	2572	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-08-01 01:00:00	2024-08-01 01:00:00
10348	2572	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-09-01 01:00:00	2024-09-01 01:00:00
10349	2572	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-10-01 01:00:00	2024-10-01 01:00:00
10350	2572	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-11-01 01:00:00	2024-11-01 01:00:00
10351	2572	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2024-12-01 01:00:00	2024-12-01 01:00:00
10352	2572	WAJIB	SETORAN	25000	Simpanan Wajib Bulanan	\N	DISETUJUI	t	2025-02-01 01:00:00	2025-02-01 01:00:00
\.


--
-- Data for Name: Notifikasi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Notifikasi" (id, "anggotaId", judul, pesan, "isRead", "createdAt") FROM stdin;
2	1937	test	test	f	2026-06-28 14:00:01.935
3	2317	test	test	f	2026-06-28 14:00:01.937
4	1929	test	test	f	2026-06-28 14:00:01.938
5	1930	test	test	f	2026-06-28 14:00:01.939
6	1931	test	test	f	2026-06-28 14:00:01.94
7	1932	test	test	f	2026-06-28 14:00:01.941
8	1933	test	test	f	2026-06-28 14:00:01.942
9	1934	test	test	f	2026-06-28 14:00:01.943
10	1935	test	test	f	2026-06-28 14:00:01.944
11	1936	test	test	f	2026-06-28 14:00:01.944
12	1938	test	test	f	2026-06-28 14:00:01.945
13	1939	test	test	f	2026-06-28 14:00:01.946
14	1940	test	test	f	2026-06-28 14:00:01.947
15	1941	test	test	f	2026-06-28 14:00:01.948
16	1942	test	test	f	2026-06-28 14:00:01.949
17	1943	test	test	f	2026-06-28 14:00:01.949
18	1944	test	test	f	2026-06-28 14:00:01.95
19	1945	test	test	f	2026-06-28 14:00:01.951
20	1946	test	test	f	2026-06-28 14:00:01.952
21	1947	test	test	f	2026-06-28 14:00:01.953
22	1948	test	test	f	2026-06-28 14:00:01.954
23	1949	test	test	f	2026-06-28 14:00:01.954
24	1950	test	test	f	2026-06-28 14:00:01.955
25	1951	test	test	f	2026-06-28 14:00:01.956
26	1952	test	test	f	2026-06-28 14:00:01.956
27	1953	test	test	f	2026-06-28 14:00:01.957
28	1954	test	test	f	2026-06-28 14:00:01.958
29	1955	test	test	f	2026-06-28 14:00:01.959
30	1956	test	test	f	2026-06-28 14:00:01.959
31	1957	test	test	f	2026-06-28 14:00:01.96
32	1958	test	test	f	2026-06-28 14:00:01.961
33	1959	test	test	f	2026-06-28 14:00:01.962
34	1960	test	test	f	2026-06-28 14:00:01.963
35	1961	test	test	f	2026-06-28 14:00:01.963
36	1962	test	test	f	2026-06-28 14:00:01.964
37	1963	test	test	f	2026-06-28 14:00:01.965
38	1964	test	test	f	2026-06-28 14:00:01.966
39	1965	test	test	f	2026-06-28 14:00:01.967
40	1966	test	test	f	2026-06-28 14:00:01.968
41	1967	test	test	f	2026-06-28 14:00:01.968
42	1968	test	test	f	2026-06-28 14:00:01.969
43	1969	test	test	f	2026-06-28 14:00:01.969
44	1970	test	test	f	2026-06-28 14:00:01.97
45	1971	test	test	f	2026-06-28 14:00:01.97
46	1972	test	test	f	2026-06-28 14:00:01.971
47	1973	test	test	f	2026-06-28 14:00:01.972
48	1974	test	test	f	2026-06-28 14:00:01.973
49	1975	test	test	f	2026-06-28 14:00:01.973
50	1976	test	test	f	2026-06-28 14:00:01.974
51	1977	test	test	f	2026-06-28 14:00:01.974
52	1978	test	test	f	2026-06-28 14:00:01.975
53	1979	test	test	f	2026-06-28 14:00:01.976
54	1980	test	test	f	2026-06-28 14:00:01.977
55	1981	test	test	f	2026-06-28 14:00:01.978
56	1982	test	test	f	2026-06-28 14:00:01.979
57	1983	test	test	f	2026-06-28 14:00:01.98
58	1984	test	test	f	2026-06-28 14:00:01.981
59	1985	test	test	f	2026-06-28 14:00:01.983
60	1986	test	test	f	2026-06-28 14:00:01.984
61	1987	test	test	f	2026-06-28 14:00:01.984
62	1988	test	test	f	2026-06-28 14:00:01.985
63	1989	test	test	f	2026-06-28 14:00:01.986
64	1990	test	test	f	2026-06-28 14:00:01.986
65	1991	test	test	f	2026-06-28 14:00:01.988
66	1992	test	test	f	2026-06-28 14:00:01.989
67	1993	test	test	f	2026-06-28 14:00:01.99
68	1994	test	test	f	2026-06-28 14:00:01.99
69	1995	test	test	f	2026-06-28 14:00:01.991
70	1996	test	test	f	2026-06-28 14:00:01.992
71	1997	test	test	f	2026-06-28 14:00:01.993
72	1998	test	test	f	2026-06-28 14:00:01.993
73	1999	test	test	f	2026-06-28 14:00:01.994
74	2000	test	test	f	2026-06-28 14:00:01.995
75	2001	test	test	f	2026-06-28 14:00:01.996
76	2002	test	test	f	2026-06-28 14:00:01.997
77	2003	test	test	f	2026-06-28 14:00:01.998
78	2004	test	test	f	2026-06-28 14:00:01.999
79	2005	test	test	f	2026-06-28 14:00:02
80	2006	test	test	f	2026-06-28 14:00:02.001
81	2007	test	test	f	2026-06-28 14:00:02.002
82	2008	test	test	f	2026-06-28 14:00:02.003
83	2009	test	test	f	2026-06-28 14:00:02.004
84	2010	test	test	f	2026-06-28 14:00:02.005
85	2011	test	test	f	2026-06-28 14:00:02.007
86	2012	test	test	f	2026-06-28 14:00:02.008
87	2013	test	test	f	2026-06-28 14:00:02.009
88	2014	test	test	f	2026-06-28 14:00:02.01
89	2015	test	test	f	2026-06-28 14:00:02.011
90	2016	test	test	f	2026-06-28 14:00:02.012
91	2017	test	test	f	2026-06-28 14:00:02.013
92	2018	test	test	f	2026-06-28 14:00:02.014
93	2019	test	test	f	2026-06-28 14:00:02.015
94	2020	test	test	f	2026-06-28 14:00:02.016
95	2021	test	test	f	2026-06-28 14:00:02.017
96	2022	test	test	f	2026-06-28 14:00:02.017
97	2023	test	test	f	2026-06-28 14:00:02.018
98	2024	test	test	f	2026-06-28 14:00:02.019
99	2025	test	test	f	2026-06-28 14:00:02.019
100	2026	test	test	f	2026-06-28 14:00:02.02
101	2027	test	test	f	2026-06-28 14:00:02.021
102	2028	test	test	f	2026-06-28 14:00:02.022
103	2029	test	test	f	2026-06-28 14:00:02.023
104	2030	test	test	f	2026-06-28 14:00:02.023
105	2031	test	test	f	2026-06-28 14:00:02.024
106	2032	test	test	f	2026-06-28 14:00:02.024
107	2033	test	test	f	2026-06-28 14:00:02.025
108	2034	test	test	f	2026-06-28 14:00:02.026
109	2035	test	test	f	2026-06-28 14:00:02.027
110	2036	test	test	f	2026-06-28 14:00:02.028
111	2037	test	test	f	2026-06-28 14:00:02.029
112	2038	test	test	f	2026-06-28 14:00:02.03
113	2039	test	test	f	2026-06-28 14:00:02.031
114	2040	test	test	f	2026-06-28 14:00:02.033
115	2041	test	test	f	2026-06-28 14:00:02.034
116	2042	test	test	f	2026-06-28 14:00:02.034
117	2043	test	test	f	2026-06-28 14:00:02.035
118	2044	test	test	f	2026-06-28 14:00:02.036
119	2045	test	test	f	2026-06-28 14:00:02.037
120	2046	test	test	f	2026-06-28 14:00:02.038
121	2047	test	test	f	2026-06-28 14:00:02.039
122	2048	test	test	f	2026-06-28 14:00:02.04
123	2049	test	test	f	2026-06-28 14:00:02.04
124	2050	test	test	f	2026-06-28 14:00:02.042
125	2051	test	test	f	2026-06-28 14:00:02.042
126	2052	test	test	f	2026-06-28 14:00:02.043
127	2053	test	test	f	2026-06-28 14:00:02.044
128	2054	test	test	f	2026-06-28 14:00:02.045
129	2055	test	test	f	2026-06-28 14:00:02.045
130	2056	test	test	f	2026-06-28 14:00:02.046
131	2057	test	test	f	2026-06-28 14:00:02.047
132	2058	test	test	f	2026-06-28 14:00:02.047
133	2059	test	test	f	2026-06-28 14:00:02.048
134	2060	test	test	f	2026-06-28 14:00:02.048
135	2061	test	test	f	2026-06-28 14:00:02.049
136	2062	test	test	f	2026-06-28 14:00:02.05
137	2063	test	test	f	2026-06-28 14:00:02.051
138	2064	test	test	f	2026-06-28 14:00:02.053
139	2065	test	test	f	2026-06-28 14:00:02.054
140	2066	test	test	f	2026-06-28 14:00:02.054
141	2067	test	test	f	2026-06-28 14:00:02.055
142	2068	test	test	f	2026-06-28 14:00:02.056
143	2069	test	test	f	2026-06-28 14:00:02.057
144	2070	test	test	f	2026-06-28 14:00:02.059
145	2071	test	test	f	2026-06-28 14:00:02.059
146	2072	test	test	f	2026-06-28 14:00:02.06
147	2073	test	test	f	2026-06-28 14:00:02.062
148	2074	test	test	f	2026-06-28 14:00:02.063
149	2075	test	test	f	2026-06-28 14:00:02.064
150	2076	test	test	f	2026-06-28 14:00:02.065
151	2077	test	test	f	2026-06-28 14:00:02.066
152	2078	test	test	f	2026-06-28 14:00:02.067
153	2079	test	test	f	2026-06-28 14:00:02.068
154	2080	test	test	f	2026-06-28 14:00:02.069
155	2081	test	test	f	2026-06-28 14:00:02.07
156	2082	test	test	f	2026-06-28 14:00:02.072
157	2083	test	test	f	2026-06-28 14:00:02.073
158	2084	test	test	f	2026-06-28 14:00:02.074
159	2085	test	test	f	2026-06-28 14:00:02.075
160	2086	test	test	f	2026-06-28 14:00:02.076
161	2087	test	test	f	2026-06-28 14:00:02.077
162	2088	test	test	f	2026-06-28 14:00:02.078
163	2089	test	test	f	2026-06-28 14:00:02.079
164	2090	test	test	f	2026-06-28 14:00:02.08
165	2091	test	test	f	2026-06-28 14:00:02.081
166	2092	test	test	f	2026-06-28 14:00:02.083
167	2093	test	test	f	2026-06-28 14:00:02.085
168	2094	test	test	f	2026-06-28 14:00:02.086
169	2095	test	test	f	2026-06-28 14:00:02.087
170	2096	test	test	f	2026-06-28 14:00:02.089
171	2097	test	test	f	2026-06-28 14:00:02.09
172	2098	test	test	f	2026-06-28 14:00:02.092
173	2099	test	test	f	2026-06-28 14:00:02.093
174	2100	test	test	f	2026-06-28 14:00:02.094
175	2101	test	test	f	2026-06-28 14:00:02.096
176	2102	test	test	f	2026-06-28 14:00:02.097
177	2103	test	test	f	2026-06-28 14:00:02.098
178	2104	test	test	f	2026-06-28 14:00:02.099
179	2105	test	test	f	2026-06-28 14:00:02.1
180	2106	test	test	f	2026-06-28 14:00:02.101
181	2107	test	test	f	2026-06-28 14:00:02.102
182	2108	test	test	f	2026-06-28 14:00:02.104
183	2109	test	test	f	2026-06-28 14:00:02.105
184	2110	test	test	f	2026-06-28 14:00:02.106
185	2111	test	test	f	2026-06-28 14:00:02.107
186	2112	test	test	f	2026-06-28 14:00:02.108
187	2113	test	test	f	2026-06-28 14:00:02.109
188	2114	test	test	f	2026-06-28 14:00:02.11
189	2115	test	test	f	2026-06-28 14:00:02.11
190	2116	test	test	f	2026-06-28 14:00:02.112
191	2117	test	test	f	2026-06-28 14:00:02.114
192	2118	test	test	f	2026-06-28 14:00:02.115
193	2119	test	test	f	2026-06-28 14:00:02.117
194	2120	test	test	f	2026-06-28 14:00:02.118
195	2121	test	test	f	2026-06-28 14:00:02.118
196	2122	test	test	f	2026-06-28 14:00:02.119
197	2123	test	test	f	2026-06-28 14:00:02.12
198	2124	test	test	f	2026-06-28 14:00:02.122
199	2125	test	test	f	2026-06-28 14:00:02.124
200	2126	test	test	f	2026-06-28 14:00:02.125
201	2127	test	test	f	2026-06-28 14:00:02.125
202	2128	test	test	f	2026-06-28 14:00:02.126
203	2129	test	test	f	2026-06-28 14:00:02.127
204	2130	test	test	f	2026-06-28 14:00:02.128
205	2131	test	test	f	2026-06-28 14:00:02.129
206	2132	test	test	f	2026-06-28 14:00:02.13
207	2133	test	test	f	2026-06-28 14:00:02.131
208	2134	test	test	f	2026-06-28 14:00:02.132
209	2135	test	test	f	2026-06-28 14:00:02.133
210	2136	test	test	f	2026-06-28 14:00:02.134
211	2137	test	test	f	2026-06-28 14:00:02.136
212	2138	test	test	f	2026-06-28 14:00:02.137
213	2139	test	test	f	2026-06-28 14:00:02.138
214	2140	test	test	f	2026-06-28 14:00:02.139
215	2141	test	test	f	2026-06-28 14:00:02.14
216	2142	test	test	f	2026-06-28 14:00:02.141
217	2143	test	test	f	2026-06-28 14:00:02.143
218	2144	test	test	f	2026-06-28 14:00:02.144
219	2145	test	test	f	2026-06-28 14:00:02.146
220	2146	test	test	f	2026-06-28 14:00:02.147
221	2147	test	test	f	2026-06-28 14:00:02.149
222	2148	test	test	f	2026-06-28 14:00:02.15
223	2149	test	test	f	2026-06-28 14:00:02.151
224	2150	test	test	f	2026-06-28 14:00:02.153
225	2151	test	test	f	2026-06-28 14:00:02.154
226	2152	test	test	f	2026-06-28 14:00:02.156
227	2153	test	test	f	2026-06-28 14:00:02.157
228	2154	test	test	f	2026-06-28 14:00:02.158
229	2155	test	test	f	2026-06-28 14:00:02.159
230	2156	test	test	f	2026-06-28 14:00:02.16
231	2158	test	test	f	2026-06-28 14:00:02.16
232	2159	test	test	f	2026-06-28 14:00:02.162
233	2160	test	test	f	2026-06-28 14:00:02.163
234	2161	test	test	f	2026-06-28 14:00:02.163
235	2162	test	test	f	2026-06-28 14:00:02.164
236	2163	test	test	f	2026-06-28 14:00:02.165
237	2164	test	test	f	2026-06-28 14:00:02.166
238	2165	test	test	f	2026-06-28 14:00:02.167
239	2166	test	test	f	2026-06-28 14:00:02.168
240	2167	test	test	f	2026-06-28 14:00:02.169
241	2168	test	test	f	2026-06-28 14:00:02.17
242	2169	test	test	f	2026-06-28 14:00:02.17
243	2170	test	test	f	2026-06-28 14:00:02.172
244	2171	test	test	f	2026-06-28 14:00:02.173
245	2172	test	test	f	2026-06-28 14:00:02.174
246	2173	test	test	f	2026-06-28 14:00:02.175
247	2174	test	test	f	2026-06-28 14:00:02.176
248	2175	test	test	f	2026-06-28 14:00:02.177
249	2176	test	test	f	2026-06-28 14:00:02.178
250	2177	test	test	f	2026-06-28 14:00:02.179
251	2178	test	test	f	2026-06-28 14:00:02.18
252	2179	test	test	f	2026-06-28 14:00:02.182
253	2180	test	test	f	2026-06-28 14:00:02.184
254	2181	test	test	f	2026-06-28 14:00:02.185
255	2182	test	test	f	2026-06-28 14:00:02.186
256	2183	test	test	f	2026-06-28 14:00:02.187
257	2184	test	test	f	2026-06-28 14:00:02.188
258	2185	test	test	f	2026-06-28 14:00:02.189
259	2186	test	test	f	2026-06-28 14:00:02.19
260	2187	test	test	f	2026-06-28 14:00:02.192
261	2188	test	test	f	2026-06-28 14:00:02.193
262	2189	test	test	f	2026-06-28 14:00:02.193
263	2190	test	test	f	2026-06-28 14:00:02.194
264	2191	test	test	f	2026-06-28 14:00:02.195
265	2192	test	test	f	2026-06-28 14:00:02.196
266	2193	test	test	f	2026-06-28 14:00:02.196
267	2194	test	test	f	2026-06-28 14:00:02.197
268	2195	test	test	f	2026-06-28 14:00:02.198
269	2196	test	test	f	2026-06-28 14:00:02.198
270	2197	test	test	f	2026-06-28 14:00:02.199
271	2198	test	test	f	2026-06-28 14:00:02.2
272	2199	test	test	f	2026-06-28 14:00:02.201
273	2200	test	test	f	2026-06-28 14:00:02.203
274	2201	test	test	f	2026-06-28 14:00:02.204
275	2202	test	test	f	2026-06-28 14:00:02.205
276	2203	test	test	f	2026-06-28 14:00:02.205
277	2204	test	test	f	2026-06-28 14:00:02.206
278	2205	test	test	f	2026-06-28 14:00:02.207
279	2206	test	test	f	2026-06-28 14:00:02.208
280	2207	test	test	f	2026-06-28 14:00:02.209
281	2208	test	test	f	2026-06-28 14:00:02.21
282	2209	test	test	f	2026-06-28 14:00:02.212
283	2210	test	test	f	2026-06-28 14:00:02.213
284	2211	test	test	f	2026-06-28 14:00:02.214
285	2212	test	test	f	2026-06-28 14:00:02.215
286	2213	test	test	f	2026-06-28 14:00:02.215
287	2214	test	test	f	2026-06-28 14:00:02.216
288	2215	test	test	f	2026-06-28 14:00:02.217
289	2216	test	test	f	2026-06-28 14:00:02.217
290	2217	test	test	f	2026-06-28 14:00:02.218
291	2218	test	test	f	2026-06-28 14:00:02.219
292	2219	test	test	f	2026-06-28 14:00:02.22
293	2220	test	test	f	2026-06-28 14:00:02.22
294	2221	test	test	f	2026-06-28 14:00:02.221
295	2222	test	test	f	2026-06-28 14:00:02.223
296	2223	test	test	f	2026-06-28 14:00:02.223
297	2224	test	test	f	2026-06-28 14:00:02.224
298	2225	test	test	f	2026-06-28 14:00:02.225
299	2226	test	test	f	2026-06-28 14:00:02.226
300	2227	test	test	f	2026-06-28 14:00:02.227
301	2228	test	test	f	2026-06-28 14:00:02.228
302	2229	test	test	f	2026-06-28 14:00:02.229
303	2230	test	test	f	2026-06-28 14:00:02.23
304	2231	test	test	f	2026-06-28 14:00:02.23
305	2232	test	test	f	2026-06-28 14:00:02.232
306	2233	test	test	f	2026-06-28 14:00:02.233
307	2234	test	test	f	2026-06-28 14:00:02.233
308	2235	test	test	f	2026-06-28 14:00:02.234
309	2236	test	test	f	2026-06-28 14:00:02.235
310	2237	test	test	f	2026-06-28 14:00:02.236
311	2238	test	test	f	2026-06-28 14:00:02.236
312	2239	test	test	f	2026-06-28 14:00:02.237
313	2240	test	test	f	2026-06-28 14:00:02.238
314	2241	test	test	f	2026-06-28 14:00:02.239
315	2242	test	test	f	2026-06-28 14:00:02.239
316	2243	test	test	f	2026-06-28 14:00:02.24
317	2244	test	test	f	2026-06-28 14:00:02.241
318	2245	test	test	f	2026-06-28 14:00:02.241
319	2246	test	test	f	2026-06-28 14:00:02.242
320	2247	test	test	f	2026-06-28 14:00:02.243
321	2248	test	test	f	2026-06-28 14:00:02.245
322	2249	test	test	f	2026-06-28 14:00:02.246
323	2250	test	test	f	2026-06-28 14:00:02.246
324	2251	test	test	f	2026-06-28 14:00:02.247
325	2252	test	test	f	2026-06-28 14:00:02.248
326	2253	test	test	f	2026-06-28 14:00:02.249
327	2254	test	test	f	2026-06-28 14:00:02.249
328	2255	test	test	f	2026-06-28 14:00:02.25
329	2256	test	test	f	2026-06-28 14:00:02.251
330	2257	test	test	f	2026-06-28 14:00:02.252
331	2258	test	test	f	2026-06-28 14:00:02.253
332	2259	test	test	f	2026-06-28 14:00:02.254
333	2260	test	test	f	2026-06-28 14:00:02.254
334	2261	test	test	f	2026-06-28 14:00:02.255
335	2262	test	test	f	2026-06-28 14:00:02.256
336	2263	test	test	f	2026-06-28 14:00:02.257
337	2264	test	test	f	2026-06-28 14:00:02.258
338	2265	test	test	f	2026-06-28 14:00:02.259
339	2266	test	test	f	2026-06-28 14:00:02.26
340	2267	test	test	f	2026-06-28 14:00:02.26
341	2268	test	test	f	2026-06-28 14:00:02.261
342	2269	test	test	f	2026-06-28 14:00:02.263
343	2270	test	test	f	2026-06-28 14:00:02.264
344	2271	test	test	f	2026-06-28 14:00:02.265
345	2272	test	test	f	2026-06-28 14:00:02.265
346	2273	test	test	f	2026-06-28 14:00:02.266
347	2274	test	test	f	2026-06-28 14:00:02.266
348	2275	test	test	f	2026-06-28 14:00:02.267
349	2276	test	test	f	2026-06-28 14:00:02.268
350	2277	test	test	f	2026-06-28 14:00:02.268
351	2278	test	test	f	2026-06-28 14:00:02.269
352	2279	test	test	f	2026-06-28 14:00:02.27
353	2280	test	test	f	2026-06-28 14:00:02.27
354	2281	test	test	f	2026-06-28 14:00:02.272
355	2282	test	test	f	2026-06-28 14:00:02.273
356	2283	test	test	f	2026-06-28 14:00:02.274
357	2284	test	test	f	2026-06-28 14:00:02.275
358	2285	test	test	f	2026-06-28 14:00:02.276
359	2286	test	test	f	2026-06-28 14:00:02.277
360	2287	test	test	f	2026-06-28 14:00:02.278
361	2288	test	test	f	2026-06-28 14:00:02.279
362	2289	test	test	f	2026-06-28 14:00:02.28
363	2290	test	test	f	2026-06-28 14:00:02.281
364	2291	test	test	f	2026-06-28 14:00:02.282
365	2292	test	test	f	2026-06-28 14:00:02.283
366	2293	test	test	f	2026-06-28 14:00:02.284
367	2294	test	test	f	2026-06-28 14:00:02.285
368	2295	test	test	f	2026-06-28 14:00:02.285
369	2296	test	test	f	2026-06-28 14:00:02.286
370	2297	test	test	f	2026-06-28 14:00:02.286
371	2298	test	test	f	2026-06-28 14:00:02.287
372	2299	test	test	f	2026-06-28 14:00:02.287
373	2300	test	test	f	2026-06-28 14:00:02.288
374	2301	test	test	f	2026-06-28 14:00:02.289
375	2302	test	test	f	2026-06-28 14:00:02.29
376	2303	test	test	f	2026-06-28 14:00:02.29
377	2304	test	test	f	2026-06-28 14:00:02.292
378	2305	test	test	f	2026-06-28 14:00:02.293
379	2306	test	test	f	2026-06-28 14:00:02.294
380	2307	test	test	f	2026-06-28 14:00:02.295
381	2308	test	test	f	2026-06-28 14:00:02.296
382	2309	test	test	f	2026-06-28 14:00:02.297
383	2310	test	test	f	2026-06-28 14:00:02.298
384	2311	test	test	f	2026-06-28 14:00:02.299
385	2312	test	test	f	2026-06-28 14:00:02.3
386	2313	test	test	f	2026-06-28 14:00:02.302
387	2314	test	test	f	2026-06-28 14:00:02.303
388	2315	test	test	f	2026-06-28 14:00:02.304
389	2316	test	test	f	2026-06-28 14:00:02.305
390	2318	test	test	f	2026-06-28 14:00:02.306
391	2319	test	test	f	2026-06-28 14:00:02.307
392	2320	test	test	f	2026-06-28 14:00:02.308
393	2321	test	test	f	2026-06-28 14:00:02.309
394	2322	test	test	f	2026-06-28 14:00:02.309
395	2323	test	test	f	2026-06-28 14:00:02.31
396	2324	test	test	f	2026-06-28 14:00:02.312
397	2325	test	test	f	2026-06-28 14:00:02.313
398	2326	test	test	f	2026-06-28 14:00:02.313
399	2327	test	test	f	2026-06-28 14:00:02.314
400	2328	test	test	f	2026-06-28 14:00:02.315
401	2329	test	test	f	2026-06-28 14:00:02.315
402	2330	test	test	f	2026-06-28 14:00:02.316
403	2331	test	test	f	2026-06-28 14:00:02.317
404	2332	test	test	f	2026-06-28 14:00:02.317
405	2333	test	test	f	2026-06-28 14:00:02.318
406	2334	test	test	f	2026-06-28 14:00:02.318
407	2335	test	test	f	2026-06-28 14:00:02.319
408	2336	test	test	f	2026-06-28 14:00:02.32
409	2337	test	test	f	2026-06-28 14:00:02.322
410	2338	test	test	f	2026-06-28 14:00:02.323
411	2339	test	test	f	2026-06-28 14:00:02.325
412	2340	test	test	f	2026-06-28 14:00:02.325
413	2341	test	test	f	2026-06-28 14:00:02.326
414	2342	test	test	f	2026-06-28 14:00:02.327
415	2343	test	test	f	2026-06-28 14:00:02.328
416	2344	test	test	f	2026-06-28 14:00:02.329
417	2345	test	test	f	2026-06-28 14:00:02.33
418	2346	test	test	f	2026-06-28 14:00:02.331
419	2347	test	test	f	2026-06-28 14:00:02.332
420	2348	test	test	f	2026-06-28 14:00:02.334
421	2349	test	test	f	2026-06-28 14:00:02.335
422	2350	test	test	f	2026-06-28 14:00:02.335
423	2351	test	test	f	2026-06-28 14:00:02.337
424	2352	test	test	f	2026-06-28 14:00:02.338
425	2353	test	test	f	2026-06-28 14:00:02.338
426	2354	test	test	f	2026-06-28 14:00:02.339
427	2355	test	test	f	2026-06-28 14:00:02.34
428	2356	test	test	f	2026-06-28 14:00:02.34
429	2357	test	test	f	2026-06-28 14:00:02.341
430	2358	test	test	f	2026-06-28 14:00:02.342
431	2359	test	test	f	2026-06-28 14:00:02.343
432	2360	test	test	f	2026-06-28 14:00:02.343
433	2361	test	test	f	2026-06-28 14:00:02.344
434	2362	test	test	f	2026-06-28 14:00:02.345
435	2363	test	test	f	2026-06-28 14:00:02.346
436	2364	test	test	f	2026-06-28 14:00:02.346
437	2365	test	test	f	2026-06-28 14:00:02.347
438	2366	test	test	f	2026-06-28 14:00:02.348
439	2367	test	test	f	2026-06-28 14:00:02.349
440	2368	test	test	f	2026-06-28 14:00:02.349
441	2369	test	test	f	2026-06-28 14:00:02.35
442	2370	test	test	f	2026-06-28 14:00:02.351
443	2371	test	test	f	2026-06-28 14:00:02.352
444	2372	test	test	f	2026-06-28 14:00:02.354
445	2373	test	test	f	2026-06-28 14:00:02.355
446	2374	test	test	f	2026-06-28 14:00:02.356
447	2375	test	test	f	2026-06-28 14:00:02.357
448	2376	test	test	f	2026-06-28 14:00:02.358
449	2377	test	test	f	2026-06-28 14:00:02.359
450	2378	test	test	f	2026-06-28 14:00:02.36
451	2379	test	test	f	2026-06-28 14:00:02.36
452	2380	test	test	f	2026-06-28 14:00:02.362
453	2381	test	test	f	2026-06-28 14:00:02.363
454	2382	test	test	f	2026-06-28 14:00:02.363
455	2383	test	test	f	2026-06-28 14:00:02.364
456	2384	test	test	f	2026-06-28 14:00:02.365
457	2385	test	test	f	2026-06-28 14:00:02.365
458	2386	test	test	f	2026-06-28 14:00:02.366
459	2387	test	test	f	2026-06-28 14:00:02.367
460	2388	test	test	f	2026-06-28 14:00:02.368
461	2389	test	test	f	2026-06-28 14:00:02.369
462	2390	test	test	f	2026-06-28 14:00:02.37
463	2391	test	test	f	2026-06-28 14:00:02.37
464	2392	test	test	f	2026-06-28 14:00:02.371
465	2393	test	test	f	2026-06-28 14:00:02.372
466	2394	test	test	f	2026-06-28 14:00:02.373
467	2395	test	test	f	2026-06-28 14:00:02.374
468	2396	test	test	f	2026-06-28 14:00:02.375
469	2397	test	test	f	2026-06-28 14:00:02.376
470	2398	test	test	f	2026-06-28 14:00:02.377
471	2399	test	test	f	2026-06-28 14:00:02.377
472	2400	test	test	f	2026-06-28 14:00:02.378
473	2401	test	test	f	2026-06-28 14:00:02.379
474	2402	test	test	f	2026-06-28 14:00:02.379
475	2403	test	test	f	2026-06-28 14:00:02.38
476	2404	test	test	f	2026-06-28 14:00:02.381
477	2405	test	test	f	2026-06-28 14:00:02.383
478	2406	test	test	f	2026-06-28 14:00:02.383
479	2407	test	test	f	2026-06-28 14:00:02.384
480	2408	test	test	f	2026-06-28 14:00:02.385
481	2409	test	test	f	2026-06-28 14:00:02.386
482	2410	test	test	f	2026-06-28 14:00:02.386
483	2411	test	test	f	2026-06-28 14:00:02.387
484	2412	test	test	f	2026-06-28 14:00:02.388
485	2413	test	test	f	2026-06-28 14:00:02.388
486	2414	test	test	f	2026-06-28 14:00:02.389
487	2415	test	test	f	2026-06-28 14:00:02.389
488	2416	test	test	f	2026-06-28 14:00:02.39
489	2417	test	test	f	2026-06-28 14:00:02.39
490	2418	test	test	f	2026-06-28 14:00:02.391
491	2419	test	test	f	2026-06-28 14:00:02.392
492	2420	test	test	f	2026-06-28 14:00:02.393
493	2421	test	test	f	2026-06-28 14:00:02.393
494	2422	test	test	f	2026-06-28 14:00:02.394
495	2423	test	test	f	2026-06-28 14:00:02.395
496	2424	test	test	f	2026-06-28 14:00:02.396
497	2425	test	test	f	2026-06-28 14:00:02.396
498	2426	test	test	f	2026-06-28 14:00:02.397
499	2427	test	test	f	2026-06-28 14:00:02.398
500	2428	test	test	f	2026-06-28 14:00:02.398
501	2429	test	test	f	2026-06-28 14:00:02.399
502	2430	test	test	f	2026-06-28 14:00:02.399
503	2431	test	test	f	2026-06-28 14:00:02.4
504	2432	test	test	f	2026-06-28 14:00:02.4
505	2433	test	test	f	2026-06-28 14:00:02.401
506	2434	test	test	f	2026-06-28 14:00:02.401
507	2435	test	test	f	2026-06-28 14:00:02.403
508	2436	test	test	f	2026-06-28 14:00:02.404
509	2437	test	test	f	2026-06-28 14:00:02.404
510	2438	test	test	f	2026-06-28 14:00:02.405
511	2439	test	test	f	2026-06-28 14:00:02.406
512	2440	test	test	f	2026-06-28 14:00:02.407
513	2441	test	test	f	2026-06-28 14:00:02.407
514	2442	test	test	f	2026-06-28 14:00:02.408
515	2443	test	test	f	2026-06-28 14:00:02.409
516	2444	test	test	f	2026-06-28 14:00:02.41
517	2445	test	test	f	2026-06-28 14:00:02.41
518	2446	test	test	f	2026-06-28 14:00:02.411
519	2447	test	test	f	2026-06-28 14:00:02.412
520	2448	test	test	f	2026-06-28 14:00:02.413
521	2449	test	test	f	2026-06-28 14:00:02.414
522	2450	test	test	f	2026-06-28 14:00:02.415
523	2451	test	test	f	2026-06-28 14:00:02.416
524	2452	test	test	f	2026-06-28 14:00:02.417
525	2453	test	test	f	2026-06-28 14:00:02.418
526	2454	test	test	f	2026-06-28 14:00:02.418
527	2455	test	test	f	2026-06-28 14:00:02.419
528	2456	test	test	f	2026-06-28 14:00:02.42
529	2457	test	test	f	2026-06-28 14:00:02.42
530	2458	test	test	f	2026-06-28 14:00:02.421
531	2459	test	test	f	2026-06-28 14:00:02.422
532	2460	test	test	f	2026-06-28 14:00:02.423
533	2461	test	test	f	2026-06-28 14:00:02.423
534	2462	test	test	f	2026-06-28 14:00:02.424
535	2463	test	test	f	2026-06-28 14:00:02.425
536	2464	test	test	f	2026-06-28 14:00:02.425
537	2465	test	test	f	2026-06-28 14:00:02.426
538	2466	test	test	f	2026-06-28 14:00:02.426
539	2467	test	test	f	2026-06-28 14:00:02.427
540	2468	test	test	f	2026-06-28 14:00:02.427
541	2469	test	test	f	2026-06-28 14:00:02.428
542	2470	test	test	f	2026-06-28 14:00:02.429
543	2471	test	test	f	2026-06-28 14:00:02.43
544	2472	test	test	f	2026-06-28 14:00:02.432
545	2473	test	test	f	2026-06-28 14:00:02.433
546	2474	test	test	f	2026-06-28 14:00:02.434
547	2475	test	test	f	2026-06-28 14:00:02.435
548	2476	test	test	f	2026-06-28 14:00:02.436
549	2477	test	test	f	2026-06-28 14:00:02.437
550	2478	test	test	f	2026-06-28 14:00:02.439
551	2479	test	test	f	2026-06-28 14:00:02.44
552	2480	test	test	f	2026-06-28 14:00:02.441
553	2481	test	test	f	2026-06-28 14:00:02.442
554	2482	test	test	f	2026-06-28 14:00:02.443
555	2483	test	test	f	2026-06-28 14:00:02.444
556	2484	test	test	f	2026-06-28 14:00:02.445
557	2485	test	test	f	2026-06-28 14:00:02.446
558	2486	test	test	f	2026-06-28 14:00:02.447
559	2487	test	test	f	2026-06-28 14:00:02.447
560	2488	test	test	f	2026-06-28 14:00:02.448
561	2489	test	test	f	2026-06-28 14:00:02.448
562	2490	test	test	f	2026-06-28 14:00:02.449
563	2491	test	test	f	2026-06-28 14:00:02.45
564	2492	test	test	f	2026-06-28 14:00:02.45
565	2493	test	test	f	2026-06-28 14:00:02.451
566	2494	test	test	f	2026-06-28 14:00:02.452
567	2495	test	test	f	2026-06-28 14:00:02.453
568	2496	test	test	f	2026-06-28 14:00:02.454
569	2497	test	test	f	2026-06-28 14:00:02.454
570	2498	test	test	f	2026-06-28 14:00:02.455
571	2499	test	test	f	2026-06-28 14:00:02.455
572	2500	test	test	f	2026-06-28 14:00:02.456
573	2501	test	test	f	2026-06-28 14:00:02.456
574	2502	test	test	f	2026-06-28 14:00:02.457
575	2503	test	test	f	2026-06-28 14:00:02.458
576	2504	test	test	f	2026-06-28 14:00:02.459
577	2505	test	test	f	2026-06-28 14:00:02.46
578	2506	test	test	f	2026-06-28 14:00:02.46
579	2507	test	test	f	2026-06-28 14:00:02.462
580	2508	test	test	f	2026-06-28 14:00:02.462
581	2509	test	test	f	2026-06-28 14:00:02.463
582	2510	test	test	f	2026-06-28 14:00:02.464
583	2511	test	test	f	2026-06-28 14:00:02.465
584	2512	test	test	f	2026-06-28 14:00:02.465
585	2513	test	test	f	2026-06-28 14:00:02.466
586	2514	test	test	f	2026-06-28 14:00:02.466
587	2515	test	test	f	2026-06-28 14:00:02.467
588	2516	test	test	f	2026-06-28 14:00:02.468
589	2517	test	test	f	2026-06-28 14:00:02.469
590	2518	test	test	f	2026-06-28 14:00:02.469
591	2519	test	test	f	2026-06-28 14:00:02.471
592	2520	test	test	f	2026-06-28 14:00:02.472
593	2521	test	test	f	2026-06-28 14:00:02.473
594	2522	test	test	f	2026-06-28 14:00:02.473
595	2523	test	test	f	2026-06-28 14:00:02.474
596	2524	test	test	f	2026-06-28 14:00:02.474
597	2525	test	test	f	2026-06-28 14:00:02.474
598	2526	test	test	f	2026-06-28 14:00:02.475
599	2527	test	test	f	2026-06-28 14:00:02.476
600	2528	test	test	f	2026-06-28 14:00:02.477
601	2529	test	test	f	2026-06-28 14:00:02.478
602	2530	test	test	f	2026-06-28 14:00:02.479
603	2531	test	test	f	2026-06-28 14:00:02.48
604	2532	test	test	f	2026-06-28 14:00:02.48
605	2533	test	test	f	2026-06-28 14:00:02.481
606	2534	test	test	f	2026-06-28 14:00:02.482
607	2535	test	test	f	2026-06-28 14:00:02.483
608	2536	test	test	f	2026-06-28 14:00:02.484
609	2537	test	test	f	2026-06-28 14:00:02.485
610	2538	test	test	f	2026-06-28 14:00:02.485
611	2539	test	test	f	2026-06-28 14:00:02.486
612	2540	test	test	f	2026-06-28 14:00:02.487
613	2541	test	test	f	2026-06-28 14:00:02.488
614	2542	test	test	f	2026-06-28 14:00:02.489
615	2543	test	test	f	2026-06-28 14:00:02.489
616	2544	test	test	f	2026-06-28 14:00:02.49
617	2545	test	test	f	2026-06-28 14:00:02.49
618	2546	test	test	f	2026-06-28 14:00:02.491
619	2547	test	test	f	2026-06-28 14:00:02.492
620	2548	test	test	f	2026-06-28 14:00:02.493
621	2549	test	test	f	2026-06-28 14:00:02.494
622	2550	test	test	f	2026-06-28 14:00:02.495
623	2551	test	test	f	2026-06-28 14:00:02.495
624	2552	test	test	f	2026-06-28 14:00:02.496
625	2553	test	test	f	2026-06-28 14:00:02.496
626	2554	test	test	f	2026-06-28 14:00:02.497
627	2555	test	test	f	2026-06-28 14:00:02.497
628	2556	test	test	f	2026-06-28 14:00:02.498
629	2557	test	test	f	2026-06-28 14:00:02.498
630	2558	test	test	f	2026-06-28 14:00:02.499
631	2559	test	test	f	2026-06-28 14:00:02.499
632	2560	test	test	f	2026-06-28 14:00:02.5
633	2561	test	test	f	2026-06-28 14:00:02.501
634	2562	test	test	f	2026-06-28 14:00:02.502
635	2563	test	test	f	2026-06-28 14:00:02.503
636	2564	test	test	f	2026-06-28 14:00:02.504
637	2565	test	test	f	2026-06-28 14:00:02.505
638	2566	test	test	f	2026-06-28 14:00:02.506
639	2567	test	test	f	2026-06-28 14:00:02.506
640	2568	test	test	f	2026-06-28 14:00:02.507
641	2569	test	test	f	2026-06-28 14:00:02.508
642	2570	test	test	f	2026-06-28 14:00:02.508
643	2571	test	test	f	2026-06-28 14:00:02.509
644	2572	test	test	f	2026-06-28 14:00:02.509
1	2157	test	test	t	2026-06-28 14:00:01.929
\.


--
-- Data for Name: Order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Order" (id, "totalHarga", "metodePembayaran", status, "createdAt", "updatedAt") FROM stdin;
4	4000	CASH	BATAL	2026-06-28 08:44:40.472	2026-06-28 08:52:16.611
\.


--
-- Data for Name: OrderItem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."OrderItem" (id, "orderId", "produkId", jumlah, "hargaSatuan") FROM stdin;
4	4	1	2	2000
\.


--
-- Data for Name: PenarikanSimpanan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PenarikanSimpanan" (id, "anggotaId", nominal, "bankTujuan", "rekeningTujuan", status, "buktiTransferUrl", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Pengaduan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Pengaduan" (id, "anggotaId", kategori, subjek, deskripsi, "lampiranUrl", status, "balasanAdmin", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: PengaturanUmum; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PengaturanUmum" (id, kategori, nilai, "createdAt", "updatedAt") FROM stdin;
3	JENIS_SIMPANAN	POKOK	2026-06-27 12:41:26.499	2026-06-27 12:41:26.499
4	JENIS_SIMPANAN	WAJIB	2026-06-27 12:41:26.499	2026-06-27 12:41:26.499
5	JENIS_SIMPANAN	SUKARELA	2026-06-27 12:41:26.499	2026-06-27 12:41:26.499
22	BUNGA_PINJAMAN	1.5	2026-06-28 01:11:19.132	2026-06-28 01:11:19.132
23	BIAYA_ADMIN_PINJAMAN	1	2026-06-28 01:11:19.134	2026-06-28 01:11:19.134
24	BIAYA_ASURANSI_PINJAMAN	0.5	2026-06-28 01:11:19.136	2026-06-28 01:11:19.136
25	DENDA_KETERLAMBATAN_PER_HARI	0.5	2026-06-28 01:11:19.138	2026-06-28 01:11:19.138
26	NOMINAL_SIMPANAN_WAJIB	25000	2026-06-28 01:11:19.14	2026-06-28 01:11:19.14
27	PERSENTASE_SHU_DIBAGIKAN	80	2026-06-28 01:11:19.141	2026-06-28 01:11:19.141
28	REKENING_BANK_KOPERASI	Bank Mandiri - 123456789 a/n Koperasi Bakamla	2026-06-28 01:11:19.142	2026-06-28 01:11:19.142
29	QRIS_IMAGE_URL		2026-06-28 01:11:19.144	2026-06-28 01:11:19.144
\.


--
-- Data for Name: PeriodeSHU; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PeriodeSHU" (id, tahun, "totalSHUKotor", "persenCadangan", "persenPengurus", "persenPendidikan", "persenJasaModal", "persenJasaAnggota", status, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Pinjaman; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Pinjaman" (id, "anggotaId", nominal, tenor, "bungaPersen", "skemaBunga", "biayaAdmin", "biayaAsuransi", "nominalCair", "plafonMaksimal", status, kolektibilitas, "fileKtpUrl", "fileSlipGajiUrl", "tanggalCair", "createdAt", "updatedAt") FROM stdin;
10	2161	10000000	5	1	FLAT	0	0	10000000	\N	DICAIRKAN	LANCAR	\N	\N	2024-08-01 00:00:00	2024-08-01 08:00:00	2024-08-01 08:00:00
11	2559	13000000	12	1	FLAT	0	0	13000000	\N	DICAIRKAN	LANCAR	\N	\N	2024-08-01 00:00:00	2024-08-01 08:00:00	2024-08-01 08:00:00
12	1937	7380000	5	1	FLAT	0	0	7380000	\N	DICAIRKAN	LANCAR	\N	\N	2024-08-01 00:00:00	2024-08-01 08:00:00	2024-08-01 08:00:00
\.


--
-- Data for Name: Produk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Produk" (id, nama, kategori, "hargaJual", "hargaModal", stok, "gambarUrl", "createdAt", "updatedAt") FROM stdin;
1	Test	Sembako	2000	1000	2		2026-06-28 08:02:14.01	2026-06-28 08:52:16.607
\.


--
-- Data for Name: RiwayatSHU; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RiwayatSHU" (id, "periodeId", "anggotaId", "nominalJasaModal", "nominalJasaAnggota", "totalSHU", "statusPencairan", "createdAt") FROM stdin;
\.


--
-- Data for Name: Simpanan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Simpanan" (id, "anggotaId", "jenisSimpanan", saldo, "createdAt", "updatedAt") FROM stdin;
6101	2414	POKOK	50000	2026-06-27 12:42:13.39	2026-06-28 01:14:03.437
6125	2426	POKOK	50000	2026-06-27 12:42:13.425	2026-06-28 01:14:03.563
6367	2547	POKOK	0	2026-06-27 12:42:13.892	2026-06-28 01:13:59.621
6368	2547	WAJIB	0	2026-06-27 12:42:13.892	2026-06-28 01:13:59.621
6369	2548	POKOK	0	2026-06-27 12:42:13.894	2026-06-28 01:13:59.621
6373	2550	POKOK	0	2026-06-27 12:42:13.9	2026-06-28 01:13:59.621
6381	2554	POKOK	0	2026-06-27 12:42:13.913	2026-06-28 01:13:59.621
6389	2558	POKOK	0	2026-06-27 12:42:13.927	2026-06-28 01:13:59.621
6391	2559	POKOK	0	2026-06-27 12:42:13.931	2026-06-28 01:13:59.621
6395	2561	POKOK	0	2026-06-27 12:42:13.937	2026-06-28 01:13:59.621
6397	2562	POKOK	0	2026-06-27 12:42:13.94	2026-06-28 01:13:59.621
6399	2563	POKOK	0	2026-06-27 12:42:13.942	2026-06-28 01:13:59.621
6405	2566	POKOK	0	2026-06-27 12:42:13.953	2026-06-28 01:13:59.621
6409	2568	POKOK	0	2026-06-27 12:42:13.96	2026-06-28 01:13:59.621
5357	2042	POKOK	50000	2026-06-27 12:42:12.061	2026-06-28 01:13:59.785
5470	2098	WAJIB	200000	2026-06-27 12:42:12.233	2026-06-28 01:14:00.965
5588	2157	WAJIB	175000	2026-06-27 12:42:12.409	2026-06-28 01:33:35.392
5382	2054	WAJIB	175000	2026-06-27 12:42:12.099	2026-06-28 01:13:59.871
5492	2109	WAJIB	175000	2026-06-27 12:42:12.267	2026-06-28 01:14:01.046
5519	2123	POKOK	100000	2026-06-27 12:42:12.305	2026-06-28 01:14:01.133
5404	2065	WAJIB	175000	2026-06-27 12:42:12.13	2026-06-28 01:13:59.951
5408	2067	WAJIB	100000	2026-06-27 12:42:12.136	2026-06-28 01:13:59.968
5163	1945	POKOK	50000	2026-06-27 12:42:11.689	2026-06-28 01:14:00.139
5524	2125	WAJIB	175000	2026-06-27 12:42:12.312	2026-06-28 01:14:01.146
6410	2568	WAJIB	0	2026-06-27 12:42:13.96	2026-06-28 01:13:59.621
5166	1946	WAJIB	200000	2026-06-27 12:42:11.693	2026-06-28 01:14:00.159
5191	1959	POKOK	50000	2026-06-27 12:42:11.742	2026-06-28 01:14:00.248
5528	2127	WAJIB	200000	2026-06-27 12:42:12.318	2026-06-28 01:14:01.16
5553	2140	POKOK	50000	2026-06-27 12:42:12.356	2026-06-28 01:14:01.239
5573	2150	POKOK	50000	2026-06-27 12:42:12.387	2026-06-28 01:14:01.328
5216	1971	WAJIB	175000	2026-06-27 12:42:11.801	2026-06-28 01:14:00.344
5240	1983	WAJIB	175000	2026-06-27 12:42:11.861	2026-06-28 01:14:00.425
5264	1995	WAJIB	175000	2026-06-27 12:42:11.904	2026-06-28 01:14:00.513
5283	2005	POKOK	50000	2026-06-27 12:42:11.938	2026-06-28 01:14:00.578
5287	2007	POKOK	50000	2026-06-27 12:42:11.944	2026-06-28 01:14:00.59
5309	2018	POKOK	50000	2026-06-27 12:42:11.981	2026-06-28 01:14:00.667
5596	2161	WAJIB	200000	2026-06-27 12:42:12.426	2026-06-28 01:14:01.426
5334	2030	WAJIB	200000	2026-06-27 12:42:12.019	2026-06-28 01:14:00.752
5430	2078	WAJIB	200000	2026-06-27 12:42:12.169	2026-06-28 01:14:00.808
5451	2089	POKOK	50000	2026-06-27 12:42:12.202	2026-06-28 01:14:00.887
6415	2571	POKOK	0	2026-06-27 12:42:13.97	2026-06-28 01:13:59.621
5169	1948	POKOK	0	2026-06-27 12:42:11.706	2026-06-28 01:13:59.621
5171	1949	POKOK	0	2026-06-27 12:42:11.709	2026-06-28 01:13:59.621
5175	1951	POKOK	0	2026-06-27 12:42:11.714	2026-06-28 01:13:59.621
5177	1952	POKOK	0	2026-06-27 12:42:11.718	2026-06-28 01:13:59.621
5181	1954	POKOK	0	2026-06-27 12:42:11.725	2026-06-28 01:13:59.621
5183	1955	POKOK	0	2026-06-27 12:42:11.728	2026-06-28 01:13:59.621
5185	1956	POKOK	0	2026-06-27 12:42:11.731	2026-06-28 01:13:59.621
5187	1957	POKOK	0	2026-06-27 12:42:11.733	2026-06-28 01:13:59.621
5193	1960	POKOK	0	2026-06-27 12:42:11.75	2026-06-28 01:13:59.621
5197	1962	POKOK	0	2026-06-27 12:42:11.756	2026-06-28 01:13:59.621
5201	1964	POKOK	0	2026-06-27 12:42:11.764	2026-06-28 01:13:59.621
5203	1965	POKOK	0	2026-06-27 12:42:11.768	2026-06-28 01:13:59.621
5209	1968	POKOK	0	2026-06-27 12:42:11.783	2026-06-28 01:13:59.621
5211	1969	POKOK	0	2026-06-27 12:42:11.788	2026-06-28 01:13:59.621
5213	1970	POKOK	0	2026-06-27 12:42:11.794	2026-06-28 01:13:59.621
5215	1971	POKOK	0	2026-06-27 12:42:11.8	2026-06-28 01:13:59.621
5219	1973	POKOK	0	2026-06-27 12:42:11.808	2026-06-28 01:13:59.621
5221	1974	POKOK	0	2026-06-27 12:42:11.812	2026-06-28 01:13:59.621
5225	1976	POKOK	0	2026-06-27 12:42:11.822	2026-06-28 01:13:59.621
5233	1980	POKOK	0	2026-06-27 12:42:11.848	2026-06-28 01:13:59.621
5235	1981	POKOK	0	2026-06-27 12:42:11.852	2026-06-28 01:13:59.621
5237	1982	POKOK	0	2026-06-27 12:42:11.856	2026-06-28 01:13:59.621
5239	1983	POKOK	0	2026-06-27 12:42:11.861	2026-06-28 01:13:59.621
5245	1986	POKOK	0	2026-06-27 12:42:11.873	2026-06-28 01:13:59.621
5247	1987	POKOK	0	2026-06-27 12:42:11.877	2026-06-28 01:13:59.621
5253	1990	POKOK	0	2026-06-27 12:42:11.887	2026-06-28 01:13:59.621
5255	1991	POKOK	0	2026-06-27 12:42:11.89	2026-06-28 01:13:59.621
5259	1993	POKOK	0	2026-06-27 12:42:11.898	2026-06-28 01:13:59.621
5261	1994	POKOK	0	2026-06-27 12:42:11.901	2026-06-28 01:13:59.621
5263	1995	POKOK	0	2026-06-27 12:42:11.904	2026-06-28 01:13:59.621
5267	1997	POKOK	0	2026-06-27 12:42:11.91	2026-06-28 01:13:59.621
5271	1999	POKOK	0	2026-06-27 12:42:11.917	2026-06-28 01:13:59.621
5273	2000	POKOK	0	2026-06-27 12:42:11.92	2026-06-28 01:13:59.621
5275	2001	POKOK	0	2026-06-27 12:42:11.923	2026-06-28 01:13:59.621
5165	1946	POKOK	50000	2026-06-27 12:42:11.693	2026-06-28 01:14:00.15
5167	1947	POKOK	50000	2026-06-27 12:42:11.703	2026-06-28 01:14:00.16
5170	1948	WAJIB	25000	2026-06-27 12:42:11.707	2026-06-28 01:14:00.176
5172	1949	WAJIB	175000	2026-06-27 12:42:11.709	2026-06-28 01:14:00.187
5173	1950	POKOK	50000	2026-06-27 12:42:11.711	2026-06-28 01:14:00.188
5176	1951	WAJIB	175000	2026-06-27 12:42:11.714	2026-06-28 01:14:00.211
5174	1950	WAJIB	200000	2026-06-27 12:42:11.712	2026-06-28 01:14:00.202
5178	1952	WAJIB	175000	2026-06-27 12:42:11.719	2026-06-28 01:14:00.218
5179	1953	POKOK	50000	2026-06-27 12:42:11.722	2026-06-28 01:14:00.218
5180	1953	WAJIB	125000	2026-06-27 12:42:11.723	2026-06-28 01:14:00.223
5184	1955	WAJIB	175000	2026-06-27 12:42:11.729	2026-06-28 01:14:00.234
5182	1954	WAJIB	100000	2026-06-27 12:42:11.726	2026-06-28 01:14:00.227
5186	1956	WAJIB	175000	2026-06-27 12:42:11.731	2026-06-28 01:14:00.239
5624	2175	WAJIB	175000	2026-06-27 12:42:12.469	2026-06-28 01:14:01.515
5647	2187	POKOK	50000	2026-06-27 12:42:12.507	2026-06-28 01:14:01.587
5650	2188	WAJIB	175000	2026-06-27 12:42:12.51	2026-06-28 01:14:01.6
5713	2220	POKOK	50000	2026-06-27 12:42:12.63	2026-06-28 01:14:01.826
5692	2209	WAJIB	100000	2026-06-27 12:42:12.59	2026-06-28 01:14:01.747
5736	2231	WAJIB	175000	2026-06-27 12:42:12.67	2026-06-28 01:14:01.91
5766	2246	WAJIB	175000	2026-06-27 12:42:12.728	2026-06-28 01:14:02.014
5760	2243	WAJIB	200000	2026-06-27 12:42:12.716	2026-06-28 01:14:01.996
5772	2249	WAJIB	175000	2026-06-27 12:42:12.738	2026-06-28 01:14:02.043
5858	2292	WAJIB	175000	2026-06-27 12:42:12.902	2026-06-28 01:14:02.386
5792	2259	WAJIB	200000	2026-06-27 12:42:12.783	2026-06-28 01:14:02.114
5816	2271	WAJIB	200000	2026-06-27 12:42:12.825	2026-06-28 01:14:02.219
5834	2280	WAJIB	200000	2026-06-27 12:42:12.861	2026-06-28 01:14:02.296
5885	2306	POKOK	50000	2026-06-27 12:42:12.949	2026-06-28 01:14:02.487
5880	2303	WAJIB	200000	2026-06-27 12:42:12.941	2026-06-28 01:14:02.466
5911	2319	POKOK	50000	2026-06-27 12:42:12.993	2026-06-28 01:14:02.622
5888	2307	WAJIB	200000	2026-06-27 12:42:12.953	2026-06-28 01:14:02.507
5964	2345	WAJIB	175000	2026-06-27 12:42:13.104	2026-06-28 01:14:02.816
5936	2331	WAJIB	300000	2026-06-27 12:42:13.047	2026-06-28 01:14:02.84
6005	2366	POKOK	50000	2026-06-27 12:42:13.193	2026-06-28 01:14:02.986
6403	2565	POKOK	50000	2026-06-27 12:42:13.949	2026-06-28 01:14:03.074
6008	2367	WAJIB	200000	2026-06-27 12:42:13.199	2026-06-28 01:14:03.001
6031	2379	POKOK	50000	2026-06-27 12:42:13.249	2026-06-28 01:14:03.089
6057	2392	POKOK	50000	2026-06-27 12:42:13.301	2026-06-28 01:14:03.186
6130	2428	WAJIB	175000	2026-06-27 12:42:13.431	2026-06-28 01:14:03.594
6078	2402	WAJIB	200000	2026-06-27 12:42:13.343	2026-06-28 01:14:03.275
6202	2464	WAJIB	175000	2026-06-27 12:42:13.564	2026-06-28 01:14:03.895
6156	2441	WAJIB	200000	2026-06-27 12:42:13.47	2026-06-28 01:14:03.719
6178	2452	WAJIB	200000	2026-06-27 12:42:13.513	2026-06-28 01:14:03.807
6229	2478	POKOK	50000	2026-06-27 12:42:13.62	2026-06-28 01:14:03.985
6365	2546	POKOK	50000	2026-06-27 12:42:13.886	2026-06-28 01:14:04.494
6370	2548	WAJIB	175000	2026-06-27 12:42:13.894	2026-06-28 01:14:04.509
6366	2546	WAJIB	200000	2026-06-27 12:42:13.887	2026-06-28 01:14:04.5
6371	2549	POKOK	50000	2026-06-27 12:42:13.897	2026-06-28 01:14:04.511
6375	2551	POKOK	50000	2026-06-27 12:42:13.903	2026-06-28 01:14:04.526
6372	2549	WAJIB	200000	2026-06-27 12:42:13.898	2026-06-28 01:14:04.52
6377	2552	POKOK	50000	2026-06-27 12:42:13.906	2026-06-28 01:14:04.534
6376	2551	WAJIB	200000	2026-06-27 12:42:13.903	2026-06-28 01:14:04.533
6379	2553	POKOK	50000	2026-06-27 12:42:13.91	2026-06-28 01:14:04.541
6378	2552	WAJIB	200000	2026-06-27 12:42:13.907	2026-06-28 01:14:04.54
6382	2554	WAJIB	175000	2026-06-27 12:42:13.914	2026-06-28 01:14:04.553
6380	2553	WAJIB	200000	2026-06-27 12:42:13.911	2026-06-28 01:14:04.547
6383	2555	POKOK	50000	2026-06-27 12:42:13.916	2026-06-28 01:14:04.553
6385	2556	POKOK	50000	2026-06-27 12:42:13.92	2026-06-28 01:14:04.56
6384	2555	WAJIB	200000	2026-06-27 12:42:13.917	2026-06-28 01:14:04.559
6387	2557	POKOK	50000	2026-06-27 12:42:13.923	2026-06-28 01:14:04.567
6386	2556	WAJIB	200000	2026-06-27 12:42:13.921	2026-06-28 01:14:04.566
6390	2558	WAJIB	175000	2026-06-27 12:42:13.928	2026-06-28 01:14:04.582
6388	2557	WAJIB	200000	2026-06-27 12:42:13.924	2026-06-28 01:14:04.574
6392	2559	WAJIB	25000	2026-06-27 12:42:13.931	2026-06-28 01:14:04.583
6393	2560	POKOK	50000	2026-06-27 12:42:13.933	2026-06-28 01:14:04.584
6396	2561	WAJIB	25000	2026-06-27 12:42:13.938	2026-06-28 01:14:04.596
6398	2562	WAJIB	25000	2026-06-27 12:42:13.941	2026-06-28 01:14:04.597
6400	2563	WAJIB	175000	2026-06-27 12:42:13.943	2026-06-28 01:14:04.607
6401	2564	POKOK	50000	2026-06-27 12:42:13.945	2026-06-28 01:14:04.608
6406	2566	WAJIB	175000	2026-06-27 12:42:13.954	2026-06-28 01:14:04.627
6402	2564	WAJIB	200000	2026-06-27 12:42:13.945	2026-06-28 01:14:04.615
6404	2565	WAJIB	200000	2026-06-27 12:42:13.949	2026-06-28 01:14:04.622
6407	2567	POKOK	50000	2026-06-27 12:42:13.956	2026-06-28 01:14:04.628
6411	2569	POKOK	50000	2026-06-27 12:42:13.963	2026-06-28 01:14:04.643
6408	2567	WAJIB	200000	2026-06-27 12:42:13.957	2026-06-28 01:14:04.635
6413	2570	POKOK	50000	2026-06-27 12:42:13.966	2026-06-28 01:14:04.667
6412	2569	WAJIB	200000	2026-06-27 12:42:13.963	2026-06-28 01:14:04.667
6416	2571	WAJIB	175000	2026-06-27 12:42:13.97	2026-06-28 01:14:04.682
6414	2570	WAJIB	200000	2026-06-27 12:42:13.967	2026-06-28 01:14:04.675
6417	2572	POKOK	50000	2026-06-27 12:42:13.972	2026-06-28 01:14:04.684
6418	2572	WAJIB	200000	2026-06-27 12:42:13.973	2026-06-28 01:14:04.695
5285	2006	POKOK	0	2026-06-27 12:42:11.942	2026-06-28 01:13:59.621
5291	2009	POKOK	0	2026-06-27 12:42:11.951	2026-06-28 01:13:59.621
5297	2012	POKOK	0	2026-06-27 12:42:11.962	2026-06-28 01:13:59.621
5299	2013	POKOK	0	2026-06-27 12:42:11.964	2026-06-28 01:13:59.621
5303	2015	POKOK	0	2026-06-27 12:42:11.971	2026-06-28 01:13:59.621
5305	2016	POKOK	0	2026-06-27 12:42:11.974	2026-06-28 01:13:59.621
5311	2019	POKOK	0	2026-06-27 12:42:11.984	2026-06-28 01:13:59.621
5315	2021	POKOK	0	2026-06-27 12:42:11.992	2026-06-28 01:13:59.621
5317	2022	POKOK	0	2026-06-27 12:42:11.994	2026-06-28 01:13:59.621
5323	2025	POKOK	0	2026-06-27 12:42:12.004	2026-06-28 01:13:59.621
5325	2026	POKOK	0	2026-06-27 12:42:12.007	2026-06-28 01:13:59.621
5327	2027	POKOK	0	2026-06-27 12:42:12.009	2026-06-28 01:13:59.621
5329	2028	POKOK	0	2026-06-27 12:42:12.012	2026-06-28 01:13:59.621
5331	2029	POKOK	0	2026-06-27 12:42:12.015	2026-06-28 01:13:59.621
5335	2031	POKOK	0	2026-06-27 12:42:12.022	2026-06-28 01:13:59.621
5339	2033	POKOK	0	2026-06-27 12:42:12.028	2026-06-28 01:13:59.621
5343	2035	POKOK	0	2026-06-27 12:42:12.035	2026-06-28 01:13:59.621
5345	2036	POKOK	0	2026-06-27 12:42:12.038	2026-06-28 01:13:59.621
5351	2039	POKOK	0	2026-06-27 12:42:12.049	2026-06-28 01:13:59.621
5353	2040	POKOK	0	2026-06-27 12:42:12.052	2026-06-28 01:13:59.621
5361	2044	POKOK	0	2026-06-27 12:42:12.068	2026-06-28 01:13:59.621
5363	2045	POKOK	0	2026-06-27 12:42:12.071	2026-06-28 01:13:59.621
5365	2046	POKOK	0	2026-06-27 12:42:12.074	2026-06-28 01:13:59.621
5369	2048	POKOK	0	2026-06-27 12:42:12.081	2026-06-28 01:13:59.621
5375	2051	POKOK	0	2026-06-27 12:42:12.089	2026-06-28 01:13:59.621
5377	2052	POKOK	0	2026-06-27 12:42:12.092	2026-06-28 01:13:59.621
5379	2053	POKOK	0	2026-06-27 12:42:12.095	2026-06-28 01:13:59.621
5381	2054	POKOK	0	2026-06-27 12:42:12.098	2026-06-28 01:13:59.621
5383	2055	POKOK	0	2026-06-27 12:42:12.101	2026-06-28 01:13:59.621
5385	2056	POKOK	0	2026-06-27 12:42:12.103	2026-06-28 01:13:59.621
5389	2058	POKOK	0	2026-06-27 12:42:12.109	2026-06-28 01:13:59.621
5395	2061	POKOK	0	2026-06-27 12:42:12.118	2026-06-28 01:13:59.621
5399	2063	POKOK	0	2026-06-27 12:42:12.124	2026-06-28 01:13:59.621
5401	2064	POKOK	0	2026-06-27 12:42:12.127	2026-06-28 01:13:59.621
5189	1958	POKOK	50000	2026-06-27 12:42:11.737	2026-06-28 01:14:00.242
5195	1961	POKOK	50000	2026-06-27 12:42:11.753	2026-06-28 01:14:00.261
5192	1959	WAJIB	200000	2026-06-27 12:42:11.745	2026-06-28 01:14:00.257
5194	1960	WAJIB	100000	2026-06-27 12:42:11.751	2026-06-28 01:14:00.26
5196	1961	WAJIB	125000	2026-06-27 12:42:11.753	2026-06-28 01:14:00.267
5199	1963	POKOK	50000	2026-06-27 12:42:11.76	2026-06-28 01:14:00.275
5198	1962	WAJIB	100000	2026-06-27 12:42:11.757	2026-06-28 01:14:00.273
5200	1963	WAJIB	125000	2026-06-27 12:42:11.761	2026-06-28 01:14:00.286
5202	1964	WAJIB	175000	2026-06-27 12:42:11.764	2026-06-28 01:14:00.297
5204	1965	WAJIB	175000	2026-06-27 12:42:11.769	2026-06-28 01:14:00.306
5205	1966	POKOK	50000	2026-06-27 12:42:11.772	2026-06-28 01:14:00.307
5207	1967	POKOK	50000	2026-06-27 12:42:11.777	2026-06-28 01:14:00.317
5206	1966	WAJIB	200000	2026-06-27 12:42:11.772	2026-06-28 01:14:00.316
5210	1968	WAJIB	175000	2026-06-27 12:42:11.784	2026-06-28 01:14:00.329
5208	1967	WAJIB	200000	2026-06-27 12:42:11.779	2026-06-28 01:14:00.324
5212	1969	WAJIB	175000	2026-06-27 12:42:11.789	2026-06-28 01:14:00.336
5217	1972	POKOK	50000	2026-06-27 12:42:11.804	2026-06-28 01:14:00.345
5220	1973	WAJIB	25000	2026-06-27 12:42:11.809	2026-06-28 01:14:00.353
5218	1972	WAJIB	200000	2026-06-27 12:42:11.804	2026-06-28 01:14:00.353
5222	1974	WAJIB	175000	2026-06-27 12:42:11.813	2026-06-28 01:14:00.358
5223	1975	POKOK	50000	2026-06-27 12:42:11.818	2026-06-28 01:14:00.359
5227	1977	POKOK	50000	2026-06-27 12:42:11.825	2026-06-28 01:14:00.375
5224	1975	WAJIB	200000	2026-06-27 12:42:11.819	2026-06-28 01:14:00.369
5226	1976	WAJIB	100000	2026-06-27 12:42:11.822	2026-06-28 01:14:00.374
5229	1978	POKOK	50000	2026-06-27 12:42:11.831	2026-06-28 01:14:00.388
5228	1977	WAJIB	200000	2026-06-27 12:42:11.825	2026-06-28 01:14:00.386
5231	1979	POKOK	50000	2026-06-27 12:42:11.841	2026-06-28 01:14:00.397
5230	1978	WAJIB	200000	2026-06-27 12:42:11.833	2026-06-28 01:14:00.396
5234	1980	WAJIB	175000	2026-06-27 12:42:11.849	2026-06-28 01:14:00.41
5232	1979	WAJIB	200000	2026-06-27 12:42:11.842	2026-06-28 01:14:00.404
5238	1982	WAJIB	175000	2026-06-27 12:42:11.857	2026-06-28 01:14:00.419
5236	1981	WAJIB	100000	2026-06-27 12:42:11.853	2026-06-28 01:14:00.414
5241	1984	POKOK	50000	2026-06-27 12:42:11.865	2026-06-28 01:14:00.426
5243	1985	POKOK	50000	2026-06-27 12:42:11.87	2026-06-28 01:14:00.435
5248	1987	WAJIB	175000	2026-06-27 12:42:11.878	2026-06-28 01:14:00.452
5244	1985	WAJIB	200000	2026-06-27 12:42:11.871	2026-06-28 01:14:00.441
5246	1986	WAJIB	100000	2026-06-27 12:42:11.874	2026-06-28 01:14:00.445
5249	1988	POKOK	50000	2026-06-27 12:42:11.88	2026-06-28 01:14:00.453
5251	1989	POKOK	50000	2026-06-27 12:42:11.884	2026-06-28 01:14:00.464
5250	1988	WAJIB	200000	2026-06-27 12:42:11.881	2026-06-28 01:14:00.463
5254	1990	WAJIB	175000	2026-06-27 12:42:11.888	2026-06-28 01:14:00.48
5252	1989	WAJIB	200000	2026-06-27 12:42:11.884	2026-06-28 01:14:00.473
5257	1992	POKOK	50000	2026-06-27 12:42:11.893	2026-06-28 01:14:00.485
5256	1991	WAJIB	100000	2026-06-27 12:42:11.891	2026-06-28 01:14:00.485
5260	1993	WAJIB	175000	2026-06-27 12:42:11.898	2026-06-28 01:14:00.498
5258	1992	WAJIB	200000	2026-06-27 12:42:11.894	2026-06-28 01:14:00.492
5262	1994	WAJIB	175000	2026-06-27 12:42:11.901	2026-06-28 01:14:00.505
5265	1996	POKOK	50000	2026-06-27 12:42:11.907	2026-06-28 01:14:00.513
5269	1998	POKOK	50000	2026-06-27 12:42:11.913	2026-06-28 01:14:00.525
5268	1997	WAJIB	150000	2026-06-27 12:42:11.911	2026-06-28 01:14:00.525
5274	2000	WAJIB	175000	2026-06-27 12:42:11.921	2026-06-28 01:14:00.547
5270	1998	WAJIB	200000	2026-06-27 12:42:11.914	2026-06-28 01:14:00.532
5272	1999	WAJIB	100000	2026-06-27 12:42:11.918	2026-06-28 01:14:00.536
5276	2001	WAJIB	175000	2026-06-27 12:42:11.924	2026-06-28 01:14:00.555
5277	2002	POKOK	50000	2026-06-27 12:42:11.926	2026-06-28 01:14:00.557
5279	2003	POKOK	50000	2026-06-27 12:42:11.931	2026-06-28 01:14:00.566
5278	2002	WAJIB	200000	2026-06-27 12:42:11.926	2026-06-28 01:14:00.565
5280	2003	WAJIB	125000	2026-06-27 12:42:11.931	2026-06-28 01:14:00.569
5281	2004	POKOK	50000	2026-06-27 12:42:11.934	2026-06-28 01:14:00.57
5286	2006	WAJIB	175000	2026-06-27 12:42:11.942	2026-06-28 01:14:00.589
5282	2004	WAJIB	200000	2026-06-27 12:42:11.935	2026-06-28 01:14:00.577
5284	2005	WAJIB	200000	2026-06-27 12:42:11.939	2026-06-28 01:14:00.584
5289	2008	POKOK	50000	2026-06-27 12:42:11.948	2026-06-28 01:14:00.598
5288	2007	WAJIB	200000	2026-06-27 12:42:11.945	2026-06-28 01:14:00.597
5293	2010	POKOK	50000	2026-06-27 12:42:11.955	2026-06-28 01:14:00.607
5292	2009	WAJIB	100000	2026-06-27 12:42:11.952	2026-06-28 01:14:00.606
5295	2011	POKOK	50000	2026-06-27 12:42:11.959	2026-06-28 01:14:00.614
5294	2010	WAJIB	200000	2026-06-27 12:42:11.956	2026-06-28 01:14:00.613
5298	2012	WAJIB	175000	2026-06-27 12:42:11.963	2026-06-28 01:14:00.632
5296	2011	WAJIB	200000	2026-06-27 12:42:11.959	2026-06-28 01:14:00.623
5300	2013	WAJIB	175000	2026-06-27 12:42:11.965	2026-06-28 01:14:00.64
5301	2014	POKOK	50000	2026-06-27 12:42:11.967	2026-06-28 01:14:00.642
5302	2014	WAJIB	125000	2026-06-27 12:42:11.968	2026-06-28 01:14:00.646
5304	2015	WAJIB	175000	2026-06-27 12:42:11.972	2026-06-28 01:14:00.653
5306	2016	WAJIB	175000	2026-06-27 12:42:11.974	2026-06-28 01:14:00.658
5307	2017	POKOK	50000	2026-06-27 12:42:11.977	2026-06-28 01:14:00.659
5312	2019	WAJIB	175000	2026-06-27 12:42:11.984	2026-06-28 01:14:00.679
5308	2017	WAJIB	200000	2026-06-27 12:42:11.978	2026-06-28 01:14:00.666
5310	2018	WAJIB	200000	2026-06-27 12:42:11.981	2026-06-28 01:14:00.674
5313	2020	POKOK	50000	2026-06-27 12:42:11.987	2026-06-28 01:14:00.68
5403	2065	POKOK	0	2026-06-27 12:42:12.13	2026-06-28 01:13:59.621
5407	2067	POKOK	0	2026-06-27 12:42:12.135	2026-06-28 01:13:59.621
5409	2068	POKOK	0	2026-06-27 12:42:12.138	2026-06-28 01:13:59.621
5411	2069	POKOK	0	2026-06-27 12:42:12.141	2026-06-28 01:13:59.621
5421	2074	POKOK	0	2026-06-27 12:42:12.158	2026-06-28 01:13:59.621
5425	2076	POKOK	0	2026-06-27 12:42:12.163	2026-06-28 01:13:59.621
5427	2077	POKOK	0	2026-06-27 12:42:12.166	2026-06-28 01:13:59.621
5437	2082	POKOK	0	2026-06-27 12:42:12.182	2026-06-28 01:13:59.621
5439	2083	POKOK	0	2026-06-27 12:42:12.184	2026-06-28 01:13:59.621
5445	2086	POKOK	0	2026-06-27 12:42:12.194	2026-06-28 01:13:59.621
5449	2088	POKOK	0	2026-06-27 12:42:12.2	2026-06-28 01:13:59.621
5461	2094	POKOK	0	2026-06-27 12:42:12.22	2026-06-28 01:13:59.621
5465	2096	POKOK	0	2026-06-27 12:42:12.227	2026-06-28 01:13:59.621
5475	2101	POKOK	0	2026-06-27 12:42:12.242	2026-06-28 01:13:59.621
5481	2104	POKOK	0	2026-06-27 12:42:12.251	2026-06-28 01:13:59.621
5483	2105	POKOK	0	2026-06-27 12:42:12.254	2026-06-28 01:13:59.621
5489	2108	POKOK	0	2026-06-27 12:42:12.264	2026-06-28 01:13:59.621
5491	2109	POKOK	0	2026-06-27 12:42:12.266	2026-06-28 01:13:59.621
5493	2110	POKOK	0	2026-06-27 12:42:12.269	2026-06-28 01:13:59.621
5495	2111	POKOK	0	2026-06-27 12:42:12.271	2026-06-28 01:13:59.621
5499	2113	POKOK	0	2026-06-27 12:42:12.278	2026-06-28 01:13:59.621
5503	2115	POKOK	0	2026-06-27 12:42:12.283	2026-06-28 01:13:59.621
5505	2116	POKOK	0	2026-06-27 12:42:12.286	2026-06-28 01:13:59.621
5507	2117	POKOK	0	2026-06-27 12:42:12.288	2026-06-28 01:13:59.621
5509	2118	POKOK	0	2026-06-27 12:42:12.291	2026-06-28 01:13:59.621
5511	2119	POKOK	0	2026-06-27 12:42:12.293	2026-06-28 01:13:59.621
5513	2120	POKOK	0	2026-06-27 12:42:12.296	2026-06-28 01:13:59.621
5517	2122	POKOK	0	2026-06-27 12:42:12.302	2026-06-28 01:13:59.621
5521	2124	POKOK	0	2026-06-27 12:42:12.309	2026-06-28 01:13:59.621
5337	2032	POKOK	50000	2026-06-27 12:42:12.024	2026-06-28 01:13:59.699
5340	2033	WAJIB	175000	2026-06-27 12:42:12.029	2026-06-28 01:13:59.716
5341	2034	POKOK	50000	2026-06-27 12:42:12.032	2026-06-28 01:13:59.717
5344	2035	WAJIB	175000	2026-06-27 12:42:12.035	2026-06-28 01:13:59.731
5342	2034	WAJIB	200000	2026-06-27 12:42:12.032	2026-06-28 01:13:59.725
5346	2036	WAJIB	175000	2026-06-27 12:42:12.039	2026-06-28 01:13:59.738
5347	2037	POKOK	50000	2026-06-27 12:42:12.041	2026-06-28 01:13:59.738
5349	2038	POKOK	50000	2026-06-27 12:42:12.044	2026-06-28 01:13:59.748
5348	2037	WAJIB	200000	2026-06-27 12:42:12.042	2026-06-28 01:13:59.747
5352	2039	WAJIB	175000	2026-06-27 12:42:12.05	2026-06-28 01:13:59.762
5350	2038	WAJIB	200000	2026-06-27 12:42:12.044	2026-06-28 01:13:59.755
5354	2040	WAJIB	175000	2026-06-27 12:42:12.055	2026-06-28 01:13:59.77
5355	2041	POKOK	50000	2026-06-27 12:42:12.058	2026-06-28 01:13:59.772
5359	2043	POKOK	50000	2026-06-27 12:42:12.064	2026-06-28 01:13:59.796
5356	2041	WAJIB	200000	2026-06-27 12:42:12.058	2026-06-28 01:13:59.784
5358	2042	WAJIB	200000	2026-06-27 12:42:12.061	2026-06-28 01:13:59.795
5362	2044	WAJIB	175000	2026-06-27 12:42:12.069	2026-06-28 01:13:59.808
5364	2045	WAJIB	175000	2026-06-27 12:42:12.072	2026-06-28 01:13:59.815
5367	2047	POKOK	50000	2026-06-27 12:42:12.077	2026-06-28 01:13:59.819
5366	2046	WAJIB	100000	2026-06-27 12:42:12.074	2026-06-28 01:13:59.818
5371	2049	POKOK	50000	2026-06-27 12:42:12.083	2026-06-28 01:13:59.833
5368	2047	WAJIB	200000	2026-06-27 12:42:12.077	2026-06-28 01:13:59.827
5370	2048	WAJIB	100000	2026-06-27 12:42:12.081	2026-06-28 01:13:59.832
5373	2050	POKOK	50000	2026-06-27 12:42:12.087	2026-06-28 01:13:59.841
5372	2049	WAJIB	200000	2026-06-27 12:42:12.084	2026-06-28 01:13:59.84
5378	2052	WAJIB	25000	2026-06-27 12:42:12.092	2026-06-28 01:13:59.853
5374	2050	WAJIB	200000	2026-06-27 12:42:12.087	2026-06-28 01:13:59.848
5376	2051	WAJIB	100000	2026-06-27 12:42:12.09	2026-06-28 01:13:59.853
5380	2053	WAJIB	175000	2026-06-27 12:42:12.095	2026-06-28 01:13:59.862
5384	2055	WAJIB	175000	2026-06-27 12:42:12.101	2026-06-28 01:13:59.882
5386	2056	WAJIB	25000	2026-06-27 12:42:12.103	2026-06-28 01:13:59.884
5387	2057	POKOK	50000	2026-06-27 12:42:12.105	2026-06-28 01:13:59.886
5390	2058	WAJIB	175000	2026-06-27 12:42:12.109	2026-06-28 01:13:59.899
5391	2059	POKOK	50000	2026-06-27 12:42:12.111	2026-06-28 01:13:59.9
5393	2060	POKOK	50000	2026-06-27 12:42:12.114	2026-06-28 01:13:59.908
5392	2059	WAJIB	200000	2026-06-27 12:42:12.112	2026-06-28 01:13:59.907
5397	2062	POKOK	50000	2026-06-27 12:42:12.12	2026-06-28 01:13:59.923
5394	2060	WAJIB	200000	2026-06-27 12:42:12.114	2026-06-28 01:13:59.917
5396	2061	WAJIB	150000	2026-06-27 12:42:12.119	2026-06-28 01:13:59.923
5400	2063	WAJIB	175000	2026-06-27 12:42:12.124	2026-06-28 01:13:59.938
5398	2062	WAJIB	200000	2026-06-27 12:42:12.121	2026-06-28 01:13:59.931
5402	2064	WAJIB	175000	2026-06-27 12:42:12.128	2026-06-28 01:13:59.945
5405	2066	POKOK	50000	2026-06-27 12:42:12.132	2026-06-28 01:13:59.953
5406	2066	WAJIB	175000	2026-06-27 12:42:12.132	2026-06-28 01:13:59.963
5410	2068	WAJIB	175000	2026-06-27 12:42:12.139	2026-06-28 01:13:59.979
5412	2069	WAJIB	175000	2026-06-27 12:42:12.142	2026-06-28 01:13:59.989
5413	2070	POKOK	50000	2026-06-27 12:42:12.144	2026-06-28 01:13:59.99
5415	2071	POKOK	50000	2026-06-27 12:42:12.147	2026-06-28 01:14:00.755
5316	2021	WAJIB	175000	2026-06-27 12:42:11.992	2026-06-28 01:14:00.693
5319	2023	POKOK	50000	2026-06-27 12:42:11.998	2026-06-28 01:14:00.697
5318	2022	WAJIB	100000	2026-06-27 12:42:11.995	2026-06-28 01:14:00.697
5321	2024	POKOK	50000	2026-06-27 12:42:12.001	2026-06-28 01:14:00.708
5320	2023	WAJIB	200000	2026-06-27 12:42:11.998	2026-06-28 01:14:00.707
5324	2025	WAJIB	175000	2026-06-27 12:42:12.004	2026-06-28 01:14:00.719
5322	2024	WAJIB	50000	2026-06-27 12:42:12.001	2026-06-28 01:14:00.711
5328	2027	WAJIB	175000	2026-06-27 12:42:12.01	2026-06-28 01:14:00.731
5326	2026	WAJIB	100000	2026-06-27 12:42:12.007	2026-06-28 01:14:00.725
5330	2028	WAJIB	175000	2026-06-27 12:42:12.012	2026-06-28 01:14:00.737
5332	2029	WAJIB	175000	2026-06-27 12:42:12.016	2026-06-28 01:14:00.744
5333	2030	POKOK	50000	2026-06-27 12:42:12.018	2026-06-28 01:14:00.745
5414	2070	WAJIB	200000	2026-06-27 12:42:12.144	2026-06-28 01:14:00.754
5416	2071	WAJIB	175000	2026-06-27 12:42:12.148	2026-06-28 01:14:00.762
5417	2072	POKOK	50000	2026-06-27 12:42:12.151	2026-06-28 01:14:00.763
5418	2072	WAJIB	125000	2026-06-27 12:42:12.152	2026-06-28 01:14:00.766
5419	2073	POKOK	50000	2026-06-27 12:42:12.154	2026-06-28 01:14:00.767
5422	2074	WAJIB	175000	2026-06-27 12:42:12.159	2026-06-28 01:14:00.78
5423	2075	POKOK	50000	2026-06-27 12:42:12.161	2026-06-28 01:14:00.782
5426	2076	WAJIB	175000	2026-06-27 12:42:12.164	2026-06-28 01:14:00.795
5424	2075	WAJIB	200000	2026-06-27 12:42:12.161	2026-06-28 01:14:00.789
5428	2077	WAJIB	175000	2026-06-27 12:42:12.167	2026-06-28 01:14:00.8
5429	2078	POKOK	50000	2026-06-27 12:42:12.169	2026-06-28 01:14:00.802
5431	2079	POKOK	50000	2026-06-27 12:42:12.172	2026-06-28 01:14:00.809
5433	2080	POKOK	50000	2026-06-27 12:42:12.175	2026-06-28 01:14:00.817
5432	2079	WAJIB	200000	2026-06-27 12:42:12.172	2026-06-28 01:14:00.816
5435	2081	POKOK	50000	2026-06-27 12:42:12.179	2026-06-28 01:14:00.825
5434	2080	WAJIB	200000	2026-06-27 12:42:12.176	2026-06-28 01:14:00.824
5438	2082	WAJIB	175000	2026-06-27 12:42:12.183	2026-06-28 01:14:00.845
5436	2081	WAJIB	200000	2026-06-27 12:42:12.18	2026-06-28 01:14:00.836
5440	2083	WAJIB	175000	2026-06-27 12:42:12.185	2026-06-28 01:14:00.855
5441	2084	POKOK	50000	2026-06-27 12:42:12.188	2026-06-28 01:14:00.855
5443	2085	POKOK	50000	2026-06-27 12:42:12.191	2026-06-28 01:14:00.863
5446	2086	WAJIB	175000	2026-06-27 12:42:12.194	2026-06-28 01:14:00.877
5444	2085	WAJIB	200000	2026-06-27 12:42:12.192	2026-06-28 01:14:00.87
5447	2087	POKOK	50000	2026-06-27 12:42:12.197	2026-06-28 01:14:00.877
5525	2126	POKOK	0	2026-06-27 12:42:12.314	2026-06-28 01:13:59.621
5529	2128	POKOK	0	2026-06-27 12:42:12.32	2026-06-28 01:13:59.621
5533	2130	POKOK	0	2026-06-27 12:42:12.326	2026-06-28 01:13:59.621
5535	2131	POKOK	0	2026-06-27 12:42:12.329	2026-06-28 01:13:59.621
5537	2132	POKOK	0	2026-06-27 12:42:12.332	2026-06-28 01:13:59.621
5539	2133	POKOK	0	2026-06-27 12:42:12.335	2026-06-28 01:13:59.621
5541	2134	POKOK	0	2026-06-27 12:42:12.338	2026-06-28 01:13:59.621
5543	2135	POKOK	0	2026-06-27 12:42:12.341	2026-06-28 01:13:59.621
5547	2137	POKOK	0	2026-06-27 12:42:12.348	2026-06-28 01:13:59.621
5555	2141	POKOK	0	2026-06-27 12:42:12.359	2026-06-28 01:13:59.621
5557	2142	POKOK	0	2026-06-27 12:42:12.363	2026-06-28 01:13:59.621
5565	2146	POKOK	0	2026-06-27 12:42:12.374	2026-06-28 01:13:59.621
5577	2152	POKOK	0	2026-06-27 12:42:12.393	2026-06-28 01:13:59.621
5583	2155	POKOK	0	2026-06-27 12:42:12.403	2026-06-28 01:13:59.621
5587	2157	POKOK	0	2026-06-27 12:42:12.409	2026-06-28 01:13:59.621
5589	2158	POKOK	0	2026-06-27 12:42:12.412	2026-06-28 01:13:59.621
5593	2160	POKOK	0	2026-06-27 12:42:12.422	2026-06-28 01:13:59.621
5599	2163	POKOK	0	2026-06-27 12:42:12.432	2026-06-28 01:13:59.621
5601	2164	POKOK	0	2026-06-27 12:42:12.434	2026-06-28 01:13:59.621
5605	2166	POKOK	0	2026-06-27 12:42:12.441	2026-06-28 01:13:59.621
5606	2166	WAJIB	0	2026-06-27 12:42:12.441	2026-06-28 01:13:59.621
5607	2167	POKOK	0	2026-06-27 12:42:12.442	2026-06-28 01:13:59.621
5609	2168	POKOK	0	2026-06-27 12:42:12.445	2026-06-28 01:13:59.621
5611	2169	POKOK	0	2026-06-27 12:42:12.449	2026-06-28 01:13:59.621
5613	2170	POKOK	0	2026-06-27 12:42:12.452	2026-06-28 01:13:59.621
5619	2173	POKOK	0	2026-06-27 12:42:12.463	2026-06-28 01:13:59.621
5621	2174	POKOK	0	2026-06-27 12:42:12.466	2026-06-28 01:13:59.621
5623	2175	POKOK	0	2026-06-27 12:42:12.469	2026-06-28 01:13:59.621
5629	2178	POKOK	0	2026-06-27 12:42:12.478	2026-06-28 01:13:59.621
5631	2179	POKOK	0	2026-06-27 12:42:12.481	2026-06-28 01:13:59.621
5635	2181	POKOK	0	2026-06-27 12:42:12.491	2026-06-28 01:13:59.621
5637	2182	POKOK	0	2026-06-27 12:42:12.494	2026-06-28 01:13:59.621
5639	2183	POKOK	0	2026-06-27 12:42:12.497	2026-06-28 01:13:59.621
5641	2184	POKOK	0	2026-06-27 12:42:12.499	2026-06-28 01:13:59.621
5643	2185	POKOK	0	2026-06-27 12:42:12.502	2026-06-28 01:13:59.621
5450	2088	WAJIB	75000	2026-06-27 12:42:12.201	2026-06-28 01:14:00.887
5453	2090	POKOK	50000	2026-06-27 12:42:12.206	2026-06-28 01:14:00.896
5452	2089	WAJIB	200000	2026-06-27 12:42:12.203	2026-06-28 01:14:00.895
5455	2091	POKOK	50000	2026-06-27 12:42:12.21	2026-06-28 01:14:00.905
5454	2090	WAJIB	200000	2026-06-27 12:42:12.207	2026-06-28 01:14:00.905
5457	2092	POKOK	50000	2026-06-27 12:42:12.213	2026-06-28 01:14:00.913
5456	2091	WAJIB	200000	2026-06-27 12:42:12.21	2026-06-28 01:14:00.912
5459	2093	POKOK	50000	2026-06-27 12:42:12.217	2026-06-28 01:14:00.924
5458	2092	WAJIB	200000	2026-06-27 12:42:12.214	2026-06-28 01:14:00.923
5460	2093	WAJIB	125000	2026-06-27 12:42:12.218	2026-06-28 01:14:00.93
5463	2095	POKOK	50000	2026-06-27 12:42:12.223	2026-06-28 01:14:00.936
5462	2094	WAJIB	100000	2026-06-27 12:42:12.221	2026-06-28 01:14:00.935
5466	2096	WAJIB	175000	2026-06-27 12:42:12.227	2026-06-28 01:14:00.95
5464	2095	WAJIB	200000	2026-06-27 12:42:12.224	2026-06-28 01:14:00.944
5467	2097	POKOK	50000	2026-06-27 12:42:12.229	2026-06-28 01:14:00.951
5469	2098	POKOK	50000	2026-06-27 12:42:12.232	2026-06-28 01:14:00.958
5468	2097	WAJIB	200000	2026-06-27 12:42:12.23	2026-06-28 01:14:00.957
5471	2099	POKOK	50000	2026-06-27 12:42:12.235	2026-06-28 01:14:00.965
5473	2100	POKOK	50000	2026-06-27 12:42:12.239	2026-06-28 01:14:00.973
5476	2101	WAJIB	175000	2026-06-27 12:42:12.243	2026-06-28 01:14:00.985
5474	2100	WAJIB	200000	2026-06-27 12:42:12.239	2026-06-28 01:14:00.979
5477	2102	POKOK	50000	2026-06-27 12:42:12.244	2026-06-28 01:14:00.986
5479	2103	POKOK	50000	2026-06-27 12:42:12.248	2026-06-28 01:14:00.994
5478	2102	WAJIB	200000	2026-06-27 12:42:12.245	2026-06-28 01:14:00.993
5482	2104	WAJIB	175000	2026-06-27 12:42:12.251	2026-06-28 01:14:01.013
5480	2103	WAJIB	200000	2026-06-27 12:42:12.249	2026-06-28 01:14:01.003
5485	2106	POKOK	50000	2026-06-27 12:42:12.257	2026-06-28 01:14:01.018
5484	2105	WAJIB	100000	2026-06-27 12:42:12.255	2026-06-28 01:14:01.017
5487	2107	POKOK	50000	2026-06-27 12:42:12.26	2026-06-28 01:14:01.028
5486	2106	WAJIB	200000	2026-06-27 12:42:12.258	2026-06-28 01:14:01.027
5488	2107	WAJIB	175000	2026-06-27 12:42:12.261	2026-06-28 01:14:01.034
5490	2108	WAJIB	175000	2026-06-27 12:42:12.264	2026-06-28 01:14:01.04
5496	2111	WAJIB	175000	2026-06-27 12:42:12.272	2026-06-28 01:14:01.057
5497	2112	POKOK	50000	2026-06-27 12:42:12.274	2026-06-28 01:14:01.058
5500	2113	WAJIB	175000	2026-06-27 12:42:12.279	2026-06-28 01:14:01.072
5498	2112	WAJIB	200000	2026-06-27 12:42:12.274	2026-06-28 01:14:01.065
5501	2114	POKOK	50000	2026-06-27 12:42:12.28	2026-06-28 01:14:01.073
5504	2115	WAJIB	175000	2026-06-27 12:42:12.284	2026-06-28 01:14:01.088
5502	2114	WAJIB	200000	2026-06-27 12:42:12.281	2026-06-28 01:14:01.079
5506	2116	WAJIB	175000	2026-06-27 12:42:12.286	2026-06-28 01:14:01.097
5508	2117	WAJIB	175000	2026-06-27 12:42:12.289	2026-06-28 01:14:01.106
5512	2119	WAJIB	175000	2026-06-27 12:42:12.294	2026-06-28 01:14:01.116
5510	2118	WAJIB	100000	2026-06-27 12:42:12.291	2026-06-28 01:14:01.11
5514	2120	WAJIB	175000	2026-06-27 12:42:12.297	2026-06-28 01:14:01.123
5515	2121	POKOK	50000	2026-06-27 12:42:12.299	2026-06-28 01:14:01.124
5518	2122	WAJIB	25000	2026-06-27 12:42:12.302	2026-06-28 01:14:01.132
5516	2121	WAJIB	200000	2026-06-27 12:42:12.3	2026-06-28 01:14:01.13
5522	2124	WAJIB	25000	2026-06-27 12:42:12.309	2026-06-28 01:14:01.14
5520	2123	WAJIB	225000	2026-06-27 12:42:12.305	2026-06-28 01:14:01.139
5527	2127	POKOK	50000	2026-06-27 12:42:12.317	2026-06-28 01:14:01.154
5530	2128	WAJIB	175000	2026-06-27 12:42:12.321	2026-06-28 01:14:01.167
5531	2129	POKOK	50000	2026-06-27 12:42:12.323	2026-06-28 01:14:01.167
5534	2130	WAJIB	175000	2026-06-27 12:42:12.327	2026-06-28 01:14:01.185
5532	2129	WAJIB	200000	2026-06-27 12:42:12.323	2026-06-28 01:14:01.177
5536	2131	WAJIB	175000	2026-06-27 12:42:12.33	2026-06-28 01:14:01.196
5538	2132	WAJIB	175000	2026-06-27 12:42:12.332	2026-06-28 01:14:01.204
5540	2133	WAJIB	25000	2026-06-27 12:42:12.335	2026-06-28 01:14:01.205
5542	2134	WAJIB	175000	2026-06-27 12:42:12.339	2026-06-28 01:14:01.211
5544	2135	WAJIB	175000	2026-06-27 12:42:12.342	2026-06-28 01:14:01.216
5545	2136	POKOK	50000	2026-06-27 12:42:12.344	2026-06-28 01:14:01.217
5549	2138	POKOK	50000	2026-06-27 12:42:12.35	2026-06-28 01:14:01.228
5546	2136	WAJIB	200000	2026-06-27 12:42:12.344	2026-06-28 01:14:01.223
5548	2137	WAJIB	100000	2026-06-27 12:42:12.348	2026-06-28 01:14:01.227
5551	2139	POKOK	50000	2026-06-27 12:42:12.353	2026-06-28 01:14:01.235
5550	2138	WAJIB	200000	2026-06-27 12:42:12.351	2026-06-28 01:14:01.235
5556	2141	WAJIB	175000	2026-06-27 12:42:12.36	2026-06-28 01:14:01.252
5554	2140	WAJIB	200000	2026-06-27 12:42:12.357	2026-06-28 01:14:01.246
5558	2142	WAJIB	175000	2026-06-27 12:42:12.363	2026-06-28 01:14:01.262
5559	2143	POKOK	50000	2026-06-27 12:42:12.365	2026-06-28 01:14:01.263
5561	2144	POKOK	50000	2026-06-27 12:42:12.368	2026-06-28 01:14:01.274
5560	2143	WAJIB	200000	2026-06-27 12:42:12.365	2026-06-28 01:14:01.273
5563	2145	POKOK	50000	2026-06-27 12:42:12.371	2026-06-28 01:14:01.284
5562	2144	WAJIB	200000	2026-06-27 12:42:12.369	2026-06-28 01:14:01.284
5566	2146	WAJIB	175000	2026-06-27 12:42:12.374	2026-06-28 01:14:01.297
5564	2145	WAJIB	200000	2026-06-27 12:42:12.372	2026-06-28 01:14:01.292
5567	2147	POKOK	50000	2026-06-27 12:42:12.377	2026-06-28 01:14:01.298
5569	2148	POKOK	50000	2026-06-27 12:42:12.381	2026-06-28 01:14:01.308
5568	2147	WAJIB	200000	2026-06-27 12:42:12.378	2026-06-28 01:14:01.307
5570	2148	WAJIB	200000	2026-06-27 12:42:12.381	2026-06-28 01:14:01.317
5645	2186	POKOK	0	2026-06-27 12:42:12.504	2026-06-28 01:13:59.621
5646	2186	WAJIB	0	2026-06-27 12:42:12.505	2026-06-28 01:13:59.621
5651	2189	POKOK	0	2026-06-27 12:42:12.513	2026-06-28 01:13:59.621
5653	2190	POKOK	0	2026-06-27 12:42:12.516	2026-06-28 01:13:59.621
5657	2192	POKOK	0	2026-06-27 12:42:12.526	2026-06-28 01:13:59.621
5659	2193	POKOK	0	2026-06-27 12:42:12.53	2026-06-28 01:13:59.621
5661	2194	POKOK	0	2026-06-27 12:42:12.533	2026-06-28 01:13:59.621
5681	2204	POKOK	0	2026-06-27 12:42:12.573	2026-06-28 01:13:59.621
5687	2207	POKOK	0	2026-06-27 12:42:12.583	2026-06-28 01:13:59.621
5691	2209	POKOK	0	2026-06-27 12:42:12.589	2026-06-28 01:13:59.621
5701	2214	POKOK	0	2026-06-27 12:42:12.611	2026-06-28 01:13:59.621
5707	2217	POKOK	0	2026-06-27 12:42:12.621	2026-06-28 01:13:59.621
5709	2218	POKOK	0	2026-06-27 12:42:12.623	2026-06-28 01:13:59.621
5711	2219	POKOK	0	2026-06-27 12:42:12.625	2026-06-28 01:13:59.621
5715	2221	POKOK	0	2026-06-27 12:42:12.634	2026-06-28 01:13:59.621
5721	2224	POKOK	0	2026-06-27 12:42:12.646	2026-06-28 01:13:59.621
5723	2225	POKOK	0	2026-06-27 12:42:12.649	2026-06-28 01:13:59.621
5727	2227	POKOK	0	2026-06-27 12:42:12.654	2026-06-28 01:13:59.621
5729	2228	POKOK	0	2026-06-27 12:42:12.657	2026-06-28 01:13:59.621
5735	2231	POKOK	0	2026-06-27 12:42:12.67	2026-06-28 01:13:59.621
5737	2232	POKOK	0	2026-06-27 12:42:12.674	2026-06-28 01:13:59.621
5743	2235	POKOK	0	2026-06-27 12:42:12.683	2026-06-28 01:13:59.621
5747	2237	POKOK	0	2026-06-27 12:42:12.689	2026-06-28 01:13:59.621
5749	2238	POKOK	0	2026-06-27 12:42:12.7	2026-06-28 01:13:59.621
5751	2239	POKOK	0	2026-06-27 12:42:12.704	2026-06-28 01:13:59.621
5753	2240	POKOK	0	2026-06-27 12:42:12.707	2026-06-28 01:13:59.621
5755	2241	POKOK	0	2026-06-27 12:42:12.709	2026-06-28 01:13:59.621
5761	2244	POKOK	0	2026-06-27 12:42:12.719	2026-06-28 01:13:59.621
5679	2203	POKOK	50000	2026-06-27 12:42:12.57	2026-06-28 01:14:00.502
5571	2149	POKOK	50000	2026-06-27 12:42:12.384	2026-06-28 01:14:01.318
5575	2151	POKOK	50000	2026-06-27 12:42:12.391	2026-06-28 01:14:01.332
5574	2150	WAJIB	50000	2026-06-27 12:42:12.388	2026-06-28 01:14:01.33
5578	2152	WAJIB	175000	2026-06-27 12:42:12.394	2026-06-28 01:14:01.346
5576	2151	WAJIB	200000	2026-06-27 12:42:12.391	2026-06-28 01:14:01.339
5579	2153	POKOK	50000	2026-06-27 12:42:12.396	2026-06-28 01:14:01.348
5581	2154	POKOK	50000	2026-06-27 12:42:12.4	2026-06-28 01:14:01.362
5580	2153	WAJIB	200000	2026-06-27 12:42:12.397	2026-06-28 01:14:01.36
5584	2155	WAJIB	175000	2026-06-27 12:42:12.403	2026-06-28 01:14:01.383
5582	2154	WAJIB	200000	2026-06-27 12:42:12.4	2026-06-28 01:14:01.374
5585	2156	POKOK	50000	2026-06-27 12:42:12.405	2026-06-28 01:14:01.384
5590	2158	WAJIB	175000	2026-06-27 12:42:12.413	2026-06-28 01:14:01.406
5586	2156	WAJIB	200000	2026-06-27 12:42:12.405	2026-06-28 01:14:01.394
5591	2159	POKOK	100000	2026-06-27 12:42:12.416	2026-06-28 01:14:01.406
5595	2161	POKOK	50000	2026-06-27 12:42:12.426	2026-06-28 01:14:01.419
5592	2159	WAJIB	225000	2026-06-27 12:42:12.417	2026-06-28 01:14:01.414
5600	2163	WAJIB	175000	2026-06-27 12:42:12.432	2026-06-28 01:14:01.438
5598	2162	WAJIB	200000	2026-06-27 12:42:12.43	2026-06-28 01:14:01.432
5602	2164	WAJIB	175000	2026-06-27 12:42:12.435	2026-06-28 01:14:01.445
5603	2165	POKOK	50000	2026-06-27 12:42:12.438	2026-06-28 01:14:01.447
5608	2167	WAJIB	175000	2026-06-27 12:42:12.443	2026-06-28 01:14:01.466
5604	2165	WAJIB	200000	2026-06-27 12:42:12.438	2026-06-28 01:14:01.457
5610	2168	WAJIB	175000	2026-06-27 12:42:12.445	2026-06-28 01:14:01.473
5612	2169	WAJIB	175000	2026-06-27 12:42:12.45	2026-06-28 01:14:01.478
5614	2170	WAJIB	175000	2026-06-27 12:42:12.453	2026-06-28 01:14:01.484
5615	2171	POKOK	50000	2026-06-27 12:42:12.457	2026-06-28 01:14:01.485
5617	2172	POKOK	50000	2026-06-27 12:42:12.46	2026-06-28 01:14:01.493
5616	2171	WAJIB	200000	2026-06-27 12:42:12.458	2026-06-28 01:14:01.493
5618	2172	WAJIB	125000	2026-06-27 12:42:12.461	2026-06-28 01:14:01.497
5620	2173	WAJIB	175000	2026-06-27 12:42:12.464	2026-06-28 01:14:01.504
5622	2174	WAJIB	175000	2026-06-27 12:42:12.466	2026-06-28 01:14:01.509
5625	2176	POKOK	50000	2026-06-27 12:42:12.472	2026-06-28 01:14:01.515
5627	2177	POKOK	50000	2026-06-27 12:42:12.474	2026-06-28 01:14:01.524
5630	2178	WAJIB	175000	2026-06-27 12:42:12.479	2026-06-28 01:14:01.541
5628	2177	WAJIB	200000	2026-06-27 12:42:12.475	2026-06-28 01:14:01.533
5632	2179	WAJIB	175000	2026-06-27 12:42:12.482	2026-06-28 01:14:01.549
5633	2180	POKOK	50000	2026-06-27 12:42:12.485	2026-06-28 01:14:01.55
5636	2181	WAJIB	175000	2026-06-27 12:42:12.491	2026-06-28 01:14:01.564
5634	2180	WAJIB	200000	2026-06-27 12:42:12.486	2026-06-28 01:14:01.558
5638	2182	WAJIB	175000	2026-06-27 12:42:12.494	2026-06-28 01:14:01.57
5640	2183	WAJIB	175000	2026-06-27 12:42:12.497	2026-06-28 01:14:01.576
5642	2184	WAJIB	175000	2026-06-27 12:42:12.5	2026-06-28 01:14:01.581
5644	2185	WAJIB	175000	2026-06-27 12:42:12.503	2026-06-28 01:14:01.587
5649	2188	POKOK	50000	2026-06-27 12:42:12.51	2026-06-28 01:14:01.595
5648	2187	WAJIB	200000	2026-06-27 12:42:12.507	2026-06-28 01:14:01.594
5652	2189	WAJIB	175000	2026-06-27 12:42:12.513	2026-06-28 01:14:01.607
5654	2190	WAJIB	175000	2026-06-27 12:42:12.517	2026-06-28 01:14:01.615
5655	2191	POKOK	50000	2026-06-27 12:42:12.521	2026-06-28 01:14:01.616
5660	2193	WAJIB	175000	2026-06-27 12:42:12.531	2026-06-28 01:14:01.634
5658	2192	WAJIB	100000	2026-06-27 12:42:12.527	2026-06-28 01:14:01.628
5662	2194	WAJIB	175000	2026-06-27 12:42:12.534	2026-06-28 01:14:01.639
5663	2195	POKOK	50000	2026-06-27 12:42:12.535	2026-06-28 01:14:01.64
5665	2196	POKOK	50000	2026-06-27 12:42:12.54	2026-06-28 01:14:01.647
5664	2195	WAJIB	200000	2026-06-27 12:42:12.537	2026-06-28 01:14:01.646
5667	2197	POKOK	50000	2026-06-27 12:42:12.543	2026-06-28 01:14:01.655
5666	2196	WAJIB	200000	2026-06-27 12:42:12.541	2026-06-28 01:14:01.654
5669	2198	POKOK	50000	2026-06-27 12:42:12.547	2026-06-28 01:14:01.662
5668	2197	WAJIB	200000	2026-06-27 12:42:12.544	2026-06-28 01:14:01.661
5671	2199	POKOK	50000	2026-06-27 12:42:12.552	2026-06-28 01:14:01.669
5670	2198	WAJIB	200000	2026-06-27 12:42:12.548	2026-06-28 01:14:01.668
5673	2200	POKOK	50000	2026-06-27 12:42:12.555	2026-06-28 01:14:01.677
5675	2201	POKOK	50000	2026-06-27 12:42:12.561	2026-06-28 01:14:01.686
5674	2200	WAJIB	200000	2026-06-27 12:42:12.557	2026-06-28 01:14:01.685
5677	2202	POKOK	50000	2026-06-27 12:42:12.566	2026-06-28 01:14:01.696
5682	2204	WAJIB	175000	2026-06-27 12:42:12.573	2026-06-28 01:14:01.717
5678	2202	WAJIB	200000	2026-06-27 12:42:12.567	2026-06-28 01:14:01.707
5680	2203	WAJIB	100000	2026-06-27 12:42:12.57	2026-06-28 01:14:01.71
5683	2205	POKOK	50000	2026-06-27 12:42:12.575	2026-06-28 01:14:01.718
5685	2206	POKOK	50000	2026-06-27 12:42:12.579	2026-06-28 01:14:01.726
5684	2205	WAJIB	200000	2026-06-27 12:42:12.576	2026-06-28 01:14:01.725
5686	2206	WAJIB	125000	2026-06-27 12:42:12.58	2026-06-28 01:14:01.73
5688	2207	WAJIB	175000	2026-06-27 12:42:12.583	2026-06-28 01:14:01.738
5689	2208	POKOK	50000	2026-06-27 12:42:12.585	2026-06-28 01:14:01.739
5690	2208	WAJIB	125000	2026-06-27 12:42:12.586	2026-06-28 01:14:01.744
5693	2210	POKOK	50000	2026-06-27 12:42:12.593	2026-06-28 01:14:01.748
5695	2211	POKOK	50000	2026-06-27 12:42:12.598	2026-06-28 01:14:01.756
5694	2210	WAJIB	200000	2026-06-27 12:42:12.593	2026-06-28 01:14:01.755
5697	2212	POKOK	50000	2026-06-27 12:42:12.602	2026-06-28 01:14:01.765
5696	2211	WAJIB	200000	2026-06-27 12:42:12.599	2026-06-28 01:14:01.764
5699	2213	POKOK	50000	2026-06-27 12:42:12.606	2026-06-28 01:14:01.774
5702	2214	WAJIB	175000	2026-06-27 12:42:12.611	2026-06-28 01:14:01.792
5700	2213	WAJIB	200000	2026-06-27 12:42:12.607	2026-06-28 01:14:01.783
5703	2215	POKOK	50000	2026-06-27 12:42:12.614	2026-06-28 01:14:01.793
5704	2215	WAJIB	200000	2026-06-27 12:42:12.614	2026-06-28 01:14:01.8
5765	2246	POKOK	0	2026-06-27 12:42:12.727	2026-06-28 01:13:59.621
5767	2247	POKOK	0	2026-06-27 12:42:12.731	2026-06-28 01:13:59.621
5769	2248	POKOK	0	2026-06-27 12:42:12.734	2026-06-28 01:13:59.621
5771	2249	POKOK	0	2026-06-27 12:42:12.738	2026-06-28 01:13:59.621
5777	2252	POKOK	0	2026-06-27 12:42:12.748	2026-06-28 01:13:59.621
5783	2255	POKOK	0	2026-06-27 12:42:12.759	2026-06-28 01:13:59.621
5784	2255	WAJIB	0	2026-06-27 12:42:12.759	2026-06-28 01:13:59.621
5793	2260	POKOK	0	2026-06-27 12:42:12.786	2026-06-28 01:13:59.621
5797	2262	POKOK	0	2026-06-27 12:42:12.793	2026-06-28 01:13:59.621
5801	2264	POKOK	0	2026-06-27 12:42:12.799	2026-06-28 01:13:59.621
5803	2265	POKOK	0	2026-06-27 12:42:12.802	2026-06-28 01:13:59.621
5805	2266	POKOK	0	2026-06-27 12:42:12.807	2026-06-28 01:13:59.621
5807	2267	POKOK	0	2026-06-27 12:42:12.811	2026-06-28 01:13:59.621
5813	2270	POKOK	0	2026-06-27 12:42:12.822	2026-06-28 01:13:59.621
5817	2272	POKOK	0	2026-06-27 12:42:12.829	2026-06-28 01:13:59.621
5843	2285	POKOK	0	2026-06-27 12:42:12.877	2026-06-28 01:13:59.621
5845	2286	POKOK	0	2026-06-27 12:42:12.881	2026-06-28 01:13:59.621
5847	2287	POKOK	0	2026-06-27 12:42:12.885	2026-06-28 01:13:59.621
5849	2288	POKOK	0	2026-06-27 12:42:12.89	2026-06-28 01:13:59.621
5851	2289	POKOK	0	2026-06-27 12:42:12.893	2026-06-28 01:13:59.621
5853	2290	POKOK	0	2026-06-27 12:42:12.896	2026-06-28 01:13:59.621
5857	2292	POKOK	0	2026-06-27 12:42:12.902	2026-06-28 01:13:59.621
5859	2293	POKOK	0	2026-06-27 12:42:12.904	2026-06-28 01:13:59.621
5861	2294	POKOK	0	2026-06-27 12:42:12.908	2026-06-28 01:13:59.621
5867	2297	POKOK	0	2026-06-27 12:42:12.919	2026-06-28 01:13:59.621
5869	2298	POKOK	0	2026-06-27 12:42:12.922	2026-06-28 01:13:59.621
5871	2299	POKOK	0	2026-06-27 12:42:12.927	2026-06-28 01:13:59.621
5883	2305	POKOK	0	2026-06-27 12:42:12.947	2026-06-28 01:13:59.621
5708	2217	WAJIB	175000	2026-06-27 12:42:12.621	2026-06-28 01:14:01.814
5710	2218	WAJIB	175000	2026-06-27 12:42:12.623	2026-06-28 01:14:01.82
5712	2219	WAJIB	175000	2026-06-27 12:42:12.626	2026-06-28 01:14:01.825
5716	2221	WAJIB	175000	2026-06-27 12:42:12.635	2026-06-28 01:14:01.837
5714	2220	WAJIB	200000	2026-06-27 12:42:12.63	2026-06-28 01:14:01.832
5717	2222	POKOK	50000	2026-06-27 12:42:12.639	2026-06-28 01:14:01.838
5719	2223	POKOK	50000	2026-06-27 12:42:12.643	2026-06-28 01:14:01.846
5718	2222	WAJIB	200000	2026-06-27 12:42:12.64	2026-06-28 01:14:01.845
5722	2224	WAJIB	175000	2026-06-27 12:42:12.646	2026-06-28 01:14:01.864
5720	2223	WAJIB	200000	2026-06-27 12:42:12.643	2026-06-28 01:14:01.855
5724	2225	WAJIB	175000	2026-06-27 12:42:12.649	2026-06-28 01:14:01.872
5725	2226	POKOK	100000	2026-06-27 12:42:12.651	2026-06-28 01:14:01.873
5728	2227	WAJIB	175000	2026-06-27 12:42:12.654	2026-06-28 01:14:01.882
5726	2226	WAJIB	125000	2026-06-27 12:42:12.652	2026-06-28 01:14:01.876
5730	2228	WAJIB	175000	2026-06-27 12:42:12.658	2026-06-28 01:14:01.89
5731	2229	POKOK	50000	2026-06-27 12:42:12.66	2026-06-28 01:14:01.891
5733	2230	POKOK	50000	2026-06-27 12:42:12.664	2026-06-28 01:14:01.899
5734	2230	WAJIB	125000	2026-06-27 12:42:12.665	2026-06-28 01:14:01.904
5738	2232	WAJIB	175000	2026-06-27 12:42:12.674	2026-06-28 01:14:01.917
5739	2233	POKOK	50000	2026-06-27 12:42:12.676	2026-06-28 01:14:01.918
5740	2233	WAJIB	125000	2026-06-27 12:42:12.677	2026-06-28 01:14:01.923
5741	2234	POKOK	50000	2026-06-27 12:42:12.68	2026-06-28 01:14:01.923
5745	2236	POKOK	50000	2026-06-27 12:42:12.686	2026-06-28 01:14:01.937
5742	2234	WAJIB	200000	2026-06-27 12:42:12.68	2026-06-28 01:14:01.931
5744	2235	WAJIB	100000	2026-06-27 12:42:12.683	2026-06-28 01:14:01.936
5748	2237	WAJIB	175000	2026-06-27 12:42:12.69	2026-06-28 01:14:01.956
5746	2236	WAJIB	200000	2026-06-27 12:42:12.687	2026-06-28 01:14:01.947
5750	2238	WAJIB	175000	2026-06-27 12:42:12.701	2026-06-28 01:14:01.964
5752	2239	WAJIB	175000	2026-06-27 12:42:12.704	2026-06-28 01:14:01.969
5754	2240	WAJIB	175000	2026-06-27 12:42:12.707	2026-06-28 01:14:01.975
5756	2241	WAJIB	175000	2026-06-27 12:42:12.71	2026-06-28 01:14:01.98
5757	2242	POKOK	50000	2026-06-27 12:42:12.712	2026-06-28 01:14:01.982
5759	2243	POKOK	50000	2026-06-27 12:42:12.715	2026-06-28 01:14:01.989
5763	2245	POKOK	50000	2026-06-27 12:42:12.722	2026-06-28 01:14:02
5762	2244	WAJIB	100000	2026-06-27 12:42:12.719	2026-06-28 01:14:01.999
5768	2247	WAJIB	175000	2026-06-27 12:42:12.732	2026-06-28 01:14:02.025
5764	2245	WAJIB	200000	2026-06-27 12:42:12.723	2026-06-28 01:14:02.008
5770	2248	WAJIB	175000	2026-06-27 12:42:12.735	2026-06-28 01:14:02.034
5773	2250	POKOK	50000	2026-06-27 12:42:12.741	2026-06-28 01:14:02.044
5774	2250	WAJIB	125000	2026-06-27 12:42:12.741	2026-06-28 01:14:02.048
5775	2251	POKOK	50000	2026-06-27 12:42:12.744	2026-06-28 01:14:02.049
5778	2252	WAJIB	175000	2026-06-27 12:42:12.748	2026-06-28 01:14:02.064
5776	2251	WAJIB	200000	2026-06-27 12:42:12.744	2026-06-28 01:14:02.057
5779	2253	POKOK	50000	2026-06-27 12:42:12.75	2026-06-28 01:14:02.065
5781	2254	POKOK	50000	2026-06-27 12:42:12.754	2026-06-28 01:14:02.074
5780	2253	WAJIB	200000	2026-06-27 12:42:12.751	2026-06-28 01:14:02.073
5785	2256	POKOK	50000	2026-06-27 12:42:12.765	2026-06-28 01:14:02.082
5782	2254	WAJIB	200000	2026-06-27 12:42:12.754	2026-06-28 01:14:02.08
5787	2257	POKOK	50000	2026-06-27 12:42:12.772	2026-06-28 01:14:02.09
5788	2257	WAJIB	125000	2026-06-27 12:42:12.773	2026-06-28 01:14:02.095
5789	2258	POKOK	50000	2026-06-27 12:42:12.779	2026-06-28 01:14:02.096
5791	2259	POKOK	50000	2026-06-27 12:42:12.783	2026-06-28 01:14:02.104
5790	2258	WAJIB	200000	2026-06-27 12:42:12.78	2026-06-28 01:14:02.103
5794	2260	WAJIB	175000	2026-06-27 12:42:12.787	2026-06-28 01:14:02.123
5795	2261	POKOK	50000	2026-06-27 12:42:12.789	2026-06-28 01:14:02.125
5798	2262	WAJIB	175000	2026-06-27 12:42:12.793	2026-06-28 01:14:02.141
5796	2261	WAJIB	200000	2026-06-27 12:42:12.79	2026-06-28 01:14:02.135
5799	2263	POKOK	50000	2026-06-27 12:42:12.795	2026-06-28 01:14:02.143
5802	2264	WAJIB	175000	2026-06-27 12:42:12.8	2026-06-28 01:14:02.156
5800	2263	WAJIB	200000	2026-06-27 12:42:12.796	2026-06-28 01:14:02.15
5804	2265	WAJIB	175000	2026-06-27 12:42:12.803	2026-06-28 01:14:02.163
5806	2266	WAJIB	175000	2026-06-27 12:42:12.808	2026-06-28 01:14:02.169
5808	2267	WAJIB	175000	2026-06-27 12:42:12.812	2026-06-28 01:14:02.176
5809	2268	POKOK	50000	2026-06-27 12:42:12.815	2026-06-28 01:14:02.176
5811	2269	POKOK	50000	2026-06-27 12:42:12.819	2026-06-28 01:14:02.185
5814	2270	WAJIB	175000	2026-06-27 12:42:12.823	2026-06-28 01:14:02.203
5812	2269	WAJIB	200000	2026-06-27 12:42:12.819	2026-06-28 01:14:02.193
5815	2271	POKOK	50000	2026-06-27 12:42:12.825	2026-06-28 01:14:02.205
5818	2272	WAJIB	175000	2026-06-27 12:42:12.829	2026-06-28 01:14:02.234
5819	2273	POKOK	50000	2026-06-27 12:42:12.831	2026-06-28 01:14:02.235
5821	2274	POKOK	50000	2026-06-27 12:42:12.835	2026-06-28 01:14:02.243
5820	2273	WAJIB	200000	2026-06-27 12:42:12.832	2026-06-28 01:14:02.242
5823	2275	POKOK	50000	2026-06-27 12:42:12.839	2026-06-28 01:14:02.25
5822	2274	WAJIB	200000	2026-06-27 12:42:12.835	2026-06-28 01:14:02.249
5825	2276	POKOK	50000	2026-06-27 12:42:12.842	2026-06-28 01:14:02.257
5824	2275	WAJIB	200000	2026-06-27 12:42:12.839	2026-06-28 01:14:02.257
5827	2277	POKOK	50000	2026-06-27 12:42:12.849	2026-06-28 01:14:02.265
5826	2276	WAJIB	200000	2026-06-27 12:42:12.843	2026-06-28 01:14:02.264
5829	2278	POKOK	50000	2026-06-27 12:42:12.854	2026-06-28 01:14:02.272
5828	2277	WAJIB	200000	2026-06-27 12:42:12.85	2026-06-28 01:14:02.271
5831	2279	POKOK	50000	2026-06-27 12:42:12.858	2026-06-28 01:14:02.279
5833	2280	POKOK	50000	2026-06-27 12:42:12.861	2026-06-28 01:14:02.287
5832	2279	WAJIB	200000	2026-06-27 12:42:12.858	2026-06-28 01:14:02.286
5835	2281	POKOK	50000	2026-06-27 12:42:12.864	2026-06-28 01:14:02.297
5836	2281	WAJIB	200000	2026-06-27 12:42:12.864	2026-06-28 01:14:02.306
5889	2308	POKOK	0	2026-06-27 12:42:12.957	2026-06-28 01:13:59.621
5891	2309	POKOK	0	2026-06-27 12:42:12.959	2026-06-28 01:13:59.621
5895	2311	POKOK	0	2026-06-27 12:42:12.965	2026-06-28 01:13:59.621
5897	2312	POKOK	0	2026-06-27 12:42:12.968	2026-06-28 01:13:59.621
5901	2314	POKOK	0	2026-06-27 12:42:12.976	2026-06-28 01:13:59.621
5907	2317	POKOK	0	2026-06-27 12:42:12.987	2026-06-28 01:13:59.621
5915	2321	POKOK	0	2026-06-27 12:42:13.001	2026-06-28 01:13:59.621
5917	2322	POKOK	0	2026-06-27 12:42:13.004	2026-06-28 01:13:59.621
5919	2323	POKOK	0	2026-06-27 12:42:13.009	2026-06-28 01:13:59.621
5925	2326	POKOK	0	2026-06-27 12:42:13.022	2026-06-28 01:13:59.621
5927	2327	POKOK	0	2026-06-27 12:42:13.028	2026-06-28 01:13:59.621
5929	2328	POKOK	0	2026-06-27 12:42:13.032	2026-06-28 01:13:59.621
5933	2330	POKOK	0	2026-06-27 12:42:13.042	2026-06-28 01:13:59.621
5937	2332	POKOK	0	2026-06-27 12:42:13.051	2026-06-28 01:13:59.621
5939	2333	POKOK	0	2026-06-27 12:42:13.054	2026-06-28 01:13:59.621
5941	2334	POKOK	0	2026-06-27 12:42:13.058	2026-06-28 01:13:59.621
5947	2337	POKOK	0	2026-06-27 12:42:13.073	2026-06-28 01:13:59.621
5949	2338	POKOK	0	2026-06-27 12:42:13.077	2026-06-28 01:13:59.621
5953	2340	POKOK	0	2026-06-27 12:42:13.085	2026-06-28 01:13:59.621
5955	2341	POKOK	0	2026-06-27 12:42:13.089	2026-06-28 01:13:59.621
5957	2342	POKOK	0	2026-06-27 12:42:13.092	2026-06-28 01:13:59.621
5959	2343	POKOK	0	2026-06-27 12:42:13.096	2026-06-28 01:13:59.621
5961	2344	POKOK	0	2026-06-27 12:42:13.1	2026-06-28 01:13:59.621
5963	2345	POKOK	0	2026-06-27 12:42:13.104	2026-06-28 01:13:59.621
5965	2346	POKOK	0	2026-06-27 12:42:13.108	2026-06-28 01:13:59.621
5967	2347	POKOK	0	2026-06-27 12:42:13.112	2026-06-28 01:13:59.621
5969	2348	POKOK	0	2026-06-27 12:42:13.116	2026-06-28 01:13:59.621
5971	2349	POKOK	0	2026-06-27 12:42:13.12	2026-06-28 01:13:59.621
5972	2349	WAJIB	0	2026-06-27 12:42:13.12	2026-06-28 01:13:59.621
5973	2350	POKOK	0	2026-06-27 12:42:13.124	2026-06-28 01:13:59.621
5975	2351	POKOK	0	2026-06-27 12:42:13.129	2026-06-28 01:13:59.621
5979	2353	POKOK	0	2026-06-27 12:42:13.138	2026-06-28 01:13:59.621
5993	2360	POKOK	0	2026-06-27 12:42:13.168	2026-06-28 01:13:59.621
5997	2362	POKOK	0	2026-06-27 12:42:13.177	2026-06-28 01:13:59.621
6001	2364	POKOK	0	2026-06-27 12:42:13.185	2026-06-28 01:13:59.621
5837	2282	POKOK	50000	2026-06-27 12:42:12.867	2026-06-28 01:14:02.307
5840	2283	WAJIB	125000	2026-06-27 12:42:12.871	2026-06-28 01:14:02.319
5841	2284	POKOK	50000	2026-06-27 12:42:12.873	2026-06-28 01:14:02.32
5844	2285	WAJIB	175000	2026-06-27 12:42:12.878	2026-06-28 01:14:02.334
5842	2284	WAJIB	200000	2026-06-27 12:42:12.873	2026-06-28 01:14:02.328
5846	2286	WAJIB	175000	2026-06-27 12:42:12.882	2026-06-28 01:14:02.341
5848	2287	WAJIB	175000	2026-06-27 12:42:12.886	2026-06-28 01:14:02.347
5850	2288	WAJIB	175000	2026-06-27 12:42:12.89	2026-06-28 01:14:02.354
5852	2289	WAJIB	175000	2026-06-27 12:42:12.894	2026-06-28 01:14:02.36
5854	2290	WAJIB	175000	2026-06-27 12:42:12.897	2026-06-28 01:14:02.367
5855	2291	POKOK	50000	2026-06-27 12:42:12.899	2026-06-28 01:14:02.368
5860	2293	WAJIB	175000	2026-06-27 12:42:12.905	2026-06-28 01:14:02.395
5856	2291	WAJIB	200000	2026-06-27 12:42:12.899	2026-06-28 01:14:02.377
5863	2295	POKOK	50000	2026-06-27 12:42:12.911	2026-06-28 01:14:02.402
5862	2294	WAJIB	100000	2026-06-27 12:42:12.909	2026-06-28 01:14:02.401
5865	2296	POKOK	50000	2026-06-27 12:42:12.913	2026-06-28 01:14:02.411
5864	2295	WAJIB	200000	2026-06-27 12:42:12.911	2026-06-28 01:14:02.41
5868	2297	WAJIB	25000	2026-06-27 12:42:12.919	2026-06-28 01:14:02.42
5872	2299	WAJIB	175000	2026-06-27 12:42:12.928	2026-06-28 01:14:02.43
5870	2298	WAJIB	100000	2026-06-27 12:42:12.923	2026-06-28 01:14:02.424
5873	2300	POKOK	50000	2026-06-27 12:42:12.93	2026-06-28 01:14:02.432
5875	2301	POKOK	50000	2026-06-27 12:42:12.932	2026-06-28 01:14:02.44
5874	2300	WAJIB	200000	2026-06-27 12:42:12.93	2026-06-28 01:14:02.44
5877	2302	POKOK	50000	2026-06-27 12:42:12.936	2026-06-28 01:14:02.449
5876	2301	WAJIB	200000	2026-06-27 12:42:12.933	2026-06-28 01:14:02.448
5879	2303	POKOK	50000	2026-06-27 12:42:12.94	2026-06-28 01:14:02.458
5878	2302	WAJIB	200000	2026-06-27 12:42:12.937	2026-06-28 01:14:02.457
5881	2304	POKOK	50000	2026-06-27 12:42:12.943	2026-06-28 01:14:02.468
5882	2304	WAJIB	125000	2026-06-27 12:42:12.944	2026-06-28 01:14:02.475
5884	2305	WAJIB	175000	2026-06-27 12:42:12.947	2026-06-28 01:14:02.486
5887	2307	POKOK	50000	2026-06-27 12:42:12.953	2026-06-28 01:14:02.499
5886	2306	WAJIB	200000	2026-06-27 12:42:12.95	2026-06-28 01:14:02.498
5892	2309	WAJIB	175000	2026-06-27 12:42:12.96	2026-06-28 01:14:02.52
5893	2310	POKOK	50000	2026-06-27 12:42:12.962	2026-06-28 01:14:02.522
5896	2311	WAJIB	175000	2026-06-27 12:42:12.965	2026-06-28 01:14:02.538
5894	2310	WAJIB	200000	2026-06-27 12:42:12.962	2026-06-28 01:14:02.53
5898	2312	WAJIB	175000	2026-06-27 12:42:12.969	2026-06-28 01:14:02.547
5899	2313	POKOK	50000	2026-06-27 12:42:12.972	2026-06-28 01:14:02.547
5900	2313	WAJIB	125000	2026-06-27 12:42:12.973	2026-06-28 01:14:02.552
5902	2314	WAJIB	175000	2026-06-27 12:42:12.977	2026-06-28 01:14:02.593
5903	2315	POKOK	50000	2026-06-27 12:42:12.98	2026-06-28 01:14:02.595
5904	2315	WAJIB	25000	2026-06-27 12:42:12.98	2026-06-28 01:14:02.595
5905	2316	POKOK	50000	2026-06-27 12:42:12.983	2026-06-28 01:14:02.596
5906	2316	WAJIB	175000	2026-06-27 12:42:12.983	2026-06-28 01:14:02.606
5909	2318	POKOK	50000	2026-06-27 12:42:12.99	2026-06-28 01:14:02.611
5908	2317	WAJIB	100000	2026-06-27 12:42:12.987	2026-06-28 01:14:02.61
5913	2320	POKOK	50000	2026-06-27 12:42:12.996	2026-06-28 01:14:02.63
5910	2318	WAJIB	200000	2026-06-27 12:42:12.99	2026-06-28 01:14:02.621
5912	2319	WAJIB	200000	2026-06-27 12:42:12.993	2026-06-28 01:14:02.629
5916	2321	WAJIB	175000	2026-06-27 12:42:13.002	2026-06-28 01:14:02.644
5918	2322	WAJIB	175000	2026-06-27 12:42:13.005	2026-06-28 01:14:02.649
5920	2323	WAJIB	175000	2026-06-27 12:42:13.009	2026-06-28 01:14:02.655
5921	2324	POKOK	50000	2026-06-27 12:42:13.011	2026-06-28 01:14:02.656
5922	2324	WAJIB	125000	2026-06-27 12:42:13.012	2026-06-28 01:14:02.66
5923	2325	POKOK	50000	2026-06-27 12:42:13.014	2026-06-28 01:14:02.661
5926	2326	WAJIB	175000	2026-06-27 12:42:13.024	2026-06-28 01:14:02.675
5924	2325	WAJIB	200000	2026-06-27 12:42:13.015	2026-06-28 01:14:02.668
5928	2327	WAJIB	175000	2026-06-27 12:42:13.029	2026-06-28 01:14:02.682
5930	2328	WAJIB	175000	2026-06-27 12:42:13.033	2026-06-28 01:14:02.691
5931	2329	POKOK	50000	2026-06-27 12:42:13.036	2026-06-28 01:14:02.693
5934	2330	WAJIB	175000	2026-06-27 12:42:13.043	2026-06-28 01:14:02.712
5932	2329	WAJIB	200000	2026-06-27 12:42:13.037	2026-06-28 01:14:02.703
5938	2332	WAJIB	175000	2026-06-27 12:42:13.051	2026-06-28 01:14:02.722
5940	2333	WAJIB	175000	2026-06-27 12:42:13.055	2026-06-28 01:14:02.728
5943	2335	POKOK	50000	2026-06-27 12:42:13.061	2026-06-28 01:14:02.736
5945	2336	POKOK	50000	2026-06-27 12:42:13.068	2026-06-28 01:14:02.745
5944	2335	WAJIB	200000	2026-06-27 12:42:13.062	2026-06-28 01:14:02.744
5951	2339	POKOK	50000	2026-06-27 12:42:13.081	2026-06-28 01:14:02.76
5946	2336	WAJIB	200000	2026-06-27 12:42:13.069	2026-06-28 01:14:02.753
5948	2337	WAJIB	100000	2026-06-27 12:42:13.074	2026-06-28 01:14:02.756
5950	2338	WAJIB	100000	2026-06-27 12:42:13.078	2026-06-28 01:14:02.76
5954	2340	WAJIB	175000	2026-06-27 12:42:13.085	2026-06-28 01:14:02.778
5952	2339	WAJIB	200000	2026-06-27 12:42:13.082	2026-06-28 01:14:02.768
5956	2341	WAJIB	175000	2026-06-27 12:42:13.089	2026-06-28 01:14:02.788
5958	2342	WAJIB	175000	2026-06-27 12:42:13.093	2026-06-28 01:14:02.797
5960	2343	WAJIB	175000	2026-06-27 12:42:13.098	2026-06-28 01:14:02.806
5966	2346	WAJIB	175000	2026-06-27 12:42:13.109	2026-06-28 01:14:02.824
5962	2344	WAJIB	100000	2026-06-27 12:42:13.101	2026-06-28 01:14:02.809
5968	2347	WAJIB	175000	2026-06-27 12:42:13.113	2026-06-28 01:14:02.831
6009	2368	POKOK	0	2026-06-27 12:42:13.202	2026-06-28 01:13:59.621
6013	2370	POKOK	0	2026-06-27 12:42:13.211	2026-06-28 01:13:59.621
6019	2373	POKOK	0	2026-06-27 12:42:13.225	2026-06-28 01:13:59.621
6021	2374	POKOK	0	2026-06-27 12:42:13.229	2026-06-28 01:13:59.621
6025	2376	POKOK	0	2026-06-27 12:42:13.237	2026-06-28 01:13:59.621
6027	2377	POKOK	0	2026-06-27 12:42:13.241	2026-06-28 01:13:59.621
6033	2380	POKOK	0	2026-06-27 12:42:13.254	2026-06-28 01:13:59.621
6035	2381	POKOK	0	2026-06-27 12:42:13.258	2026-06-28 01:13:59.621
6037	2382	POKOK	0	2026-06-27 12:42:13.262	2026-06-28 01:13:59.621
6039	2383	POKOK	0	2026-06-27 12:42:13.264	2026-06-28 01:13:59.621
6041	2384	POKOK	0	2026-06-27 12:42:13.269	2026-06-28 01:13:59.621
6047	2387	POKOK	0	2026-06-27 12:42:13.283	2026-06-28 01:13:59.621
6051	2389	POKOK	0	2026-06-27 12:42:13.29	2026-06-28 01:13:59.621
6053	2390	POKOK	0	2026-06-27 12:42:13.293	2026-06-28 01:13:59.621
6055	2391	POKOK	0	2026-06-27 12:42:13.295	2026-06-28 01:13:59.621
6065	2396	POKOK	0	2026-06-27 12:42:13.319	2026-06-28 01:13:59.621
6071	2399	POKOK	0	2026-06-27 12:42:13.332	2026-06-28 01:13:59.621
6073	2400	POKOK	0	2026-06-27 12:42:13.336	2026-06-28 01:13:59.621
6075	2401	POKOK	0	2026-06-27 12:42:13.34	2026-06-28 01:13:59.621
6081	2404	POKOK	0	2026-06-27 12:42:13.352	2026-06-28 01:13:59.621
6087	2407	POKOK	0	2026-06-27 12:42:13.365	2026-06-28 01:13:59.621
6089	2408	POKOK	0	2026-06-27 12:42:13.369	2026-06-28 01:13:59.621
6091	2409	POKOK	0	2026-06-27 12:42:13.373	2026-06-28 01:13:59.621
6095	2411	POKOK	0	2026-06-27 12:42:13.38	2026-06-28 01:13:59.621
6097	2412	POKOK	0	2026-06-27 12:42:13.383	2026-06-28 01:13:59.621
6103	2415	POKOK	0	2026-06-27 12:42:13.393	2026-06-28 01:13:59.621
6105	2416	POKOK	0	2026-06-27 12:42:13.396	2026-06-28 01:13:59.621
6107	2417	POKOK	0	2026-06-27 12:42:13.399	2026-06-28 01:13:59.621
6109	2418	POKOK	0	2026-06-27 12:42:13.401	2026-06-28 01:13:59.621
6111	2419	POKOK	0	2026-06-27 12:42:13.404	2026-06-28 01:13:59.621
6113	2420	POKOK	0	2026-06-27 12:42:13.407	2026-06-28 01:13:59.621
6117	2422	POKOK	0	2026-06-27 12:42:13.413	2026-06-28 01:13:59.621
6119	2423	POKOK	0	2026-06-27 12:42:13.415	2026-06-28 01:13:59.621
6121	2424	POKOK	0	2026-06-27 12:42:13.419	2026-06-28 01:13:59.621
5970	2348	WAJIB	25000	2026-06-27 12:42:13.117	2026-06-28 01:14:02.832
5935	2331	POKOK	50000	2026-06-27 12:42:13.045	2026-06-28 01:14:02.834
5976	2351	WAJIB	175000	2026-06-27 12:42:13.13	2026-06-28 01:14:02.853
5977	2352	POKOK	50000	2026-06-27 12:42:13.133	2026-06-28 01:14:02.854
5978	2352	WAJIB	175000	2026-06-27 12:42:13.133	2026-06-28 01:14:02.86
5980	2353	WAJIB	175000	2026-06-27 12:42:13.139	2026-06-28 01:14:02.869
5981	2354	POKOK	50000	2026-06-27 12:42:13.142	2026-06-28 01:14:02.87
5983	2355	POKOK	50000	2026-06-27 12:42:13.147	2026-06-28 01:14:02.884
5982	2354	WAJIB	200000	2026-06-27 12:42:13.143	2026-06-28 01:14:02.882
5985	2356	POKOK	50000	2026-06-27 12:42:13.151	2026-06-28 01:14:02.896
5984	2355	WAJIB	200000	2026-06-27 12:42:13.147	2026-06-28 01:14:02.895
5987	2357	POKOK	50000	2026-06-27 12:42:13.155	2026-06-28 01:14:02.906
5986	2356	WAJIB	200000	2026-06-27 12:42:13.152	2026-06-28 01:14:02.905
5989	2358	POKOK	50000	2026-06-27 12:42:13.159	2026-06-28 01:14:02.915
5991	2359	POKOK	50000	2026-06-27 12:42:13.164	2026-06-28 01:14:02.922
5990	2358	WAJIB	200000	2026-06-27 12:42:13.16	2026-06-28 01:14:02.921
5994	2360	WAJIB	175000	2026-06-27 12:42:13.168	2026-06-28 01:14:02.936
5995	2361	POKOK	50000	2026-06-27 12:42:13.172	2026-06-28 01:14:02.937
5998	2362	WAJIB	175000	2026-06-27 12:42:13.178	2026-06-28 01:14:02.95
5996	2361	WAJIB	200000	2026-06-27 12:42:13.173	2026-06-28 01:14:02.944
5999	2363	POKOK	50000	2026-06-27 12:42:13.181	2026-06-28 01:14:02.951
6002	2364	WAJIB	175000	2026-06-27 12:42:13.185	2026-06-28 01:14:02.971
6000	2363	WAJIB	200000	2026-06-27 12:42:13.182	2026-06-28 01:14:02.96
6003	2365	POKOK	50000	2026-06-27 12:42:13.189	2026-06-28 01:14:02.973
6010	2368	WAJIB	175000	2026-06-27 12:42:13.203	2026-06-28 01:14:03.008
6004	2365	WAJIB	200000	2026-06-27 12:42:13.19	2026-06-28 01:14:02.984
6006	2366	WAJIB	200000	2026-06-27 12:42:13.194	2026-06-28 01:14:02.994
6011	2369	POKOK	50000	2026-06-27 12:42:13.206	2026-06-28 01:14:03.008
6014	2370	WAJIB	25000	2026-06-27 12:42:13.212	2026-06-28 01:14:03.018
6012	2369	WAJIB	200000	2026-06-27 12:42:13.207	2026-06-28 01:14:03.017
6015	2371	POKOK	50000	2026-06-27 12:42:13.215	2026-06-28 01:14:03.019
6017	2372	POKOK	50000	2026-06-27 12:42:13.22	2026-06-28 01:14:03.027
6016	2371	WAJIB	200000	2026-06-27 12:42:13.216	2026-06-28 01:14:03.027
6020	2373	WAJIB	175000	2026-06-27 12:42:13.226	2026-06-28 01:14:03.043
6022	2374	WAJIB	175000	2026-06-27 12:42:13.23	2026-06-28 01:14:03.049
6023	2375	POKOK	50000	2026-06-27 12:42:13.233	2026-06-28 01:14:03.05
6026	2376	WAJIB	175000	2026-06-27 12:42:13.238	2026-06-28 01:14:03.07
6024	2375	WAJIB	200000	2026-06-27 12:42:13.233	2026-06-28 01:14:03.06
6028	2377	WAJIB	175000	2026-06-27 12:42:13.242	2026-06-28 01:14:03.08
6029	2378	POKOK	50000	2026-06-27 12:42:13.245	2026-06-28 01:14:03.081
6034	2380	WAJIB	175000	2026-06-27 12:42:13.255	2026-06-28 01:14:03.103
6030	2378	WAJIB	200000	2026-06-27 12:42:13.245	2026-06-28 01:14:03.089
6032	2379	WAJIB	200000	2026-06-27 12:42:13.25	2026-06-28 01:14:03.096
6036	2381	WAJIB	175000	2026-06-27 12:42:13.259	2026-06-28 01:14:03.109
6040	2383	WAJIB	175000	2026-06-27 12:42:13.265	2026-06-28 01:14:03.12
6038	2382	WAJIB	100000	2026-06-27 12:42:13.262	2026-06-28 01:14:03.114
6042	2384	WAJIB	175000	2026-06-27 12:42:13.269	2026-06-28 01:14:03.126
6043	2385	POKOK	50000	2026-06-27 12:42:13.272	2026-06-28 01:14:03.127
6045	2386	POKOK	50000	2026-06-27 12:42:13.277	2026-06-28 01:14:03.136
6048	2387	WAJIB	175000	2026-06-27 12:42:13.283	2026-06-28 01:14:03.157
6046	2386	WAJIB	200000	2026-06-27 12:42:13.279	2026-06-28 01:14:03.147
6049	2388	POKOK	50000	2026-06-27 12:42:13.286	2026-06-28 01:14:03.158
6052	2389	WAJIB	175000	2026-06-27 12:42:13.291	2026-06-28 01:14:03.17
6050	2388	WAJIB	50000	2026-06-27 12:42:13.287	2026-06-28 01:14:03.161
6054	2390	WAJIB	175000	2026-06-27 12:42:13.293	2026-06-28 01:14:03.178
6056	2391	WAJIB	175000	2026-06-27 12:42:13.296	2026-06-28 01:14:03.185
6059	2393	POKOK	50000	2026-06-27 12:42:13.304	2026-06-28 01:14:03.194
6058	2392	WAJIB	200000	2026-06-27 12:42:13.302	2026-06-28 01:14:03.194
6061	2394	POKOK	50000	2026-06-27 12:42:13.309	2026-06-28 01:14:03.202
6060	2393	WAJIB	200000	2026-06-27 12:42:13.305	2026-06-28 01:14:03.201
6063	2395	POKOK	50000	2026-06-27 12:42:13.313	2026-06-28 01:14:03.21
6062	2394	WAJIB	200000	2026-06-27 12:42:13.31	2026-06-28 01:14:03.209
6066	2396	WAJIB	175000	2026-06-27 12:42:13.319	2026-06-28 01:14:03.226
6064	2395	WAJIB	200000	2026-06-27 12:42:13.314	2026-06-28 01:14:03.218
6067	2397	POKOK	50000	2026-06-27 12:42:13.322	2026-06-28 01:14:03.227
6069	2398	POKOK	50000	2026-06-27 12:42:13.327	2026-06-28 01:14:03.238
6074	2400	WAJIB	25000	2026-06-27 12:42:13.337	2026-06-28 01:14:03.257
6070	2398	WAJIB	200000	2026-06-27 12:42:13.327	2026-06-28 01:14:03.25
6072	2399	WAJIB	100000	2026-06-27 12:42:13.332	2026-06-28 01:14:03.256
6076	2401	WAJIB	175000	2026-06-27 12:42:13.34	2026-06-28 01:14:03.267
6077	2402	POKOK	50000	2026-06-27 12:42:13.343	2026-06-28 01:14:03.268
6079	2403	POKOK	50000	2026-06-27 12:42:13.348	2026-06-28 01:14:03.276
6082	2404	WAJIB	175000	2026-06-27 12:42:13.353	2026-06-28 01:14:03.29
6080	2403	WAJIB	200000	2026-06-27 12:42:13.349	2026-06-28 01:14:03.284
6083	2405	POKOK	50000	2026-06-27 12:42:13.356	2026-06-28 01:14:03.29
6085	2406	POKOK	50000	2026-06-27 12:42:13.36	2026-06-28 01:14:03.299
6084	2405	WAJIB	200000	2026-06-27 12:42:13.356	2026-06-28 01:14:03.298
6088	2407	WAJIB	175000	2026-06-27 12:42:13.366	2026-06-28 01:14:03.315
6086	2406	WAJIB	200000	2026-06-27 12:42:13.361	2026-06-28 01:14:03.306
6090	2408	WAJIB	175000	2026-06-27 12:42:13.37	2026-06-28 01:14:03.327
6127	2427	POKOK	0	2026-06-27 12:42:13.428	2026-06-28 01:13:59.621
6129	2428	POKOK	0	2026-06-27 12:42:13.431	2026-06-28 01:13:59.621
6133	2430	POKOK	0	2026-06-27 12:42:13.437	2026-06-28 01:13:59.621
6135	2431	POKOK	0	2026-06-27 12:42:13.44	2026-06-28 01:13:59.621
6141	2434	POKOK	0	2026-06-27 12:42:13.449	2026-06-28 01:13:59.621
6142	2434	WAJIB	0	2026-06-27 12:42:13.45	2026-06-28 01:13:59.621
6143	2435	POKOK	0	2026-06-27 12:42:13.451	2026-06-28 01:13:59.621
6145	2436	POKOK	0	2026-06-27 12:42:13.454	2026-06-28 01:13:59.621
6147	2437	POKOK	0	2026-06-27 12:42:13.457	2026-06-28 01:13:59.621
6149	2438	POKOK	0	2026-06-27 12:42:13.46	2026-06-28 01:13:59.621
6153	2440	POKOK	0	2026-06-27 12:42:13.465	2026-06-28 01:13:59.621
6157	2442	POKOK	0	2026-06-27 12:42:13.472	2026-06-28 01:13:59.621
6165	2446	POKOK	0	2026-06-27 12:42:13.489	2026-06-28 01:13:59.621
6169	2448	POKOK	0	2026-06-27 12:42:13.497	2026-06-28 01:13:59.621
6171	2449	POKOK	0	2026-06-27 12:42:13.501	2026-06-28 01:13:59.621
6175	2451	POKOK	0	2026-06-27 12:42:13.509	2026-06-28 01:13:59.621
6179	2453	POKOK	0	2026-06-27 12:42:13.516	2026-06-28 01:13:59.621
6183	2455	POKOK	0	2026-06-27 12:42:13.525	2026-06-28 01:13:59.621
6185	2456	POKOK	0	2026-06-27 12:42:13.53	2026-06-28 01:13:59.621
6189	2458	POKOK	0	2026-06-27 12:42:13.538	2026-06-28 01:13:59.621
6193	2460	POKOK	0	2026-06-27 12:42:13.547	2026-06-28 01:13:59.621
6199	2463	POKOK	0	2026-06-27 12:42:13.559	2026-06-28 01:13:59.621
6201	2464	POKOK	0	2026-06-27 12:42:13.563	2026-06-28 01:13:59.621
6203	2465	POKOK	0	2026-06-27 12:42:13.567	2026-06-28 01:13:59.621
6205	2466	POKOK	0	2026-06-27 12:42:13.571	2026-06-28 01:13:59.621
6207	2467	POKOK	0	2026-06-27 12:42:13.575	2026-06-28 01:13:59.621
6209	2468	POKOK	0	2026-06-27 12:42:13.579	2026-06-28 01:13:59.621
6213	2470	POKOK	0	2026-06-27 12:42:13.588	2026-06-28 01:13:59.621
6215	2471	POKOK	0	2026-06-27 12:42:13.592	2026-06-28 01:13:59.621
6217	2472	POKOK	0	2026-06-27 12:42:13.596	2026-06-28 01:13:59.621
6219	2473	POKOK	0	2026-06-27 12:42:13.6	2026-06-28 01:13:59.621
6221	2474	POKOK	0	2026-06-27 12:42:13.603	2026-06-28 01:13:59.621
6225	2476	POKOK	0	2026-06-27 12:42:13.611	2026-06-28 01:13:59.621
6235	2481	POKOK	0	2026-06-27 12:42:13.632	2026-06-28 01:13:59.621
6241	2484	POKOK	0	2026-06-27 12:42:13.646	2026-06-28 01:13:59.621
6243	2485	POKOK	0	2026-06-27 12:42:13.649	2026-06-28 01:13:59.621
6093	2410	POKOK	50000	2026-06-27 12:42:13.377	2026-06-28 01:14:03.36
6096	2411	WAJIB	25000	2026-06-27 12:42:13.381	2026-06-28 01:14:03.39
6098	2412	WAJIB	175000	2026-06-27 12:42:13.383	2026-06-28 01:14:03.409
6099	2413	POKOK	50000	2026-06-27 12:42:13.385	2026-06-28 01:14:03.412
6104	2415	WAJIB	175000	2026-06-27 12:42:13.394	2026-06-28 01:14:03.463
6100	2413	WAJIB	200000	2026-06-27 12:42:13.386	2026-06-28 01:14:03.434
6102	2414	WAJIB	200000	2026-06-27 12:42:13.39	2026-06-28 01:14:03.451
6106	2416	WAJIB	175000	2026-06-27 12:42:13.397	2026-06-28 01:14:03.472
6108	2417	WAJIB	175000	2026-06-27 12:42:13.399	2026-06-28 01:14:03.48
6110	2418	WAJIB	175000	2026-06-27 12:42:13.402	2026-06-28 01:14:03.489
6114	2420	WAJIB	175000	2026-06-27 12:42:13.407	2026-06-28 01:14:03.504
6112	2419	WAJIB	100000	2026-06-27 12:42:13.404	2026-06-28 01:14:03.495
6115	2421	POKOK	50000	2026-06-27 12:42:13.41	2026-06-28 01:14:03.505
6120	2423	WAJIB	175000	2026-06-27 12:42:13.416	2026-06-28 01:14:03.535
6116	2421	WAJIB	200000	2026-06-27 12:42:13.41	2026-06-28 01:14:03.517
6118	2422	WAJIB	100000	2026-06-27 12:42:13.413	2026-06-28 01:14:03.524
6123	2425	POKOK	50000	2026-06-27 12:42:13.422	2026-06-28 01:14:03.549
6128	2427	WAJIB	175000	2026-06-27 12:42:13.429	2026-06-28 01:14:03.584
6124	2425	WAJIB	200000	2026-06-27 12:42:13.422	2026-06-28 01:14:03.561
6126	2426	WAJIB	200000	2026-06-27 12:42:13.425	2026-06-28 01:14:03.574
6131	2429	POKOK	50000	2026-06-27 12:42:13.433	2026-06-28 01:14:03.596
6134	2430	WAJIB	175000	2026-06-27 12:42:13.438	2026-06-28 01:14:03.618
6132	2429	WAJIB	200000	2026-06-27 12:42:13.434	2026-06-28 01:14:03.608
6136	2431	WAJIB	175000	2026-06-27 12:42:13.44	2026-06-28 01:14:03.627
6137	2432	POKOK	50000	2026-06-27 12:42:13.442	2026-06-28 01:14:03.628
6139	2433	POKOK	50000	2026-06-27 12:42:13.446	2026-06-28 01:14:03.64
6138	2432	WAJIB	200000	2026-06-27 12:42:13.443	2026-06-28 01:14:03.639
6144	2435	WAJIB	175000	2026-06-27 12:42:13.452	2026-06-28 01:14:03.666
6140	2433	WAJIB	200000	2026-06-27 12:42:13.446	2026-06-28 01:14:03.655
6148	2437	WAJIB	175000	2026-06-27 12:42:13.458	2026-06-28 01:14:03.684
6146	2436	WAJIB	100000	2026-06-27 12:42:13.455	2026-06-28 01:14:03.673
6150	2438	WAJIB	175000	2026-06-27 12:42:13.46	2026-06-28 01:14:03.693
6151	2439	POKOK	50000	2026-06-27 12:42:13.462	2026-06-28 01:14:03.694
6154	2440	WAJIB	175000	2026-06-27 12:42:13.466	2026-06-28 01:14:03.71
6155	2441	POKOK	50000	2026-06-27 12:42:13.469	2026-06-28 01:14:03.71
6158	2442	WAJIB	175000	2026-06-27 12:42:13.473	2026-06-28 01:14:03.727
6159	2443	POKOK	50000	2026-06-27 12:42:13.476	2026-06-28 01:14:03.728
6161	2444	POKOK	50000	2026-06-27 12:42:13.481	2026-06-28 01:14:03.737
6160	2443	WAJIB	200000	2026-06-27 12:42:13.477	2026-06-28 01:14:03.736
6163	2445	POKOK	50000	2026-06-27 12:42:13.484	2026-06-28 01:14:03.746
6162	2444	WAJIB	200000	2026-06-27 12:42:13.481	2026-06-28 01:14:03.745
6166	2446	WAJIB	175000	2026-06-27 12:42:13.49	2026-06-28 01:14:03.763
6164	2445	WAJIB	200000	2026-06-27 12:42:13.485	2026-06-28 01:14:03.754
6167	2447	POKOK	50000	2026-06-27 12:42:13.492	2026-06-28 01:14:03.764
6170	2448	WAJIB	175000	2026-06-27 12:42:13.498	2026-06-28 01:14:03.784
6168	2447	WAJIB	200000	2026-06-27 12:42:13.493	2026-06-28 01:14:03.774
6173	2450	POKOK	50000	2026-06-27 12:42:13.504	2026-06-28 01:14:03.788
6172	2449	WAJIB	100000	2026-06-27 12:42:13.502	2026-06-28 01:14:03.787
6176	2451	WAJIB	175000	2026-06-27 12:42:13.509	2026-06-28 01:14:03.8
6177	2452	POKOK	50000	2026-06-27 12:42:13.512	2026-06-28 01:14:03.8
6180	2453	WAJIB	175000	2026-06-27 12:42:13.517	2026-06-28 01:14:03.815
6181	2454	POKOK	50000	2026-06-27 12:42:13.52	2026-06-28 01:14:03.815
6184	2455	WAJIB	175000	2026-06-27 12:42:13.525	2026-06-28 01:14:03.828
6182	2454	WAJIB	200000	2026-06-27 12:42:13.521	2026-06-28 01:14:03.822
6186	2456	WAJIB	175000	2026-06-27 12:42:13.531	2026-06-28 01:14:03.835
6187	2457	POKOK	50000	2026-06-27 12:42:13.534	2026-06-28 01:14:03.835
6190	2458	WAJIB	175000	2026-06-27 12:42:13.539	2026-06-28 01:14:03.846
6188	2457	WAJIB	50000	2026-06-27 12:42:13.535	2026-06-28 01:14:03.837
6191	2459	POKOK	50000	2026-06-27 12:42:13.542	2026-06-28 01:14:03.847
6192	2459	WAJIB	175000	2026-06-27 12:42:13.542	2026-06-28 01:14:03.856
6194	2460	WAJIB	175000	2026-06-27 12:42:13.548	2026-06-28 01:14:03.865
6195	2461	POKOK	50000	2026-06-27 12:42:13.55	2026-06-28 01:14:03.866
6197	2462	POKOK	50000	2026-06-27 12:42:13.554	2026-06-28 01:14:03.875
6196	2461	WAJIB	200000	2026-06-27 12:42:13.551	2026-06-28 01:14:03.874
6200	2463	WAJIB	175000	2026-06-27 12:42:13.56	2026-06-28 01:14:03.888
6206	2466	WAJIB	175000	2026-06-27 12:42:13.572	2026-06-28 01:14:03.909
6204	2465	WAJIB	150000	2026-06-27 12:42:13.568	2026-06-28 01:14:03.903
6208	2467	WAJIB	175000	2026-06-27 12:42:13.576	2026-06-28 01:14:03.916
6210	2468	WAJIB	175000	2026-06-27 12:42:13.58	2026-06-28 01:14:03.923
6211	2469	POKOK	50000	2026-06-27 12:42:13.583	2026-06-28 01:14:03.924
6214	2470	WAJIB	175000	2026-06-27 12:42:13.589	2026-06-28 01:14:03.941
6212	2469	WAJIB	200000	2026-06-27 12:42:13.584	2026-06-28 01:14:03.932
6216	2471	WAJIB	175000	2026-06-27 12:42:13.593	2026-06-28 01:14:03.949
6218	2472	WAJIB	175000	2026-06-27 12:42:13.597	2026-06-28 01:14:03.957
6220	2473	WAJIB	175000	2026-06-27 12:42:13.6	2026-06-28 01:14:03.964
6222	2474	WAJIB	25000	2026-06-27 12:42:13.604	2026-06-28 01:14:03.965
6223	2475	POKOK	50000	2026-06-27 12:42:13.608	2026-06-28 01:14:03.966
6224	2475	WAJIB	125000	2026-06-27 12:42:13.608	2026-06-28 01:14:03.97
5131	1929	POKOK	0	2026-06-27 12:42:11.613	2026-06-28 01:13:59.621
5133	1930	POKOK	0	2026-06-27 12:42:11.631	2026-06-28 01:13:59.621
5141	1934	POKOK	0	2026-06-27 12:42:11.648	2026-06-28 01:13:59.621
5145	1936	POKOK	0	2026-06-27 12:42:11.655	2026-06-28 01:13:59.621
5153	1940	POKOK	0	2026-06-27 12:42:11.668	2026-06-28 01:13:59.621
6245	2486	POKOK	0	2026-06-27 12:42:13.653	2026-06-28 01:13:59.621
6247	2487	POKOK	0	2026-06-27 12:42:13.656	2026-06-28 01:13:59.621
6253	2490	POKOK	0	2026-06-27 12:42:13.668	2026-06-28 01:13:59.621
6265	2496	POKOK	0	2026-06-27 12:42:13.691	2026-06-28 01:13:59.621
6269	2498	POKOK	0	2026-06-27 12:42:13.698	2026-06-28 01:13:59.621
6271	2499	POKOK	0	2026-06-27 12:42:13.702	2026-06-28 01:13:59.621
6273	2500	POKOK	0	2026-06-27 12:42:13.704	2026-06-28 01:13:59.621
6277	2502	POKOK	0	2026-06-27 12:42:13.712	2026-06-28 01:13:59.621
6281	2504	POKOK	0	2026-06-27 12:42:13.72	2026-06-28 01:13:59.621
6283	2505	POKOK	0	2026-06-27 12:42:13.723	2026-06-28 01:13:59.621
6287	2507	POKOK	0	2026-06-27 12:42:13.731	2026-06-28 01:13:59.621
6295	2511	POKOK	0	2026-06-27 12:42:13.763	2026-06-28 01:13:59.621
5523	2125	POKOK	0	2026-06-27 12:42:12.311	2026-06-28 01:13:59.621
5132	1929	WAJIB	175000	2026-06-27 12:42:11.624	2026-06-28 01:14:00.005
5336	2031	WAJIB	175000	2026-06-27 12:42:12.022	2026-06-28 01:14:00.754
5338	2032	WAJIB	200000	2026-06-27 12:42:12.024	2026-06-28 01:13:59.708
5360	2043	WAJIB	125000	2026-06-27 12:42:12.064	2026-06-28 01:13:59.801
5134	1930	WAJIB	175000	2026-06-27 12:42:11.631	2026-06-28 01:14:00.015
5135	1931	POKOK	50000	2026-06-27 12:42:11.634	2026-06-28 01:14:00.016
5137	1932	POKOK	50000	2026-06-27 12:42:11.641	2026-06-28 01:14:00.028
5136	1931	WAJIB	200000	2026-06-27 12:42:11.635	2026-06-28 01:14:00.027
5139	1933	POKOK	50000	2026-06-27 12:42:11.644	2026-06-28 01:14:00.038
5138	1932	WAJIB	200000	2026-06-27 12:42:11.641	2026-06-28 01:14:00.037
5143	1935	POKOK	50000	2026-06-27 12:42:11.652	2026-06-28 01:14:00.05
5140	1933	WAJIB	200000	2026-06-27 12:42:11.645	2026-06-28 01:14:00.046
5142	1934	WAJIB	100000	2026-06-27 12:42:11.649	2026-06-28 01:14:00.049
5146	1936	WAJIB	25000	2026-06-27 12:42:11.655	2026-06-28 01:14:00.06
5144	1935	WAJIB	200000	2026-06-27 12:42:11.652	2026-06-28 01:14:00.059
5147	1937	POKOK	50000	2026-06-27 12:42:11.658	2026-06-28 01:14:00.062
5149	1938	POKOK	50000	2026-06-27 12:42:11.661	2026-06-28 01:14:00.073
5148	1937	WAJIB	200000	2026-06-27 12:42:11.659	2026-06-28 01:14:00.071
5151	1939	POKOK	50000	2026-06-27 12:42:11.664	2026-06-28 01:14:00.085
5154	1940	WAJIB	175000	2026-06-27 12:42:11.668	2026-06-28 01:14:00.1
5152	1939	WAJIB	200000	2026-06-27 12:42:11.665	2026-06-28 01:14:00.094
5155	1941	POKOK	50000	2026-06-27 12:42:11.671	2026-06-28 01:14:00.102
5157	1942	POKOK	50000	2026-06-27 12:42:11.674	2026-06-28 01:14:00.112
5156	1941	WAJIB	200000	2026-06-27 12:42:11.671	2026-06-28 01:14:00.11
5159	1943	POKOK	50000	2026-06-27 12:42:11.678	2026-06-28 01:14:00.121
5158	1942	WAJIB	200000	2026-06-27 12:42:11.674	2026-06-28 01:14:00.12
5160	1943	WAJIB	125000	2026-06-27 12:42:11.679	2026-06-28 01:14:00.127
5161	1944	POKOK	50000	2026-06-27 12:42:11.683	2026-06-28 01:14:00.128
6226	2476	WAJIB	175000	2026-06-27 12:42:13.612	2026-06-28 01:14:03.976
5162	1944	WAJIB	200000	2026-06-27 12:42:11.684	2026-06-28 01:14:00.138
6227	2477	POKOK	50000	2026-06-27 12:42:13.615	2026-06-28 01:14:03.977
6231	2479	POKOK	50000	2026-06-27 12:42:13.624	2026-06-28 01:14:03.992
6228	2477	WAJIB	200000	2026-06-27 12:42:13.616	2026-06-28 01:14:03.984
6230	2478	WAJIB	200000	2026-06-27 12:42:13.621	2026-06-28 01:14:03.992
6233	2480	POKOK	50000	2026-06-27 12:42:13.628	2026-06-28 01:14:04
6236	2481	WAJIB	175000	2026-06-27 12:42:13.633	2026-06-28 01:14:04.015
6234	2480	WAJIB	200000	2026-06-27 12:42:13.629	2026-06-28 01:14:04.007
6237	2482	POKOK	50000	2026-06-27 12:42:13.635	2026-06-28 01:14:04.016
6239	2483	POKOK	50000	2026-06-27 12:42:13.641	2026-06-28 01:14:04.027
6238	2482	WAJIB	200000	2026-06-27 12:42:13.635	2026-06-28 01:14:04.026
6242	2484	WAJIB	175000	2026-06-27 12:42:13.647	2026-06-28 01:14:04.045
6240	2483	WAJIB	200000	2026-06-27 12:42:13.642	2026-06-28 01:14:04.038
6244	2485	WAJIB	175000	2026-06-27 12:42:13.65	2026-06-28 01:14:04.05
6246	2486	WAJIB	175000	2026-06-27 12:42:13.653	2026-06-28 01:14:04.057
6248	2487	WAJIB	175000	2026-06-27 12:42:13.657	2026-06-28 01:14:04.063
6249	2488	POKOK	50000	2026-06-27 12:42:13.659	2026-06-28 01:14:04.064
6251	2489	POKOK	50000	2026-06-27 12:42:13.663	2026-06-28 01:14:04.073
6250	2488	WAJIB	200000	2026-06-27 12:42:13.66	2026-06-28 01:14:04.071
6254	2490	WAJIB	175000	2026-06-27 12:42:13.669	2026-06-28 01:14:04.085
6252	2489	WAJIB	200000	2026-06-27 12:42:13.664	2026-06-28 01:14:04.079
6255	2491	POKOK	50000	2026-06-27 12:42:13.671	2026-06-28 01:14:04.086
6257	2492	POKOK	50000	2026-06-27 12:42:13.675	2026-06-28 01:14:04.091
6261	2494	POKOK	50000	2026-06-27 12:42:13.683	2026-06-28 01:14:04.105
6258	2492	WAJIB	200000	2026-06-27 12:42:13.676	2026-06-28 01:14:04.099
6260	2493	WAJIB	300000	2026-06-27 12:42:13.68	2026-06-28 01:14:04.642
6262	2494	WAJIB	125000	2026-06-27 12:42:13.683	2026-06-28 01:14:04.112
6263	2495	POKOK	50000	2026-06-27 12:42:13.687	2026-06-28 01:14:04.113
6266	2496	WAJIB	175000	2026-06-27 12:42:13.692	2026-06-28 01:14:04.129
6264	2495	WAJIB	200000	2026-06-27 12:42:13.687	2026-06-28 01:14:04.123
6267	2497	POKOK	50000	2026-06-27 12:42:13.694	2026-06-28 01:14:04.13
6270	2498	WAJIB	75000	2026-06-27 12:42:13.699	2026-06-28 01:14:04.14
6268	2497	WAJIB	200000	2026-06-27 12:42:13.695	2026-06-28 01:14:04.137
6272	2499	WAJIB	175000	2026-06-27 12:42:13.703	2026-06-28 01:14:04.146
6274	2500	WAJIB	175000	2026-06-27 12:42:13.706	2026-06-28 01:14:04.153
6275	2501	POKOK	50000	2026-06-27 12:42:13.709	2026-06-28 01:14:04.154
6279	2503	POKOK	50000	2026-06-27 12:42:13.716	2026-06-28 01:14:04.168
6276	2501	WAJIB	200000	2026-06-27 12:42:13.709	2026-06-28 01:14:04.16
6282	2504	WAJIB	175000	2026-06-27 12:42:13.721	2026-06-28 01:14:04.181
6280	2503	WAJIB	200000	2026-06-27 12:42:13.716	2026-06-28 01:14:04.175
6285	2506	POKOK	50000	2026-06-27 12:42:13.726	2026-06-28 01:14:04.188
6284	2505	WAJIB	100000	2026-06-27 12:42:13.723	2026-06-28 01:14:04.187
6289	2508	POKOK	50000	2026-06-27 12:42:13.733	2026-06-28 01:14:04.205
6286	2506	WAJIB	200000	2026-06-27 12:42:13.727	2026-06-28 01:14:04.198
6288	2507	WAJIB	100000	2026-06-27 12:42:13.731	2026-06-28 01:14:04.204
6290	2508	WAJIB	175000	2026-06-27 12:42:13.734	2026-06-28 01:14:04.214
6291	2509	POKOK	50000	2026-06-27 12:42:13.755	2026-06-28 01:14:04.215
6293	2510	POKOK	50000	2026-06-27 12:42:13.759	2026-06-28 01:14:04.222
6292	2509	WAJIB	200000	2026-06-27 12:42:13.755	2026-06-28 01:14:04.221
6296	2511	WAJIB	175000	2026-06-27 12:42:13.764	2026-06-28 01:14:04.237
6294	2510	WAJIB	200000	2026-06-27 12:42:13.76	2026-06-28 01:14:04.23
6297	2512	POKOK	50000	2026-06-27 12:42:13.766	2026-06-28 01:14:04.238
6299	2513	POKOK	50000	2026-06-27 12:42:13.77	2026-06-28 01:14:04.245
6298	2512	WAJIB	200000	2026-06-27 12:42:13.767	2026-06-28 01:14:04.245
6347	2537	POKOK	50000	2026-06-27 12:42:13.855	2026-06-28 01:14:04.435
6350	2538	WAJIB	175000	2026-06-27 12:42:13.86	2026-06-28 01:14:04.45
6348	2537	WAJIB	200000	2026-06-27 12:42:13.855	2026-06-28 01:14:04.445
6352	2539	WAJIB	175000	2026-06-27 12:42:13.863	2026-06-28 01:14:04.457
6356	2541	WAJIB	175000	2026-06-27 12:42:13.872	2026-06-28 01:14:04.467
6354	2540	WAJIB	100000	2026-06-27 12:42:13.866	2026-06-28 01:14:04.46
6358	2542	WAJIB	175000	2026-06-27 12:42:13.875	2026-06-28 01:14:04.473
6359	2543	POKOK	50000	2026-06-27 12:42:13.878	2026-06-28 01:14:04.474
6362	2544	WAJIB	175000	2026-06-27 12:42:13.882	2026-06-28 01:14:04.487
6360	2543	WAJIB	200000	2026-06-27 12:42:13.879	2026-06-28 01:14:04.48
6364	2545	WAJIB	175000	2026-06-27 12:42:13.884	2026-06-28 01:14:04.493
6259	2493	POKOK	50000	2026-06-27 12:42:13.679	2026-06-28 01:14:04.635
6307	2517	POKOK	0	2026-06-27 12:42:13.783	2026-06-28 01:13:59.621
6309	2518	POKOK	0	2026-06-27 12:42:13.786	2026-06-28 01:13:59.621
6311	2519	POKOK	0	2026-06-27 12:42:13.789	2026-06-28 01:13:59.621
6313	2520	POKOK	0	2026-06-27 12:42:13.797	2026-06-28 01:13:59.621
6315	2521	POKOK	0	2026-06-27 12:42:13.8	2026-06-28 01:13:59.621
6317	2522	POKOK	0	2026-06-27 12:42:13.802	2026-06-28 01:13:59.621
6319	2523	POKOK	0	2026-06-27 12:42:13.805	2026-06-28 01:13:59.621
6321	2524	POKOK	0	2026-06-27 12:42:13.809	2026-06-28 01:13:59.621
6323	2525	POKOK	0	2026-06-27 12:42:13.812	2026-06-28 01:13:59.621
6329	2528	POKOK	0	2026-06-27 12:42:13.823	2026-06-28 01:13:59.621
6333	2530	POKOK	0	2026-06-27 12:42:13.831	2026-06-28 01:13:59.621
6339	2533	POKOK	0	2026-06-27 12:42:13.842	2026-06-28 01:13:59.621
6343	2535	POKOK	0	2026-06-27 12:42:13.848	2026-06-28 01:13:59.621
6349	2538	POKOK	0	2026-06-27 12:42:13.86	2026-06-28 01:13:59.621
6351	2539	POKOK	0	2026-06-27 12:42:13.862	2026-06-28 01:13:59.621
6353	2540	POKOK	0	2026-06-27 12:42:13.865	2026-06-28 01:13:59.621
6355	2541	POKOK	0	2026-06-27 12:42:13.871	2026-06-28 01:13:59.621
6357	2542	POKOK	0	2026-06-27 12:42:13.874	2026-06-28 01:13:59.621
6361	2544	POKOK	0	2026-06-27 12:42:13.881	2026-06-28 01:13:59.621
6363	2545	POKOK	0	2026-06-27 12:42:13.883	2026-06-28 01:13:59.621
6342	2534	WAJIB	200000	2026-06-27 12:42:13.845	2026-06-28 01:14:04.413
6330	2528	WAJIB	175000	2026-06-27 12:42:13.823	2026-06-28 01:14:04.365
6331	2529	POKOK	50000	2026-06-27 12:42:13.826	2026-06-28 01:14:04.366
6316	2521	WAJIB	175000	2026-06-27 12:42:13.8	2026-06-28 01:14:04.323
6318	2522	WAJIB	100000	2026-06-27 12:42:13.803	2026-06-28 01:14:04.326
6344	2535	WAJIB	175000	2026-06-27 12:42:13.849	2026-06-28 01:14:04.423
6345	2536	POKOK	50000	2026-06-27 12:42:13.851	2026-06-28 01:14:04.424
6332	2529	WAJIB	200000	2026-06-27 12:42:13.827	2026-06-28 01:14:04.374
6346	2536	WAJIB	200000	2026-06-27 12:42:13.852	2026-06-28 01:14:04.434
6301	2514	POKOK	100000	2026-06-27 12:42:13.773	2026-06-28 01:14:04.253
6334	2530	WAJIB	175000	2026-06-27 12:42:13.832	2026-06-28 01:14:04.379
6335	2531	POKOK	50000	2026-06-27 12:42:13.834	2026-06-28 01:14:04.38
6320	2523	WAJIB	175000	2026-06-27 12:42:13.805	2026-06-28 01:14:04.333
6302	2514	WAJIB	300000	2026-06-27 12:42:13.773	2026-06-28 01:14:04.26
6303	2515	POKOK	50000	2026-06-27 12:42:13.776	2026-06-28 01:14:04.261
6336	2531	WAJIB	200000	2026-06-27 12:42:13.835	2026-06-28 01:14:04.386
6322	2524	WAJIB	175000	2026-06-27 12:42:13.81	2026-06-28 01:14:04.338
6337	2532	POKOK	50000	2026-06-27 12:42:13.838	2026-06-28 01:14:04.387
6304	2515	WAJIB	200000	2026-06-27 12:42:13.777	2026-06-28 01:14:04.268
6305	2516	POKOK	50000	2026-06-27 12:42:13.78	2026-06-28 01:14:04.269
6324	2525	WAJIB	175000	2026-06-27 12:42:13.813	2026-06-28 01:14:04.344
6325	2526	POKOK	50000	2026-06-27 12:42:13.815	2026-06-28 01:14:04.345
6306	2516	WAJIB	200000	2026-06-27 12:42:13.78	2026-06-28 01:14:04.277
6308	2517	WAJIB	75000	2026-06-27 12:42:13.784	2026-06-28 01:14:04.282
6338	2532	WAJIB	200000	2026-06-27 12:42:13.839	2026-06-28 01:14:04.394
6326	2526	WAJIB	200000	2026-06-27 12:42:13.815	2026-06-28 01:14:04.352
6310	2518	WAJIB	175000	2026-06-27 12:42:13.787	2026-06-28 01:14:04.293
6327	2527	POKOK	50000	2026-06-27 12:42:13.819	2026-06-28 01:14:04.353
6340	2533	WAJIB	175000	2026-06-27 12:42:13.842	2026-06-28 01:14:04.403
6341	2534	POKOK	50000	2026-06-27 12:42:13.844	2026-06-28 01:14:04.404
6312	2519	WAJIB	175000	2026-06-27 12:42:13.794	2026-06-28 01:14:04.302
6328	2527	WAJIB	200000	2026-06-27 12:42:13.819	2026-06-28 01:14:04.359
6314	2520	WAJIB	175000	2026-06-27 12:42:13.798	2026-06-28 01:14:04.313
6122	2424	WAJIB	175000	2026-06-27 12:42:13.419	2026-06-28 01:14:03.548
5388	2057	WAJIB	125000	2026-06-27 12:42:12.106	2026-06-28 01:13:59.893
5150	1938	WAJIB	200000	2026-06-27 12:42:11.662	2026-06-28 01:14:00.083
5626	2176	WAJIB	200000	2026-06-27 12:42:12.472	2026-06-28 01:14:01.522
5914	2320	WAJIB	200000	2026-06-27 12:42:12.997	2026-06-28 01:14:02.638
5164	1945	WAJIB	200000	2026-06-27 12:42:11.69	2026-06-28 01:14:00.149
6152	2439	WAJIB	200000	2026-06-27 12:42:13.463	2026-06-28 01:14:03.703
5656	2191	WAJIB	200000	2026-06-27 12:42:12.522	2026-06-28 01:14:01.625
5942	2334	WAJIB	175000	2026-06-27 12:42:13.059	2026-06-28 01:14:02.735
5168	1947	WAJIB	200000	2026-06-27 12:42:11.703	2026-06-28 01:14:00.175
5188	1957	WAJIB	25000	2026-06-27 12:42:11.733	2026-06-28 01:14:00.241
5190	1958	WAJIB	100000	2026-06-27 12:42:11.738	2026-06-28 01:14:00.248
5214	1970	WAJIB	75000	2026-06-27 12:42:11.795	2026-06-28 01:14:00.338
5597	2162	POKOK	50000	2026-06-27 12:42:12.429	2026-06-28 01:14:00.352
5672	2199	WAJIB	200000	2026-06-27 12:42:12.552	2026-06-28 01:14:01.676
5242	1984	WAJIB	200000	2026-06-27 12:42:11.865	2026-06-28 01:14:00.434
5974	2350	WAJIB	175000	2026-06-27 12:42:13.125	2026-06-28 01:14:02.847
5676	2201	WAJIB	200000	2026-06-27 12:42:12.561	2026-06-28 01:14:01.695
5266	1996	WAJIB	200000	2026-06-27 12:42:11.907	2026-06-28 01:14:00.519
6174	2450	WAJIB	200000	2026-06-27 12:42:13.505	2026-06-28 01:14:03.795
5290	2008	WAJIB	125000	2026-06-27 12:42:11.948	2026-06-28 01:14:00.603
5698	2212	WAJIB	200000	2026-06-27 12:42:12.603	2026-06-28 01:14:01.773
5705	2216	POKOK	50000	2026-06-27 12:42:12.617	2026-06-28 01:14:01.801
5314	2020	WAJIB	200000	2026-06-27 12:42:11.988	2026-06-28 01:14:00.687
5988	2357	WAJIB	200000	2026-06-27 12:42:13.155	2026-06-28 01:14:02.914
5420	2073	WAJIB	200000	2026-06-27 12:42:12.155	2026-06-28 01:14:00.775
5706	2216	WAJIB	200000	2026-06-27 12:42:12.618	2026-06-28 01:14:01.808
6198	2462	WAJIB	200000	2026-06-27 12:42:13.555	2026-06-28 01:14:03.883
5442	2084	WAJIB	200000	2026-06-27 12:42:12.188	2026-06-28 01:14:00.863
5992	2359	WAJIB	200000	2026-06-27 12:42:13.164	2026-06-28 01:14:02.929
5732	2229	WAJIB	200000	2026-06-27 12:42:12.66	2026-06-28 01:14:01.899
5448	2087	WAJIB	200000	2026-06-27 12:42:12.198	2026-06-28 01:14:00.884
5758	2242	WAJIB	200000	2026-06-27 12:42:12.712	2026-06-28 01:14:01.989
5472	2099	WAJIB	200000	2026-06-27 12:42:12.236	2026-06-28 01:14:00.972
6232	2479	WAJIB	200000	2026-06-27 12:42:13.624	2026-06-28 01:14:03.999
6018	2372	WAJIB	200000	2026-06-27 12:42:13.221	2026-06-28 01:14:03.036
5494	2110	WAJIB	175000	2026-06-27 12:42:12.27	2026-06-28 01:14:01.052
5786	2256	WAJIB	200000	2026-06-27 12:42:12.766	2026-06-28 01:14:02.089
5526	2126	WAJIB	175000	2026-06-27 12:42:12.315	2026-06-28 01:14:01.153
5839	2283	POKOK	50000	2026-06-27 12:42:12.87	2026-06-28 01:14:01.192
5552	2139	WAJIB	100000	2026-06-27 12:42:12.353	2026-06-28 01:14:01.239
6256	2491	WAJIB	100000	2026-06-27 12:42:13.671	2026-06-28 01:14:04.09
5810	2268	WAJIB	200000	2026-06-27 12:42:12.816	2026-06-28 01:14:02.184
6044	2385	WAJIB	200000	2026-06-27 12:42:13.273	2026-06-28 01:14:03.135
5572	2149	WAJIB	200000	2026-06-27 12:42:12.384	2026-06-28 01:14:01.327
5830	2278	WAJIB	200000	2026-06-27 12:42:12.854	2026-06-28 01:14:02.278
5594	2160	WAJIB	175000	2026-06-27 12:42:12.423	2026-06-28 01:14:01.419
6278	2502	WAJIB	175000	2026-06-27 12:42:13.713	2026-06-28 01:14:04.167
6068	2397	WAJIB	200000	2026-06-27 12:42:13.322	2026-06-28 01:14:03.237
5838	2282	WAJIB	200000	2026-06-27 12:42:12.868	2026-06-28 01:14:02.315
5866	2296	WAJIB	200000	2026-06-27 12:42:12.914	2026-06-28 01:14:02.419
5890	2308	WAJIB	100000	2026-06-27 12:42:12.957	2026-06-28 01:14:02.513
6007	2367	POKOK	50000	2026-06-27 12:42:13.199	2026-06-28 01:14:02.559
6092	2409	WAJIB	175000	2026-06-27 12:42:13.374	2026-06-28 01:14:03.354
6300	2513	WAJIB	200000	2026-06-27 12:42:13.771	2026-06-28 01:14:04.252
6374	2550	WAJIB	100000	2026-06-27 12:42:13.901	2026-06-28 01:14:04.526
6094	2410	WAJIB	200000	2026-06-27 12:42:13.378	2026-06-28 01:14:03.388
6394	2560	WAJIB	200000	2026-06-27 12:42:13.933	2026-06-28 01:14:04.595
\.


--
-- Data for Name: TagihanPaylater; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TagihanPaylater" (id, "orderId", "anggotaId", nominal, status, "jatuhTempo", "tanggalBayar", "createdAt", "updatedAt") FROM stdin;
3	4	2157	0	BELUM_BAYAR	2026-07-28 08:44:40.476	\N	2026-06-28 08:44:40.477	2026-06-28 08:52:16.613
\.


--
-- Data for Name: Transaksi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Transaksi" (id, "anggotaId", "jenisTransaksi", kategori, nominal, keterangan, "lampiranBuktiUrl", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User" (id, username, password, role, name, "createdAt", "updatedAt") FROM stdin;
1	admin	$2b$10$3.vBr0rrFXN71gp1Ufz/KehKsKKq.16SmJ5FkgRztAdXi0PaXdura	SUPERADMIN	Super Admin	2026-06-27 10:31:55.911	2026-06-27 10:31:55.911
\.


--
-- Name: Anggota_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Anggota_id_seq"', 2576, true);


--
-- Name: Angsuran_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Angsuran_id_seq"', 88, true);


--
-- Name: AuditTrail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."AuditTrail_id_seq"', 4, true);


--
-- Name: Chat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Chat_id_seq"', 8, true);


--
-- Name: JurnalUmum_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."JurnalUmum_id_seq"', 1, true);


--
-- Name: KasKoperasi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."KasKoperasi_id_seq"', 1, true);


--
-- Name: LogAktivitas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."LogAktivitas_id_seq"', 2, true);


--
-- Name: MutasiSimpanan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."MutasiSimpanan_id_seq"', 10357, true);


--
-- Name: Notifikasi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Notifikasi_id_seq"', 644, true);


--
-- Name: OrderItem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."OrderItem_id_seq"', 4, true);


--
-- Name: Order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Order_id_seq"', 4, true);


--
-- Name: PenarikanSimpanan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."PenarikanSimpanan_id_seq"', 1, false);


--
-- Name: Pengaduan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Pengaduan_id_seq"', 1, true);


--
-- Name: PengaturanUmum_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."PengaturanUmum_id_seq"', 29, true);


--
-- Name: PeriodeSHU_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."PeriodeSHU_id_seq"', 1, false);


--
-- Name: Pinjaman_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Pinjaman_id_seq"', 13, true);


--
-- Name: Produk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Produk_id_seq"', 1, true);


--
-- Name: RiwayatSHU_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RiwayatSHU_id_seq"', 1, false);


--
-- Name: Simpanan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Simpanan_id_seq"', 6419, true);


--
-- Name: TagihanPaylater_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."TagihanPaylater_id_seq"', 3, true);


--
-- Name: Transaksi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Transaksi_id_seq"', 1, false);


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."User_id_seq"', 2, true);


--
-- Name: Anggota Anggota_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Anggota"
    ADD CONSTRAINT "Anggota_pkey" PRIMARY KEY (id);


--
-- Name: Angsuran Angsuran_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Angsuran"
    ADD CONSTRAINT "Angsuran_pkey" PRIMARY KEY (id);


--
-- Name: AuditTrail AuditTrail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AuditTrail"
    ADD CONSTRAINT "AuditTrail_pkey" PRIMARY KEY (id);


--
-- Name: Chat Chat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Chat"
    ADD CONSTRAINT "Chat_pkey" PRIMARY KEY (id);


--
-- Name: JurnalUmum JurnalUmum_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."JurnalUmum"
    ADD CONSTRAINT "JurnalUmum_pkey" PRIMARY KEY (id);


--
-- Name: KasKoperasi KasKoperasi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KasKoperasi"
    ADD CONSTRAINT "KasKoperasi_pkey" PRIMARY KEY (id);


--
-- Name: LogAktivitas LogAktivitas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LogAktivitas"
    ADD CONSTRAINT "LogAktivitas_pkey" PRIMARY KEY (id);


--
-- Name: MutasiSimpanan MutasiSimpanan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MutasiSimpanan"
    ADD CONSTRAINT "MutasiSimpanan_pkey" PRIMARY KEY (id);


--
-- Name: Notifikasi Notifikasi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Notifikasi"
    ADD CONSTRAINT "Notifikasi_pkey" PRIMARY KEY (id);


--
-- Name: OrderItem OrderItem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderItem"
    ADD CONSTRAINT "OrderItem_pkey" PRIMARY KEY (id);


--
-- Name: Order Order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY (id);


--
-- Name: PenarikanSimpanan PenarikanSimpanan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PenarikanSimpanan"
    ADD CONSTRAINT "PenarikanSimpanan_pkey" PRIMARY KEY (id);


--
-- Name: Pengaduan Pengaduan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pengaduan"
    ADD CONSTRAINT "Pengaduan_pkey" PRIMARY KEY (id);


--
-- Name: PengaturanUmum PengaturanUmum_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PengaturanUmum"
    ADD CONSTRAINT "PengaturanUmum_pkey" PRIMARY KEY (id);


--
-- Name: PeriodeSHU PeriodeSHU_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PeriodeSHU"
    ADD CONSTRAINT "PeriodeSHU_pkey" PRIMARY KEY (id);


--
-- Name: Pinjaman Pinjaman_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pinjaman"
    ADD CONSTRAINT "Pinjaman_pkey" PRIMARY KEY (id);


--
-- Name: Produk Produk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Produk"
    ADD CONSTRAINT "Produk_pkey" PRIMARY KEY (id);


--
-- Name: RiwayatSHU RiwayatSHU_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RiwayatSHU"
    ADD CONSTRAINT "RiwayatSHU_pkey" PRIMARY KEY (id);


--
-- Name: Simpanan Simpanan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Simpanan"
    ADD CONSTRAINT "Simpanan_pkey" PRIMARY KEY (id);


--
-- Name: TagihanPaylater TagihanPaylater_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TagihanPaylater"
    ADD CONSTRAINT "TagihanPaylater_pkey" PRIMARY KEY (id);


--
-- Name: Transaksi Transaksi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transaksi"
    ADD CONSTRAINT "Transaksi_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: Anggota_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Anggota_email_key" ON public."Anggota" USING btree (email);


--
-- Name: Anggota_nip_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Anggota_nip_key" ON public."Anggota" USING btree (nip);


--
-- Name: PeriodeSHU_tahun_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "PeriodeSHU_tahun_key" ON public."PeriodeSHU" USING btree (tahun);


--
-- Name: TagihanPaylater_orderId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "TagihanPaylater_orderId_key" ON public."TagihanPaylater" USING btree ("orderId");


--
-- Name: User_username_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "User_username_key" ON public."User" USING btree (username);


--
-- Name: Angsuran Angsuran_pinjamanId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Angsuran"
    ADD CONSTRAINT "Angsuran_pinjamanId_fkey" FOREIGN KEY ("pinjamanId") REFERENCES public."Pinjaman"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: AuditTrail AuditTrail_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AuditTrail"
    ADD CONSTRAINT "AuditTrail_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: MutasiSimpanan MutasiSimpanan_anggotaId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MutasiSimpanan"
    ADD CONSTRAINT "MutasiSimpanan_anggotaId_fkey" FOREIGN KEY ("anggotaId") REFERENCES public."Anggota"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Notifikasi Notifikasi_anggotaId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Notifikasi"
    ADD CONSTRAINT "Notifikasi_anggotaId_fkey" FOREIGN KEY ("anggotaId") REFERENCES public."Anggota"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: OrderItem OrderItem_orderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderItem"
    ADD CONSTRAINT "OrderItem_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES public."Order"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: OrderItem OrderItem_produkId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderItem"
    ADD CONSTRAINT "OrderItem_produkId_fkey" FOREIGN KEY ("produkId") REFERENCES public."Produk"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: PenarikanSimpanan PenarikanSimpanan_anggotaId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PenarikanSimpanan"
    ADD CONSTRAINT "PenarikanSimpanan_anggotaId_fkey" FOREIGN KEY ("anggotaId") REFERENCES public."Anggota"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Pengaduan Pengaduan_anggotaId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pengaduan"
    ADD CONSTRAINT "Pengaduan_anggotaId_fkey" FOREIGN KEY ("anggotaId") REFERENCES public."Anggota"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Pinjaman Pinjaman_anggotaId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pinjaman"
    ADD CONSTRAINT "Pinjaman_anggotaId_fkey" FOREIGN KEY ("anggotaId") REFERENCES public."Anggota"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: RiwayatSHU RiwayatSHU_anggotaId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RiwayatSHU"
    ADD CONSTRAINT "RiwayatSHU_anggotaId_fkey" FOREIGN KEY ("anggotaId") REFERENCES public."Anggota"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: RiwayatSHU RiwayatSHU_periodeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RiwayatSHU"
    ADD CONSTRAINT "RiwayatSHU_periodeId_fkey" FOREIGN KEY ("periodeId") REFERENCES public."PeriodeSHU"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Simpanan Simpanan_anggotaId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Simpanan"
    ADD CONSTRAINT "Simpanan_anggotaId_fkey" FOREIGN KEY ("anggotaId") REFERENCES public."Anggota"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: TagihanPaylater TagihanPaylater_anggotaId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TagihanPaylater"
    ADD CONSTRAINT "TagihanPaylater_anggotaId_fkey" FOREIGN KEY ("anggotaId") REFERENCES public."Anggota"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: TagihanPaylater TagihanPaylater_orderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TagihanPaylater"
    ADD CONSTRAINT "TagihanPaylater_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES public."Order"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Transaksi Transaksi_anggotaId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transaksi"
    ADD CONSTRAINT "Transaksi_anggotaId_fkey" FOREIGN KEY ("anggotaId") REFERENCES public."Anggota"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

\unrestrict obWH2zxciUP14KtFFDPmhcP2M2YZHyBFysRBVtWBRaJYuXps3GSYM8YihIEfkeS

