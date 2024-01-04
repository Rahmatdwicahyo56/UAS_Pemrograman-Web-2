/*
 Navicat Premium Data Transfer

 Source Server         : q
 Source Server Type    : MySQL
 Source Server Version : 100414
 Source Host           : localhost:3306
 Source Schema         : sisfohotel

 Target Server Type    : MySQL
 Target Server Version : 100414
 File Encoding         : 65001

 Date: 15/12/2023 03:05:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for kamar
-- ----------------------------
DROP TABLE IF EXISTS `kamar`;
CREATE TABLE `kamar`  (
  `idkamar` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tipe` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `gambar` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`idkamar`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kamar
-- ----------------------------
INSERT INTO `kamar` VALUES ('001', 'Superior', 7, 410000, 'Standard.jpg');
INSERT INTO `kamar` VALUES ('002', 'Deluxe', 49, 450000, 'Superior.jpg');
INSERT INTO `kamar` VALUES ('003', 'Junior Suite', 4, 700000, 'Deluxe.jpg');
INSERT INTO `kamar` VALUES ('004', 'Executive', 2, 1200000, 'Junior-Suite.jpg');

-- ----------------------------
-- Table structure for kontak
-- ----------------------------
DROP TABLE IF EXISTS `kontak`;
CREATE TABLE `kontak`  (
  `idkontak` int(11) NOT NULL AUTO_INCREMENT,
  `idtamu` int(11) NOT NULL,
  `username` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pesanuser` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pesanadmin` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`idkontak`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login`  (
  `username` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `role` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES ('admin', '21232f297a57a5a743894a0e4a801fc3', 'admin');
INSERT INTO `login` VALUES ('owner', '72122ce96bfec66e2396d2e25225d70a', 'pimpinan');
INSERT INTO `login` VALUES ('staff', '1253208465b1efa876f982d8a9e73eef', 'staff');

-- ----------------------------
-- Table structure for pembayaran
-- ----------------------------
DROP TABLE IF EXISTS `pembayaran`;
CREATE TABLE `pembayaran`  (
  `idpesan` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jumlah` int(11) NOT NULL,
  `bank` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `norek` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `namarek` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `gambar` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`idpesan`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pemesanan
-- ----------------------------
DROP TABLE IF EXISTS `pemesanan`;
CREATE TABLE `pemesanan`  (
  `idpesan` int(11) NOT NULL AUTO_INCREMENT,
  `tglpesan` datetime(0) NOT NULL,
  `batasbayar` datetime(0) NOT NULL,
  `idkamar` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tipe` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `harga` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `idtamu` int(11) NOT NULL,
  `nama` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alamat` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `telepon` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tglmasuk` date NOT NULL,
  `tglkeluar` date NOT NULL,
  `lamahari` int(11) NOT NULL DEFAULT 0,
  `totalbayar` int(11) NOT NULL DEFAULT 0,
  `status` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Pending...',
  PRIMARY KEY (`idpesan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stokkamar
-- ----------------------------
DROP TABLE IF EXISTS `stokkamar`;
CREATE TABLE `stokkamar`  (
  `idkamar` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tipe` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `stok` int(11) NOT NULL,
  PRIMARY KEY (`idkamar`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stokkamar
-- ----------------------------
INSERT INTO `stokkamar` VALUES ('001', 'Superior', 6);
INSERT INTO `stokkamar` VALUES ('002', 'Deluxe', 32);
INSERT INTO `stokkamar` VALUES ('003', 'Junior Suite', 42);
INSERT INTO `stokkamar` VALUES ('004', 'Executive', 66);

-- ----------------------------
-- Table structure for tamu
-- ----------------------------
DROP TABLE IF EXISTS `tamu`;
CREATE TABLE `tamu`  (
  `idtamu` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `gender` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alamat` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `telepon` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `foto` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`idtamu`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tamu
-- ----------------------------
INSERT INTO `tamu` VALUES (10, 'ali', 'ali@gmail.com', 'Aljumad', 'Perempuan', 'Jl. qwerty', '081222333444', '202cb962ac59075b964b07152d234b70', 'favicon.png');
INSERT INTO `tamu` VALUES (12, 'fahri', 'fahri@gmail.com', 'Muh. Fahrizal', NULL, 'Jl....', '1234567777', '202cb962ac59075b964b07152d234b70', '');
INSERT INTO `tamu` VALUES (13, 'furkan', 'furkan@gmail.com', 'Muh. Ade Furkan', NULL, 'Jlll', '088777888999', '202cb962ac59075b964b07152d234b70', '');
INSERT INTO `tamu` VALUES (14, 'tes', '1@1.com', 'AA', 'Perempuan', 'AA', '313131', '76d80224611fc919a5d54f0ff9fba446', 'defaultfoto.png');

SET FOREIGN_KEY_CHECKS = 1;
