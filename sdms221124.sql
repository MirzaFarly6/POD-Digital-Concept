CREATE DATABASE  IF NOT EXISTS `sdms` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `sdms`;
-- MySQL dump 10.16  Distrib 10.1.10-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: sdms
-- ------------------------------------------------------
-- Server version	10.1.10-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `abandonment_site_restoration`
--

DROP TABLE IF EXISTS `abandonment_site_restoration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abandonment_site_restoration` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `well_abd_total` int(11) DEFAULT NULL COMMENT 'Jumlah sumur yang akan dilakukan abandonment\n',
  `asr_well_dev_cost` decimal(13,3) DEFAULT NULL COMMENT 'Biaya ASR untuk sumur pengembangan dalam satuan MMUSD\n',
  `asr_prod_facility_cost` decimal(13,3) DEFAULT NULL COMMENT 'Biaya ASR untuk fasilitas produksi dalam satuan MMUSD\n',
  `asr_total_cost` decimal(13,3) DEFAULT NULL COMMENT 'Total seluruh biaya ASR dalam satuan MMUSD\n',
  KEY `abandonment_site_restoration_FK` (`pod_id`),
  CONSTRAINT `abandonment_site_restoration_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cementing_program`
--

DROP TABLE IF EXISTS `cementing_program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cementing_program` (
  `well_id` int(11) NOT NULL COMMENT 'Nomor identifikasi sumur berdasarkan kolom WELL_ID di dalam sheet Well\n',
  `hole_size` decimal(13,3) DEFAULT NULL COMMENT 'Ukuran lubang suatu sumur dalam rancangan desain semen dalam satuan inch\n',
  `well_depth` decimal(13,3) DEFAULT NULL COMMENT 'Kedalaman sumur pada rencana desain semen dalam satuan feet Measured Depth Rotary Table\n',
  `csg_size` decimal(13,3) DEFAULT NULL COMMENT 'Ukuran casing yang digunakan dalam kegiatan penyemenan pada suatu sumur dalam satuan inch\n',
  `cement_density_lead` decimal(13,3) DEFAULT NULL COMMENT 'Densitas atau berat jenis semen pada lead dalam satuan pounds per gallon\n',
  `cement_density_tail` decimal(13,3) DEFAULT NULL COMMENT 'Densitas atau berat jenis semen pada tail dalam satuan pounds per gallon\n',
  `cement_program_img` varchar(100) DEFAULT NULL COMMENT 'Program penyemenan casing 9-5/8"\n',
  KEY `cementing_program_FK` (`well_id`),
  CONSTRAINT `cementing_program_FK` FOREIGN KEY (`well_id`) REFERENCES `well` (`well_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `completion`
--

DROP TABLE IF EXISTS `completion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `completion` (
  `pod_id` int(11) DEFAULT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `field_id` int(11) DEFAULT NULL COMMENT 'Nomor identifikasi lapangan berdasarkan kolom FIELD_ID di dalam sheet R Field\n',
  `well_id` int(11) DEFAULT NULL COMMENT 'Nomor identifikasi sumur berdasarkan kolom WELL_ID di dalam sheet Well\n',
  `well_compl_plan` text COMMENT 'Rencana komplesi sumur untuk sumur produksi\n',
  `well_comp_scheme` varchar(100) DEFAULT NULL COMMENT 'Skema usulan komplesi\n',
  `wellhead_class` varchar(100) DEFAULT NULL COMMENT 'Spesifikasi kelas dari Wellhead yang diusulkan untuk desain casing pada POD\n',
  `rig_capacity` int(11) DEFAULT NULL COMMENT 'Perhitungan Kapasitas rig dalam satuan horse power\n',
  `comp_day` int(11) DEFAULT NULL COMMENT 'Estimasi hari untuk pengerjaan komplesi sumur\n',
  `compl_cost` int(11) DEFAULT NULL COMMENT 'Completion cost dalam satuan USD\n',
  `compl_cost_ref` text COMMENT 'Referensi biaya yang digunakan\n',
  KEY `completion_FK` (`pod_id`),
  KEY `completion_FK_1` (`field_id`),
  KEY `completion_FK_2` (`well_id`),
  CONSTRAINT `completion_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `completion_FK_1` FOREIGN KEY (`field_id`) REFERENCES `r_field` (`field_id`),
  CONSTRAINT `completion_FK_2` FOREIGN KEY (`well_id`) REFERENCES `well` (`well_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `constant_composition_expansion`
--

DROP TABLE IF EXISTS `constant_composition_expansion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `constant_composition_expansion` (
  `field_id` int(11) NOT NULL COMMENT 'Nomor identifikasi lapangan berdasarkan kolom FIELD_ID di dalam sheet R Field\n',
  `well_id` int(11) NOT NULL COMMENT 'Nomor identifikasi sumur berdasarkan kolom WELL_ID di dalam sheet Well\n',
  `sampling_depth` int(11) DEFAULT NULL COMMENT 'Titik kedalaman sampel yang diambil dalam satuan meter\n',
  `sample_date` date DEFAULT NULL COMMENT 'Tanggal saat sampel diambil dalam format dd-mm-yyyy\n',
  `cce_temperature` decimal(13,3) DEFAULT NULL COMMENT 'Temperatur yang diatur pada temperatur reservoir dalam satuan celcius\n',
  `cce_pressure` int(11) DEFAULT NULL COMMENT 'Tekanan yang diatur sama dengan tekanan reservoir atau lebih tinggi dalam satuan psig\n',
  `cce_relative_vol` decimal(13,3) DEFAULT NULL COMMENT 'Volume relatif merupakan perbandingan antara total volume hidrokarbon dan volume saat tekanan saturasi\n',
  `cce_dev_factor_z` decimal(13,3) DEFAULT NULL COMMENT 'Deviation Factor Z yang didapat dari hasil studi Constant Composition Expansion\n',
  `cce_density` decimal(13,3) DEFAULT NULL COMMENT 'Nilai densitas didapat dari hasil studi Constant Composition Expansion dalam satuan g/cm3\n',
  `cce_fvf_gas` decimal(13,3) DEFAULT NULL COMMENT 'Nilai faktor volume formasi gas yang didapat dari hasil studi Constant Composition Expansion dalam satuan bbl/scf\n',
  `cce_gas_expansion_factor` decimal(13,3) DEFAULT NULL COMMENT 'Ekspansi tudung gas awal dalam satuan scf/ft3\n',
  `cce_calculated_gas_viscosity` decimal(13,3) DEFAULT NULL COMMENT 'Viskositas gas kalkulasi yang didapat dari hasil studi Constant Composition Expansion dalam satuan centipoise\n',
  `cce_matching_result_img` varchar(100) DEFAULT NULL COMMENT 'Hasil Constant Composition Expansion Matching berdasarkan analisa PVT\n',
  `cce_matching_analysis` text COMMENT 'Hasil Constant Composition Expansion Matching berasal dari analisa PVT yang menggunakan input hasil studi CCE dari laboratorium\n',
  KEY `constant_composition_expansion_FK` (`field_id`),
  KEY `constant_composition_expansion_FK_1` (`well_id`),
  CONSTRAINT `constant_composition_expansion_FK` FOREIGN KEY (`field_id`) REFERENCES `r_field` (`field_id`),
  CONSTRAINT `constant_composition_expansion_FK_1` FOREIGN KEY (`well_id`) REFERENCES `well` (`well_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cross_plot_analysis`
--

DROP TABLE IF EXISTS `cross_plot_analysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cross_plot_analysis` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `well_id` int(11) NOT NULL COMMENT 'Nomor identifikasi sumur berdasarkan kolom WELL_ID di dalam sheet Well\n',
  `xplot_bestparams_img` varchar(100) DEFAULT NULL COMMENT 'Gambar crossplot parameter fisis terbaik yang digunakan (contoh crossplot AI vs porositas, lambda rho vs GR dll)\n',
  `xplot_bestparams_analysis` text COMMENT 'Analisa dari gambar crossplot parameter fisis yang digunakan\n',
  KEY `cross_plot_analysis_FK` (`pod_id`),
  KEY `cross_plot_analysis_FK_1` (`well_id`),
  CONSTRAINT `cross_plot_analysis_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `cross_plot_analysis_FK_1` FOREIGN KEY (`well_id`) REFERENCES `well` (`well_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cross_plot_parameter`
--

DROP TABLE IF EXISTS `cross_plot_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cross_plot_parameter` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `well_id` int(11) NOT NULL COMMENT 'Nomor identifikasi sumur berdasarkan kolom WELL_ID di dalam sheet Well\n',
  `xplot_bestparams` decimal(13,3) DEFAULT NULL COMMENT 'Parameter fisis terbaik yang dapat digunakan untuk membedakan litologi atau fluida dan melihat karakter reservoir berdasarkan hasil crossplot\n',
  `xplot_cutoff_min` decimal(13,3) DEFAULT NULL COMMENT 'Nilai batas bawah cut-off dari parameter fisis, satuan berdasarkan parameter fisis tersebut\n',
  `xplot_cutoff_mid` decimal(13,3) DEFAULT NULL COMMENT 'Nilai batas tengah cut-off dari parameter fisis, satuan berdasarkan parameter fisis tersebut\n',
  `xplot_cutoff_max` varchar(100) DEFAULT NULL COMMENT 'Nilai batas atas cut-off dari parameter fisis, satuan berdasarkan parameter fisis tersebut\n',
  `xplot_cutoff_explanation` text COMMENT 'Penjelasan nilai cut-off\n',
  KEY `cross_plot_parameter_FK` (`pod_id`),
  KEY `cross_plot_parameter_FK_1` (`well_id`),
  CONSTRAINT `cross_plot_parameter_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `cross_plot_parameter_FK_1` FOREIGN KEY (`well_id`) REFERENCES `well` (`well_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `development_capex`
--

DROP TABLE IF EXISTS `development_capex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `development_capex` (
  `pod_id` int(11) DEFAULT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `capex_year` date DEFAULT NULL COMMENT 'Tahun tertentu untuk perhitungan biaya investasi proyek pengembangan lapangan\n',
  `capex_drilling` decimal(13,3) DEFAULT NULL COMMENT 'Perkiraan biaya investasi untuk pekerjaan pengeboran pada tahun tertentu dalam satuan MMUSD\n',
  `capex_facility` decimal(13,3) DEFAULT NULL COMMENT 'Perkiraan biaya investasi untuk pekerjaan fasilitas produksi pada tahun tertentu dalam satuan MMUSD\n',
  KEY `development_capex_FK` (`pod_id`),
  CONSTRAINT `development_capex_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drilling`
--

DROP TABLE IF EXISTS `drilling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drilling` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `field_id` int(11) NOT NULL COMMENT 'Nomor identifikasi lapangan berdasarkan kolom FIELD_ID di dalam sheet R Field\n',
  `well_id` int(11) NOT NULL COMMENT 'Nomor identifikasi sumur berdasarkan kolom WELL_ID di dalam sheet Well\n',
  `drill_plan` text COMMENT 'Perencanaan kegiatan pemboran (kegiatan, jadwal, jumlah sumur, dan target formasi pemboran)\n',
  `well_design` varchar(100) DEFAULT NULL COMMENT 'Desain sumur yang diusulkan untuk pemboran\n',
  `well_design_triaxial` varchar(100) DEFAULT NULL COMMENT 'Perhitungan triaxial desain casing sumur\n',
  `octg_material` varchar(100) DEFAULT NULL COMMENT 'Material oil country tubular goods (OCTG) yang digunakan pada setiap casing sumur pengembangan\n',
  `well_est_operation_time` decimal(13,3) DEFAULT NULL COMMENT 'Estimasi durasi operasi sumur ( (tidak termasuk hari untuk mobilisasi dan demobilisasi dari Jack Up Rig) dalam satuan hari\n',
  `drill_est_opt_day` int(11) DEFAULT NULL COMMENT 'Estimasi hari untuk pemboran optimum\n',
  `drill_operation_cost` int(11) DEFAULT NULL COMMENT 'Drilling operation cost dalam satuan USD\n',
  `general_cost` int(11) DEFAULT NULL COMMENT 'General cost dalam satuan USD\n',
  `drill_cost_total` int(11) DEFAULT NULL COMMENT 'Total biaya pemboran sumur pengembangan dalam satuan USD\n',
  KEY `drilling_FK` (`pod_id`),
  KEY `drilling_FK_1` (`field_id`),
  KEY `drilling_FK_2` (`well_id`),
  CONSTRAINT `drilling_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `drilling_FK_1` FOREIGN KEY (`field_id`) REFERENCES `r_field` (`field_id`),
  CONSTRAINT `drilling_FK_2` FOREIGN KEY (`well_id`) REFERENCES `well` (`well_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drilling_estimation_cost`
--

DROP TABLE IF EXISTS `drilling_estimation_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drilling_estimation_cost` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `field_id` int(11) NOT NULL COMMENT 'Nomor identifikasi lapangan berdasarkan kolom FIELD_ID di dalam sheet R Field\n',
  `well_id` int(11) NOT NULL COMMENT 'Nomor identifikasi sumur berdasarkan kolom WELL_ID di dalam sheet Well\n',
  `drill_cost_est` decimal(13,3) DEFAULT NULL COMMENT 'Perkiraan biaya pemboran untuk sumur lapangan pengembangan\n',
  `drill_days_total` decimal(13,3) DEFAULT NULL COMMENT 'Total hari pemboran dalam satuan hari\n',
  `drill_cost_illustration` decimal(13,3) DEFAULT NULL COMMENT 'Ilustrasi biaya pemboran dalam satuan USD\n',
  `drill_cost_ref` text COMMENT 'Referensi biaya yang digunakan\n',
  KEY `drilling_estimation_cost_FK` (`pod_id`),
  KEY `drilling_estimation_cost_FK_1` (`field_id`),
  KEY `drilling_estimation_cost_FK_2` (`well_id`),
  CONSTRAINT `drilling_estimation_cost_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `drilling_estimation_cost_FK_1` FOREIGN KEY (`field_id`) REFERENCES `r_field` (`field_id`),
  CONSTRAINT `drilling_estimation_cost_FK_2` FOREIGN KEY (`well_id`) REFERENCES `well` (`well_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drilling_target`
--

DROP TABLE IF EXISTS `drilling_target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drilling_target` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `well_id` int(11) NOT NULL COMMENT 'Nomor identifikasi sumur berdasarkan kolom WELL_ID di dalam sheet Well\n',
  `formation_id` int(11) NOT NULL COMMENT 'Formasi batuan yang ada di kedalaman akhir (Total Depth), merupakan FORMATION_ID di dalam sheet R Formation\n',
  `borehole_shape` varchar(100) DEFAULT NULL COMMENT 'Arah pengeboran (vertical, s-shaped, deviated, horizontal)\n',
  `depth_md` int(11) DEFAULT NULL COMMENT 'Kedalaman total terukur (measured depth) sumur bor yang diusulkan di dalam POD dalam satuan feet\n',
  `depth_tvd` int(11) DEFAULT NULL COMMENT 'Kedalaman total sumur bor secara vertikal yang diusulkan di dalam POD dalam satuan feet\n',
  `drill_scheme_img` varchar(100) DEFAULT NULL COMMENT 'Gambar skematik pengeboran sumur yang direncanakan\n',
  `well_loc_img` varchar(100) DEFAULT NULL COMMENT 'Peta titik pengeboran sumur yang direncanakan\n',
  KEY `drilling_target_FK` (`pod_id`),
  KEY `drilling_target_FK_1` (`well_id`),
  KEY `drilling_target_FK_2` (`formation_id`),
  CONSTRAINT `drilling_target_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `drilling_target_FK_1` FOREIGN KEY (`well_id`) REFERENCES `well` (`well_id`),
  CONSTRAINT `drilling_target_FK_2` FOREIGN KEY (`formation_id`) REFERENCES `r_formation` (`formation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `economics_commerical`
--

DROP TABLE IF EXISTS `economics_commerical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `economics_commerical` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `well_id` int(11) NOT NULL COMMENT 'Nomor identifikasi sumur berdasarkan kolom WELL_ID di dalam sheet Well. Kosongkan jika dokumen bukan POP (Put On Production)\n',
  `economic_assumptions` text COMMENT 'Asumsi dasar perhitungan perekonomian pada suatu lapangan yang akan diusulkan untuk dikerjakan\n',
  `psc_type` varchar(100) DEFAULT NULL COMMENT 'Tipe PSC Gross Split (GS) atau Cost Recovery (CR)\n',
  `past_cost` decimal(13,3) DEFAULT NULL COMMENT 'Biaya investasi untuk eksplorasi yang telah dikembalikan dari lapangan eksisting dalam satuan MMUSD\n',
  `lifting_oil` decimal(13,3) DEFAULT NULL COMMENT 'Perkiraan jumlah total minyak yang dapat diproduksikan dalam satuan MBbl\n',
  `price_oil_wavg` decimal(13,3) DEFAULT NULL COMMENT 'Asumsi rata-rata harga minyak dalam satuan USD/bbl\n',
  `lifting_gas_mmscf` decimal(13,3) DEFAULT NULL COMMENT 'Produksi gas jual dalam satuan MMSCF\n',
  `lifting_gas_tbtu` decimal(13,3) DEFAULT NULL COMMENT 'Produksi gas jual dalam satuan TBTU\n',
  `ghv` decimal(13,3) DEFAULT NULL COMMENT 'Gross Heating Value dalam satuan BTU/SCF\n',
  `price_gas_mmbtu` decimal(13,3) DEFAULT NULL COMMENT 'Asumsi rata-rata harga gas dalam satuan USD/MMBTU\n',
  `price_gas_mscf` decimal(13,3) DEFAULT NULL COMMENT 'Asumsi rata-rata harga gas dalam satuan USD/MSCF\n',
  `price_gas_escalation` decimal(13,3) DEFAULT NULL COMMENT 'Kenaikan harga gas tiap tahun dalam satuan fraksi\n',
  `lifting_con` decimal(13,3) DEFAULT NULL COMMENT 'Produksi kondensat dalam satuan MMSTB\n',
  `price_con_wavg` decimal(13,3) DEFAULT NULL COMMENT 'Asumsi rata-rata harga kondensat dalam satuan USD/bbl\n',
  `lifting_lpg` decimal(13,3) DEFAULT NULL COMMENT 'Produksi LPG dalam satuan Ribu Ton\n',
  `price_lpg_wavg` decimal(13,3) DEFAULT NULL COMMENT 'Asumsi rata-rata harga LPG dalam satuan USD/Ton\n',
  `prod_duration` decimal(13,3) DEFAULT NULL COMMENT 'Perkiraan lama waktu produksi hidrokarbon dalam satuan tahun\n',
  `revenue_gross` decimal(13,3) DEFAULT NULL COMMENT 'Pendapatan kotor yang dihitung dari jumlah lifting dikalikan harga rata-rata hidrokarbon dalam satuan MMUSD\n',
  `ftp_total` decimal(13,3) DEFAULT NULL COMMENT 'Total FTP atau bagian yang harus disisihan dari produksi sebelum dikurangi biaya cost recovery atau investment credit yang selanjutnya akan dibagi antara pemerintah dan kontraktor sesuai dengan bagi hasil yang berlaku dalam satuan MMUSD\n',
  `ftp_oil_contractor` decimal(13,3) DEFAULT NULL COMMENT 'Bagian oil yang didapatkan oleh kontraktor sebelum dikurangi biaya cost recovery atau investment credit dalam satuan MMUSD\n',
  `ftp_oil_gov` decimal(13,3) DEFAULT NULL COMMENT 'Bagian oil yang didapatkan oleh pemerintah sebelum dikurangi biaya cost recovery atau investment credit dalam satuan MMUSD\n',
  `ftp_gas_contractor` decimal(13,3) DEFAULT NULL COMMENT 'Bagian gas yang didapatkan oleh kontraktor sebelum dikurangi biaya cost recovery atau investment credit dalam satuan MMUSD\n',
  `ftp_gas_gov` decimal(13,3) DEFAULT NULL COMMENT 'Bagian gas yang didapatkan oleh pemerintah sebelum dikurangi biaya cost recovery atau investment credit dalam satuan MMUSD\n',
  `sum_inv_sunkcost` decimal(13,3) DEFAULT NULL COMMENT 'Total nilai investasi ditambah biaya dari bisnis yang tidak bisa dipulihkan kembali dalam satuan MMUSD\n',
  `capex_total` decimal(13,3) DEFAULT NULL COMMENT 'Total capital expenditure yaitu membeli, memperbaiki, merawat aset jangka panjang seperti bangunan dan fasilitas produksi dalam satuan MMUSD\n',
  `capex_drilling` decimal(13,3) DEFAULT NULL COMMENT 'Biaya investasi seluruh aktivitas pemboran dan komplesi yang diajukan di POD dalam MMUSD\n',
  `capex_prod_facility` decimal(13,3) DEFAULT NULL COMMENT 'Biaya investasi seluruh fasilitas produksi yang diajukan di POD dalam MMUSD\n',
  `capex_other` decimal(13,3) DEFAULT NULL COMMENT 'Biaya investasi lainnya dalam MMUSD\n',
  `capex_intangible` decimal(13,3) DEFAULT NULL COMMENT 'Biaya capital expenditure yang tidak berwujud seperti paten dan lisensi dalam satuan MMUSD\n',
  `capex_tangible` decimal(13,3) DEFAULT NULL COMMENT 'Biaya capital expenditure yang berwujud seperti bangunan dan peralatan produksi dalam satuan MMUSD\n',
  `opex_total` decimal(13,3) DEFAULT NULL COMMENT 'Total operation expenditure dan biaya ASR dalam satuan MMUSD\n',
  `opex_operation` decimal(13,3) DEFAULT NULL COMMENT 'Pengeluaran yang biasa dilakukan untuk memenuhi kebutuhan operasional seperti bahan bakar dan gaji karyawan dalam satuan MMUSD\n',
  `opex_asr` decimal(13,3) DEFAULT NULL COMMENT 'Biaya pasca eksploitasi (ASR) biasanya untuk proses penutupan sumur dalam satuan MMUSD\n',
  `sunk_cost` decimal(13,3) DEFAULT NULL COMMENT 'Biaya yang digunakan untuk memperoleh lapangan (ekplorasi atau penjual-belian lapangan) yang tidak masuk dalam skema cost recovery dalam satuan MMUSD\n',
  `ic_icr` decimal(13,3) DEFAULT NULL COMMENT 'Tambahan pengembalian biaya modal dalam jumlah tertentu, yang berkaitan langsung dengan fasilitas produksi dalam satuan MMUSD\n',
  `recovery_cost` decimal(13,3) DEFAULT NULL COMMENT 'Biaya dana talangan yang dikeluarkan oleh kontraktor dan akan dikembalikan oleh pemerintah jika penemuan hidrokarbon tersebut ekonomis dalam satuan MMUSD\n',
  `recovery_cost_frac` decimal(13,3) DEFAULT NULL COMMENT 'Perbandingan antara cost recovery dan gross revenue dalam satuan fraksi\n',
  `unrecovered_cost` decimal(13,3) DEFAULT NULL COMMENT 'Biaya yang terjadi pada masa eksploitasi dan sisa biaya yang belum dijadikan cost recovery dalam satuan MMUSD\n',
  `unrecovered_cost_frac` decimal(13,3) DEFAULT NULL COMMENT 'Perbandingan antara unrecovered cost dan gross revenue dalam satuan fraksi\n',
  `equity_split_total` decimal(13,3) DEFAULT NULL COMMENT 'Total ekuitas yg dibagikan kepada pemerintah dan kontraktor dalam satuan MMUSD\n',
  `equity_split_contractor` decimal(13,3) DEFAULT NULL COMMENT 'Pembagian ekuitas untuk kontraktor dalam satuan MMUSD\n',
  `equity_split_gov` decimal(13,3) DEFAULT NULL COMMENT 'Pembagian ekuitas untuk pemerintah dalam satuan MMUSD\n',
  `cashflow_net_contractor` decimal(13,3) DEFAULT NULL COMMENT 'Cashflow bersih kontraktor dalam satuan MMUSD\n',
  `cashflow_net_contractor_frac` decimal(13,3) DEFAULT NULL COMMENT 'Perbandingan cashflow bersih kontraktor terhadap gross revenue dalam satuan fraksi\n',
  `irr_contractor` decimal(13,3) DEFAULT NULL COMMENT 'Kontraktor initial rate of return (IRR) yaitu indikator tingkat efisiensi bagi kontraktor pada sebuah investasi dalam satuan fraksi\n',
  `npv10_contractor` decimal(13,3) DEFAULT NULL COMMENT 'Net Present Value pada ekspektasi return tahunan 10% untuk kontraktor dalam satuan MMUSD\n',
  `pay_out_time` decimal(13,3) DEFAULT NULL COMMENT 'Lama waktu yang dibutuhkan untuk pendapatan menutup modal awal investasi dalam satuan tahun\n',
  `pv_10percent` decimal(13,3) DEFAULT NULL COMMENT 'PV Ratio pada ekspektasi return tahunan 10% dalam satuan fraksi\n',
  `ftp_equity_gov` decimal(13,3) DEFAULT NULL COMMENT 'Total FTP ditambahkan dengan bagian ekuitas pemerintah dalam satuan MMUSD\n',
  `tax_gov` decimal(13,3) DEFAULT NULL COMMENT 'Pajak oleh pemerintah dalam satuan MMUSD\n',
  `dmo_net` decimal(13,3) DEFAULT NULL COMMENT 'Kewajiban produsen migas domestik untuk memasok produksi migas bagi kebutuhan dalam negeri bersih dalam satuan MMUSD\n',
  `cashflow_net_gov` decimal(13,3) DEFAULT NULL COMMENT 'Cashflow bersih pemerintah dalam satuan MMUSD\n',
  `cashflow_net_gov_frac` decimal(13,3) DEFAULT NULL COMMENT 'Perbandingan cashflow bersih pemerintah terhadap gross revenue dalam satuan fraksi\n',
  `npv10_gov` decimal(13,3) DEFAULT NULL COMMENT 'Net Present Value pada ekspektasi return tahunan 10% untuk pemerintah dalam satuan MMUSD\n',
  `economic_scenario` varchar(100) DEFAULT NULL COMMENT 'Skenario pengembangan lapangan secara ekonomis\n',
  `economic_plan` text COMMENT 'Perencanaan ekonomi meliputi estimasi waktu, estimasi biaya, estimasi hasil produksi, hingga pembagian hasil produksi\n',
  `oil_profile_prod_img` varchar(100) DEFAULT NULL COMMENT 'Perkiraan profil produksi minyak yang akan dijual\n',
  `con_profile_prod_img` varchar(100) DEFAULT NULL COMMENT 'Perkiraan profil produksi kondensat yang akan dijual\n',
  `gas_profile_prod_img` varchar(100) DEFAULT NULL COMMENT 'Perkiraan profil produksi gas yang akan dijual\n',
  `revenue_distribution_img` varchar(100) DEFAULT NULL COMMENT 'Distribusi revenue\n',
  `psc_scheme_img` varchar(100) DEFAULT NULL COMMENT 'Gambar model kontrak PSC sesuai dengan Term & Conditions yang tertuang dalam kontrak.  \n',
  `goi_take_profile_img` varchar(100) DEFAULT NULL COMMENT 'Profil distribusi pendapatan Pemerintah per tahun, ditampilkan dalam bentuk grafik batang. Dalam grafik ini pendapatan Pemerintah tiap tahun dirinci dalam FTP,  equity share, Net DMO, Pajak, dll   \n',
  `ncf_cont_profile_img` varchar(100) DEFAULT 'NNULL' COMMENT 'Profil Net Cash Flow (NCF) Kontraktor per tahun\n',
  `irr_cont_senst_psc_img` varchar(100) DEFAULT NULL COMMENT 'Sensitivitas IRR Contractor pada kondisi PSC Limit (berdasarkan 4 perubahan parameter yaitu: a. harga (minyak bumi/kondensat, gas bumi, LPG, LNG); b. produksi minyak bumi/kondensat, gas bumi, LPG, LNG);  c. biaya kapital; d. biaya operasi\n',
  `irr_cont_senst_econlim_img` varchar(100) DEFAULT NULL COMMENT 'Sensitivitas IRR Contractor pada kondisi Economic Limit (berdasarkan 4 perubahan parameter yaitu: a. harga (minyak bumi/kondensat, gas bumi, LPG, LNG); b. produksi minyak bumi/kondensat, gas bumi, LPG, LNG);  c. biaya kapital; d. biaya operasi\n',
  `npv_cont_senst_psc_img` varchar(100) DEFAULT NULL COMMENT 'Sensitivity NPV Contractor pada kondisi PSC Limit ( berdasarkan 4 perubahan parameter yaitu: a. harga (minyak bumi/kondensat, gas bumi, LPG, LNG); b. produksi minyak bumi/kondensat, gas bumi, LPG, LNG);  c. biaya kapital; d. biaya operasi\n',
  `npv_cont_senst_econlim_img` varchar(100) DEFAULT NULL COMMENT 'Sensitivity NPV Contractor pada kondisi Economic Limit  ( berdasarkan 4 perubahan parameter yaitu: a. harga (minyak bumi/kondensat, gas bumi, LPG, LNG); b. produksi minyak bumi/kondensat, gas bumi, LPG, LNG);  c. biaya kapital; d. biaya operasi\n',
  `npv_gov_senst_psc_img` varchar(100) DEFAULT NULL COMMENT 'Sensitivity NPV Pemerintah pada kondisi PSC Limit ( berdasarkan 4 perubahan parameter yaitu: a. harga (minyak bumi/kondensat, gas bumi, LPG, LNG); b. produksi minyak bumi/kondensat, gas bumi, LPG, LNG);  c. biaya kapital; d. biaya operasi\n',
  `npv_gov_senst_econlim_img` varchar(100) DEFAULT NULL COMMENT 'Sensitivity NPV Pemerintah pada kondisi Economic Limit ( berdasarkan 4 perubahan parameter yaitu: a. harga (minyak bumi/kondensat, gas bumi, LPG, LNG); b. produksi minyak bumi/kondensat, gas bumi, LPG, LNG);  c. biaya kapital; d. biaya operasi\n',
  `goi_take_senst_psc_img` varchar(100) DEFAULT NULL COMMENT 'Sensitivity Government Take pada kondisi PSC Limit ( berdasarkan 4 perubahan parameter yaitu: a. harga (minyak bumi/kondensat, gas bumi, LPG, LNG); b. produksi minyak bumi/kondensat, gas bumi, LPG, LNG);  c. biaya kapital; d. biaya operasi\n',
  `goi_take_senst_econlim_img` varchar(100) DEFAULT NULL COMMENT 'Sensitivity Government Take pada kondisi Economic Limit( berdasarkan 4 perubahan parameter yaitu: a. harga (minyak bumi/kondensat, gas bumi, LPG, LNG); b. produksi minyak bumi/kondensat, gas bumi, LPG, LNG);  c. biaya kapital; d. biaya operasi\n',
  KEY `economics_commerical_FK` (`pod_id`),
  KEY `economics_commerical_FK_1` (`well_id`),
  CONSTRAINT `economics_commerical_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `economics_commerical_FK_1` FOREIGN KEY (`well_id`) REFERENCES `well` (`well_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `executive_summary`
--

DROP TABLE IF EXISTS `executive_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `executive_summary` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD',
  `field_id` int(11) NOT NULL COMMENT 'Nomor identifikasi lapangan berdasarkan kolom FIELD_ID di dalam sheet R Field',
  `reservoir_type` varchar(100) DEFAULT NULL COMMENT 'Nomor identifikasi tipe dari reservoir. Contoh: Gas, minyak dan lain-lain. Referensi ada di sheet R Hydrocarbon',
  `pod_scheme` varchar(100) DEFAULT NULL COMMENT 'Skema kontrak bagi hasil',
  `pod_company_name` varchar(100) DEFAULT NULL COMMENT 'Nama Kontraktor Kontrak Kerja Sama (KKKS) yang mengajukan POD',
  `prod_method` varchar(100) DEFAULT NULL COMMENT 'Metode produksi yang digunakan pada suatu lapangan',
  `onstream_year` int(11) DEFAULT NULL COMMENT 'Tahun ketika wilayah kerja/lapangan mulai beroperasi.',
  `pod_start_date` date DEFAULT NULL COMMENT 'Tanggal persetujuan surat POD dalam format yyyy-mm-dd\n',
  `pod_end_date` varchar(100) DEFAULT NULL COMMENT 'Tanggal berakhirnya kontrak bagi hasil dalam format yyyy-mm-dd\n',
  `dur_psc_end` varchar(100) DEFAULT NULL COMMENT 'Lama waktu produksi yang direncanakan hingga kontrak bagi hasil selesai dalam tahun\n',
  `dur_economic_limit` int(11) DEFAULT NULL COMMENT 'Lama waktu produksi yang direncanakan hingga economic limit dalam tahun\n',
  `history_activity` text COMMENT 'Deskripsi sejarah kegiatan pada suatu wilayah kerja atau lapangan\n',
  `pod_study` varchar(100) DEFAULT NULL COMMENT 'Rencana studi yang akan dilakukan, seperti GGR (Geology, Geophysics and Reservoir) dan screening EOR (Enhanced Oil Recovery)\n',
  `prod_rate_init_oil` decimal(13,3) DEFAULT NULL COMMENT 'Laju produksi awal minyak setelah onstream POD dalam satuan BOPD\n',
  `prod_rate_peak_oil` decimal(13,3) DEFAULT NULL COMMENT 'Laju produksi puncak minyak setelah onstream POD dalam satuan BOPD\n',
  `prod_rate_peak_oil_date` date DEFAULT NULL COMMENT 'Tahun ketika laju produksi puncak minyak berdasarkan POD\n',
  `prod_rate_init_con` decimal(13,3) DEFAULT NULL COMMENT 'Laju produksi awal kondensat setelah onstream POD dalam satuan BCPD\n',
  `prod_rate_peak_con` decimal(13,3) DEFAULT NULL COMMENT 'Laju produksi puncak kondensat setelah onstream POD dalam satuan BCPD\n',
  `prod_rate_peak_con_date` date DEFAULT NULL COMMENT 'Tanggal ketika laju produksi puncak kondensat berdasarkan POD\n',
  `prod_rate_init_ga` decimal(13,3) DEFAULT NULL COMMENT 'Laju produksi awal associated gas setelah onstream POD dalam satuan MMSCFD\n',
  `prod_rate_peak_ga` decimal(13,3) DEFAULT NULL COMMENT 'Laju produksi puncak associated gas setelah onstream POD dalam satuan MMSCFD\n',
  `prod_rate_peak_ga_date` date DEFAULT NULL COMMENT 'Tanggal ketika laju produksi puncak associated gas berdasarkan POD\n',
  `prod_rate_init_gn` decimal(13,3) DEFAULT NULL COMMENT 'Laju produksi awal non-associated gas setelah onstream POD dalam satuan MMSCFD. \n',
  `prod_rate_peak_gn` decimal(13,3) DEFAULT NULL COMMENT 'Laju produksi puncak non-associated gas setelah onstream POD dalam satuan MMSCFD. \n',
  `prod_rate_peak_gn_date` date DEFAULT NULL COMMENT 'Tanggal ketika laju produksi puncak non-associated gas berdasarkan POD\n',
  `prod_rate_init_lpg` decimal(13,3) DEFAULT NULL COMMENT 'Laju produksi awal LPG setelah onstream POD dalam satuan TPD. \n',
  `prod_rate_peak_lpg` decimal(13,3) DEFAULT NULL COMMENT 'Laju produksi puncak LPG setelah onstream POD dalam satuan TPD. \n',
  `prod_rate_peak_lpg_date` date DEFAULT NULL COMMENT 'Tanggal ketika laju produksi puncak LPG berdasarkan POD\n',
  `prod_rate_init_wtr` decimal(13,3) DEFAULT NULL COMMENT 'Laju produksi awal air setelah onstream POD dalam satuan BWPD\n',
  `prod_rate_peak_wtr` decimal(13,3) DEFAULT NULL COMMENT 'Laju produksi puncak air setelah onstream POD dalam satuan BWPD\n',
  `prod_rate_peak_wtr_date` date DEFAULT NULL COMMENT 'Tanggal ketika laju produksi puncak air berdasarkan POD\n',
  `inj_rate_init_wtr` decimal(13,3) DEFAULT NULL COMMENT 'Laju injeksi awal air setelah onstream POD dalam satuan BWPD\n',
  `inj_rate_peak_wtr` decimal(13,3) DEFAULT NULL COMMENT 'Laju injeksi puncak air setelah onstream POD dalam satuan BWPD\n',
  `inj_rate_peak_wtr_date` date DEFAULT NULL COMMENT 'Tanggal ketika laju injeksi puncak air berdasarkan POD\n',
  `economic_limit_field_oil_rate` decimal(13,3) DEFAULT NULL COMMENT 'Laju alir minyak per lapangan yang direncanakan hingga economic limit dalam satuan BOPD\n',
  `economic_limit_well_oil_rate` decimal(13,3) DEFAULT NULL COMMENT 'Laju alir minyak per sumur yang direncanakan hingga economic limit dalam satuan BOPD\n',
  `economic_limit_field_gas_rate` decimal(13,3) DEFAULT NULL COMMENT 'Laju alir gas per lapangan yang direncanakan hingga economic limit dalam satuan MMSCFD\n',
  `economic_limit_well_gas_rate` decimal(13,3) DEFAULT NULL COMMENT 'Laju alir gas per sumur yang direncanakan hingga economic limit dalam satuan MMSCFD\n',
  `pod_map_img` varchar(100) DEFAULT NULL COMMENT 'Peta lokasi lapangan secara administrasi\n',
  KEY `executive_summary_FK` (`pod_id`),
  KEY `executive_summary_FK_1` (`field_id`),
  CONSTRAINT `executive_summary_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `executive_summary_FK_1` FOREIGN KEY (`field_id`) REFERENCES `r_field` (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fluid_characteristics`
--

DROP TABLE IF EXISTS `fluid_characteristics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fluid_characteristics` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `field_id` int(11) NOT NULL COMMENT 'Nomor identifikasi lapangan berdasarkan kolom FIELD_ID di dalam sheet R Field\n',
  `zone_id` int(11) NOT NULL COMMENT 'Nomor identifikasi zona pada tabel/sheet Zones - Reservoir Target\n',
  `drive_mech` varchar(100) DEFAULT NULL COMMENT 'Tenaga yang dimiliki oleh reservoir secara alamiah yang digunakan untuk mendorong minyak atau gas ke permukaan\n',
  `oil_water_contact` decimal(13,3) DEFAULT NULL COMMENT 'Kedalaman kontak minyak dan air dalam satuan ft TVD SS\n',
  `gas_oil_contact` decimal(13,3) DEFAULT NULL COMMENT 'Kedalaman kontak gas dan minyak dalam satuan ft TVD SS\n',
  `gas_water_contact` decimal(13,3) DEFAULT NULL COMMENT 'Kedalaman kontak gas dan air dalam satuan ft TVD SS\n',
  `res_temp_init` int(11) DEFAULT NULL COMMENT 'Temperatur awal reservoir dalam satuan derajat Fahrenheit\n',
  `res_press_init` int(11) DEFAULT NULL COMMENT 'Tekanan awal reservoir dalam satuan psig\n',
  `res_temp_avg` int(11) DEFAULT NULL COMMENT 'Temperatur reservoir rata-rata dalam satuan derajat fahrenheit\n',
  `res_press_avg` int(11) DEFAULT NULL COMMENT 'Tekanan reservoir rata-rata dalam satuan psig\n',
  `fluid_phase` varchar(100) DEFAULT NULL COMMENT 'Fasa fluida dari reservoir\n',
  `fvf_oil` decimal(13,3) DEFAULT NULL COMMENT 'Rasio antara volume minyak beserta gas pada kondisi reservoir dan volume minyak tersebut pada keadaan bebas gas pada kondisi standar dalam satuan RB/STB\n',
  `fvf_gas` decimal(13,3) DEFAULT NULL COMMENT 'Rasio antara volume gas bebas pada kondisi reservoir dan volume gas tersebut dalam kondisi standar dalam satuan cuft/scf\n',
  `fvf_water` decimal(13,3) DEFAULT NULL COMMENT 'Perbandingan antara volume air yang terdapat di reservoir dengan volume air yang ada di permukaan pada kondisi standar dalam satuan RB/STB\n',
  `sol_gas_oil_ratio` decimal(13,3) DEFAULT NULL COMMENT 'Perbandingan antara gas terlarut dan minyak dalam satuan scf/bbl dari residu minyak pada 60 derajat fahrenheit\n',
  `viscosity_avg_oil` decimal(13,3) DEFAULT NULL COMMENT 'Ukuran ketahanan minyak terhadap aliran dalam satuan centipoise\n',
  `viscosity_avg_water` decimal(13,3) DEFAULT NULL COMMENT 'Ukuran ketahanan air terhadap aliran dalam satuan centipoise\n',
  `viscosity_avg_gas` decimal(13,3) DEFAULT NULL COMMENT 'Ukuran ketahanan gas terhadap aliran dalam satuan centipoise\n',
  `water_salinity` decimal(13,3) DEFAULT NULL COMMENT 'Nilai salinitas dalam satuan ppm\n',
  `pressure_bubblepoint` decimal(13,3) DEFAULT NULL COMMENT 'Tekanan saturasi dimana gas terlarut mulai lepas dari minyak pada temperatur tertentu dalam satuan psig\n',
  `pressure_dewpoint` decimal(13,3) DEFAULT NULL COMMENT 'Tekanan saturasi dimana mulai terbentuk droplet liquid dari gas pada temperatur tertentu dalam satuan psig\n',
  `temp_pourpoint` decimal(13,3) DEFAULT NULL COMMENT 'Temperatur minimum dimana liquid tidak dapat mengalir lagi dalam satuan Fahrenheit\n',
  `oil_gravity` decimal(13,3) DEFAULT NULL COMMENT 'Specific gravity minyak dalam satuan API\n',
  `oil_compress` decimal(13,3) DEFAULT NULL COMMENT 'Perubahan volume minyak akibat perubahan tekanan dalam satuan 1/psi\n',
  `gas_compress` decimal(13,3) DEFAULT NULL COMMENT 'Perubahan volume gas akibat perubahan tekanan dalam satuan 1/psi\n',
  `water_compress` decimal(13,3) DEFAULT NULL COMMENT 'Perubahan volume air akibat perubahan tekanan dalam satuan 1/psi\n',
  `con_gas_ratio` decimal(13,3) DEFAULT NULL COMMENT 'Nilai condensate gas ratio\n',
  KEY `fluid_characteristics_FK` (`pod_id`),
  KEY `fluid_characteristics_FK_1` (`field_id`),
  KEY `fluid_characteristics_FK_2` (`zone_id`),
  CONSTRAINT `fluid_characteristics_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `fluid_characteristics_FK_1` FOREIGN KEY (`field_id`) REFERENCES `r_field` (`field_id`),
  CONSTRAINT `fluid_characteristics_FK_2` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gas_commercial`
--

DROP TABLE IF EXISTS `gas_commercial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gas_commercial` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `field_id` int(11) NOT NULL COMMENT 'Nomor identifikasi lapangan berdasarkan kolom FIELD_ID di dalam sheet R Field\n',
  `gas_balance_sheet_img` varchar(100) DEFAULT NULL COMMENT 'Gambar neraca gas berdasarkan pengkategorian pasokan dan kebutuhan di suatu wilayah\n',
  `gas_supply_demand_analysis` text COMMENT 'Hasil analisa dari proyeksi permintaan dan suplai gas di suatu wilayah \n',
  `gas_pot_buyer` varchar(100) DEFAULT NULL COMMENT 'Nama potensial pembeli gas dari suatu lapangan\n',
  `consider_desc` text COMMENT 'Penjelasan atas pemilihan pembeli potensial (dapat berupa strength dan weakness) \n',
  KEY `gas_commercial_FK` (`pod_id`),
  KEY `gas_commercial_FK_1` (`field_id`),
  CONSTRAINT `gas_commercial_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `gas_commercial_FK_1` FOREIGN KEY (`field_id`) REFERENCES `r_field` (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gas_composition`
--

DROP TABLE IF EXISTS `gas_composition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gas_composition` (
  `field_id` int(11) NOT NULL COMMENT 'Nomor identifikasi lapangan berdasarkan kolom FIELD_ID di dalam sheet R Field\n',
  `well_id` int(11) NOT NULL COMMENT 'Nomor identifikasi sumur berdasarkan kolom WELL_ID di dalam sheet Well\n',
  `co2` decimal(13,3) DEFAULT NULL COMMENT 'Komposisi gas karbondioksida dalam satuan persen mol\n',
  `h2` decimal(13,3) DEFAULT NULL COMMENT 'Komposisi gas hidrogen dalam satuan persen mol\n',
  `n2` decimal(13,3) DEFAULT NULL COMMENT 'Komposisi gas nitrogen dalam satuan persen mol\n',
  `h2s` decimal(13,3) DEFAULT NULL COMMENT 'Komposisi gas hidrogen sulfida dalam satuan persen mol\n',
  `c1` decimal(13,3) DEFAULT NULL COMMENT 'Komposisi gas metana dalam satuan persen mol\n',
  `c2` decimal(13,3) DEFAULT NULL COMMENT 'Komposisi gas etana dalam satuan persen mol\n',
  `c3` decimal(13,3) DEFAULT NULL COMMENT 'Komposisi gas propana dalam satuan persen mol\n',
  `ic4` decimal(13,3) DEFAULT NULL COMMENT 'Komposisi gas iso-butana dalam satuan persen mol\n',
  `nc4` decimal(13,3) DEFAULT NULL COMMENT 'Komposisi gas n-butana dalam satuan persen mol\n',
  `ic5` decimal(13,3) DEFAULT NULL COMMENT 'Komposisi gas iso-pentana dalam satuan persen mol\n',
  `nc5` decimal(13,3) DEFAULT NULL COMMENT 'Komposisi gas n-pentana dalam satuan persen mol\n',
  `c6` decimal(13,3) DEFAULT NULL COMMENT 'Komposisi gas heksana dalam satuan persen mol\n',
  `c7+` decimal(13,3) DEFAULT NULL COMMENT 'Komposisi gas heptana plus dalam satuan persen mol\n',
  KEY `gas_composition_FK` (`well_id`),
  KEY `gas_composition_FK_1` (`field_id`),
  CONSTRAINT `gas_composition_FK` FOREIGN KEY (`well_id`) REFERENCES `well` (`well_id`),
  CONSTRAINT `gas_composition_FK_1` FOREIGN KEY (`field_id`) REFERENCES `r_field` (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `geology`
--

DROP TABLE IF EXISTS `geology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geology` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD.\n',
  `field_id` int(11) NOT NULL COMMENT 'Nomor identifikasi lapangan berdasarkan kolom FIELD_ID di dalam sheet R Field.\n',
  `geo_basin_name` varchar(100) DEFAULT NULL COMMENT 'Nama cekungan geologi wilayah kerja\n',
  `geo_strct_img` varchar(100) DEFAULT NULL COMMENT 'Struktur geologi yang berkembang secara regional\n',
  `geo_reg_strat_img` varchar(100) DEFAULT NULL COMMENT 'Stratigrafi regional cekungan wilayah kerja\n',
  `geo_tecto_strat_img` varchar(100) DEFAULT NULL COMMENT 'Tektonostratigrafi cekungan wilayah kerja\n',
  `geo_trap_type` varchar(100) DEFAULT NULL COMMENT 'Jenis perangkap hidrokarbon (struktur/stratigrafi/basement fracture/lainnya)\n',
  `geo_chem_img` varchar(100) DEFAULT NULL COMMENT 'Analisis geokimia wilayah kerja\n',
  `geo_biostrat_img` varchar(100) DEFAULT NULL COMMENT 'Analisis biostratigrafi wilayah kerja\n',
  `geo_petrography_img` varchar(100) DEFAULT NULL COMMENT 'Analisis petrografi batuan di wilayah kerja\n',
  `geo_core_img` varchar(100) DEFAULT NULL COMMENT 'Analisis core di reservoir wilayah kerja\n',
  `seq_strat_img` varchar(100) DEFAULT NULL COMMENT 'Stratigrafi sikuen wilayah kerja\n',
  `geo_marker` varchar(100) DEFAULT NULL COMMENT 'Data marker pada wilayah kerja\n',
  `geo_mark_img` varchar(100) DEFAULT NULL COMMENT 'Korelasi sumur yang menunjukkan distribusi reservoir di lapangan\n',
  `geo_pet_sys_img` varchar(100) DEFAULT NULL COMMENT 'Sistem petroleum yang menunjukkan elemen batuan induk, reservoir, dan batuan tudung\n',
  `geo_strct_trap_type` varchar(100) DEFAULT NULL COMMENT 'Jenis struktur pada perangkap hidrokarbon (four way dip/three way dip/fault segmented)\n',
  `geo_reservoir_type` varchar(100) DEFAULT NULL COMMENT 'Jenis reservoir berdasarkan litologinya\n',
  `geo_reservoir_lithology` varchar(100) DEFAULT NULL COMMENT 'Litologi reservoir hidrokarbon\n',
  `geo_pot_mig_img` varchar(100) DEFAULT NULL COMMENT 'Peta potensi batuan induk dan migrasi hidrokarbon dalam sistem petroleum\n',
  KEY `geology_FK` (`pod_id`),
  CONSTRAINT `geology_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `history_matching`
--

DROP TABLE IF EXISTS `history_matching`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_matching` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `well_id` int(11) NOT NULL COMMENT 'Nomor identifikasi sumur berdasarkan kolom WELL_ID di dalam sheet Well\n',
  `zone_id` int(11) NOT NULL COMMENT 'Nomor identifikasi reservoir pada tabel/sheet Reservoir Target\n',
  `oil_rate_hm_img` varchar(100) DEFAULT NULL COMMENT 'History matching DST untuk parameter laju alir minyak yang disajikan dalam bentuk grafik\n',
  `gas_rate_hm_img` varchar(100) DEFAULT NULL COMMENT 'History matching DST untuk parameter laju alir gas yang disajikan dalam bentuk grafik\n',
  `water_rate_hm_img` varchar(100) DEFAULT NULL COMMENT 'History matching DST untuk parameter laju alir air yang disajikan dalam bentuk grafik\n',
  `bhp_rate_hm_img` varchar(100) DEFAULT NULL COMMENT 'History matching DST untuk parameter bottom hole pressure yang disajikan dalam bentuk grafik\n',
  `whp_matching_gas` int(11) DEFAULT NULL COMMENT 'Nilai Well Head Pressure (WHP) yang digunakan untuk matching yang ada di sumur gas\n',
  `error_actual_simulation` decimal(13,3) DEFAULT NULL COMMENT 'Perbandingan error nilai actual parameter yang akan dilakukan history matching dengan nilai yang dihasilkan dari simulasi\n',
  KEY `history_matching_FK` (`pod_id`),
  KEY `history_matching_FK_1` (`well_id`),
  KEY `history_matching_FK_2` (`zone_id`),
  CONSTRAINT `history_matching_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `history_matching_FK_1` FOREIGN KEY (`well_id`) REFERENCES `well` (`well_id`),
  CONSTRAINT `history_matching_FK_2` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hse_csr`
--

DROP TABLE IF EXISTS `hse_csr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hse_csr` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `health_desc` varchar(100) DEFAULT NULL COMMENT 'Penjelasan program atau komitmen di bidang kesehatan yang akan dilakukan oleh KKKS\n',
  `safety_desc` varchar(100) DEFAULT NULL COMMENT 'Penjelasan program atau komitmen di bidang keselamatan yang akan dilakukan oleh KKKS\n',
  `environment_desc` text COMMENT 'Penjelasan program atau komitmen di sekitar lingkungan operasional KKKS\n',
  `environment_study` varchar(100) DEFAULT NULL COMMENT 'Jenis studi lingkungan yang dilakukan untuk memperoleh izin lingkungan\n',
  `environment_study_sched_img` varchar(100) DEFAULT NULL COMMENT 'Ringkasan dari studi lingkungan yang akan dilaksanakan\n',
  `csr_program` text COMMENT 'Penjelasan umum program CSR yang akan dilakukan oleh KKKS di wilayah tersebut\n',
  `csr_img` varchar(100) DEFAULT NULL COMMENT 'Gambar pelaksanaan kegiatan CSR\n',
  KEY `hse_csr_FK` (`pod_id`),
  CONSTRAINT `hse_csr_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inisialisasi`
--

DROP TABLE IF EXISTS `inisialisasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inisialisasi` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `zone_id` int(11) NOT NULL COMMENT 'Nomor identifikasi reservoir pada tabel/sheet Reservoir Target\n',
  `ioip_zone_static` decimal(13,3) DEFAULT NULL COMMENT 'Jumlah minyak dalam zona reservoir dihitung dengan pemodelan dinamik dalam satuan MMSTB\n',
  `ioip_zone_dinamic` decimal(13,3) DEFAULT NULL COMMENT 'Jumlah total minyak dalam zona reservoir dihitung dengan pemodelan statik dalam satuan MMSTB\n',
  `igip_zone_static` decimal(13,3) DEFAULT NULL COMMENT 'Jumlah total gas dalam zona reservoir dihitung dengan pemodelan dinamik dalam satuan BSCF\n',
  `igip_zone_dinamic` decimal(13,3) DEFAULT NULL COMMENT 'Jumlah total gas dalam zona reservoir dihitung dengan pemodelan statik dalam satuan BSCF\n',
  `error_static_dinamic` decimal(13,3) DEFAULT NULL COMMENT 'Perbandingan antara IOIP/IGIP dalam satuan fraksi\n',
  KEY `inisialisasi_FK` (`pod_id`),
  KEY `inisialisasi_FK_1` (`zone_id`),
  CONSTRAINT `inisialisasi_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `inisialisasi_FK_1` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inversion_section`
--

DROP TABLE IF EXISTS `inversion_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inversion_section` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `field_id` int(11) NOT NULL COMMENT 'Nomor identifikasi lapangan berdasarkan kolom FIELD_ID di dalam sheet R Field\n',
  `xplot_bestparams` varchar(100) DEFAULT NULL COMMENT 'Parameter fisis terbaik yang dapat digunakan untuk membedakan litologi atau fluida berdasarkan hasil crossplot\n',
  `inv_init_model_img` varchar(100) DEFAULT NULL COMMENT 'Model awal yang digunakan dalam seismik inversi\n',
  `inv_param_analysis_img` varchar(100) DEFAULT NULL COMMENT 'Gambar hasil analisis parameter inversi\n',
  `inv_section_img` varchar(100) DEFAULT NULL COMMENT 'Gambar penampang dari hasil inversi seismik yang melalui target sumur\n',
  `inv_section_analysis` text COMMENT 'Analisis dari penampang hasil inversi seismik\n',
  KEY `inversion_section_FK` (`pod_id`),
  KEY `inversion_section_FK_1` (`field_id`),
  CONSTRAINT `inversion_section_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `inversion_section_FK_1` FOREIGN KEY (`field_id`) REFERENCES `r_field` (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ipr`
--

DROP TABLE IF EXISTS `ipr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipr` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `well_id` int(11) NOT NULL COMMENT 'Nomor identifikasi sumur berdasarkan kolom WELL_ID di dalam sheet Well\n',
  `res_model` varchar(100) DEFAULT NULL COMMENT 'Model reservoir untuk kurva IPR\n',
  `formation_rate` decimal(18,8) DEFAULT NULL COMMENT 'Formation Rate dalam satuan MMscfd, STB/day\n',
  `fbhp_gauge` decimal(18,8) DEFAULT NULL COMMENT 'Formation Bottom Hole Pressure at Gauge dalam satuan psia\n',
  `fbhp_datum` int(11) DEFAULT NULL COMMENT 'Formation Bottom Hole Pressure at Datum dalam satuan psia\n',
  `ipr_curve_result_img` varchar(100) DEFAULT NULL COMMENT 'Hasil Kurva IPR hasil pemodelan reservoir\n',
  `ipr_curve_hor_img` varchar(100) DEFAULT NULL COMMENT 'Perbandingan kurva IPR sumur Vertikal dan Horizontal hasil pemodelan\n',
  `ipr_img` varchar(100) DEFAULT NULL COMMENT 'IPR Sumur Injeksi dengan mengambil asumsi tekanan reservoir dan gradien tekanan rekah\n',
  `ipr_curve_analysis` text COMMENT 'Inflow Performance Relationship, Kurva hubungan antara laju produksi terhadap tekanan alir dasar sumur\n',
  `ipr_aof` decimal(13,3) DEFAULT NULL COMMENT 'Absolute Open Flow hasil pemodelan IPR dalam satuan MMscfd, STB/day\n',
  `ipr_coef_perform` decimal(13,3) DEFAULT NULL COMMENT 'Coefficient Performance hasil pemodelan IPR dalam satuan MMscfd/psi2, STB/day/psi2\n',
  `ipr_value_n` decimal(13,3) DEFAULT NULL COMMENT 'Nilai Kemiringan hasil pemodelan IPR\n',
  `ipr_prod_range_left` decimal(13,3) DEFAULT NULL COMMENT 'Batas optimum produsi minyak/gas dengan rule of thumb 30% AOF untuk mengetahui liquid loading dan economic limit dalam satuan MMSCFD, STB/day\n',
  `ipr_prod_range_right` decimal(13,3) DEFAULT NULL COMMENT 'Batas optimum produsi minyak/gas dengan rule of thumb 70% AOF untuk mengetahui sanding problem dan water coning dalam satuan MMSCFD, STB/day\n',
  KEY `ipr_FK` (`pod_id`),
  KEY `ipr_FK_1` (`well_id`),
  CONSTRAINT `ipr_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `ipr_FK_1` FOREIGN KEY (`well_id`) REFERENCES `well` (`well_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `local_content`
--

DROP TABLE IF EXISTS `local_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `local_content` (
  `pod_id` int(11) DEFAULT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `goods_drill` decimal(13,3) DEFAULT NULL COMMENT 'Tingkat Komponen Dalam Negeri barang sesuai dengan target KKKS pada lingkup pekerjaan pengeboran dinyatakan dalam satuan fraksi\n',
  `goods_prodfac` decimal(13,3) DEFAULT NULL COMMENT 'Tingkat Komponen Dalam Negeri barang sesuai dengan target KKKS pada lingkup pekerjaan fasilitas produksi dinyatakan dalam satuan fraksi\n',
  `services_drill` decimal(13,3) DEFAULT NULL COMMENT 'Tingkat Komponen Dalam Negeri jasa sesuai dengan target KKKS pada lingkup pekerjaan pengeboran dinyatakan dalam satuan fraksi\n',
  `services_prodfac` decimal(13,3) DEFAULT NULL COMMENT 'Tingkat Komponen Dalam Negeri jasa sesuai dengan target KKKS pada lingkup pekerjaan fasilitas produksi dinyatakan dalam satuan fraksi\n',
  `goods_total` decimal(13,3) DEFAULT NULL COMMENT 'Tingkat Komponen Dalam Negeri barang sesuai dengan target KKKS pada seluruh lingkup pekerjaan dalam POD dinyatakan dalam satuan fraksi\n',
  `services_total` decimal(13,3) DEFAULT NULL COMMENT 'Tingkat Komponen Dalam Negeri jasa sesuai dengan target KKKS pada seluruh lingkup pekerjaan dalam POD dinyatakan dalam satuan fraksi\n',
  `composite_drill` decimal(13,3) DEFAULT NULL COMMENT 'Tingkat Komponen Dalam Negeri barang dan jasa sesuai dengan target KKKS pada lingkup pekerjaan pengeboran dinyatakan dalam satuan fraksi\n',
  `composite_prodfac` decimal(13,3) DEFAULT NULL COMMENT 'Tingkat Komponen Dalam Negeri barang dan jasa sesuai dengan target KKKS pada lingkup pekerjaan fasilitas produksi dinyatakan dalam satuan fraksi\n',
  `composite_total` decimal(13,3) DEFAULT NULL COMMENT 'Tingkat Komponen Dalam Negeri barang dan jasa sesuai dengan target KKKS pada seluruh lingkup pekerjaan dalam POD dinyatakan dalam satuan fraksi\n',
  KEY `local_content_FK` (`pod_id`),
  CONSTRAINT `local_content_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lumping_petrophysics`
--

DROP TABLE IF EXISTS `lumping_petrophysics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lumping_petrophysics` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `field_id` int(11) NOT NULL COMMENT 'Nomor identifikasi lapangan berdasarkan kolom FIELD_ID di dalam sheet R Field\n',
  `well_id` int(11) NOT NULL COMMENT 'Nomor identifikasi sumur berdasarkan kolom WELL_ID di dalam sheet Well\n',
  `zone_id` int(11) NOT NULL COMMENT 'Nomor identifikasi zona pada tabel/sheet Zones - Reservoir Target\n',
  `data_availability_img` varchar(100) DEFAULT NULL COMMENT 'Tabel atau gambar yang menunjukkan ketersediaan data untuk analisis petrofisika, terdiri dari pressure log, mudlog, cuttings, core, log resistivity, SP, sonic, density, GR, neutron, dan fluid sampling\n',
  `gross_thickness` decimal(13,3) DEFAULT NULL COMMENT 'Ketebalan kotor (sebelum di-cutoff) reservoir dalam satuan feet\n',
  `net_pay` decimal(13,3) DEFAULT NULL COMMENT 'Ketebalan bersih (setelah cutoff Sw) reservoir dalam satuan feet\n',
  `net_porous` decimal(13,3) DEFAULT NULL COMMENT 'Ketebalan zona hidrokarbon produktif (net porous) reservoir dalam satuan feet\n',
  `net_to_gross_ratio` decimal(13,3) DEFAULT NULL COMMENT 'Rasio antara ketebalan bersih dan ketebalan kotor reservoir dalam satuan fraksi\n',
  `poro_eff_avg` decimal(13,3) DEFAULT NULL COMMENT 'Niiai rata-rata porositas efektif dalam satuan fraksi\n',
  `perm_avg` decimal(13,3) DEFAULT NULL COMMENT 'Nilai rata-rata permeabilitas batuan dalam satuan mD\n',
  `swi_avg` decimal(13,3) DEFAULT NULL COMMENT 'Nilai rata-rata saturasi air awal dalam satuan fraksi\n',
  `vsh_avg` decimal(13,3) DEFAULT NULL COMMENT 'Nilai rata-rata volume shale/clay dalam satuan fraksi\n',
  `hcpv_avg` decimal(13,3) DEFAULT NULL COMMENT 'Nilai rata-rata untuk hydrocarbon pore volume dalam MMcfd\n',
  `cutoff_poro` decimal(13,3) DEFAULT NULL COMMENT 'Nilai cutoff untuk porositas\n',
  `cutoff_sw` decimal(13,3) DEFAULT NULL COMMENT 'Nilai cutoff untuk saturasi air\n',
  `cutoff_vsh` decimal(13,3) DEFAULT NULL COMMENT 'Nilai cutoff untuk volume shale\n',
  `rock_compress` decimal(13,3) DEFAULT NULL COMMENT 'Nilai kompresibilitas batuan dalam satuan Vol/Psi\n',
  `reservoir_cover_area` decimal(13,3) DEFAULT NULL COMMENT 'Luas tutupan reservoir dalam satuan acre\n',
  `source` varchar(100) DEFAULT NULL COMMENT 'Sumber data yang digunakan untuk analisis, diambil dari log, atribut, dll.\n',
  KEY `lumping_petrophysics_FK` (`pod_id`),
  KEY `lumping_petrophysics_FK_1` (`field_id`),
  KEY `lumping_petrophysics_FK_2` (`well_id`),
  KEY `lumping_petrophysics_FK_3` (`zone_id`),
  CONSTRAINT `lumping_petrophysics_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `lumping_petrophysics_FK_1` FOREIGN KEY (`field_id`) REFERENCES `r_field` (`field_id`),
  CONSTRAINT `lumping_petrophysics_FK_2` FOREIGN KEY (`well_id`) REFERENCES `well` (`well_id`),
  CONSTRAINT `lumping_petrophysics_FK_3` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mud_program`
--

DROP TABLE IF EXISTS `mud_program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mud_program` (
  `well_id` int(11) NOT NULL COMMENT 'Nomor identifikasi sumur berdasarkan kolom WELL_ID di dalam sheet Well\n',
  `hole_size` decimal(13,3) DEFAULT NULL COMMENT 'Ukuran lubang suatu sumur dalam rencana desain lumpur pemboran dalam satuan inch\n',
  `depth_md_bottom` decimal(13,3) DEFAULT NULL COMMENT 'Kedalaman perencanaan lumpur pemboran measured depth dalam satuan meter\n',
  `depth_md_top` decimal(13,3) DEFAULT NULL COMMENT 'Kedalaman perencanaan lumpur pemboran measured depth dalam satuan meter\n',
  `mud_type` varchar(100) DEFAULT NULL COMMENT 'Jenis lumpur pemboran yang digunakan/dipakai pada suatu sumur\n',
  `mud_density_min` decimal(13,3) DEFAULT NULL COMMENT 'Densitas atau berat jenis lumpur minimal dalam satuan pounds per gallon\n',
  `mud_density_max` decimal(13,3) DEFAULT NULL COMMENT 'Densitas atau berat jenis lumpur maksimal dalam satuan pounds per gallon\n',
  KEY `mud_program_FK` (`well_id`),
  CONSTRAINT `mud_program_FK` FOREIGN KEY (`well_id`) REFERENCES `well` (`well_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `operation_abandonment`
--

DROP TABLE IF EXISTS `operation_abandonment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_abandonment` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `opex_year` date DEFAULT NULL COMMENT 'Tahun tertentu untuk perhitungan biaya operasi proyek pengembangan lapangan\n',
  `opex_operation_maintenance` decimal(13,3) DEFAULT NULL COMMENT 'Perkiraan biaya operasi untuk kegiatan operasi dan pemeliharaan suatu lapangan pada tahun tertentu dalam satuan MMUSD\n',
  `opex_facility_maintenance` decimal(13,3) DEFAULT NULL COMMENT 'Perkiraan biaya operasi untuk kegiatan pemeliharaan fasilitas produksi pada tahun tertentu dalam satuan MMUSD\n',
  `opex_hsse` decimal(13,3) DEFAULT NULL COMMENT 'Perkiraan biaya operasi untuk kegiatan kesehatan, keselamatan, dan keamanan lingkungan kerja pada tahun tertentu\n',
  `opex_engineering_support` decimal(13,3) DEFAULT NULL COMMENT 'Perkiraan biaya operasi untuk kegiatan engineering support pada tahun tertentu\n',
  `opex_rental_insurance` decimal(13,3) DEFAULT NULL COMMENT 'Perkiraan biaya operasi untuk kegiatan rental dan asuransi pada tahun tertentu\n',
  `opex_abandonment` decimal(13,3) DEFAULT NULL,
  KEY `operation_abandonment_FK` (`pod_id`),
  CONSTRAINT `operation_abandonment_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pf_cost`
--

DROP TABLE IF EXISTS `pf_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pf_cost` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `field_id` int(11) NOT NULL COMMENT 'Nomor identifikasi lapangan berdasarkan kolom FIELD_ID di dalam sheet R Field\n',
  `cost_prod_facilities` int(11) DEFAULT NULL COMMENT 'Perkiraan biaya investasi untuk fasilitas produksi dalam satuan USD\n',
  `cost_land` int(11) DEFAULT NULL COMMENT 'Perkiraan biaya lahan untuk fasilitas produksi dalam satuan USD\n',
  `cost_flowline` int(11) DEFAULT NULL COMMENT 'Perkiraan biaya investasi untuk flow line (pembebasan lahan, material, & konstruksi) dalam satuan USD\n',
  `cost_epf` int(11) DEFAULT NULL COMMENT 'Perkiraan biaya Early Production Facilities (sewa) dalam satuan USD\n',
  `cost_modification` int(11) DEFAULT NULL COMMENT 'Perkiraan biaya jika ada modifikasi pada fasilitas eksisting dalam satuan USD\n',
  `cost_pipeline` int(11) DEFAULT NULL COMMENT 'Perkiraan biaya untuk pipeline dalam satuan USD\n',
  `cost_studies_survey` int(11) DEFAULT NULL COMMENT 'Perkiraan biaya untuk studi dan survei dalam satuan USD\n',
  `cost_pre_feed` int(11) DEFAULT NULL COMMENT 'Perkiraan biaya yang diperlukan untuk kegiatan Pre-FEED (Pre-Front End Engineering Design) dalam satuan USD\n',
  `cost_feed` int(11) DEFAULT NULL COMMENT 'Perkiraan biaya yang diperlukan untuk kegiatan FEED (Front End Engineering Design) dalam satuan USD\n',
  `cost_survey` int(11) DEFAULT NULL COMMENT 'Perkiraan biaya dari survei dalam satuan USD\n',
  `cost_overhead` int(11) DEFAULT NULL COMMENT 'Biaya yang tidak berkaitan langsung dengan proses produksi maupun jasa. Biaya ini juga dikenal sebagai biaya tidak langsung dan harus dibayar secara teratur dalam satuan USD\n',
  `cost_permits` int(11) DEFAULT NULL COMMENT 'Perkiraan biaya untuk perizinan. Mencakup perizinan operasi, keamanan, lokasi, lingkungan, dll dalam satuan USD\n',
  KEY `pf_cost_FK` (`pod_id`),
  KEY `pf_cost_FK_1` (`field_id`),
  CONSTRAINT `pf_cost_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `pf_cost_FK_1` FOREIGN KEY (`field_id`) REFERENCES `r_field` (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pf_custody_meter`
--

DROP TABLE IF EXISTS `pf_custody_meter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pf_custody_meter` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `field_id` int(11) NOT NULL COMMENT 'Nomor identifikasi lapangan berdasarkan kolom FIELD_ID di dalam sheet R Field\n',
  `well_id` int(11) NOT NULL COMMENT 'Nomor identifikasi sumur berdasarkan kolom WELL_ID di dalam sheet Well\n',
  `custody_meter_type` varchar(100) DEFAULT NULL COMMENT 'Tipe yang digunakan dalam custody meter\n',
  `custody_meter_range` int(11) DEFAULT NULL COMMENT 'Rentang flowrate yang digunakan dalam custody meter dalam satuan BOPD untuk minyak atau MMSCFD untuk gas\n',
  `custody_pressure` int(11) DEFAULT NULL COMMENT 'Tekanan design custody meter dalam satuan psig\n',
  `custody_pipe_dia` int(11) DEFAULT NULL COMMENT 'Diameter pipa custody meter dalam satuan inch\n',
  `custody_meter_size` int(11) DEFAULT NULL COMMENT 'Dimensi custody meter yang digunakan dalam satuan meter\n',
  KEY `pf_custody_meter_FK` (`pod_id`),
  KEY `pf_custody_meter_FK_1` (`field_id`),
  KEY `pf_custody_meter_FK_2` (`well_id`),
  CONSTRAINT `pf_custody_meter_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `pf_custody_meter_FK_1` FOREIGN KEY (`field_id`) REFERENCES `r_field` (`field_id`),
  CONSTRAINT `pf_custody_meter_FK_2` FOREIGN KEY (`well_id`) REFERENCES `well` (`well_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pf_flare`
--

DROP TABLE IF EXISTS `pf_flare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pf_flare` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `field_id` int(11) NOT NULL COMMENT 'Nomor identifikasi lapangan berdasarkan kolom FIELD_ID di dalam sheet R Field\n',
  `well_id` int(11) NOT NULL COMMENT 'Nomor identifikasi sumur berdasarkan kolom WELL_ID di dalam sheet Well\n',
  `typical_flare_tip_img` varchar(100) DEFAULT NULL COMMENT 'Tipe flare yang digunakan untuk fasilitas produksi\n',
  `flare_capacity` varchar(100) DEFAULT NULL COMMENT 'Kapasitas flare yang digunakan untuk fasilitas produksi\n',
  `typical_flare_kod` varchar(100) DEFAULT NULL COMMENT 'Kapasitas flare yang digunakan untuk fasilitas produksi\n',
  `flare_comp` varchar(100) DEFAULT NULL COMMENT 'Tabel komposisi gas flare\n',
  `flare_pilot` int(11) DEFAULT NULL COMMENT 'Kebutuhan gas pilot untuk flare dalam satuan MSCFD\n',
  KEY `pf_flare_FK` (`pod_id`),
  KEY `pf_flare_FK_1` (`field_id`),
  KEY `pf_flare_FK_2` (`well_id`),
  CONSTRAINT `pf_flare_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `pf_flare_FK_1` FOREIGN KEY (`field_id`) REFERENCES `r_field` (`field_id`),
  CONSTRAINT `pf_flare_FK_2` FOREIGN KEY (`well_id`) REFERENCES `well` (`well_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pf_fluid_treating_system`
--

DROP TABLE IF EXISTS `pf_fluid_treating_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pf_fluid_treating_system` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `field_id` int(11) NOT NULL COMMENT 'Nomor identifikasi lapangan berdasarkan kolom FIELD_ID di dalam sheet R Field\n',
  `well_id` int(11) NOT NULL COMMENT 'Nomor identifikasi sumur berdasarkan kolom WELL_ID di dalam sheet Well\n',
  `treating_gas_sweet_cap` varchar(100) DEFAULT NULL COMMENT 'Kapasitas treatment gas sweetening dalam satuan MMSCFD\n',
  `treating_gas_sweet_power` int(11) DEFAULT NULL COMMENT 'Kebutuhan daya sistem gas sweetening dalam satuan kW\n',
  `treating_gas_sweet_chem` varchar(100) DEFAULT NULL COMMENT 'Kebutuhan bahan kimia untuk proses gas sweetening\n',
  `treating_hydrocycl_cap` int(11) DEFAULT NULL COMMENT 'Kapasitas olah hydrocyclone dalam satuan BFPD\n',
  `treating_hydrocycl_spec` varchar(100) DEFAULT NULL COMMENT 'Spesifikasi produk hasil pemisahan hidrosiklon\n',
  `treating_gun_barrels_spec` int(11) DEFAULT NULL COMMENT 'Kapasitas olah gun barrels dalam satuan BFPD\n',
  `treating_gun_barrels_cap` varchar(100) DEFAULT NULL COMMENT 'Spesifikasi produk hasil pemisahan hidrosiklon\n',
  `treating_others` varchar(100) DEFAULT NULL COMMENT 'Kapasitas dan spesifikasi untuk proses fluid treating lainnya\n',
  KEY `pf_fluid_treating_system_FK` (`pod_id`),
  KEY `pf_fluid_treating_system_FK_1` (`field_id`),
  KEY `pf_fluid_treating_system_FK_2` (`well_id`),
  CONSTRAINT `pf_fluid_treating_system_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `pf_fluid_treating_system_FK_1` FOREIGN KEY (`field_id`) REFERENCES `r_field` (`field_id`),
  CONSTRAINT `pf_fluid_treating_system_FK_2` FOREIGN KEY (`well_id`) REFERENCES `well` (`well_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pf_manifold`
--

DROP TABLE IF EXISTS `pf_manifold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pf_manifold` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `field_id` int(11) NOT NULL COMMENT 'Nomor identifikasi lapangan berdasarkan kolom FIELD_ID di dalam sheet R Field\n',
  `well_id` int(11) NOT NULL COMMENT 'Nomor identifikasi sumur berdasarkan kolom WELL_ID di dalam sheet Well\n',
  `prod_manifold_total` int(11) DEFAULT NULL COMMENT 'Total manifold Produksi\n',
  `prod_oil_manifold_capacity` int(11) DEFAULT NULL COMMENT 'Kapasitas manifold untuk menampung produksi minyak dalam satuan BOPD\n',
  `prod_water_manifold_capacity` int(11) DEFAULT NULL COMMENT 'Kapasitas manifold untuk mengakomodasi air terproduksi dalam satuan BWPD\n',
  `prod_gas_manifold_capacity` decimal(13,3) DEFAULT NULL COMMENT 'Kapasitas manifold produksi gas dalam satuan MMSCFD\n',
  `prod_manifold_pipe_size` int(11) DEFAULT NULL COMMENT 'Ukuran pipa manifold produksi dalam satuan inch\n',
  `manifold_type_analysis` text COMMENT 'Tipe manifold\n',
  KEY `pf_manifold_FK` (`pod_id`),
  KEY `pf_manifold_FK_1` (`field_id`),
  KEY `pf_manifold_FK_2` (`well_id`),
  CONSTRAINT `pf_manifold_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `pf_manifold_FK_1` FOREIGN KEY (`field_id`) REFERENCES `r_field` (`field_id`),
  CONSTRAINT `pf_manifold_FK_2` FOREIGN KEY (`well_id`) REFERENCES `well` (`well_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pf_pipeline_hydraulic_backpress`
--

DROP TABLE IF EXISTS `pf_pipeline_hydraulic_backpress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pf_pipeline_hydraulic_backpress` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `field_id` int(11) NOT NULL COMMENT 'Nomor identifikasi lapangan berdasarkan kolom FIELD_ID di dalam sheet R Field\n',
  `well_id` int(11) NOT NULL COMMENT 'Nomor identifikasi sumur berdasarkan kolom WELL_ID di dalam sheet Well\n',
  `pump_discharge_press` int(11) DEFAULT NULL COMMENT 'Pump Discharge Pressure digunakan untuk analisa hidrolik dalam satuan psig\n',
  `predict_pump_shutoff_press` int(11) DEFAULT NULL COMMENT 'Prediksi ketika tekanan pompa shutoff pada analisa hidrolik dalam satuan psig\n',
  `length_safety_fact` int(11) DEFAULT NULL COMMENT 'Panjang pipeline dengan safety factor pada analisa hidrolik dalam satuan feet\n',
  `pipe_material` varchar(100) DEFAULT NULL COMMENT 'Jenis material pipa dan roughness\n',
  `control_valve` int(11) DEFAULT NULL COMMENT 'Tekanan dari katup pengontrol pada analisa hidrolik dalam satuan psi\n',
  `custody_meter` int(11) DEFAULT NULL COMMENT 'Tekanan Custody Meter pada analisa hidrolik dalam satuan psi\n',
  `static_head` int(11) DEFAULT NULL COMMENT 'Tekanan Static Head pada analisa hidrolik dalam satuan psi\n',
  `destination_press` int(11) DEFAULT NULL COMMENT 'Tekanan destinasi dalam satuan psig\n',
  `velocity_oil` int(11) DEFAULT NULL COMMENT 'Kecepatan minyak yang digunakan pada analisa hidrolik dalam satuan feet per second (ft/s)\n',
  `erosional_velocity` int(11) DEFAULT NULL COMMENT 'Kecepatan erosional pada analisa hidrolik dalam satuan feet per second (ft/s)\n',
  `pressure_drop` decimal(13,3) DEFAULT NULL COMMENT 'Penurunan tekanan dalam satuan psi/100ft\n',
  `total_dp` decimal(13,3) DEFAULT NULL COMMENT 'Penurunan tekanan total sepanjang jarak pipa dalam satuan psi\n',
  `landing_pressure` int(11) DEFAULT NULL COMMENT 'Tekanan di downstream pipa (tujuan) dalam satuan psig\n',
  `back_press_total_dp` int(11) DEFAULT NULL COMMENT 'Total penurunan tekanan pada tiap ukuran pipeline dalam satuan psig\n',
  `pump_power` int(11) DEFAULT NULL COMMENT 'Daya pompa (dengan asumsi efisiensi 70%) pada analisa hidrolik dalam satuan kilowatt\n',
  KEY `pf_pipeline_hydraulic_backpress_FK` (`pod_id`),
  KEY `pf_pipeline_hydraulic_backpress_FK_1` (`field_id`),
  KEY `pf_pipeline_hydraulic_backpress_FK_2` (`well_id`),
  CONSTRAINT `pf_pipeline_hydraulic_backpress_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `pf_pipeline_hydraulic_backpress_FK_1` FOREIGN KEY (`field_id`) REFERENCES `r_field` (`field_id`),
  CONSTRAINT `pf_pipeline_hydraulic_backpress_FK_2` FOREIGN KEY (`well_id`) REFERENCES `well` (`well_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pf_separator`
--

DROP TABLE IF EXISTS `pf_separator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pf_separator` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `field_id` int(11) NOT NULL COMMENT 'Nomor identifikasi lapangan berdasarkan kolom FIELD_ID di dalam sheet R Field\n',
  `well_id` int(11) NOT NULL COMMENT 'Nomor identifikasi sumur berdasarkan kolom WELL_ID di dalam sheet Well\n',
  `type_separator` varchar(100) DEFAULT NULL COMMENT 'Tipe Separator (2 atau 3 fasa)\n',
  `prod_sep_oil_capacity` int(11) DEFAULT NULL COMMENT 'Kapasitas produksi minyak di separator dalam satuan BOPD\n',
  `prod_sep_water_capacity` int(11) DEFAULT NULL COMMENT 'Kapasitas produksi air di separator dalam satuan BWPD\n',
  `initial_press_separator` decimal(13,3) DEFAULT NULL COMMENT 'Tekanan separator awal dalam satuan psig\n',
  `num_of_stages` decimal(13,3) DEFAULT NULL COMMENT 'Jumlah tahapan pemilihan separator\n',
  KEY `pf_separator_FK` (`pod_id`),
  KEY `pf_separator_FK_1` (`field_id`),
  KEY `pf_separator_FK_2` (`well_id`),
  CONSTRAINT `pf_separator_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `pf_separator_FK_1` FOREIGN KEY (`field_id`) REFERENCES `r_field` (`field_id`),
  CONSTRAINT `pf_separator_FK_2` FOREIGN KEY (`well_id`) REFERENCES `well` (`well_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pf_storage_tanks`
--

DROP TABLE IF EXISTS `pf_storage_tanks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pf_storage_tanks` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `field_id` int(11) NOT NULL COMMENT 'Nomor identifikasi lapangan berdasarkan kolom FIELD_ID di dalam sheet R Field\n',
  `well_id` int(11) NOT NULL COMMENT 'Nomor identifikasi sumur berdasarkan kolom WELL_ID di dalam sheet Well\n',
  `tank_type` varchar(100) DEFAULT NULL COMMENT 'Tipe storage tank yang digunakan\n',
  `tank_capacity` int(11) DEFAULT NULL COMMENT 'Kapasitas storage tank dalam satuan bbl\n',
  `tank_press_dsgn` int(11) DEFAULT NULL COMMENT 'Tekanan design storage tank dalam satuan psig\n',
  `tank_safety` varchar(100) DEFAULT NULL COMMENT 'Safety system dalam untuk storage tank (Y/N)\n',
  `tank_safety_type` varchar(100) DEFAULT NULL COMMENT 'Jenis safety system (foam, sprinkle, dll)\n',
  KEY `pf_storage_tanks_FK` (`pod_id`),
  KEY `pf_storage_tanks_FK_1` (`field_id`),
  KEY `pf_storage_tanks_FK_2` (`well_id`),
  CONSTRAINT `pf_storage_tanks_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `pf_storage_tanks_FK_1` FOREIGN KEY (`field_id`) REFERENCES `r_field` (`field_id`),
  CONSTRAINT `pf_storage_tanks_FK_2` FOREIGN KEY (`well_id`) REFERENCES `well` (`well_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pf_summary`
--

DROP TABLE IF EXISTS `pf_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pf_summary` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `field_id` int(11) NOT NULL COMMENT 'Nomor identifikasi lapangan berdasarkan kolom FIELD_ID di dalam sheet R Field\n',
  `well_id` int(11) NOT NULL COMMENT 'Nomor identifikasi sumur berdasarkan kolom WELL_ID di dalam sheet Well\n',
  `raw_sales_product_spec` varchar(100) DEFAULT NULL COMMENT 'Spesifikasi raw & sales product (Minyak Bumi/Gas Bumi/LPG/LNG) berupa komposisi, tekanan, flowrate, production life\n',
  `layout_field_overall` varchar(100) DEFAULT NULL COMMENT 'Mencakup deskripsi dan gambaran secara umum tata letak fasilitas dari sumur hingga fasilitas produksi dan utilitas serta fasilitas lainnya\n',
  `prod_facility_img` varchar(100) DEFAULT NULL COMMENT 'Gambar skematik fasilitas produksi\n',
  `heat_mass_balance` varchar(100) DEFAULT NULL COMMENT 'Tabel atau gambar neraca massa dan energi\n',
  `prod_facility_desc` text COMMENT 'Deskripsi fasilitas produksi\n',
  `process_flow_diagram_img` varchar(100) DEFAULT NULL COMMENT 'Diagram alir proses fasilitas produksi\n',
  `operation_philosphy` varchar(100) DEFAULT NULL COMMENT 'Operation Filosofi [manned/ unmanned]\n',
  `fasprod_capacity` int(11) DEFAULT NULL COMMENT 'Kapasitas fasilitas produksi dalam satuan BOPD\n',
  `facility_opt_dsgn` varchar(100) DEFAULT NULL COMMENT 'Hasil evaluasi fasilitas produksi eksisting dan optimasi design-nya.\n',
  `prod_gas` decimal(13,3) DEFAULT NULL COMMENT 'Produksi gas dalam satuan MMSCFD\n',
  `prod_oil_capacity` int(11) DEFAULT NULL COMMENT 'Kapasitas produksi minyak dalam satuan BOPD\n',
  `prod_water_capacity` int(11) DEFAULT NULL COMMENT 'Kapasitas produksi air dalam satuan BWPD\n',
  `topografi_pipe_transfr_img` varchar(100) DEFAULT NULL COMMENT 'Topografi pipa transfer berdasarkan laju alir, Destination Pressure dan panjang\n',
  `flowline_length` int(11) DEFAULT NULL COMMENT 'Jumlah dan panjang flowline dalam satuan kilometer\n',
  `flowline_size` int(11) DEFAULT NULL COMMENT 'Ukuran pipa flowline dalam satuan inch\n',
  `prod_manifold` varchar(100) DEFAULT NULL COMMENT 'Production manifold\n',
  `prod_separator` varchar(100) DEFAULT NULL COMMENT 'Production separator\n',
  `separator_total` int(11) DEFAULT NULL COMMENT 'Jumlah Total separator\n',
  `fluid_treating` varchar(100) DEFAULT NULL,
  `prod_storage_tank` varchar(100) DEFAULT NULL COMMENT 'Tangki penyimpanan fluida dari sumur\n',
  `storage_type` varchar(100) DEFAULT NULL COMMENT 'Tipe dan Total Volume Penyimpanan dalam satuan barrel\n',
  `prod_water treatment` varchar(100) DEFAULT NULL COMMENT 'Pengolahan air produksi untuk injeksi\n',
  `pump_transfer` varchar(100) DEFAULT NULL COMMENT 'Pompa transfer\n',
  `pump_loading` varchar(100) DEFAULT NULL COMMENT 'Transfer minyak ke gathering line\n',
  `pipeline_transfer` varchar(100) DEFAULT NULL COMMENT 'Transfer produk ke jalur ekspor\n',
  `pipe_diameter` int(11) DEFAULT NULL COMMENT 'Diameter pipeline dalam satuan inch\n',
  `pipe_wall_thickness` decimal(18,8) DEFAULT NULL COMMENT 'Ketebalan dinding pipeline dalam satuan milimeter\n',
  `riser_od` int(11) DEFAULT NULL COMMENT 'Riser OD dalam satuan inch\n',
  `riser_seabed` varchar(100) DEFAULT NULL COMMENT 'Riser Seabed\n',
  `custody_metering_gas` varchar(100) DEFAULT NULL COMMENT 'Pengukuran laju aliran custody untuk gas\n',
  `custody_metering_oil` varchar(100) DEFAULT NULL,
  `schematic_cust_meter_img` varchar(100) DEFAULT NULL COMMENT 'Skema instalasi custody meter untuk laju alir pengiriman produk\n',
  `time_frame_trucking_img` varchar(100) DEFAULT NULL COMMENT 'Skenario waktu trucking produksi minyak\n',
  `typical_flare_tip_img` varchar(100) DEFAULT NULL COMMENT 'Tipe flare tip yang digunakan untuk fasilitas produksi\n',
  `pipe_length` int(11) DEFAULT NULL COMMENT 'Panjang pipa di bawah laut dalam satuan kilometer\n',
  `prod_facility_loc_img` varchar(100) DEFAULT NULL COMMENT 'Lokasi dari fasilitas produksi\n',
  `loc_shippingline_img` varchar(100) DEFAULT NULL COMMENT 'Lokasi lapangan dan shipping line\n',
  `sp_field_img` varchar(100) DEFAULT NULL COMMENT 'Stasiun pengumpul di sekitar lapangan\n',
  `schematic_whp_img` varchar(100) DEFAULT NULL COMMENT 'Framing skematik awal design sumur untuk Well Head Platform\n',
  `schematic_whp_pipe_img` varchar(100) DEFAULT NULL COMMENT 'Pipeline Well Head Pressure dari sumur eksisting ke sumur pengembangan\n',
  `schematic_hc_img` varchar(100) DEFAULT NULL COMMENT 'Design skematik aliran hidrokarbon sumur pengembangan\n',
  `wellhead_platform_analysis` text COMMENT 'Komponen wellhead platform\n',
  `philosophy_redundancy` text COMMENT 'Filosofi redundancy untuk peralatan (terutama peralatan rotating)\n',
  KEY `pf_summary_FK` (`pod_id`),
  KEY `pf_summary_FK_1` (`field_id`),
  KEY `pf_summary_FK_2` (`well_id`),
  CONSTRAINT `pf_summary_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `pf_summary_FK_1` FOREIGN KEY (`field_id`) REFERENCES `r_field` (`field_id`),
  CONSTRAINT `pf_summary_FK_2` FOREIGN KEY (`well_id`) REFERENCES `well` (`well_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pf_transfer_pumps`
--

DROP TABLE IF EXISTS `pf_transfer_pumps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pf_transfer_pumps` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `field_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD	Nomor identifikasi lapangan berdasarkan kolom FIELD_ID di dalam sheet R Field\n',
  `well_id` int(11) NOT NULL COMMENT 'Nomor identifikasi sumur berdasarkan kolom WELL_ID di dalam sheet Well\n',
  `pump_capacity` int(11) DEFAULT NULL COMMENT 'Kapasitas pompa dalam satuan BOPD\n',
  `pump_type` varchar(100) DEFAULT NULL COMMENT 'Tipe pompa yang digunakan untuk mengalirkan hasil produksi ke gathering lines\n',
  `pump_press` int(11) DEFAULT NULL COMMENT 'Tekanan discharge pompa untuk mengalirkan hasil produksi dalam satuan psig\n',
  `predict_pump_shutoff_press` int(11) DEFAULT NULL COMMENT 'Prediksi ketika tekanan pompa shutoff dalam satuan psig\n',
  `pump_driver` varchar(100) DEFAULT NULL COMMENT 'Jenis penggerak pompa (motor/steam/gas)\n',
  `pump_power` int(11) DEFAULT NULL COMMENT 'Kebutuhan daya pompa dalam satuan kW\n',
  KEY `pf_transfer_pumps_FK` (`pod_id`),
  KEY `pf_transfer_pumps_FK_1` (`field_id`),
  KEY `pf_transfer_pumps_FK_2` (`well_id`),
  CONSTRAINT `pf_transfer_pumps_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `pf_transfer_pumps_FK_1` FOREIGN KEY (`field_id`) REFERENCES `r_field` (`field_id`),
  CONSTRAINT `pf_transfer_pumps_FK_2` FOREIGN KEY (`well_id`) REFERENCES `well` (`well_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pf_utilities`
--

DROP TABLE IF EXISTS `pf_utilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pf_utilities` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `field_id` int(11) DEFAULT NULL COMMENT 'Nomor identifikasi lapangan berdasarkan kolom FIELD_ID di dalam sheet R Field\n',
  `power_reqd` varchar(100) DEFAULT NULL COMMENT 'Tabel kebutuhan power (listrik) dalam satuan kW\n',
  `power_source` int(11) DEFAULT NULL COMMENT 'Jenis dan sumber power (listrik) dari pembangkitan sendiri atau dari sumber lain\n',
  `power_emergency` int(11) DEFAULT NULL COMMENT 'Jenis dan kapasitasn pembangkitan listrik emergency dalam satuan kW\n',
  `air_instrument` int(11) DEFAULT NULL COMMENT 'Kebutuhan udara instrument dalam satuan NM3/h\n',
  `air_utility` int(11) DEFAULT NULL COMMENT 'Kebutuhan udara utilitas dalam satuan NM3/h\n',
  `water_process` int(11) DEFAULT NULL COMMENT 'Kebutuhan air untuk keperluan proses dalam satuan m3/day\n',
  `water_utility` int(11) DEFAULT NULL COMMENT 'Kebutuhan air untuk keperluan utilitas dalam satuan m3/day\n',
  `water_potable` int(11) DEFAULT NULL COMMENT 'Kebutuhan air untuk keperluan domestik dalam satuan m3/day\n',
  `utility_others` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`pod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pf_water_treatment`
--

DROP TABLE IF EXISTS `pf_water_treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pf_water_treatment` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `field_id` int(11) NOT NULL COMMENT 'Nomor identifikasi lapangan berdasarkan kolom FIELD_ID di dalam sheet R Field\n',
  `well_id` int(11) NOT NULL COMMENT 'Nomor identifikasi sumur berdasarkan kolom WELL_ID di dalam sheet Well\n',
  `wtp_capacity` int(11) DEFAULT NULL COMMENT 'Kapasitas water treatment dalam satuan BWPD untuk injeksi ataupun sebagai effluent/air buang\n',
  `water_inj_pump` varchar(100) DEFAULT NULL COMMENT 'Jenis pompa injeksi\n',
  `water_inj_pump_cap` int(11) DEFAULT NULL COMMENT 'Tekanan pompa injeksi air untuk proses Pressure Maintenance dalam satuan BWPD\n',
  `water_inj_pump_press` int(11) DEFAULT NULL COMMENT 'Tekanan pompa injeksi air untuk proses Pressure Maintenance dalam satuan psig\n',
  `compability_test` int(11) DEFAULT NULL COMMENT 'Uji Kompatibilitas air injeksi terhadap sumuran\n',
  `water_analysis` text COMMENT 'Penjelasan analisis air\n',
  KEY `pf_water_treatment_FK` (`pod_id`),
  KEY `pf_water_treatment_FK_1` (`field_id`),
  KEY `pf_water_treatment_FK_2` (`well_id`),
  CONSTRAINT `pf_water_treatment_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `pf_water_treatment_FK_1` FOREIGN KEY (`field_id`) REFERENCES `r_field` (`field_id`),
  CONSTRAINT `pf_water_treatment_FK_2` FOREIGN KEY (`well_id`) REFERENCES `well` (`well_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pf_wellhead_platform`
--

DROP TABLE IF EXISTS `pf_wellhead_platform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pf_wellhead_platform` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `field_id` int(11) NOT NULL COMMENT 'Nomor identifikasi lapangan berdasarkan kolom FIELD_ID di dalam sheet R Field\n',
  `water_depth_platform` decimal(13,3) DEFAULT NULL COMMENT 'Kedalaman anjungan kaki di dalam air dalam satuan feet\n',
  `leg_type` varchar(100) DEFAULT NULL COMMENT 'Tipe kaki dari anjungan yang digunakan untuk mengakomodasi bobot peralatan\n',
  `jacket_level` int(11) DEFAULT NULL COMMENT 'Level jaket dalam satuan inch\n',
  `leg_spacing` int(11) DEFAULT NULL COMMENT 'Jarak kaki dalam satuan inch\n',
  `leg_sleeve_size` int(11) DEFAULT NULL COMMENT 'Leg Sleeve Size dalam satuan inch\n',
  `horizontal_bracing` int(11) DEFAULT NULL COMMENT 'Ukuran Horizontal Bracing dalam satuan inch\n',
  `vertical_bracing` int(11) DEFAULT NULL COMMENT 'Ukuran Vertical Bracing dalam satuan inch\n',
  `jacket_sleeve_weight` decimal(13,3) DEFAULT NULL COMMENT 'Jacket Sleeve Weight dalam satuan metric ton\n',
  `pile_size` int(11) DEFAULT NULL COMMENT 'Ukuran tiang pancang dalam satuan inch\n',
  `pile_depth` int(11) DEFAULT NULL COMMENT 'Kedalaman tiang pancang dalam satuan feet\n',
  `penetration_weight` decimal(13,3) DEFAULT NULL COMMENT 'Penetration dalam satuan metric ton\n',
  `pile_steel_weight` decimal(13,3) DEFAULT NULL COMMENT 'Berat tiang baja dalam satuan metric ton\n',
  `total_subs_weight` int(11) DEFAULT NULL COMMENT 'Total berat Substructure dalam satuan metric ton\n',
  `deck_weight` decimal(13,3) DEFAULT NULL COMMENT 'Berat geladak dalam satuan metric ton\n',
  `wellhead_pressure` int(11) DEFAULT NULL COMMENT 'Tekanan pada wellhead dalam satuan psig\n',
  KEY `pf_wellhead_platform_FK` (`pod_id`),
  KEY `pf_wellhead_platform_FK_1` (`field_id`),
  CONSTRAINT `pf_wellhead_platform_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `pf_wellhead_platform_FK_1` FOREIGN KEY (`field_id`) REFERENCES `r_field` (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pod`
--

DROP TABLE IF EXISTS `pod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pod` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor sekuensial dokumen POD',
  `pod_name` varchar(100) NOT NULL COMMENT 'Judul pada dokumen POD',
  `workarea_id` int(11) NOT NULL COMMENT 'Nomor identifikasi wilayah kerja. Referensi terdapat di sheet R Working Area. Nama wilayah kerja merupakan nama yang tertulis di dalam dokumen POD',
  `pod_ref_num` varchar(100) NOT NULL COMMENT 'Nomor surat yang menyetujui dokumen POD',
  PRIMARY KEY (`pod_id`),
  KEY `pod_FK` (`workarea_id`),
  CONSTRAINT `pod_FK` FOREIGN KEY (`workarea_id`) REFERENCES `r_working_area` (`workarea_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profile_production`
--

DROP TABLE IF EXISTS `profile_production`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_production` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `zone_id` int(11) NOT NULL COMMENT 'Nomor identifikasi reservoir pada tabel/sheet Reservoir Target\n',
  `forecast_year` date DEFAULT NULL COMMENT 'Tahun perolehan prediksi produksi minyak/gas\n',
  `forecast_reserve_qg` decimal(13,3) DEFAULT NULL COMMENT 'Laju produksi gas rerata tahunan  sampai akhir PSC dalam satuan MMCFD\n',
  `forecast_grr_qg` decimal(13,3) DEFAULT NULL COMMENT 'Laju produksi gas rerata tahunan sampai economic limit berdasarkan hasil forecast dalam satuan MMCFD\n',
  `profile_production_gas_img` varchar(100) DEFAULT NULL COMMENT 'Profil produksi gas yang disajikan dalam bentuk diagram batang\n',
  `forecast_reserve_np` decimal(13,3) DEFAULT NULL,
  `forecast_grr_np` decimal(13,3) DEFAULT NULL COMMENT 'Laju produksi minyak rerata tahunan sampai economic limit berdasarkan hasil forecast dalam satuan BOPD\n',
  `profile_production_oil_img` decimal(13,3) DEFAULT NULL COMMENT 'Profil produksi minyak yang disajikan dalam bentuk diagram batang\n',
  KEY `profile_production_FK` (`pod_id`),
  KEY `profile_production_FK_1` (`zone_id`),
  CONSTRAINT `profile_production_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `profile_production_FK_1` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_organization`
--

DROP TABLE IF EXISTS `project_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_organization` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ ID di dalam sheet POD\n',
  `field_id` int(11) NOT NULL COMMENT 'Nomor identifikasi lapangan berdasarkan kolom FIELD_ID di dalam sheet R Field\n',
  `tk_wni` decimal(13,3) DEFAULT NULL COMMENT 'Jumlah penggunaan tenaga kerja WNI dan tenaga kerja setempat dalam satuan fraksi\n',
  `structure_org_img` varchar(100) DEFAULT NULL COMMENT 'Dibuat dalam bentuk gantt chart dan milestone. Grafik organisasi yang berupa gambar dimana setidaknya minimal mencakup informasi tentang posisi jabatan, nama lengkap kepala pemegang posisi jabatan, dan total manpower yang ada di suatu departemen/divisi\n',
  KEY `project_organization_FK` (`pod_id`),
  KEY `project_organization_FK_1` (`field_id`),
  CONSTRAINT `project_organization_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `project_organization_FK_1` FOREIGN KEY (`field_id`) REFERENCES `r_field` (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_schedule`
--

DROP TABLE IF EXISTS `project_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_schedule` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ ID di dalam sheet POD\n',
  `sched_onstream` date DEFAULT NULL COMMENT 'Jadwal onstream proyek dengan format penamaan yyyy-mm-dd\n',
  `dur_pod_fid` int(11) DEFAULT NULL COMMENT 'Durasi sejak POD disetujui hingga FID (Final Investment Desicion) dalam satuan bulan\n',
  `dur_fid_os` int(11) DEFAULT NULL COMMENT 'Durasi sejak FID (Final Investment Desicion) hingga On Stream dalam satuan bulan\n',
  `sched_summ_img` varchar(100) DEFAULT NULL COMMENT 'Ringkasan dari agenda proyek yang akan dilaksanakan\n',
  KEY `project_schedule_FK` (`pod_id`),
  CONSTRAINT `project_schedule_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `r_field`
--

DROP TABLE IF EXISTS `r_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_field` (
  `field_id` int(11) NOT NULL COMMENT 'Nomor sekuensial lapangan',
  `workarea_id` int(11) NOT NULL COMMENT 'Nomor identifikasi wilayah kerja',
  `field_name` varchar(100) NOT NULL COMMENT 'Nama lapangan yang tertulis di dalam dokumen POD',
  `field_area` decimal(13,3) DEFAULT NULL COMMENT 'Luas lapangan dalam satuan kilometer persegi',
  `field_area_type` varchar(45) DEFAULT NULL COMMENT 'Tipe lapangan (Onshore, Offshore atau Transition Zone)\n',
  PRIMARY KEY (`field_id`),
  KEY `r_field_FK` (`workarea_id`),
  CONSTRAINT `r_field_FK` FOREIGN KEY (`workarea_id`) REFERENCES `r_working_area` (`workarea_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `r_formation`
--

DROP TABLE IF EXISTS `r_formation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_formation` (
  `formation_id` int(11) NOT NULL COMMENT 'Nomor sekuensial formasi batuan',
  `formation_name` varchar(100) NOT NULL COMMENT 'Nama formasi batuan yang tertulis di dalam dokumen POD\n',
  PRIMARY KEY (`formation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `r_hydrocarbon`
--

DROP TABLE IF EXISTS `r_hydrocarbon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_hydrocarbon` (
  `hc_id` int(11) NOT NULL COMMENT 'Nomor identifikasi jenis hidrokarbon',
  `hc_name` varchar(100) NOT NULL COMMENT 'Jenis hidrokarbon',
  PRIMARY KEY (`hc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `r_pod_esdc`
--

DROP TABLE IF EXISTS `r_pod_esdc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_pod_esdc` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor sekuensial dokumen POD',
  `escd_id` varchar(100) NOT NULL COMMENT 'Kode proyek di dalam pelaporan ESDC',
  KEY `r_pod_esdc_FK` (`pod_id`),
  CONSTRAINT `r_pod_esdc_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `r_volumetric`
--

DROP TABLE IF EXISTS `r_volumetric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_volumetric` (
  `uncertainty_level` int(11) NOT NULL COMMENT 'ID tingkat ketidakpastian perhitungan cadangan',
  `uncertainty_level_desc` varchar(100) NOT NULL COMMENT 'Tingkat ketidakpastian perhitungan cadangan',
  `uncertainty_level_remarks` varchar(100) NOT NULL COMMENT 'Catatan tingkat ketidakpastian perhitungan cadangan',
  PRIMARY KEY (`uncertainty_level`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `r_working_area`
--

DROP TABLE IF EXISTS `r_working_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_working_area` (
  `workarea_id` int(11) NOT NULL COMMENT 'Nomor sekuensial wilayah kerja',
  `workarea` varchar(100) NOT NULL COMMENT 'Nama wilayah kerja yang tertulis di dalam dokumen POD',
  `land_area` decimal(13,3) DEFAULT NULL COMMENT 'Luas wilayah kerja dalam satuan kilometer persegi',
  PRIMARY KEY (`workarea_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reserve_production_forecast`
--

DROP TABLE IF EXISTS `reserve_production_forecast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserve_production_forecast` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `zone_id` int(11) NOT NULL COMMENT 'Nomor identifikasi reservoir pada tabel/sheet Reservoir Target\n',
  `reserve_scenario` text COMMENT 'Beberapa skenario/case untuk mendapatkan hydrocarbon reserves \n',
  `eur_oil_reserve` decimal(13,3) DEFAULT NULL COMMENT 'Estimated Ultimate Recovery untuk minyak  sampai akhir PSC dalam satuan MMSTB\n',
  `eur_con_reserve` decimal(13,3) DEFAULT NULL COMMENT 'Estimated Ultimate Recovery untuk kondensat  sampai akhir PSC dalam satuan MMSTB\n',
  `eur_ga_reserve` decimal(13,3) DEFAULT NULL COMMENT 'Estimated Ultimate Recovery untuk gas asosiasi  sampai akhir PSC dalam satuan BSCF\n',
  `eur_gn_reserve` decimal(13,3) DEFAULT NULL COMMENT 'Estimated Ultimate Recovery untuk gas non asosiasi  sampai akhir PSC dalam satuan BSCF\n',
  `eur_oil_grr` decimal(13,3) DEFAULT NULL COMMENT 'Estimated Ultimate Recovery untuk minyak  sampai economic limit berdasarkan hasil forecast  dalam satuan MMSTB\n',
  `eur_con_grr` decimal(13,3) DEFAULT NULL COMMENT 'Estimated Ultimate Recovery untuk kondensat  sampai economic limit berdasarkan hasil forecast  dalam satuan MMSTB\n',
  `eur_ga_grr` decimal(13,3) DEFAULT NULL COMMENT 'Estimated Ultimate Recovery untuk gas asosiasi  sampai economic limit berdasarkan hasil forecast dalam satuan BSCF\n',
  `eur_gn_grr` decimal(13,3) DEFAULT NULL COMMENT 'Estimated Ultimate Recovery untuk gas non asosiasi  sampai economic limit berdasarkan hasil forecast  dalam satuan BSCF\n',
  `oil_reserve_forecast` decimal(13,3) DEFAULT NULL COMMENT 'Jumlah tambahan minyak maksimum yang dapat diambil ke permukaan sampai akhir PSC berdasarkan hasil forecast dalam satuan MMSTB\n',
  `con_reserve_forecast` decimal(13,3) DEFAULT NULL COMMENT 'Jumlah tambahan minyak kondensat maksimum yang dapat diambil ke permukaan sampai akhir PSC berdasarkan hasil forecast dalam satuan MMSTB\n',
  `ga_reserve_forecast` decimal(13,3) DEFAULT NULL COMMENT 'Jumlah tambahan associated gas maksimum yang dapat diambil ke permukaan sampai akhir PSC berdasarkan hasil forecast dalam satuan BSCF\n',
  `gn_reserve_forecast` decimal(13,3) DEFAULT NULL COMMENT 'Jumlah tambahan non-associated gas maksimum yang dapat diambil ke permukaan sampai akhir PSC berdasarkan hasil forecast dalam satuan BSCF\n',
  `oil_grr_forecast` decimal(13,3) DEFAULT NULL COMMENT 'Jumlah tambahan minyak maksimum yang dapat diambil ke permukaan sampai economic limit berdasarkan hasil forecast dalam satuan MMSTB\n',
  `con_grr_forecast` decimal(13,3) DEFAULT NULL COMMENT 'Jumlah tambahan minyak kondensat maksimum yang dapat diambil ke permukaan sampai economic limit berdasarkan hasil forecast dalam satuan MMSTB\n',
  `ga_grr_forecast` decimal(13,3) DEFAULT NULL COMMENT 'Jumlah tambahan associated gas maksimum yang dapat diambil ke permukaan sampai economic limit berdasarkan hasil forecast dalam satuan BSCF\n',
  `gn_grr_forecast` decimal(13,3) DEFAULT NULL COMMENT 'Jumlah tambahan non-associated gas maksimum yang dapat diambil ke permukaan sampai economic limit berdasarkan hasil forecast dalam satuan BSCF\n',
  `rf_oil_reserve` decimal(13,3) DEFAULT NULL COMMENT 'Recovery Factor untuk minyak  sampai akhir PSC dalam satuan fraksi\n',
  `rf_con_reserve` decimal(13,3) DEFAULT NULL COMMENT 'Recovery Factor untuk kondensat  sampai akhir PSC dalam satuan fraksi\n',
  `rf_ga_reserve` decimal(13,3) DEFAULT NULL COMMENT 'Recovery Factor untuk gas asosiasi  sampai akhir PSC dalam satuan fraksi\n',
  `rf_gn_reserve` decimal(13,3) DEFAULT NULL COMMENT 'Recovery Factor untuk gas non asosiasi  sampai akhir PSC dalam satuan fraksi\n',
  `rf_oil_grr` decimal(13,3) DEFAULT NULL COMMENT 'Recovery Factor untuk minyak  sampai economic limit berdasarkan hasil forecast  dalam satuan fraksi\n',
  `rf_con_grr` decimal(13,3) DEFAULT NULL COMMENT 'Recovery Factor untuk kondensat  sampai economic limit berdasarkan hasil forecast  dalam satuan fraksi\n',
  `rf_ga_grr` decimal(13,3) DEFAULT NULL COMMENT 'Recovery Factor untuk gas asosiasi  sampai economic limit berdasarkan hasil forecast dalam satuan fraksi\n',
  `rf_gn_grr` decimal(13,3) DEFAULT NULL COMMENT 'Recovery Factor untuk gas non asosiasi  sampai economic limit berdasarkan hasil forecast  dalam satuan fraksi\n',
  KEY `reserve_production_forecast_FK` (`pod_id`),
  KEY `reserve_production_forecast_FK_1` (`zone_id`),
  CONSTRAINT `reserve_production_forecast_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `reserve_production_forecast_FK_1` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reservoir_modeling`
--

DROP TABLE IF EXISTS `reservoir_modeling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservoir_modeling` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `field_id` int(11) NOT NULL COMMENT 'Nomor identifikasi lapangan berdasarkan kolom FIELD_ID di dalam sheet R Field\n',
  `workflow_img` varchar(100) DEFAULT NULL COMMENT 'Alur kerja pemodelan reservoir\n',
  `margin_lateral_gas_p1` int(11) DEFAULT NULL COMMENT 'Radius dari sumur gas yang telah memproduksi reservoir yang digunakan sebagai batas area untuk menghitung P1 volume dalam satuan meter\n',
  `margin_lateral_gas_p2` int(11) DEFAULT NULL COMMENT 'Radius dari sumur gas yang telah memproduksi reservoir yang digunakan sebagai batas area untuk menghitung P2 volume dalam satuan meter\n',
  `margin_lateral_oil_p1` int(11) DEFAULT NULL COMMENT 'Radius dari sumur minyak yang telah memproduksi reservoir yang digunakan sebagai batas area untuk menghitung P1 volume dalam satuan meter\n',
  `margin_lateral_oil_p2` int(11) DEFAULT NULL COMMENT 'Radius dari sumur minyak yang telah memproduksi reservoir yang digunakan sebagai batas area untuk menghitung P2 volume. Satuan dalam meter\n',
  `zone_img` varchar(100) DEFAULT NULL COMMENT 'Pembuatan zona reservoir untuk membuat pemodelan reservoir\n',
  `margin_vertical_gas_p1` int(11) DEFAULT NULL COMMENT 'Jarak vertikal dari sumur gas yang telah memproduksi reservoir yang digunakan sebagai batas area untuk menghitung P1 volume dalam satuan m SSTVD\n',
  `margin_vertical_gas_p2` int(11) DEFAULT NULL COMMENT 'Jarak vertikal dari sumur gas yang telah memproduksi reservoir yang digunakan sebagai batas area untuk menghitung P2 volume, satuan dalam m SSTVD\n',
  `margin_vertical_oil_p1` int(11) DEFAULT NULL COMMENT 'Jarak vertikal dari sumur minyak yang telah memproduksi reservoir yang digunakan sebagai batas area untuk menghitung P1 volume dalam satuan m SSTVD\n',
  `margin_vertical_oil_p2` int(11) DEFAULT NULL COMMENT 'Jarak vertikal dari sumur minyak yang telah memproduksi reservoir yang digunakan sebagai batas area untuk menghitung P2 volume dalam satuan m SSTVD\n',
  `depth_structure_img` varchar(100) DEFAULT NULL COMMENT 'Peta kontur struktur kedalaman batuan Reservoir dari zona hidrokarbon\n',
  `total_grid` int(11) DEFAULT NULL COMMENT 'Jumlah total grid cell\n',
  `grid_i` int(11) DEFAULT NULL COMMENT 'Jumlah grid untuk vektor/sumbu i\n',
  `grid_j` int(11) DEFAULT NULL COMMENT 'Jumlah grid untuk vektor/sumbu j\n',
  `grid_z` int(11) DEFAULT NULL COMMENT 'Jumlah grid untuk vektor/sumbu z\n',
  `avg_thick_grid` int(11) DEFAULT NULL COMMENT 'Rata-rata ketebalan grid dalam satuan feet\n',
  `grid_size` int(11) DEFAULT NULL COMMENT 'Ukuran grid dalam satuan meter\n',
  `total_grid_upscaling` int(11) DEFAULT NULL COMMENT 'Jumlah total grid cell setelah dilakukan upscaling\n',
  `grid_i_upscaling` int(11) DEFAULT NULL COMMENT 'Jumlah grid untuk vektor/sumbu i setelah dilakukan upscaling\n',
  `grid_j_upscaling` int(11) DEFAULT NULL COMMENT 'Jumlah grid untuk vektor/sumbu j setelah dilakukan upscaling\n',
  `grid_z_upscaling` int(11) DEFAULT NULL COMMENT 'Jumlah grid untuk vektor/sumbu z setelah dilakukan upscaling\n',
  `avg_thick_grid_upscaling` int(11) DEFAULT NULL COMMENT 'Rata-rata ketebalan grid setelah dilakukan upscaling dalam satuan ft\n',
  `grid_size_upscaling` int(11) DEFAULT NULL COMMENT 'Ukuran grid setelah dilakukan upscaling dalam satuan meter\n',
  `upscale_log_img` varchar(100) DEFAULT NULL COMMENT 'Hasil upscaling log\n',
  `variogram_img` varchar(100) DEFAULT NULL COMMENT 'Variogram yang dilakukan saat proses pemodelan reservoir\n',
  `reservoir_facies` varchar(100) DEFAULT NULL COMMENT 'Jenis fasies pada reservoir hasil pemodelan\n',
  `facies_model_img` varchar(100) DEFAULT NULL COMMENT 'Model fasies pada pemodelan reservoir di wilayah kerja\n',
  `facies_model_analysis` varchar(100) DEFAULT NULL COMMENT 'Analisis model fasies pada pemodelan reservoir\n',
  `vsh_model_img` varchar(100) DEFAULT NULL COMMENT 'Model Volume Shale pada pemodelan reservoir wilayah kerja\n',
  `vsh_model_analysis` varchar(100) DEFAULT NULL COMMENT 'Analisis model Volume Shale pada pemodelan reservoir\n',
  `phie_model_img` varchar(100) DEFAULT NULL COMMENT 'Model porositas efektif pada pemodelan reservoir wilayah kerja\n',
  `phie_model_analysis` varchar(100) DEFAULT NULL COMMENT 'Analisis model porositas efektif pada pemodelan reservoir\n',
  `sw_model_img` varchar(100) DEFAULT NULL COMMENT 'Model saturasi air pada pemodelan reservoir wilayah kerja\n',
  `sw_model_analysis` varchar(100) DEFAULT NULL,
  `perm_model_img` varchar(100) DEFAULT NULL COMMENT 'Model permeabilitas reservoir pada reservoir wilayah kerja\n',
  `perm_model_analysis` varchar(100) DEFAULT NULL COMMENT 'Analisis model saturasi air pada pemodelan reservoir\n',
  `hcpv_model_img` varchar(100) DEFAULT NULL COMMENT 'Model hydrocarbon pore volume pada reservoir wilayah kerja\n',
  `hcpv_model_analysis` varchar(100) DEFAULT NULL COMMENT 'Analisis hydrocarbon pore volume pada pemodelan reservoir\n',
  `ntg_model_img` varchar(100) DEFAULT NULL COMMENT 'Model Net to Gross pada pemodelan reservoir wilayah kerja\n',
  `net_reservoir_img` varchar(100) DEFAULT NULL COMMENT 'Model Net Reservoir pada zona reservoir\n',
  `net_pay_model_img` varchar(100) DEFAULT NULL COMMENT 'Model Net Pay pada zona reservoir\n',
  `fine_coarse_histogram_img` varchar(100) DEFAULT NULL COMMENT 'Perbandingan model fine dan coarse yang disajikan dalam bentuk grafik histogram\n',
  KEY `reservoir_modeling_FK` (`pod_id`),
  KEY `reservoir_modeling_FK_1` (`field_id`),
  CONSTRAINT `reservoir_modeling_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `reservoir_modeling_FK_1` FOREIGN KEY (`field_id`) REFERENCES `r_field` (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rock_typing`
--

DROP TABLE IF EXISTS `rock_typing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rock_typing` (
  `field_id` int(11) NOT NULL COMMENT 'Nomor identifikasi lapangan berdasarkan kolom FIELD_ID di dalam sheet R Field\n',
  `well_id` int(11) NOT NULL COMMENT 'Nomor identifikasi sumur berdasarkan kolom WELL_ID di dalam sheet Well\n',
  `zone_id` int(11) DEFAULT NULL COMMENT 'Nomor identifikasi zona pada tabel/sheet Zones - Reservoir Target\n',
  `rock_type_method` varchar(100) DEFAULT NULL COMMENT 'Metode rock typing yang digunakan\n',
  `rock_type` varchar(100) DEFAULT NULL COMMENT 'Tipe dari sampel batuan yang tertulis di POD\n',
  `perm_rock_type_min` decimal(13,3) DEFAULT NULL COMMENT 'Permeabilitas core minimal dalam satuan milidarcy berdasarkan rock type\n',
  `perm_rock_type_max` decimal(13,3) DEFAULT NULL COMMENT 'Permeabilitas core maksimal dalam satuan milidarcy berdasarkan rock type\n',
  `por_perm_correlation_img` varchar(100) DEFAULT NULL COMMENT 'Grafik hubungan porositas dan permeabilitas\n',
  `cross_plot_poro_gas_rate_img` varchar(100) DEFAULT NULL COMMENT 'Grafik crossplot antara porositas dan laju alir gas\n',
  `cross_plot_perm_gas_rate_img` varchar(100) DEFAULT NULL COMMENT 'Grafik crossplot antara permeabilitas dan laju alir gas\n',
  `cross_plot_sat_water_gas_rate_img` varchar(100) DEFAULT NULL COMMENT 'Grafik crossplot antara saturasi air dan laju alir gas\n',
  `rock_typing_analysis` text,
  KEY `rock_typing_FK` (`field_id`),
  KEY `rock_typing_FK_1` (`well_id`),
  KEY `rock_typing_FK_2` (`zone_id`),
  CONSTRAINT `rock_typing_FK` FOREIGN KEY (`field_id`) REFERENCES `r_field` (`field_id`),
  CONSTRAINT `rock_typing_FK_1` FOREIGN KEY (`well_id`) REFERENCES `well` (`well_id`),
  CONSTRAINT `rock_typing_FK_2` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scal`
--

DROP TABLE IF EXISTS `scal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scal` (
  `field_id` int(11) NOT NULL COMMENT 'Nomor identifikasi lapangan berdasarkan kolom FIELD_ID di dalam sheet R Field\n',
  `well_id` int(11) DEFAULT NULL COMMENT 'Nomor identifikasi sumur berdasarkan kolom WELL_ID di dalam sheet Well\n',
  `capillary_press` decimal(13,3) DEFAULT NULL COMMENT 'Tekanan kapiler (perbedaan tekanan yang terjadi diantara permukaan dua fluida yang tidak saling bercampur) dari sampel analisa special core \n',
  `perm_rel` decimal(13,3) DEFAULT NULL COMMENT 'Permeabilitas relatif (permeabilitas dimana fluida yang mengalir pada batuan terdiri lebih dari satu fasa) dari setiap batuan sampel dalam satuan milidarcy\n',
  `water_saturation` decimal(13,3) DEFAULT NULL COMMENT 'Saturasi air (persentase dari volume pori yang berisi air formasi batuan) dalam satuan fraksi\n',
  `perm_to_water_avg` decimal(13,3) DEFAULT NULL COMMENT 'Permeabilitas air rata-rata dari setiap kelompok batuan dalam satuan milidarcy\n',
  `perm_oil_swirr_avg` decimal(13,3) DEFAULT NULL COMMENT 'Permeabilitas minyak dalam satuan milidarcy dengan irreducible water saturation (saturasi air yang tersisa) rata-rata pada batuan sampel analisa special core   \n',
  `perm_water_sor_avg` decimal(13,3) DEFAULT NULL COMMENT 'Permeabilitas air dalam satuan milidarcy dengan saturasi minyak yang tersisa rata-rata dalam satuan fraksi \n',
  `poro_avg` decimal(13,3) DEFAULT NULL COMMENT 'Porositas batuan sampel rata-rata  yang digunakan saat analisa special core dalam satuan fraksi\n',
  `swirr_avg` decimal(13,3) DEFAULT NULL COMMENT 'Irreducible water saturation (saturasi air dimana seluruh cairan tertahan di dalam batuan karena pengaruh tekanan kapiler) rata-rata \n',
  `sor_avg` decimal(13,3) DEFAULT NULL COMMENT 'Merupakan saturasi minyak (sisa) minimum  yang tidak dapat bergerak rata-rata dalam satuan fraksi\n',
  `kro_swirr_avg` decimal(13,3) DEFAULT NULL COMMENT 'Permeabilitas relatif minyak dalam satuan milidarcy dengan Irreducible water saturation (saturasi air dimana seluruh cairan tertahan di dalam batuan karena pengaruh tekanan kapiler) rata-rata\n',
  `krw_sor_avg` decimal(13,3) DEFAULT NULL COMMENT 'Permeabilitas relatif air dalam satuan milidarcy dengan saturasi minyak tersisa dalam satuan fraksi rata-rata\n',
  `fzi_avg` decimal(13,3) DEFAULT NULL COMMENT 'Penentuan kelompok batuan berdasarkan Flow Zone Indicator (FZI) \n',
  `capillary_press_plot_img` varchar(100) DEFAULT NULL COMMENT 'Plot nilai tekanan kapiler dari setiap sampel tipe batuan\n',
  `capillary_press_avg_curve_img` varchar(100) DEFAULT NULL COMMENT 'Kurva nilai rata-rata tekanan kapiler untuk setiap tipe batuan berdasarkan Leverett J-Function\n',
  `perm_rel_curve_img` varchar(100) DEFAULT NULL COMMENT 'Kurva permeabilitas relatif masing-masing tipe batuan\n',
  `pc_perm_rel_water_oil_plot_img` varchar(100) DEFAULT NULL COMMENT 'Capillary pressure vs water-oil relative permeability\n',
  `jfunction_sw_plot_img` varchar(100) DEFAULT NULL COMMENT 'Grafik J-Function vs water saturation \n',
  `denormalisasi_pc_plot_img` varchar(100) DEFAULT NULL COMMENT 'Denormalisasi tekanan kapiler plot hasil analisa sampel special core \n',
  `norm_water_oil_plot_img` varchar(100) DEFAULT NULL COMMENT 'Grafik normalisasi antara air-minyak dan permeabilitas relatif\n',
  `norm_gas_water_plot_img` varchar(100) DEFAULT NULL COMMENT 'Grafik normalisasi antara gas-air dan permeabilitas relatif\n',
  `norm_gas_oil_plot_img` varchar(100) DEFAULT NULL COMMENT 'Grafik normalisasi antara gas-minyak dan permeabilitas relatif\n',
  `perm_endpoint_img` varchar(100) DEFAULT NULL COMMENT 'Hubungan permeabilitas dengan endpoint\n',
  `perm_rel_wo_plot_img` varchar(100) DEFAULT NULL COMMENT 'Grafik water-oil relative permeability\n',
  `fractional_flow_plot_img` varchar(100) DEFAULT NULL COMMENT 'Kurva fractional flow hasil dari denormalisasi permeabilitas relatif air-minyak\n',
  `jfunction_datacore_plot_img` varchar(100) DEFAULT NULL COMMENT 'Kurva perhitungan modifikasi J-Function dari data core pada tiap lapisan yang digunakan untuk mengetahui sifat batuan antar lapisan\n',
  KEY `scal_FK` (`field_id`),
  KEY `scal_FK_1` (`well_id`),
  CONSTRAINT `scal_FK` FOREIGN KEY (`field_id`) REFERENCES `r_field` (`field_id`),
  CONSTRAINT `scal_FK_1` FOREIGN KEY (`well_id`) REFERENCES `well` (`well_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scope`
--

DROP TABLE IF EXISTS `scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scope` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `facility_modification` varchar(100) DEFAULT NULL COMMENT 'Kegiatan yang berhubungan dengan fasilitas produksi yang tercakup dalam POD, keterangan mengenai perbaikan dan penambahan fasilitas produksi. Contoh pengisian: sewa EPF (Early Production Facilities), pembangunan sistem perpipaan dan sistem manifold, pembangunan WHP, pemasangan pipa bawah laut dan modifikasi fasilitas eksisting\n',
  `field_dev_1st_phase_desc` text COMMENT 'Penjabaran dari fase pertama pengembangan lapangan\n',
  `field_dev_2nd_phase_desc` text COMMENT 'Penjabaran dari fase kedua pengembangan lapangan\n',
  `field_dev_3rd_phase_desc` text COMMENT 'Penjabaran dari fase ketiga pengembangan lapangan\n',
  `well_exist_expl` int(11) DEFAULT NULL COMMENT 'Jumlah sumur eksplorasi eksisting dalam POD\n',
  `well_exist_prod` int(11) DEFAULT NULL COMMENT 'Jumlah sumur produksi eksisting\n',
  `well_exist_inject` int(11) DEFAULT NULL COMMENT 'Jumlah sumur injeksi eksisting\n',
  `well_exist_stepout` int(11) DEFAULT NULL COMMENT 'Jumlah sumur stepout eksisting\n',
  `well_exist_observation` int(11) DEFAULT NULL COMMENT 'Jumlah sumur observasi eksisting\n',
  `well_new_prod` int(11) DEFAULT NULL COMMENT 'Jumlah sumur pengembangan/infill yang akan dibor\n',
  `well_new_inj` int(11) DEFAULT NULL COMMENT 'Jumlah sumur injeksi yang akan dibor\n',
  `well_new_drill_total` int(11) DEFAULT NULL COMMENT 'Jumlah sumur infill dan injeksi yang akan dibor (Diisi jika di surat persetujuan tidak dijelaskan jumlah masing-masing sumur produksi dan injeksi dll)\n',
  `well_new_stepout` int(11) DEFAULT NULL COMMENT 'Jumlah sumur step-out yang akan dibor\n',
  `well_new_obs` int(11) DEFAULT NULL COMMENT 'Jumlah sumur observasi yang akan dibor\n',
  `well_prod_to_inj` int(11) DEFAULT NULL COMMENT 'Jumlah konversi sumur produksi menjadi sumur injeksi\n',
  `well_inj_to_obs` int(11) DEFAULT NULL COMMENT 'Jumlah konversi sumur injeksi menjadi sumur observasi\n',
  `well_prod_to_obs` int(11) DEFAULT NULL COMMENT 'Jumlah konversi sumur produksi menjadi sumur observasi\n',
  `well_expl_to_prod` int(11) DEFAULT NULL COMMENT 'Jumlah konversi sumur eksplorasi menjadi sumur produksi\n',
  `well_inj_to_swtr` int(11) DEFAULT NULL COMMENT 'Jumlah konversi sumur injeksi menjadi sumur source water\n',
  `well_prod_to_swtr` int(11) DEFAULT NULL COMMENT 'Jumlah konversi sumur produksi menjadi sumur source water\n',
  `well_si_to_prod` int(11) DEFAULT NULL COMMENT 'Jumlah konversi sumur shut-in/suspended menjadi sumur produksi\n',
  `well_si_to_inj` int(11) DEFAULT NULL COMMENT 'Jumlah konversi sumur shut-in/suspended  menjadi sumur injeksi\n',
  `well_si_to_sgas` int(11) DEFAULT NULL COMMENT 'Jumlah konversi sumur shut-in/suspended  menjadi sumur source gas\n',
  `well_si_to_swtr` int(11) DEFAULT NULL COMMENT 'Jumlah konversi sumur shut-in/suspended  menjadi sumur source water\n',
  `well_disp_to_inj` int(11) DEFAULT NULL COMMENT 'Jumlah konversi sumur disposal menjadi sumur injeksi\n',
  `field_dev_scheme_img` varchar(100) DEFAULT NULL COMMENT 'Skema pengembangan lapangan\n',
  KEY `scope_FK` (`pod_id`),
  CONSTRAINT `scope_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seismic`
--

DROP TABLE IF EXISTS `seismic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seismic` (
  `pod_id` int(11) DEFAULT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `field_id` int(11) DEFAULT NULL COMMENT 'Nomor identifikasi lapangan berdasarkan kolom FIELD_ID di dalam sheet R Field\n',
  `seis_3d_domain` varchar(100) DEFAULT NULL COMMENT 'Domain data seismik 3D (time, depth)\n',
  `seis_3d_data_type` varchar(100) DEFAULT NULL COMMENT 'Tipe data seismik 3D (poststack, prestack)\n',
  `seis_3d_area` decimal(13,3) DEFAULT NULL COMMENT 'Luas area seismik 3D dalam satuan kilometer persegi\n',
  `seis_3d_acq_time` time DEFAULT NULL COMMENT 'Waktu pelaksanaan akuisisi seismik 3D\n',
  `seis_3d_acq_cont` varchar(100) DEFAULT NULL COMMENT 'Kontraktor yang melakukan akuisisi seismik 3D\n',
  `seis_3d_pro_time` time DEFAULT NULL COMMENT 'Waktu pengolahan atau processing data seismik 3D\n',
  `seis_3d_pro_cont` varchar(100) DEFAULT NULL COMMENT 'Kontraktor yang melakukan pengolahan data seismik 3D\n',
  `seis_polarity` varchar(100) DEFAULT NULL COMMENT 'Polaritas data seismik\n',
  `seis_3d_bin_size_inline` int(11) DEFAULT NULL COMMENT 'Nilai ukuran bin arah inline dalam satuan m\n',
  `seis_3d_bin_size_xline` int(11) DEFAULT NULL COMMENT 'Nilai ukuran bin arah crossline dalam satuan m\n',
  `seis_3d_fold` int(11) DEFAULT NULL COMMENT 'Jumlah fold pada seismik 3D\n',
  `seis_inline_start` int(11) DEFAULT NULL COMMENT 'Nilai inline awal data seismik 3D\n',
  `seis_inline_end` int(11) DEFAULT NULL COMMENT 'Nilai inline akhir data seismik 3D\n',
  `seis_3d_il` int(11) DEFAULT NULL COMMENT 'Jumlah crossline data seismik 3D\n',
  `seis_xline_start` int(11) DEFAULT NULL COMMENT 'Nilai crossline awal data seismik 3D\n',
  `seis_xline_end` int(11) DEFAULT NULL COMMENT 'Nilai crossline akhir data seismik 3D\n',
  `seis_3d_xl` int(11) DEFAULT NULL COMMENT 'Jumlah crossline data seismik 3D\n',
  `seis_angle_stack` varchar(100) DEFAULT NULL COMMENT 'Sudut stack pada data seismik pre-stack\n',
  `seis_tuning_thickness` decimal(13,3) DEFAULT NULL COMMENT 'Resolusi vertikal data seismik yang merupakan perhitungan dari 1/4 lambda dalam satuan m\n',
  `seis_2d_line` int(11) DEFAULT NULL COMMENT 'Jumlah lintasan data seismik 2D\n',
  `seis_2d_data_type` varchar(100) DEFAULT NULL COMMENT 'Tipe data seismik 2D (poststack, prestack)\n',
  `seis_2d_domain` varchar(100) DEFAULT NULL COMMENT 'Domain data seismik 2D (time, depth)\n',
  `seis_2d_acq_time` time DEFAULT NULL COMMENT 'Waktu pelaksanaan akuisisi seismik 2D\n',
  `seis_2d_acq_cont` varchar(100) DEFAULT NULL COMMENT 'Kontraktor yang melakukan akuisisi seismik 2D\n',
  `seis_2d_pro_time` time DEFAULT NULL COMMENT 'Waktu pengolahan atau processing data seismik 2D\n',
  `seis_2d_pro_cont` varchar(100) DEFAULT NULL COMMENT 'Kontraktor yang melakukan pengolahan data seismik 2D\n',
  `seis_2d_spatial_grid` int(11) DEFAULT NULL COMMENT 'Spasi lintasan seismik 2D dalam satuan km\n',
  `seis_crs` varchar(100) DEFAULT NULL COMMENT 'Sistem referensi koordinat yang digunakan\n',
  `seis_section_img` varchar(100) DEFAULT NULL COMMENT 'Penampang seismik\n',
  `map_seismic_img` varchar(100) DEFAULT NULL COMMENT 'Basemap area pengukuran survey seismik dalam format shape file (.shp). Isi shape file mencakup posisi sumur, posisi line seismik 2D atau area seismik 3D dan wilayah kerja\n',
  KEY `seismic_FK` (`pod_id`),
  KEY `seismic_FK_1` (`field_id`),
  CONSTRAINT `seismic_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `seismic_FK_1` FOREIGN KEY (`field_id`) REFERENCES `r_field` (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seismic_attribute`
--

DROP TABLE IF EXISTS `seismic_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seismic_attribute` (
  `pod_id` int(11) DEFAULT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `field_id` int(11) DEFAULT NULL COMMENT 'Nomor identifikasi lapangan berdasarkan kolom FIELD_ID di dalam sheet R Field\n',
  `seis_attribute` varchar(100) DEFAULT NULL COMMENT 'Attribute yang digunakan untuk mengetahui penyebaran properti reservoir\n',
  `attr_section_img` varchar(100) DEFAULT NULL COMMENT 'Penampang dari hasil analisis atribut seismik\n',
  `attr_section_analysis` varchar(100) DEFAULT NULL COMMENT 'Analisa atau interpretasi mengenai hasil atribut seismik yang dilakukan \n',
  `attr_distr_map_img` varchar(100) DEFAULT NULL COMMENT 'Peta persebaran distribusi atribut dalam format shape file dan grid file. Contoh: peta RMS  amplitudo, peta mean amplitudo AI, peta multi atribut porositas\n',
  `attr_distr_map_analysis` text COMMENT 'Analisa dari peta persebaran distribusi atribut. Contoh: peta RMS  amplitudo, peta mean amplitudo AI, peta multi atribut porositas\n',
  KEY `siesmic_attribute_FK` (`pod_id`),
  KEY `siesmic_attribute_FK_1` (`field_id`),
  CONSTRAINT `siesmic_attribute_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `siesmic_attribute_FK_1` FOREIGN KEY (`field_id`) REFERENCES `r_field` (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seismic_horizon`
--

DROP TABLE IF EXISTS `seismic_horizon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seismic_horizon` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `formation_id` int(11) NOT NULL COMMENT 'Nomor identifikasi formasi berdasarkan kolom FORMATION_ID di dalam sheet Formation\n',
  `hor_name` varchar(100) DEFAULT NULL COMMENT 'Nama horizon atau batas-batas struktur lapisan yang dimodelkan\n',
  `hor_continuity` int(11) DEFAULT NULL COMMENT 'Penilaian subjektif untuk kemenerusan horizon hasil picking (1 = poor, 2 = fair, 3 = good)\n',
  `hor_amplitude` int(11) DEFAULT NULL COMMENT 'Penilaian subjektif kekuatan amplitude horizon (1 = lemah, 2 = lemah-sedang, 3 = sedang, 4 = sedang-kuat, 5= kuat)\n',
  KEY `siesmic_horizon_FK` (`pod_id`),
  KEY `siesmic_horizon_FK_1` (`formation_id`),
  CONSTRAINT `siesmic_horizon_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `siesmic_horizon_FK_1` FOREIGN KEY (`formation_id`) REFERENCES `r_formation` (`formation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seismic_interpretation`
--

DROP TABLE IF EXISTS `seismic_interpretation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seismic_interpretation` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `field_id` int(11) NOT NULL COMMENT 'Nomor identifikasi lapangan berdasarkan kolom FIELD_ID di dalam sheet R Field\n',
  `hor_fault_interpret_img` varchar(100) DEFAULT NULL COMMENT 'Interpretasi penampang seismik yang sudah ditarik horizon beserta sesarnya\n',
  `hor_fault_interpret_analysis` text COMMENT 'Analisa dari interpretasi horizon atau batas-batas lapisan dan sesar-sesar (jenis sesar, orientasi sesar, pola sesar, kemenerusan horizon dll)\n',
  `map_dhi_img` varchar(100) DEFAULT NULL COMMENT 'Peta persebaran Direct Hydrocarbon Indicator (flatspot, bright spot, dim spot)\n',
  KEY `siesmic_interpretation_FK` (`pod_id`),
  KEY `siesmic_interpretation_FK_1` (`field_id`),
  CONSTRAINT `siesmic_interpretation_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `siesmic_interpretation_FK_1` FOREIGN KEY (`field_id`) REFERENCES `r_field` (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seismic_inversion`
--

DROP TABLE IF EXISTS `seismic_inversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seismic_inversion` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `field_id` int(11) NOT NULL COMMENT 'Nomor identifikasi lapangan berdasarkan kolom FIELD_ID di dalam sheet R Field\n',
  `inv_method` varchar(100) DEFAULT NULL COMMENT 'Metode inversi seismik yang digunakan (AVO Inversi, Simultan Inversi, EI Inversi, EEI Inversi)\n',
  `inv_method_desc` text COMMENT 'Penjelasan proses inversi seismik yang digunakan (AVO Inversi, Simultan Inversi, EI Inversi, EEI Inversi)\n',
  `inv_workflow_img` varchar(100) DEFAULT NULL COMMENT 'Alur kerja dari proses seismik inversi\n',
  `inv_workflow_desc` text COMMENT 'Deskripsi atau penjelasan terkait alur kerja dari proses inversi seismik\n',
  KEY `seismic_inversion_FK` (`pod_id`),
  KEY `seismic_inversion_FK_1` (`field_id`),
  CONSTRAINT `seismic_inversion_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `seismic_inversion_FK_1` FOREIGN KEY (`field_id`) REFERENCES `r_field` (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `source_rock`
--

DROP TABLE IF EXISTS `source_rock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `source_rock` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `formation_id` int(11) NOT NULL COMMENT 'Nomor identifikasi nama formasi batuan induk pada sistem petroleum, merupakan FORMATION_ID di dalam sheet R Formation\n',
  `srock_lithology` varchar(100) DEFAULT NULL COMMENT 'Litologi formasi batuan induk pada sistem petroleum\n',
  `srock_env` varchar(100) DEFAULT NULL COMMENT 'Lingkungan pengendapan formasi batuan induk pada sistem petroleum\n',
  `srock_age` varchar(100) DEFAULT NULL COMMENT 'Umur batuan induk pada sistem petroleum\n',
  `temp_grad` decimal(13,3) DEFAULT NULL COMMENT 'Gradien temperatur rata-rata kematangan pada sistem petroleum dalam satuan derajat fahrenheit per 100 feet\n',
  `srock_facies` varchar(100) DEFAULT NULL COMMENT 'Nama fasies batuan induk pada sistem petroleum\n',
  `srock_kerogen_type` varchar(100) DEFAULT NULL COMMENT 'Tipe kerogen dari fasies batuan induk pada sistem petroleum (Tipe I, I-II, III)\n',
  `srock_toc_min` decimal(13,3) DEFAULT NULL COMMENT 'Karbon organik total (TOC) minimum yang terkandung dalam fasies batuan induk pada sistem petroleum dalam satuan fraksi\n',
  `srock_toc_max` decimal(13,3) DEFAULT NULL COMMENT 'Karbon organik total (TOC) maksimum yang terkandung dalam fasies batuan induk pada sistem petroleum dalam satuan fraksi\n',
  `srock_toc_avg` decimal(13,3) DEFAULT NULL COMMENT 'Karbon organik total (TOC) rata-rata yang terkandung dalam fasies batuan induk pada sistem petroleum dalam satuan fraksi\n',
  `srock_tmax` int(11) DEFAULT NULL COMMENT 'Suhu maksimum pada saat kerogen berubah menjadi hidrokarbon (matang) dalam derajat fahrenheit\n',
  `coal_type` varchar(100) DEFAULT NULL COMMENT 'Tipe batubara (lignite, sub-bituminus,bituminus, antrasit) dari fasies batuan induk pada sistem petroleum\n',
  `maceral_analysis_img` varchar(100) DEFAULT NULL COMMENT 'Analisis maseral batubara pada source rock\n',
  `vitrinite_reflectance_img` varchar(100) DEFAULT NULL COMMENT 'Analisis Vitrinite Reflectance pada batubara source rock\n',
  `xray_diffraction_img` varchar(100) DEFAULT NULL COMMENT 'Analisis difrasi X-ray pada batubara source rock\n',
  KEY `source_rock_FK` (`pod_id`),
  KEY `source_rock_FK_1` (`formation_id`),
  CONSTRAINT `source_rock_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `source_rock_FK_1` FOREIGN KEY (`formation_id`) REFERENCES `r_formation` (`formation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_depth_structure`
--

DROP TABLE IF EXISTS `time_depth_structure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_depth_structure` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `field_id` int(11) NOT NULL COMMENT 'Nomor identifikasi lapangan berdasarkan kolom FIELD_ID di dalam sheet R Field\n',
  `hor_name` varchar(100) DEFAULT NULL COMMENT 'Nama horizon atau batas-batas struktur lapisan yang dimodelkan\n',
  `map_struct_time_img` varchar(100) DEFAULT NULL COMMENT 'Peta struktur waktu untuk horizon yang dimodelkan dalam format shape file (berisikan peta kontur) dan grid file\n',
  `map_struct_depth_img` varchar(100) DEFAULT NULL COMMENT 'Peta struktur kedalaman untuk horizon yang dimodelkan dalam format shape file (berisikan peta kontur) dan grid file\n',
  `time_depth_conv_method` text COMMENT 'Metode yang digunakan untuk mengubah domain waktu ke domain kedalaman beserta penjelasan prosesnya\n',
  `workflow_time_depth_conv_img` varchar(100) DEFAULT NULL COMMENT 'Flow chart atau workflow dari pembuatan depth structure map \n',
  `workflow_vel_model_img` varchar(100) DEFAULT NULL COMMENT 'Workflow proses pembuatan model kecepatan untuk proses konversi waktu terhadap kedalaman\n',
  `vel_tdr_curve_img` varchar(100) DEFAULT NULL COMMENT 'Plot antara waktu dan kedalaman yang diperoleh dari sumur yang digunakan untuk proses konversi dari peta struktur waktu ke kedalaman\n',
  `vel_map_img` varchar(100) DEFAULT NULL COMMENT 'Gambar velocity map yang digunakan untuk proses konversi dari peta struktur waktu ke kedalaman\n',
  `vel_mod_img` varchar(100) DEFAULT NULL COMMENT 'Gambar model velocity yang digunakan untuk proses konversi dari peta struktur waktu ke kedalaman\n',
  `map_struct_depth_analysis` text COMMENT 'Analisa dari peta struktur kedalaman dapat berupa penjelasan struktur utama, orientasi, jenis struktur, kedalaman, dll\n',
  KEY `time_depth_structure_FK` (`pod_id`),
  KEY `time_depth_structure_FK_1` (`field_id`),
  CONSTRAINT `time_depth_structure_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `time_depth_structure_FK_1` FOREIGN KEY (`field_id`) REFERENCES `r_field` (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumetric`
--

DROP TABLE IF EXISTS `volumetric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumetric` (
  `pod_id` int(11) NOT NULL COMMENT 'POD_ID\n',
  `zone_id` int(11) NOT NULL COMMENT 'Nomor identifikasi reservoir pada tabel/sheet Reservoir Target\n',
  `uncertainty_level` int(11) NOT NULL COMMENT 'Nomor identifikasi tingkat ketidakpastian perhitungan cadangan, dapat dilihat pada tabel/sheet R Volumetric\n',
  `ioip` decimal(13,3) DEFAULT NULL COMMENT 'Volume minyak awal pada reservoir dalam satuan MMSTB\n',
  `igip` decimal(13,3) DEFAULT NULL COMMENT 'Volume gas awal pada reservoir dalam satuan BSCF\n',
  `tornado_chart` varchar(100) DEFAULT NULL,
  KEY `volumetric_FK` (`pod_id`),
  KEY `volumetric_FK_1` (`zone_id`),
  KEY `volumetric_FK_2` (`uncertainty_level`),
  CONSTRAINT `volumetric_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `volumetric_FK_1` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`zone_id`),
  CONSTRAINT `volumetric_FK_2` FOREIGN KEY (`uncertainty_level`) REFERENCES `r_volumetric` (`uncertainty_level`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `well`
--

DROP TABLE IF EXISTS `well`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `well` (
  `well_id` int(11) NOT NULL COMMENT 'Nomor sekuensial sumur',
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD',
  `well_name` varchar(100) NOT NULL COMMENT 'Nama sumur yang tertulis di dalam POD, baik sumur yang telah ada maupun sumur usulan',
  `well_exist` tinyint(1) NOT NULL COMMENT 'Keterangan yang menunjukkan bahwa sumur sudah ada sebelumnya atau baru direncanakan (1 jika sudah ada, 0 jika belum ada)',
  `well_surf_x` decimal(12,8) DEFAULT NULL COMMENT 'Untuk well exist berupa koordinat permukaan sumur arah sumbu-x sedangkan untuk well proposed  berupa usulan koordinat permukaan sumur arah sumbu-x',
  `well_surf_y` decimal(12,8) DEFAULT NULL COMMENT 'Untuk well exist berupa koordinat permukaan sumur arah sumbu-y sedangkan untuk well proposed  berupa usulan koordinat permukaan sumur arah sumbu-y',
  `well_kb_elev` decimal(10,2) DEFAULT NULL COMMENT 'Nilai ketinggian kelly bushing yang diukur dalam satuan meter (untuk well existed)',
  PRIMARY KEY (`well_id`),
  KEY `well_FK` (`pod_id`),
  CONSTRAINT `well_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `well_casing_design`
--

DROP TABLE IF EXISTS `well_casing_design`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `well_casing_design` (
  `pod_id` int(11) NOT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `well_id` int(11) NOT NULL COMMENT 'Nomor identifikasi sumur berdasarkan kolom WELL_ID di dalam sheet Well\n',
  `formation_id` int(11) NOT NULL COMMENT 'Nomor sekuensial formasi batuan\n',
  `csg_depth_md` int(11) DEFAULT NULL COMMENT 'Kedalaman casing yang diusulkan untuk desain casing pada POD dalam satuan feet measured depth\n',
  `csg_length` decimal(13,3) DEFAULT NULL COMMENT 'Panjang casing yang diusulkan untuk desain casing pada POD dalam satuan feet\n',
  `csg_hole` decimal(13,3) DEFAULT NULL COMMENT 'Ukuran lubang sumur yang diusulkan untuk desain casing pada POD dalam satuan inch\n',
  `csg_size` decimal(13,3) DEFAULT NULL COMMENT 'Ukuran diameter casing yang diusulkan untuk desain casing pada POD dalam satuan inch\n',
  `csg_grade` varchar(100) DEFAULT NULL COMMENT 'Spesifikasi kelas dari casing yang diusulkan untuk desain casing pada POD\n',
  `csg_weight` decimal(13,3) DEFAULT NULL COMMENT 'Berat casing dari casing yang diusulkan untuk desain casing pada POD dalam satuan pound per feet\n',
  `csg_connection` varchar(100) DEFAULT NULL COMMENT 'Jenis sambungan antar casing yang diusulkan untuk desain casing pada POD\n',
  `csg_remarks` varchar(100) DEFAULT NULL COMMENT 'Informasi tambahan tentang casing yang diusulkan untuk desain casing pada POD\n',
  `collapse_rating` decimal(13,3) DEFAULT NULL COMMENT 'Tekanan collapse yang diturunkan oleh safety factor dengan memperhitungkan efek beban aksial. Formula baik digunakan untuk pipa bulat dalam satuan pound per square inch\n',
  `burst_rating` decimal(13,3) DEFAULT NULL COMMENT 'Tekanan burst minimum aktual yang diturunkan oleh safety factor. Burst yang diturunkan digunakan sebagai maksimum saat memompa dalam satuan pound per square inch\n',
  `yield_rating` decimal(13,3) DEFAULT NULL COMMENT 'Rating yield dalam satuan pound per square inch\n',
  `tension_rating` decimal(13,3) DEFAULT NULL COMMENT 'Rating tension dalam satuan killopound\n',
  `stresscheck_collapse` decimal(13,3) DEFAULT NULL COMMENT 'Tekanan collapse yang didapatkan dari hasil running software dalam satuan pound per square inch\n',
  `stresscheck_burst` decimal(13,3) DEFAULT NULL COMMENT 'Tekanan burst yang didapatkan dari hasil running software dalam satuan pound per square inch\n',
  `stresscheck_yield` decimal(13,3) DEFAULT NULL COMMENT 'Tekanan yield yang didapatkan dari hasil running software dalam satuan pound per square inch\n',
  `cgs_inner_diameter` decimal(13,3) DEFAULT NULL COMMENT 'Diameter dalam dari casing yang diusulkan pada POD dalam satuan inci\n',
  `csg_drift_inner_diameter` decimal(13,3) DEFAULT NULL COMMENT 'Diameter maksimal suatu benda yang dapat masuk ke dalam casing yang diusulkan pada POD dalam satuan inci\n',
  `yield_strength` decimal(13,3) DEFAULT NULL COMMENT 'Besarnya beban burst minimum dari casing yang diusulkan pada POD\n',
  `well_design_img` varchar(100) DEFAULT NULL COMMENT 'Tata letak vertikal dan tampilan rencana pemboran yang khas\n',
  `well_design_plan_vertical_img` varchar(100) DEFAULT NULL COMMENT 'Desain / profil sumur yang diusulkan (vertical)\n',
  `well_design_plan_directional_img` varchar(100) DEFAULT NULL COMMENT 'Desain / profil sumur yang diusulkan (berarah)\n',
  `well_design_csg_img` varchar(100) DEFAULT NULL COMMENT 'Stick chart design casing sumur\n',
  KEY `well_casing_design_FK` (`pod_id`),
  KEY `well_casing_design_FK_1` (`well_id`),
  KEY `well_casing_design_FK_2` (`formation_id`),
  CONSTRAINT `well_casing_design_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `well_casing_design_FK_1` FOREIGN KEY (`well_id`) REFERENCES `well` (`well_id`),
  CONSTRAINT `well_casing_design_FK_2` FOREIGN KEY (`formation_id`) REFERENCES `r_formation` (`formation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `well_test_dst`
--

DROP TABLE IF EXISTS `well_test_dst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `well_test_dst` (
  `field_id` int(11) NOT NULL COMMENT 'Nomor identifikasi lapangan berdasarkan kolom FIELD_ID di dalam sheet R Field\n',
  `well_id` int(11) NOT NULL COMMENT 'Nomor identifikasi sumur berdasarkan kolom WELL_ID di dalam sheet Well\n',
  `zone_id` int(11) NOT NULL COMMENT 'Nomor sekuensial reservoir\n',
  `dst_period` varchar(100) DEFAULT NULL COMMENT 'Tahapan yang dilakukan dalam rangkaian uji sumur\n',
  `dst_test_duration` decimal(13,3) DEFAULT NULL COMMENT 'Durasi uji Drill Stem Testing atau Uji Kandungan Lapisan dalam satuan jam\n',
  `dst_choke_size` int(11) DEFAULT NULL COMMENT 'Ukuran choke yang digunakan saat uji Drill Stem Testing/DST (Uji Kandungan Lapisan) dalam satuan inch\n',
  `dst_oil_rate` decimal(13,3) DEFAULT NULL COMMENT 'Laju alir minyak per hari (Qo) hasil pengujian sumur dalam satuan BOPD\n',
  `dst_gas_rate` decimal(13,3) DEFAULT NULL COMMENT 'Laju alir gas per hari (Qg) hasil pengujian sumur dalam satuan MMSCFD\n',
  `dst_con_rate` decimal(13,3) DEFAULT NULL COMMENT 'Laju alir kondensat per hari (Qc) hasil pengujian sumur dalam satuan BCPD\n',
  `dst_liquid_rate` decimal(13,3) DEFAULT NULL COMMENT 'Laju alir liquid per hari dari hasil pengujian sumur dalam satuan BLPD\n',
  `dst_water_rate` decimal(13,3) DEFAULT NULL COMMENT 'Laju alir air per hari (Qw) hasil pengujian sumur dalam satuan BWPD\n',
  `dst_bhp` decimal(13,3) DEFAULT NULL COMMENT 'Tekanan bottom hole saat uji DST (Uji Kandungan Lapisan) dalam satuan psia\n',
  `dst_whp` decimal(13,3) DEFAULT NULL COMMENT 'Tekanan kepala sumur saat uji DST (Uji Kandungan Lapisan) dalam satuan psia\n',
  `dst_wht` decimal(13,3) DEFAULT NULL COMMENT 'Temperatur kepala sumur saat uji DST (Uji Kandungan Lapisan) dalam satuan fahrenheit\n',
  KEY `well_test_dst_FK` (`field_id`),
  KEY `well_test_dst_FK_1` (`well_id`),
  KEY `well_test_dst_FK_2` (`zone_id`),
  CONSTRAINT `well_test_dst_FK` FOREIGN KEY (`field_id`) REFERENCES `r_field` (`field_id`),
  CONSTRAINT `well_test_dst_FK_1` FOREIGN KEY (`well_id`) REFERENCES `well` (`well_id`),
  CONSTRAINT `well_test_dst_FK_2` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `well_test_report`
--

DROP TABLE IF EXISTS `well_test_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `well_test_report` (
  `field_id` int(11) NOT NULL COMMENT 'Nomor identifikasi lapangan berdasarkan kolom FIELD_ID di dalam sheet R Field\n',
  `well_id` int(11) NOT NULL COMMENT 'Nomor identifikasi sumur berdasarkan kolom WELL_ID di dalam sheet Well\n',
  `res_model` varchar(100) DEFAULT NULL COMMENT 'Model reservoir lapangan yang tertulis di dalam POD\n',
  `res_boundary` varchar(100) DEFAULT NULL COMMENT 'Bentuk batas reservoir lapangan yang tertulis di dalam POD\n',
  `well_test_method` varchar(100) DEFAULT NULL COMMENT 'Metode analisa hasil uji sumur (well test) yang tertulis di dalam POD\n',
  `permeability` decimal(13,3) DEFAULT NULL COMMENT 'Permeabilitas hasil well test dalam satuan milidarcy\n',
  `skin_factor` decimal(13,3) DEFAULT NULL COMMENT 'Suatu besaran dimensionless yang menyatakan besarnya tingkat kerusakan formasi pada lapangan pengembangan\n',
  `radius_invest` decimal(13,3) DEFAULT NULL COMMENT 'Radius investigasi dari sumur dalam satuan feet\n',
  `res_pressure` decimal(13,3) DEFAULT NULL COMMENT 'Tekanan reservoir pada saat uji sumur dalam satuan psia\n',
  `res_temp` decimal(13,3) DEFAULT NULL COMMENT 'Temperatur reservoir pada saat uji sumur dalam satuan fahrenheit\n',
  KEY `well_test_report_FK` (`field_id`),
  KEY `well_test_report_FK_1` (`well_id`),
  CONSTRAINT `well_test_report_FK` FOREIGN KEY (`field_id`) REFERENCES `r_field` (`field_id`),
  CONSTRAINT `well_test_report_FK_1` FOREIGN KEY (`well_id`) REFERENCES `well` (`well_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `well_tie`
--

DROP TABLE IF EXISTS `well_tie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `well_tie` (
  `pod_id` int(11) DEFAULT NULL COMMENT 'Nomor identifikasi dokumen POD, merupakan POD_ID di dalam sheet POD\n',
  `well_id` int(11) DEFAULT NULL COMMENT 'Nomor identifikasi sumur berdasarkan kolom WELL_ID di dalam sheet Well\n',
  `well_tie_wavelet_type` varchar(100) DEFAULT NULL COMMENT 'Tipe wavelet yang digunakan dalam proses korelasi sumur dan data seismik\n',
  `well_tie_wavelet_length` int(11) DEFAULT NULL COMMENT 'Panjang wavelet yang digunakan dalam proses well tie\n',
  `well_tie_wavelet_phase` varchar(100) DEFAULT NULL COMMENT 'Fase pada wavelet yang digunakan dalam proses well tie\n',
  `well_tie_wavelet_polarity` varchar(100) DEFAULT NULL COMMENT 'Polaritas pada wavelet yang digunakan dalam proses well tie\n',
  `well_tie_freq_dom` decimal(13,3) DEFAULT NULL COMMENT 'Nilai frekuensi dominan pada data seismik yang digunakan dalam proses korelasi sumur dan seismik dalam satuan hertz\n',
  `well_tie_coef_corr` int(11) DEFAULT NULL COMMENT 'Nilai koefisien korelasi seismogram sintetik dengan data seismik\n',
  `well_tie_img` varchar(100) DEFAULT NULL COMMENT 'Hasil pengikatan data sumur terhadap seismik\n',
  `well_tie_source_data` varchar(100) DEFAULT NULL COMMENT 'Data yang digunakan untuk melakukan proses well tie. Contoh : data checkshot, data log sonic\n',
  KEY `well_tie_FK` (`pod_id`),
  KEY `well_tie_FK_1` (`well_id`),
  CONSTRAINT `well_tie_FK` FOREIGN KEY (`pod_id`) REFERENCES `pod` (`pod_id`),
  CONSTRAINT `well_tie_FK_1` FOREIGN KEY (`well_id`) REFERENCES `well` (`well_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zones`
--

DROP TABLE IF EXISTS `zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zones` (
  `zone_id` int(11) NOT NULL COMMENT 'Nomor sekuensial reservoir',
  `field_id` int(11) NOT NULL COMMENT 'Nomor identifikasi lapangan berdasarkan kolom FIELD_ID di dalam sheet R Field',
  `formation_id` int(11) NOT NULL COMMENT 'Nomor identifikasi formasi batuan',
  `zone_name` varchar(100) NOT NULL COMMENT 'Nama zona yang tertulis di POD',
  `is_reservoir` tinyint(1) DEFAULT NULL COMMENT 'Nilai boolean yang menandakan zona merupakan reservoir atau bukan. Reservoir =1, Non-reservoir = 0.',
  PRIMARY KEY (`zone_id`),
  KEY `zones_FK` (`field_id`),
  KEY `zones_FK_1` (`formation_id`),
  CONSTRAINT `zones_FK` FOREIGN KEY (`field_id`) REFERENCES `r_field` (`field_id`),
  CONSTRAINT `zones_FK_1` FOREIGN KEY (`formation_id`) REFERENCES `r_formation` (`formation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Reservoir Target';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-24 10:58:42
