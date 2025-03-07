-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2025 at 08:20 AM
-- Server version: 11.6.2-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hydroatlantisdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `actuator_device_infos`
--

CREATE TABLE `actuator_device_infos` (
  `id` varchar(36) DEFAULT NULL,
  `created_at` varchar(10) DEFAULT NULL,
  `updated_at` varchar(10) DEFAULT NULL,
  `deleted_at` varchar(10) DEFAULT NULL,
  `device_name` varchar(20) DEFAULT NULL,
  `type_id` varchar(36) DEFAULT NULL,
  `statusz` tinyint(4) DEFAULT NULL,
  `parent_edge_device_id` varchar(36) DEFAULT NULL,
  `row_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `actuator_device_infos`
--

INSERT INTO `actuator_device_infos` (`id`, `created_at`, `updated_at`, `deleted_at`, `device_name`, `type_id`, `statusz`, `parent_edge_device_id`, `row_id`) VALUES
('43ffb88e-f721-4823-95c0-8c9a840eee46', '2024-03-07', '2024-03-07', '', 'Humidifier', '402c9565-4690-4d18-962d-9d108fdc4551', 1, '09a52f4d-0b92-4050-80d7-c8f4f6e18688', 1),
('ba29346b-b8ee-403a-84f5-093c92b6a174', '2024-03-16', '2024-03-16', '', 'Grow Lamp', 'f1b4bbb4-d82f-4af8-9922-60592f3c1da8', 0, '09a52f4d-0b92-4050-80d7-c8f4f6e18688', 2),
('b5f15541-5154-4303-82ba-1c882f0aaca4', '2024-03-14', '2024-03-14', '', 'Exhaust Fans', '35488e4c-d92d-4cab-9b20-29b8451c309c', 0, '09a52f4d-0b92-4050-80d7-c8f4f6e18688', 3),
('c99dd16a-fe8d-431e-a502-131752547b1a', '2024-03-09', '2024-03-09', '', 'Greenhouse Shading', '8b2a9ce3-f235-4f2e-b3d6-bcc4b2546bb6', 0, '09a52f4d-0b92-4050-80d7-c8f4f6e18688', 4),
('214d1bc6-a432-40ac-a916-b9d0cf6bc05a', '2024-03-08', '2024-03-08', '', 'Fish Feeder', '1da982f4-95a7-4440-aacf-22913062cc07', 0, '09a52f4d-0b92-4050-80d7-c8f4f6e18688', 5),
('f2e36748-1552-4bd4-9c5d-b3ae7e9c2400', '2024-03-08', '2024-05-30', '', 'Water Blender', '1c0196f4-db39-4921-8409-a15f9bd6a224', 0, '09a52f4d-0b92-4050-80d7-c8f4f6e18688', 6),
('2c596186-8b34-43bf-af0f-3e7d722bdc0d', '2024-03-22', '2024-03-22', '', 'Ph Down', '8326cb3f-4c10-47b1-aa39-daeb867552a0', 0, '09a52f4d-0b92-4050-80d7-c8f4f6e18688', 7),
('d93ab677-0a68-4773-a916-ff31bd1e3532', '2024-03-18', '2024-08-06', '', 'Ph Up', '6bfb31dc-437e-42d2-aaec-9ae3403df21f', 0, '09a52f4d-0b92-4050-80d7-c8f4f6e18688', 8),
('ac7c5e04-d410-4454-a828-4d541eedbe53', '2024-03-20', '2024-03-20', '', 'Aquaponics Solution', '11c74d36-db60-4b7e-8a9c-341fc601486f', 0, '09a52f4d-0b92-4050-80d7-c8f4f6e18688', 9),
('4acfbc3d-3108-42ad-b06f-aa9b7e37c715', '2024-03-13', '2024-05-27', '', 'Clean Water', '02bb73a9-9147-48eb-953f-8977b412a834', 0, '09a52f4d-0b92-4050-80d7-c8f4f6e18688', 10),
('13cd077d-a2fd-4704-9ad8-7f697bca64e9', '2024-03-21', '2024-08-03', '', 'Nitrate', 'b140aafb-c264-46bb-9051-20b554499ba9', 0, '09a52f4d-0b92-4050-80d7-c8f4f6e18688', 11),
('189d0fc4-131d-41a0-bea0-40de300990d0', '2024-03-17', '2024-03-17', '', 'Exhaust Fans', '35488e4c-d92d-4cab-9b20-29b8451c309c', 0, '100f800d-132c-4d92-a892-71a6c1cb45e7', 12),
('41cf8f6d-f697-4ca5-a38c-0740d37ba35f', '2024-03-11', '2024-03-11', '', 'Greenhouse Shading', '8b2a9ce3-f235-4f2e-b3d6-bcc4b2546bb6', 0, '100f800d-132c-4d92-a892-71a6c1cb45e7', 13),
('c40ca10d-e713-4886-8f45-65a3687f9e8f', '2024-04-28', '2024-04-28', '', 'Exhaust Fans ', '35488e4c-d92d-4cab-9b20-29b8451c309c', 0, 'a7cd79d5-0759-41bb-8857-cac4f696c93b', 14),
('7785af3e-5c30-44a1-b329-ffc54d84f895', '2024-04-30', '2024-04-30', '', 'Humidifier ', '402c9565-4690-4d18-962d-9d108fdc4551', 0, 'a7cd79d5-0759-41bb-8857-cac4f696c93b', 15),
('ce9752ba-b6c4-4984-8a3b-cbf8102608c0', '2024-05-01', '2024-05-01', '', 'Grow Lamp ', 'f1b4bbb4-d82f-4af8-9922-60592f3c1da8', 0, 'a7cd79d5-0759-41bb-8857-cac4f696c93b', 16),
('5531de02-dad1-429a-bec9-70f49dd42cd5', '2024-05-03', '2024-05-03', '', 'Greenhouse Shading ', '8b2a9ce3-f235-4f2e-b3d6-bcc4b2546bb6', 0, 'a7cd79d5-0759-41bb-8857-cac4f696c93b', 17),
('83a5b5c5-44b7-414b-96e8-261602bda264', '2024-05-05', '2024-05-05', '', 'Camera Fish ', '16a91ac6-ee34-4d0b-8852-473568adbeb1', 0, 'a7cd79d5-0759-41bb-8857-cac4f696c93b', 18),
('58322529-02f3-4aa7-a99e-a54e430e3808', '2024-05-07', '2024-05-07', '', 'Camera Plant ', 'cb487d22-3fdd-4e82-af96-45c470685fbd', 0, 'a7cd79d5-0759-41bb-8857-cac4f696c93b', 19),
('e0fe0d0e-223f-4845-9f1f-f3829324b51c', '2024-04-27', '2024-04-27', '', 'Water Blender ', '1c0196f4-db39-4921-8409-a15f9bd6a224', 0, 'a7cd79d5-0759-41bb-8857-cac4f696c93b', 20),
('e09de4b1-f76c-4b50-a27a-fb1c6950c2e8', '2024-04-29', '2024-04-29', '', 'Fish Feeder ', '1da982f4-95a7-4440-aacf-22913062cc07', 0, 'a7cd79d5-0759-41bb-8857-cac4f696c93b', 21),
('e70fee79-64f9-46ec-880f-c9d8656721e5', '2024-04-30', '2024-04-30', '', 'Return Pump Main ', '60c41d59-5649-446b-9efa-af24a0b560cc', 0, 'a7cd79d5-0759-41bb-8857-cac4f696c93b', 22),
('1135f9bc-733e-4df1-8708-9f68dc420f3b', '2024-05-02', '2024-05-02', '', 'Return Pump Standby ', 'c2d06588-54b2-463a-98c3-54b0b72506a6', 0, 'a7cd79d5-0759-41bb-8857-cac4f696c93b', 23),
('97518adb-bf1e-49a8-83f5-97874a888b76', '2024-05-05', '2024-05-05', '', 'Ph Down ', '8326cb3f-4c10-47b1-aa39-daeb867552a0', 0, 'a7cd79d5-0759-41bb-8857-cac4f696c93b', 24),
('9106566f-2b92-4582-815b-16e92bb20ba7', '2024-05-07', '2024-05-07', '', 'Ph Up ', '6bfb31dc-437e-42d2-aaec-9ae3403df21f', 0, 'a7cd79d5-0759-41bb-8857-cac4f696c93b', 25),
('390bde7f-e81c-485f-98b9-ff72bc6f71b8', '2024-04-29', '2024-04-29', '', 'Aquaponics Solution ', '11c74d36-db60-4b7e-8a9c-341fc601486f', 0, 'a7cd79d5-0759-41bb-8857-cac4f696c93b', 26),
('f52932fa-15c2-4b66-98a2-4108b55c35af', '2024-05-01', '2024-05-01', '', 'Clean Water ', '02bb73a9-9147-48eb-953f-8977b412a834', 0, 'a7cd79d5-0759-41bb-8857-cac4f696c93b', 27),
('850fb957-2927-4087-92f8-141bc64062e9', '2024-05-03', '2024-05-03', '', 'Nitrate ', 'b140aafb-c264-46bb-9051-20b554499ba9', 0, 'a7cd79d5-0759-41bb-8857-cac4f696c93b', 28),
('046f8c2b-54b1-42cb-a9e7-fb34f62c1acc', '2024-10-05', '2024-10-05', '', 'Exhaust Fans ', '35488e4c-d92d-4cab-9b20-29b8451c309c', 0, '1fcc0c3a-aa5d-4cc9-8a98-74f1298edbfc', 29),
('c635d004-16d7-4714-b380-1cf0d0a7209e', '2024-10-08', '2024-10-08', '', 'Humidifier ', '402c9565-4690-4d18-962d-9d108fdc4551', 0, '1fcc0c3a-aa5d-4cc9-8a98-74f1298edbfc', 30),
('22fdefce-607e-4a08-82b7-69da2c64f8ee', '2024-10-10', '2024-10-10', '', 'Grow Lamp ', 'f1b4bbb4-d82f-4af8-9922-60592f3c1da8', 0, '1fcc0c3a-aa5d-4cc9-8a98-74f1298edbfc', 31),
('e436879e-9602-4d5c-877c-7c4202007c3b', '2024-10-12', '2024-10-12', '', 'Greenhouse Shading ', '8b2a9ce3-f235-4f2e-b3d6-bcc4b2546bb6', 0, '1fcc0c3a-aa5d-4cc9-8a98-74f1298edbfc', 32),
('2fd11b69-a7fb-4c4b-b134-247afc16f51b', '2024-10-14', '2024-10-14', '', 'Camera Fish ', '16a91ac6-ee34-4d0b-8852-473568adbeb1', 0, '1fcc0c3a-aa5d-4cc9-8a98-74f1298edbfc', 33),
('fc9b373c-d1c0-4ae8-94ea-4464dc9ab898', '2024-10-05', '2024-10-05', '', 'Camera Plant ', 'cb487d22-3fdd-4e82-af96-45c470685fbd', 0, '1fcc0c3a-aa5d-4cc9-8a98-74f1298edbfc', 34),
('c9c3293b-fa9c-4b3d-9abe-5469582b79a4', '2024-10-07', '2024-10-07', '', 'Water Blender ', '1c0196f4-db39-4921-8409-a15f9bd6a224', 0, '1fcc0c3a-aa5d-4cc9-8a98-74f1298edbfc', 35),
('ff32e411-8aac-4b99-aa93-8c1a41851a31', '2024-10-09', '2024-10-09', '', 'Fish Feeder ', '1da982f4-95a7-4440-aacf-22913062cc07', 0, '1fcc0c3a-aa5d-4cc9-8a98-74f1298edbfc', 36),
('186faaa4-67b0-4049-950b-93deaad3501c', '2024-10-10', '2024-10-10', '', 'Return Pump Main ', '60c41d59-5649-446b-9efa-af24a0b560cc', 0, '1fcc0c3a-aa5d-4cc9-8a98-74f1298edbfc', 37),
('c0cadab6-0999-4d6d-b3aa-68c23e6cda99', '2024-10-12', '2024-10-12', '', 'Return Pump Standby ', 'c2d06588-54b2-463a-98c3-54b0b72506a6', 0, '1fcc0c3a-aa5d-4cc9-8a98-74f1298edbfc', 38),
('830736ab-af7d-4fc7-9563-84a3ea094e79', '2024-10-05', '2024-10-05', '', 'Ph Down ', '8326cb3f-4c10-47b1-aa39-daeb867552a0', 0, '1fcc0c3a-aa5d-4cc9-8a98-74f1298edbfc', 39),
('a0ae4e75-b98c-40bd-8b38-b5f99d22b574', '2024-10-07', '2024-10-07', '', 'Ph Up ', '6bfb31dc-437e-42d2-aaec-9ae3403df21f', 0, '1fcc0c3a-aa5d-4cc9-8a98-74f1298edbfc', 40),
('1a188cc7-4f64-4e18-bd1a-aae08daa5c7c', '2024-10-09', '2024-10-09', '', 'Aquaponics Solution ', '11c74d36-db60-4b7e-8a9c-341fc601486f', 0, '1fcc0c3a-aa5d-4cc9-8a98-74f1298edbfc', 41),
('1955ce1b-1e05-4005-ae00-af7d9906f9d3', '2024-10-11', '2024-10-11', '', 'Clean Water ', '02bb73a9-9147-48eb-953f-8977b412a834', 0, '1fcc0c3a-aa5d-4cc9-8a98-74f1298edbfc', 42),
('6e0360ea-c3ee-4dfc-97e2-a0e5b1336742', '2024-10-14', '2024-10-14', '', 'Nitrate ', 'b140aafb-c264-46bb-9051-20b554499ba9', 0, '1fcc0c3a-aa5d-4cc9-8a98-74f1298edbfc', 43),
('4d4b9463-a84b-49d8-907b-f5da31e6b753', '2024-10-10', '2024-10-10', '', 'Exhaust Fans ', '35488e4c-d92d-4cab-9b20-29b8451c309c', 0, '2aa53fc5-0369-483a-b618-8db6cae21313', 44),
('02ee39c1-1cc4-499b-b9df-6f62222c5f32', '2024-10-13', '2024-10-13', '', 'Humidifier ', '402c9565-4690-4d18-962d-9d108fdc4551', 0, '2aa53fc5-0369-483a-b618-8db6cae21313', 45),
('e65eece6-2f14-4619-992b-40c249016393', '2024-10-15', '2024-10-15', '', 'Grow Lamp ', 'f1b4bbb4-d82f-4af8-9922-60592f3c1da8', 0, '2aa53fc5-0369-483a-b618-8db6cae21313', 46),
('f31c6261-1791-498f-b587-e243a341e404', '2024-10-06', '2024-10-06', '', 'Greenhouse Shading ', '8b2a9ce3-f235-4f2e-b3d6-bcc4b2546bb6', 0, '2aa53fc5-0369-483a-b618-8db6cae21313', 47),
('63f41fb0-d29c-466a-a178-4d7a53c40de2', '2024-10-09', '2024-10-09', '', 'Camera Fish ', '16a91ac6-ee34-4d0b-8852-473568adbeb1', 0, '2aa53fc5-0369-483a-b618-8db6cae21313', 48),
('2c3b7ddc-6392-4926-808b-57ae7bf2a11c', '2024-10-11', '2024-10-11', '', 'Camera Plant ', 'cb487d22-3fdd-4e82-af96-45c470685fbd', 0, '2aa53fc5-0369-483a-b618-8db6cae21313', 49),
('48714662-4f22-4059-876d-49e7ef2664f8', '2024-10-13', '2024-10-13', '', 'Water Blender ', '1c0196f4-db39-4921-8409-a15f9bd6a224', 0, '2aa53fc5-0369-483a-b618-8db6cae21313', 50),
('3b83ada3-115c-4e66-a7e5-267ce6157002', '2024-10-15', '2024-10-15', '', 'Fish Feeder ', '1da982f4-95a7-4440-aacf-22913062cc07', 0, '2aa53fc5-0369-483a-b618-8db6cae21313', 51),
('44efaede-c15d-48aa-b553-836c45d2f5eb', '2024-10-05', '2024-10-05', '', 'Return Pump Main ', '60c41d59-5649-446b-9efa-af24a0b560cc', 0, '2aa53fc5-0369-483a-b618-8db6cae21313', 52),
('9a96e68f-16c0-4726-9f00-3c29420b7324', '2024-10-06', '2024-10-06', '', 'Return Pump Standby ', 'c2d06588-54b2-463a-98c3-54b0b72506a6', 0, '2aa53fc5-0369-483a-b618-8db6cae21313', 53),
('cae19965-bd2c-4cc0-a90c-482b61e3e91d', '2024-10-08', '2024-10-08', '', 'Ph Down ', '8326cb3f-4c10-47b1-aa39-daeb867552a0', 0, '2aa53fc5-0369-483a-b618-8db6cae21313', 54),
('db8250ca-d51a-422e-845e-7537ce84d30d', '2024-10-04', '2024-10-04', '', 'Ph Up ', '6bfb31dc-437e-42d2-aaec-9ae3403df21f', 0, '2aa53fc5-0369-483a-b618-8db6cae21313', 55),
('c28833fc-9403-44af-9ea8-9e860758780a', '2024-10-11', '2024-10-11', '', 'Aquaponics Solution ', '11c74d36-db60-4b7e-8a9c-341fc601486f', 0, '2aa53fc5-0369-483a-b618-8db6cae21313', 56),
('5adb258d-0528-498d-95ad-78e6a03fb927', '2024-10-13', '2024-10-13', '', 'Clean Water ', '02bb73a9-9147-48eb-953f-8977b412a834', 0, '2aa53fc5-0369-483a-b618-8db6cae21313', 57),
('fbe28072-216b-423d-80ce-e95621022569', '2024-10-15', '2024-10-15', '', 'Nitrate ', 'b140aafb-c264-46bb-9051-20b554499ba9', 0, '2aa53fc5-0369-483a-b618-8db6cae21313', 58),
('2da90374-7e48-4cdf-9e1d-9e086b39f6e3', '2024-12-24', '2024-12-24', '', 'Exhaust Fans ', '35488e4c-d92d-4cab-9b20-29b8451c309c', 0, '79dea917-a396-46aa-87b4-e0a6c9f8c4fe', 59),
('9fded486-28f5-40a8-8608-cd6f21defb91', '2024-12-26', '2024-12-26', '', 'Humidifier ', '402c9565-4690-4d18-962d-9d108fdc4551', 0, '79dea917-a396-46aa-87b4-e0a6c9f8c4fe', 60),
('6678cbef-a3eb-4250-9156-c74b4e98c711', '2024-12-27', '2024-12-27', '', 'Grow Lamp ', 'f1b4bbb4-d82f-4af8-9922-60592f3c1da8', 0, '79dea917-a396-46aa-87b4-e0a6c9f8c4fe', 61),
('f9b30def-2f15-4a08-b1b3-b0d5275de07b', '2024-12-29', '2024-12-29', '', 'Greenhouse Shading ', '8b2a9ce3-f235-4f2e-b3d6-bcc4b2546bb6', 0, '79dea917-a396-46aa-87b4-e0a6c9f8c4fe', 62),
('bcd78fdf-a8e1-446e-91f2-1cc635a33983', '2024-12-20', '2024-12-20', '', 'Camera Fish ', '16a91ac6-ee34-4d0b-8852-473568adbeb1', 0, '79dea917-a396-46aa-87b4-e0a6c9f8c4fe', 63),
('f6cc7301-59da-4b58-b76b-450faa1ca37d', '2024-12-21', '2024-12-21', '', 'Camera Plant ', 'cb487d22-3fdd-4e82-af96-45c470685fbd', 0, '79dea917-a396-46aa-87b4-e0a6c9f8c4fe', 64),
('8f7e5af6-b6bb-45c5-ac1f-198d718b7d08', '2024-12-23', '2024-12-23', '', 'Water Blender ', '1c0196f4-db39-4921-8409-a15f9bd6a224', 0, '79dea917-a396-46aa-87b4-e0a6c9f8c4fe', 65),
('353ab125-b351-4895-8cc3-a11d09a609d4', '2024-12-25', '2024-12-25', '', 'Fish Feeder ', '1da982f4-95a7-4440-aacf-22913062cc07', 0, '79dea917-a396-46aa-87b4-e0a6c9f8c4fe', 66),
('56933248-e539-4d58-81cc-d5bafef1af0d', '2024-12-26', '2024-12-26', '', 'Return Pump Main ', '60c41d59-5649-446b-9efa-af24a0b560cc', 0, '79dea917-a396-46aa-87b4-e0a6c9f8c4fe', 67),
('979dae64-3f81-4049-a863-64768a07bb9c', '2024-12-28', '2024-12-28', '', 'Return Pump Standby ', 'c2d06588-54b2-463a-98c3-54b0b72506a6', 0, '79dea917-a396-46aa-87b4-e0a6c9f8c4fe', 68),
('005a8ba0-49b6-419f-89e5-672dedbcd67f', '2024-12-19', '2024-12-19', '', 'Ph Down ', '8326cb3f-4c10-47b1-aa39-daeb867552a0', 0, '79dea917-a396-46aa-87b4-e0a6c9f8c4fe', 69),
('69cb9036-779a-4579-aa75-8a2d6e7b429f', '2024-12-20', '2024-12-20', '', 'Ph Up ', '6bfb31dc-437e-42d2-aaec-9ae3403df21f', 0, '79dea917-a396-46aa-87b4-e0a6c9f8c4fe', 70),
('793ce3d4-ea3b-40f8-a804-fb6000ea2398', '2024-12-22', '2024-12-22', '', 'Aquaponics Solution ', '11c74d36-db60-4b7e-8a9c-341fc601486f', 0, '79dea917-a396-46aa-87b4-e0a6c9f8c4fe', 71),
('81ddd544-1acd-438b-be7f-8cb5217a3b71', '2024-12-23', '2024-12-23', '', 'Clean Water ', '02bb73a9-9147-48eb-953f-8977b412a834', 0, '79dea917-a396-46aa-87b4-e0a6c9f8c4fe', 72),
('38baaf95-31ec-4c5b-90f4-6ce999882c51', '2024-12-25', '2024-12-25', '', 'Nitrate ', 'b140aafb-c264-46bb-9051-20b554499ba9', 0, '79dea917-a396-46aa-87b4-e0a6c9f8c4fe', 73);

-- --------------------------------------------------------

--
-- Table structure for table `actuator_updates`
--

CREATE TABLE `actuator_updates` (
  `id` varchar(36) DEFAULT NULL,
  `created_at` varchar(10) DEFAULT NULL,
  `updated_at` varchar(10) DEFAULT NULL,
  `deleted_at` varchar(0) DEFAULT NULL,
  `actuator_device_info_id` varchar(36) DEFAULT NULL,
  `statusz` tinyint(4) DEFAULT NULL,
  `timestamp` varchar(26) DEFAULT NULL,
  `remarks` varchar(0) DEFAULT NULL,
  `made_by` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `actuator_updates`
--

INSERT INTO `actuator_updates` (`id`, `created_at`, `updated_at`, `deleted_at`, `actuator_device_info_id`, `statusz`, `timestamp`, `remarks`, `made_by`) VALUES
('3dfee380-6f95-40a9-b519-c526a002fc4a', '2024-04-25', '2024-04-25', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 0, '2024-04-24 09:21:91', '', 'toggle'),
('bbc8f86d-fe9f-4f08-829e-3ba78f41734c', '2024-05-02', '2024-05-02', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 1, '2024-04-24 09:28:64', '', 'toggle'),
('8a4314df-3776-4568-a037-b5a556387809', '2024-04-29', '2024-04-29', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 0, '2024-04-24 09:29:33', '', 'toggle'),
('6f53c30c-f53e-4c6e-b748-89aa0e33a3c5', '2024-04-25', '2024-04-25', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 1, '2024-04-24 09:35:06', '', 'toggle'),
('26ee445b-ff2c-4227-80c8-67abe9fbd95f', '2024-06-08', '2024-06-08', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 1, '2024-05-29 08:56:09.703602', '', 'toggle'),
('422d39d1-6c28-4fd5-9d3f-5dd4f458ac91', '2024-05-29', '2024-05-29', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 0, '2024-05-29 08:57:35.340112', '', 'toggle'),
('92b2c8b2-d421-4230-ba2a-49dc8c6f875c', '2024-06-07', '2024-06-07', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 0, '2024-05-29 09:17:39.567502', '', 'toggle'),
('719afbc0-a0f2-4ec8-8dd7-e6f221063cbc', '2024-07-30', '2024-07-30', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 1, '2024-07-23 13:50:26.965995', '', 'automation'),
('1e6428cd-1ab9-424f-8df8-889b7b6a09dc', '2024-07-23', '2024-07-23', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 1, '2024-07-23 13:50:31.387931', '', 'automation'),
('782027dc-7901-4188-85d8-c994f4e1e90c', '2024-08-01', '2024-08-01', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 0, '2024-07-23 13:50:44.090962', '', 'automation'),
('5b6c61ce-2abe-498d-86ec-06d5b7ef0950', '2024-08-02', '2024-08-02', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 0, '2024-07-23 13:57:39.311102', '', 'automation'),
('ed28294e-c9e1-47c3-8584-d303a92ebf42', '2024-07-31', '2024-07-31', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 1, '2024-07-23 14:00:04.977828', '', 'automation'),
('f2a0d92b-cb32-4b0a-af7d-396f6adc4ac9', '2024-07-25', '2024-07-25', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 1, '2024-07-23 14:00:31.540129', '', 'automation'),
('3f603353-50ef-4d28-9ffd-969c91956623', '2024-08-01', '2024-08-01', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 0, '2024-07-23 14:00:43.993823', '', 'automation'),
('9f7fbf56-58d4-4abe-acf3-b3c979298e68', '2024-07-25', '2024-07-25', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 0, '2024-07-23 14:07:17.583884', '', 'automation'),
('3d9ab305-7d1d-45fb-a695-604d87b03f1a', '2024-07-28', '2024-07-28', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 1, '2024-07-23 14:10:04.694274', '', 'automation'),
('74d4fe89-ac86-425f-9544-012aa17800b9', '2024-08-02', '2024-08-02', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 1, '2024-07-23 14:10:31.264320', '', 'automation'),
('26c3d689-8c05-4943-b213-a1b732fb75d9', '2024-07-27', '2024-07-27', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 0, '2024-07-23 14:10:43.753176', '', 'automation'),
('d951b833-94ba-44a1-b539-400b67cb33f5', '2024-08-01', '2024-08-01', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 0, '2024-07-23 14:17:17.163232', '', 'automation'),
('aefe63fc-ece2-4e38-b252-d0ff8aa50e9d', '2024-07-27', '2024-07-27', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 1, '2024-07-23 14:20:04.751447', '', 'automation'),
('e2a94d43-12de-470b-8b4b-84e46d104f9f', '2024-08-01', '2024-08-01', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 1, '2024-07-23 14:20:31.163273', '', 'automation'),
('8afa6b9c-da5f-497f-9c27-086d80b585b8', '2024-07-27', '2024-07-27', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 0, '2024-07-23 14:20:43.694579', '', 'automation'),
('6dd2d48c-2503-4641-a7ec-d97bc19e5d70', '2024-08-02', '2024-08-02', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 0, '2024-07-23 14:27:17.346272', '', 'automation'),
('669d84ad-def5-4ea6-87a0-fba9723d26f6', '2024-07-29', '2024-07-29', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 1, '2024-07-23 14:30:04.913962', '', 'automation'),
('206165d1-c545-4d49-948e-0876b3195071', '2024-07-30', '2024-07-30', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 1, '2024-07-23 14:30:35.907169', '', 'automation'),
('e11fc014-37aa-4dad-9b08-06e485c62de5', '2024-07-28', '2024-07-28', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 0, '2024-07-23 14:30:48.653282', '', 'automation'),
('a8523de9-3a47-4141-9845-f15880571b3f', '2024-07-30', '2024-07-30', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 0, '2024-07-23 14:37:17.779684', '', 'automation'),
('9e69efa7-4c03-4c90-b041-e544e882f9c5', '2024-07-29', '2024-07-29', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 1, '2024-07-23 14:40:04.918919', '', 'automation'),
('4ffb8e1f-b5e5-41f6-a90a-e02560d8f96e', '2024-08-03', '2024-08-03', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 1, '2024-07-23 14:40:33.261481', '', 'automation'),
('50d8d3d3-1235-445e-a884-b9c0d8fa0c5d', '2024-08-04', '2024-08-04', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 0, '2024-07-23 14:40:46.106636', '', 'automation'),
('a18cbfe3-50fd-4abc-8a9b-ff821d2b3d96', '2024-07-27', '2024-07-27', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 0, '2024-07-23 14:47:17.672558', '', 'automation'),
('eb52db95-6809-43e0-bf14-09da6a747a8e', '2024-07-28', '2024-07-28', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 1, '2024-07-23 14:50:04.898791', '', 'automation'),
('d6c2d037-2132-4199-ab29-027f6a4731c8', '2024-08-02', '2024-08-02', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 1, '2024-07-23 14:50:34.191120', '', 'automation'),
('b42f027d-688e-4581-9a24-eeb7d9259c9d', '2024-07-24', '2024-07-24', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 0, '2024-07-23 14:50:46.835460', '', 'automation'),
('e97d4412-d79a-4081-917c-6b2eabe9fff1', '2024-07-24', '2024-07-24', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 0, '2024-07-23 14:57:17.512855', '', 'automation'),
('eced0b63-eabb-4f93-b4e9-47c283dad268', '2024-07-30', '2024-07-30', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 1, '2024-07-23 15:00:04.995836', '', 'automation'),
('f686325a-fc6a-4492-939c-c33425131535', '2024-07-30', '2024-07-30', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 1, '2024-07-23 15:00:33.829168', '', 'automation'),
('82f6dda1-bdba-4740-8b0a-4e4ab2cf14f6', '2024-07-24', '2024-07-24', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 0, '2024-07-23 15:00:46.884463', '', 'automation'),
('a277e029-4b05-4074-8178-72f0ef3d449e', '2024-07-29', '2024-07-29', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 0, '2024-07-23 15:07:17.902574', '', 'automation'),
('0627a30e-351c-436d-ac04-09aa1b938a25', '2024-07-28', '2024-07-28', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 1, '2024-07-23 15:10:04.773847', '', 'automation'),
('5dac78c8-7370-483c-80b6-56cc68454186', '2024-07-26', '2024-07-26', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 1, '2024-07-23 15:10:32.613990', '', 'automation'),
('6d1f6512-9e92-4df7-8ca0-96696d00f761', '2024-07-24', '2024-07-24', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 0, '2024-07-23 15:10:45.420526', '', 'automation'),
('f2290365-2926-4310-ad39-3c68863e0ec5', '2024-08-02', '2024-08-02', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 0, '2024-07-23 15:17:17.195148', '', 'automation'),
('91753df1-3ab5-4436-83a5-2127f9e52855', '2024-07-30', '2024-07-30', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 1, '2024-07-23 15:20:05.012094', '', 'automation'),
('8461fd66-678a-44cd-b426-98b32b33b14c', '2024-07-24', '2024-07-24', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 1, '2024-07-23 15:20:31.380322', '', 'automation'),
('c8219fb9-139d-44fe-9f37-af0b785d91b1', '2024-07-26', '2024-07-26', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 0, '2024-07-23 15:20:44.616343', '', 'automation'),
('15d0e42f-7f66-4d43-ac8d-685e338bd1d6', '2024-07-24', '2024-07-24', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 0, '2024-07-23 15:27:17.780804', '', 'automation'),
('b5cf56e5-cc49-4d7f-beba-a75ca6c11efa', '2024-07-27', '2024-07-27', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 1, '2024-07-23 15:30:04.732311', '', 'automation'),
('327f1d71-a570-4fcb-a26c-396663c43ad2', '2024-07-31', '2024-07-31', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 1, '2024-07-23 15:30:32.018225', '', 'automation'),
('5415c10e-8243-4b76-872b-81058867fa3d', '2024-07-28', '2024-07-28', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 0, '2024-07-23 15:30:44.662504', '', 'automation'),
('e70e4205-6a1e-4226-8b2e-2e53b4b9327f', '2024-08-01', '2024-08-01', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 0, '2024-07-23 15:37:17.180309', '', 'automation'),
('5a648182-4846-4df3-b44b-71b082f1e2e1', '2024-07-30', '2024-07-30', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 1, '2024-07-23 15:40:04.951762', '', 'automation'),
('2a676764-d417-4d58-a54e-cc9a6230e1fc', '2024-07-23', '2024-07-23', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 1, '2024-07-23 15:40:31.449671', '', 'automation'),
('32dcaf70-ad37-4f27-a67b-d49b54ee89d2', '2024-07-24', '2024-07-24', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 0, '2024-07-23 15:40:44.313460', '', 'automation'),
('b66d601c-843b-4e30-9ba7-2fa05a98590f', '2024-07-26', '2024-07-26', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 0, '2024-07-23 15:47:17.646680', '', 'automation'),
('23268ca2-0caf-4ccd-8bdd-a447e540b6f2', '2024-08-01', '2024-08-01', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 1, '2024-07-23 15:50:05.148835', '', 'automation'),
('89762a4f-df1d-4223-9c43-28a4535aae3f', '2024-07-25', '2024-07-25', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 1, '2024-07-23 15:50:35.225573', '', 'automation'),
('8f95e55f-16e9-472e-a2e3-6099fe8d0013', '2024-08-01', '2024-08-01', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 0, '2024-07-23 15:50:48.109224', '', 'automation'),
('68bbbd6a-1ce8-4d60-ae2f-c304966e3bed', '2024-07-28', '2024-07-28', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 0, '2024-07-23 15:57:17.733070', '', 'automation'),
('59789efe-2662-4e8f-a06c-afa8882e889a', '2024-07-29', '2024-07-29', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 1, '2024-07-23 16:00:04.945352', '', 'automation'),
('d91e80b1-d09b-46a1-b089-3d8def5277f3', '2024-07-26', '2024-07-26', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 1, '2024-07-23 16:00:35.550527', '', 'automation'),
('c6d3d393-42d9-447a-9909-3453511aad54', '2024-08-03', '2024-08-03', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 0, '2024-07-23 16:00:48.204787', '', 'automation'),
('64d0b0fd-741e-4ebb-8b82-bcb17aea18bf', '2024-07-30', '2024-07-30', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 0, '2024-07-23 16:07:17.916750', '', 'automation'),
('473c5cc8-b1ce-42a5-a93e-68cebd189a97', '2024-07-30', '2024-07-30', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 1, '2024-07-23 16:10:04.943191', '', 'automation'),
('3771b9ff-c64b-46a2-9dc8-b6525afbc91d', '2024-07-31', '2024-07-31', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 1, '2024-07-23 16:10:33.880413', '', 'automation'),
('5f17bd3e-ec9e-4dd4-8508-007dfc6ef0eb', '2024-07-27', '2024-07-27', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 0, '2024-07-23 16:10:46.693391', '', 'automation'),
('39c6b22e-a015-4fb7-9942-bb5c09f30e60', '2024-07-29', '2024-07-29', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 0, '2024-07-23 16:17:17.813324', '', 'automation'),
('3c90aae1-894b-482b-a16e-585577f74b4e', '2024-08-01', '2024-08-01', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 1, '2024-07-23 16:20:05.224020', '', 'automation'),
('d4d734cb-289a-4b16-a22b-723c04d6214e', '2024-07-27', '2024-07-27', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 1, '2024-07-23 16:20:33.705852', '', 'automation'),
('a401d359-017c-4ee5-bec9-2054be369f8e', '2024-07-25', '2024-07-25', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 0, '2024-07-23 16:20:46.219794', '', 'automation'),
('3b73cdf7-f740-4a4b-a594-dad45e4678c7', '2024-07-29', '2024-07-29', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 0, '2024-07-23 16:27:17.928844', '', 'automation'),
('b73ae1cf-e45f-4643-befe-96c18f538608', '2024-07-28', '2024-07-28', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 1, '2024-07-23 16:30:04.888226', '', 'automation'),
('5de1e853-dc8c-46b9-ac88-0681d5e72b81', '2024-07-31', '2024-07-31', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 1, '2024-07-23 16:30:32.406363', '', 'automation'),
('c7d65179-47a8-48b7-8633-b9a6d3f36c88', '2024-07-26', '2024-07-26', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 0, '2024-07-23 16:30:45.676576', '', 'automation'),
('eb146b95-be74-4255-b862-92f2fce4bbd7', '2024-08-04', '2024-08-04', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 0, '2024-07-23 16:37:17.457023', '', 'automation'),
('fce11510-6412-490b-a587-d83d1601c9c8', '2024-08-02', '2024-08-02', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 1, '2024-07-23 16:40:05.225780', '', 'automation'),
('67d73059-b7b7-46d9-8d5d-39a3109694b7', '2024-07-29', '2024-07-29', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 1, '2024-07-23 16:40:31.923618', '', 'automation'),
('96157526-811f-4b56-85f2-0e6569907ded', '2024-07-23', '2024-07-23', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 0, '2024-07-23 16:40:44.529904', '', 'automation'),
('d644794c-0bcc-44cf-93d5-3de76dacc574', '2024-07-27', '2024-07-27', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 0, '2024-07-23 16:47:17.739161', '', 'automation'),
('0241329e-9936-48fd-97d3-d6fdb8026e2e', '2024-07-29', '2024-07-29', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 1, '2024-07-23 16:50:04.936404', '', 'automation'),
('c5cf4bd6-4896-4400-9229-955c475143b0', '2024-07-27', '2024-07-27', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 1, '2024-07-23 16:50:30.523351', '', 'automation'),
('3b425437-adbf-4208-a5a5-514c3478bb41', '2024-07-27', '2024-07-27', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 0, '2024-07-23 16:50:43.679944', '', 'automation'),
('06e4cfaf-8563-43a3-a459-58e52e603471', '2024-07-28', '2024-07-28', '', 'b5f15541-5154-4303-82ba-1c882f0aaca4', 0, '2024-07-23 16:57:17.798271', '', 'automation'),
('c7ae271a-0050-4a98-8fda-f423b53edf4e', '2024-07-23', '2024-07-23', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 1, '2024-07-23 17:00:34.279777', '', 'automation'),
('8023bd02-7e51-4106-ac40-3b7e3b8dc7f0', '2024-07-24', '2024-07-24', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 0, '2024-07-23 17:00:47.154999', '', 'automation'),
('bfefe50d-8a7e-4510-9b4b-e1f2c77bc31d', '2024-07-25', '2024-07-25', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 1, '2024-07-23 17:10:35.448745', '', 'automation'),
('c6a6d171-efbd-4330-aaa7-bd647f3ae263', '2024-08-02', '2024-08-02', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 0, '2024-07-23 17:10:48.239684', '', 'automation'),
('c24454af-59fb-4537-b7eb-365690cf4d2a', '2024-08-02', '2024-08-02', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 1, '2024-07-23 17:20:31.131184', '', 'automation'),
('7b990c2c-6352-4ef0-9601-0d8ae23c1b32', '2024-08-01', '2024-08-01', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 0, '2024-07-23 17:20:43.847374', '', 'automation'),
('a75486c8-f876-42f8-a6d1-f160ac4c641b', '2024-08-01', '2024-08-01', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 1, '2024-07-23 17:30:32.744600', '', 'automation'),
('410889a3-e8a3-44e1-86b1-40fe4a136602', '2024-07-31', '2024-07-31', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 0, '2024-07-23 17:30:46.110794', '', 'automation'),
('f30c7023-8655-4dda-8332-07bda8b6232f', '2024-07-24', '2024-07-24', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 1, '2024-07-23 17:40:33.135074', '', 'automation'),
('f62f73fe-a764-4c20-9561-4a09741f2b6f', '2024-08-01', '2024-08-01', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 0, '2024-07-23 17:40:45.934445', '', 'automation'),
('9fe2ff4f-2bec-42fc-8537-0197245c5ec1', '2024-08-01', '2024-08-01', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 1, '2024-07-23 17:50:32.848472', '', 'automation'),
('eccee317-cc5f-4c12-897e-eb3153e63305', '2024-08-03', '2024-08-03', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 0, '2024-07-23 17:50:45.673331', '', 'automation'),
('a21b1f51-e41f-4696-8d72-03d5c714a826', '2024-07-30', '2024-07-30', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 1, '2024-07-23 18:00:31.666573', '', 'automation'),
('d2269089-eb5f-4629-b9d7-1c2e0a3645c7', '2024-07-31', '2024-07-31', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 0, '2024-07-23 18:00:44.395179', '', 'automation'),
('9aa4496b-941d-4284-b923-eb486f4414cb', '2024-07-29', '2024-07-29', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 1, '2024-07-23 18:10:36.683565', '', 'automation'),
('4fe50957-c22a-44df-8dce-fb59a2a56635', '2024-08-02', '2024-08-02', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 0, '2024-07-23 18:10:49.434157', '', 'automation'),
('6385ad5c-5f75-4c65-8c8e-4a3a5ba49515', '2024-07-26', '2024-07-26', '', 'd93ab677-0a68-4773-a916-ff31bd1e3532', 1, '2024-07-23 18:20:30.811535', '', 'automation');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add biofilter', 7, 'add_biofilter'),
(26, 'Can change biofilter', 7, 'change_biofilter'),
(27, 'Can delete biofilter', 7, 'delete_biofilter'),
(28, 'Can view biofilter', 7, 'view_biofilter'),
(29, 'Can add greenhouse', 8, 'add_greenhouse'),
(30, 'Can change greenhouse', 8, 'change_greenhouse'),
(31, 'Can delete greenhouse', 8, 'delete_greenhouse'),
(32, 'Can view greenhouse', 8, 'view_greenhouse'),
(33, 'Can add user account', 9, 'add_useraccount'),
(34, 'Can change user account', 9, 'change_useraccount'),
(35, 'Can delete user account', 9, 'delete_useraccount'),
(36, 'Can view user account', 9, 'view_useraccount'),
(37, 'Can add water bed', 10, 'add_waterbed'),
(38, 'Can change water bed', 10, 'change_waterbed'),
(39, 'Can delete water bed', 10, 'delete_waterbed'),
(40, 'Can view water bed', 10, 'view_waterbed');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'hydrosapp', 'biofilter'),
(8, 'hydrosapp', 'greenhouse'),
(9, 'hydrosapp', 'useraccount'),
(10, 'hydrosapp', 'waterbed'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-02-13 06:31:16.315130'),
(2, 'auth', '0001_initial', '2025-02-13 06:31:21.737253'),
(3, 'admin', '0001_initial', '2025-02-13 06:31:22.798671'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-02-13 06:31:22.822464'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-02-13 06:31:22.838828'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-02-13 06:31:23.763624'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-02-13 06:31:24.179812'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-02-13 06:31:24.457681'),
(9, 'auth', '0004_alter_user_username_opts', '2025-02-13 06:31:24.476437'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-02-13 06:31:24.799424'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-02-13 06:31:24.820840'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-02-13 06:31:24.862114'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-02-13 06:31:25.150401'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-02-13 06:31:25.466598'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-02-13 06:31:25.725555'),
(16, 'auth', '0011_update_proxy_permissions', '2025-02-13 06:31:25.754695'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-02-13 06:31:26.028049'),
(18, 'hydrosapp', '0001_initial', '2025-02-13 06:31:26.041503'),
(19, 'sessions', '0001_initial', '2025-02-13 06:31:26.447788');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('k6wfh01iut6a9kovhgx6buouxr4500aa', '.eJyrViotTi2Kz0xRsjLSAbPzEnNTlazgzJKiSiUdpbTSnByohGNOpoJjSU5iXklmsVItANQrFlk:1tnuQ7:rz788qkSxqq4Z1q5-jHo7GIqJB4GZASYI9bXcNE69kE', '2025-03-14 07:04:27.618613'),
('vcix7sltgq2feo669c1syzxzc4kujqnm', '.eJyrViotTi2Kz0xRsjLSAbPzEnNTlazgzJKiSiUdpbTSnByohGNKbmaegqFRoYJjSU5iXklmsVItAFxDGCA:1tkaln:xOcNT_mo-a6n2JDKA8ql5gLa4lNSy45ZXKq8nP3Yd20', '2025-03-05 03:29:07.299711');

-- --------------------------------------------------------

--
-- Stand-in structure for view `edge_actuator_view`
-- (See below for the actual view)
--
CREATE TABLE `edge_actuator_view` (
`edge_device_id` varchar(36)
,`edge_device_name` varchar(18)
,`edge_device_description` varchar(57)
,`edge_device_status` tinyint(4)
,`api_key` varchar(60)
,`passcode` varchar(60)
,`mqtt_client_id` varchar(44)
,`actuator_id` varchar(36)
,`actuator_name` varchar(20)
,`actuator_type` varchar(36)
,`actuator_status` tinyint(4)
,`parent_edge_device_id` varchar(36)
);

-- --------------------------------------------------------

--
-- Table structure for table `edge_device_infos`
--

CREATE TABLE `edge_device_infos` (
  `id` varchar(36) NOT NULL,
  `created_at` varchar(10) DEFAULT NULL,
  `updated_at` varchar(10) DEFAULT NULL,
  `deleted_at` varchar(0) DEFAULT NULL,
  `name` varchar(18) DEFAULT NULL,
  `description` varchar(57) DEFAULT NULL,
  `statusz` tinyint(4) DEFAULT NULL,
  `api_key` varchar(60) DEFAULT NULL,
  `passcode` varchar(60) DEFAULT NULL,
  `mqtt_client_id` varchar(44) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `edge_device_infos`
--

INSERT INTO `edge_device_infos` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `description`, `statusz`, `api_key`, `passcode`, `mqtt_client_id`) VALUES
('09a52f4d-0b92-4050-80d7-c8f4f6e18688', '2024-03-13', '2024-07-12', '', 'Edge Device 1-beta', 'Located at Turbulent Drip Sales Inc. in Tagaytay, Cavite.', 0, '$2a$17$Wh6XXVKpWtPpN/mwrHY91eBStkVbCtHxPd/B.gX1Xgz/7CEtGkpuu', '$2a$15$cKIsCxXDn3J58wH/hoPJluXavI38isdXzX5DalDtoI8D3BulQiZ1u', 'UDJ0N3pGbHlQZmdQV0Z0SC1ReWI0dXU2Rl9LZWVaSWo='),
('100f800d-132c-4d92-a892-71a6c1cb45e7', '2024-03-20', '2024-03-20', '', 'Main Edge Device', 'This is the main edge Device', 0, '$2a$17$QJ7tCQk7jron4p.TD1r9/ucqkdgJRCNS5TQk7991G/XJnDJlf1HUa', '$2a$15$vDdA.bHk393eI.Xxv8CxZuSsjyJ.I3USyoVuAO/MhglQ98HTXqnQS', ''),
('1fcc0c3a-aa5d-4cc9-8a98-74f1298edbfc', '2024-10-13', '2024-10-13', '', 'Edge Device', 'This is an edge device on the ATLANTIS system', 0, '$2a$17$YuXkF56sVyMlhGSOQPVz5.CxjlVoFTHD7I2UDZx9b2FLe9xLaS0Gm', '$2a$15$havSu5ZVTYiOFualdSuxJu0Vl1SFhhYKKH/bYmfNqlN6mkTmeUNP.', 'UWh6bnpOTjFXRjQyYmw3MmgwZlVTVUcwaTZOUHY4U2I='),
('2aa53fc5-0369-483a-b618-8db6cae21313', '2024-10-05', '2024-10-05', '', 'Rick Edge Device', 'This is an edge device on the ATLANTIS system', 0, '$2a$17$pNYO19/xXkU9UZA84oi5cugUY.tYKqI3uvrRjRoX0LveE8A9FDu42', '$2a$15$Ub4Cg5LMih343OYJiKPZwOs3j7Y/tvMkqz/phC4b4jQj5nvVS/z22', 'WTNtWmxYR0R0Yjd1ZlluNUVRbU1oRjl0YS16Z0lXUWg='),
('58b4bac4-7454-4abd-bf95-868e5d4a73da', '2024-05-03', '2024-05-03', '', 'Edge Device II', 'Edge device create sensor automate test', 0, '$2a$17$BMCz8JzQxAUmdQYSMDs/muBRaxjJuYT5TVMKDtyB2vr4x/4J.QYae', '$2a$15$zBtao58yq.zbTLvTLNVEN.22zK5Q8sHBZWaHwerO3uQZxXfCWwCze', ''),
('79dea917-a396-46aa-87b4-e0a6c9f8c4fe', '2024-12-23', '2024-12-23', '', 'Edge Device', 'This is an edge device on the ATLANTIS system', 0, '$2a$17$79ZvaEsJuCIfXLlqC6d63e/YVs5tCw4zVpi8HUYZQ548E0Git3KLC', '$2a$15$0yPJkUvd7UCMS6BofS2roey/TIgQFPMpkwodlHZsM7RsRWcr1h8ni', 'YkpfVmF3cnNiN3RrMlFGWGFxcHVDZ3oyUmtQTXQ1UVI='),
('a7cd79d5-0759-41bb-8857-cac4f696c93b', '2024-04-28', '2024-04-28', '', 'Edge Device IV', 'Edge device create sensor automate test', 0, '$2a$17$RqpzRnKb8TwRThORY.cD4em4E2OUUteLnj4spMtJ2.813.dEboD9.', '$2a$15$yvKgVy/eyOQB1kYUpIika.GxKCcH.khSAX8ScdLFSCmQ2WqrpnGcS', ''),
('dcf18b56-100d-41e0-a78c-d84f3123c124', '2024-05-01', '2024-05-01', '', 'Edge Device III', 'Edge device create sensor automate test', 0, '$2a$17$HGTtjL8WPcZEIP8Bk6V/0uf43fwA9dBAz.TWKp6UUkueKmLhdnjGq', '$2a$15$6/oY7eCHwtKJI0nbOzeUsOOGN31mrorxK5lEZOVSh0AS9RtJgkYJ.', '');

-- --------------------------------------------------------

--
-- Table structure for table `greenhouse`
--

CREATE TABLE `greenhouse` (
  `id` varchar(36) NOT NULL,
  `created_at` varchar(35) NOT NULL,
  `updated_at` varchar(35) NOT NULL,
  `deleted_at` varchar(30) DEFAULT NULL,
  `air_temperature` decimal(11,8) NOT NULL,
  `relative_humidity` decimal(11,8) NOT NULL,
  `co2_level` bit(1) NOT NULL,
  `illumination_intensity` decimal(13,9) NOT NULL,
  `timestamp` varchar(16) NOT NULL,
  `sensor_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `greenhouse`
--

INSERT INTO `greenhouse` (`id`, `created_at`, `updated_at`, `deleted_at`, `air_temperature`, `relative_humidity`, `co2_level`, `illumination_intensity`, `timestamp`, `sensor_id`) VALUES
('005703d5-d5b7-4a5a-91df-06f3a3b1acf2', '2024-04-16 11:59:09.012259642+08:00', '2024-04-16 11:59:09.012259642+08:00', NULL, 32.70000076, 54.50000000, b'0', 4184.299805000, '16/04/2024 12:00', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('01ae5753-f129-4606-9609-ea35f8fcf927', '2024-04-16 09:04:09.702894154+08:00', '2024-04-16 09:04:09.702894154+08:00', NULL, 31.70000076, 60.09999847, b'0', 3619.300049000, '16/04/2024 09:05', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('01cd6788-6f2e-4d5e-9c8d-60d19ca72e1d', '2024-04-16 03:34:09.274741936+08:00', '2024-04-16 03:34:09.274741936+08:00', NULL, 21.50000000, 95.19999695, b'0', 0.000000000, '16/04/2024 03:35', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('02a72ad3-2962-4997-aedc-3637f0b39c7d', '2024-04-16 04:34:09.481304338+08:00', '2024-04-16 04:34:09.481304338+08:00', NULL, 21.29999924, 90.30000305, b'0', 0.000000000, '16/04/2024 04:35', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('058a958e-21f1-41a6-ad86-71b2437e748b', '2024-04-16 08:14:09.119677923+08:00', '2024-04-16 08:14:09.119677923+08:00', NULL, 29.70000076, 64.59999847, b'0', 4623.799805000, '16/04/2024 08:15', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('06f13b42-baa3-4b09-8ecd-63ad0d5428d3', '2024-04-16 11:54:09.426928811+08:00', '2024-04-16 11:54:09.426928811+08:00', NULL, 31.89999962, 55.29999924, b'0', 1658.199951000, '16/04/2024 11:55', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('0c475759-d160-409c-9d1c-568796ce30a7', '2024-04-16 12:14:08.243065059+08:00', '2024-04-16 12:14:08.243065059+08:00', NULL, 32.79999924, 53.40000153, b'0', 3792.399902000, '16/04/2024 12:15', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('0f37c858-845f-439d-9c5b-1b93a2f30244', '2024-04-16 14:49:09.036177762+08:00', '2024-04-16 14:49:09.036177762+08:00', NULL, 32.09999847, 56.29999924, b'0', 3151.100098000, '16/04/2024 14:50', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('0f6c9528-7b5b-4e98-bd34-04dde8886240', '2024-04-16 08:49:09.788714206+08:00', '2024-04-16 08:49:09.788714206+08:00', NULL, 31.00000000, 60.00000000, b'0', 3054.600098000, '16/04/2024 08:50', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('108c453b-150c-4fa5-81bf-30a1b2d4b4f1', '2024-04-16 14:19:09.125774192+08:00', '2024-04-16 14:19:09.125774192+08:00', NULL, 33.20000076, 52.70000076, b'0', 3155.300049000, '16/04/2024 14:20', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('10c4c6ef-d6ea-4d55-8861-4934b4ea481e', '2024-04-16 06:09:09.1431754+08:00', '2024-04-16 06:09:09.1431754+08:00', NULL, 22.39999962, 83.90000153, b'0', 186.000000000, '16/04/2024 06:10', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('110d007b-f1e3-4b72-a105-a98c290bdcbe', '2024-04-16 01:04:09.102304199+08:00', '2024-04-16 01:04:09.102304199+08:00', NULL, 22.20000076, 94.09999847, b'0', 0.000000000, '16/04/2024 01:05', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('120b1059-8582-4252-a546-a4a9b42d34b8', '2024-04-16 11:14:09.203145466+08:00', '2024-04-16 11:14:09.203145466+08:00', NULL, 31.70000076, 56.70000076, b'0', 3702.600098000, '16/04/2024 11:15', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('12c80da2-fbea-4a35-b892-2df16ce332f3', '2024-04-16 15:04:08.591930107+08:00', '2024-04-16 15:04:08.591930107+08:00', NULL, 31.00000000, 58.00000000, b'0', 979.400024400, '16/04/2024 15:05', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('1577258f-8ffb-4495-8175-b9444e87ec62', '2024-04-16 14:04:07.513268402+08:00', '2024-04-16 14:04:07.513268402+08:00', NULL, 33.00000000, 55.29999924, b'0', 3855.300049000, '16/04/2024 14:05', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('15a955d9-e725-4ce3-a582-b0462d9bcaf3', '2024-04-16 07:39:09.528203002+08:00', '2024-04-16 07:39:09.528203002+08:00', NULL, 30.29999924, 66.90000153, b'0', 1496.900024000, '16/04/2024 07:40', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('166e508b-87e3-4c09-aa93-07e608e3118b', '2024-04-16 14:14:08.457674703+08:00', '2024-04-16 14:14:08.457674703+08:00', NULL, 31.89999962, 55.20000076, b'0', 1138.900024000, '16/04/2024 14:15', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('179d80b5-a0cf-4950-9689-1f1fe89313bd', '2024-04-16 02:09:08.979666182+08:00', '2024-04-16 02:09:08.979666182+08:00', NULL, 22.00000000, 94.19999695, b'0', 0.000000000, '16/04/2024 02:10', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('1a048aa6-87bc-4ebf-9726-74dcd62dc055', '2024-04-16 01:19:08.656602299+08:00', '2024-04-16 01:19:08.656602299+08:00', NULL, 22.20000076, 93.80000305, b'0', 0.000000000, '16/04/2024 01:20', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('1cb2fa88-4e9a-4335-a5f6-f1639ca6c1dd', '2024-04-16 08:54:09.290683299+08:00', '2024-04-16 08:54:09.290683299+08:00', NULL, 31.00000000, 61.29999924, b'0', 3209.100098000, '16/04/2024 08:55', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('1d411dd2-b5fc-42ee-86ba-15060a6a0f5a', '2024-04-16 13:49:08.887986725+08:00', '2024-04-16 13:49:08.887986725+08:00', NULL, 33.20000076, 51.50000000, b'0', 3629.000000000, '16/04/2024 13:50', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('1ec5c107-aa82-4edd-bc5e-3863eef2f16a', '2024-04-16 11:04:09.410846557+08:00', '2024-04-16 11:04:09.410846557+08:00', NULL, 31.00000000, 59.00000000, b'0', 3725.699951000, '16/04/2024 11:05', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('20241400-6131-4c84-b8a1-189620674f9c', '2024-04-16 06:39:09.871434863+08:00', '2024-04-16 06:39:09.871434863+08:00', NULL, 24.00000000, 79.59999847, b'0', 1494.900024000, '16/04/2024 06:40', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('2296c331-178b-4225-8257-7f0cd94c5eae', '2024-04-16 10:14:09.08794118+08:00', '2024-04-16 10:14:09.08794118+08:00', NULL, 30.29999924, 60.29999924, b'0', 3400.500000000, '16/04/2024 10:15', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('22abc559-bdac-40e3-aa55-8ec7e60a94b6', '2024-04-16 08:24:09.24762174+08:00', '2024-04-16 08:24:09.24762174+08:00', NULL, 30.70000076, 63.20000076, b'0', 3044.199951000, '16/04/2024 08:25', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('23149949-738c-4309-880f-e21eae8458f4', '2024-04-16 04:24:08.427475243+08:00', '2024-04-16 04:24:08.427475243+08:00', NULL, 21.29999924, 93.00000000, b'0', 0.000000000, '16/04/2024 04:25', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('25e29140-4c9c-4474-a738-beb01e5be16d', '2024-04-16 01:24:08.949734721+08:00', '2024-04-16 01:24:08.949734721+08:00', NULL, 22.20000076, 94.00000000, b'0', 0.000000000, '16/04/2024 01:25', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('2834d342-29d6-464d-8e6a-d0c70742fe8b', '2024-04-16 12:34:08.195410347+08:00', '2024-04-16 12:34:08.195410347+08:00', NULL, 32.90000153, 55.20000076, b'0', 1580.699951000, '16/04/2024 12:35', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('290ffb33-0dad-488c-aac2-e1fc49b2abe5', '2024-04-16 08:19:09.662841913+08:00', '2024-04-16 08:19:09.662841913+08:00', NULL, 30.29999924, 64.90000153, b'0', 4386.200195000, '16/04/2024 08:20', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('29c02b68-7462-496b-bf06-4a7a3abad8b3', '2024-04-16 02:39:09.155043667+08:00', '2024-04-16 02:39:09.155043667+08:00', NULL, 21.70000076, 94.50000000, b'0', 0.000000000, '16/04/2024 02:40', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('2febc735-febe-4912-a1c6-8f0cdb29cb2e', '2024-04-16 04:09:08.564661986+08:00', '2024-04-16 04:09:08.564661986+08:00', NULL, 21.29999924, 93.40000153, b'0', 0.000000000, '16/04/2024 04:10', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('308d9ebd-1056-4c18-8050-dd7ed6268a8c', '2024-04-16 09:59:10.566926547+08:00', '2024-04-16 09:59:10.566926547+08:00', NULL, 31.39999962, 60.09999847, b'0', 3862.300049000, '16/04/2024 10:00', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('311ed961-0a71-46a7-ac23-7eb2e7e45580', '2024-04-16 09:19:09.588599265+08:00', '2024-04-16 09:19:09.588599265+08:00', NULL, 31.60000038, 57.79999924, b'0', 2798.699951000, '16/04/2024 09:20', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('32f76500-d460-4ff3-947d-421322086a8e', '2024-04-16 08:09:09.159865135+08:00', '2024-04-16 08:09:09.159865135+08:00', NULL, 29.60000038, 64.40000153, b'0', 3533.000000000, '16/04/2024 08:10', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('3605f021-44fe-4fd4-8187-601ae0cca2af', '2024-04-16 07:44:09.463480137+08:00', '2024-04-16 07:44:09.463480137+08:00', NULL, 30.00000000, 66.00000000, b'0', 1769.900024000, '16/04/2024 07:45', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('362325fe-f6f2-4fad-b65f-fdeb75246c98', '2024-04-16 15:39:08.506406301+08:00', '2024-04-16 15:39:08.506406301+08:00', NULL, 32.50000000, 56.50000000, b'0', 1907.000000000, '16/04/2024 15:40', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('3648cd02-f7c3-41cd-97d6-06fc1179f2cf', '2024-04-16 04:39:09.091616769+08:00', '2024-04-16 04:39:09.091616769+08:00', NULL, 21.39999962, 88.50000000, b'0', 0.000000000, '16/04/2024 04:40', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('3721b930-5c65-4680-b228-0002152ab4d0', '2024-04-16 03:19:09.310599434+08:00', '2024-04-16 03:19:09.310599434+08:00', NULL, 21.50000000, 95.50000000, b'0', 0.000000000, '16/04/2024 03:20', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('37f661e8-58ee-43de-9d9e-949c2a179213', '2024-04-16 03:04:09.938114588+08:00', '2024-04-16 03:04:09.938114588+08:00', NULL, 21.60000038, 94.69999695, b'0', 0.000000000, '16/04/2024 03:05', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('387949cd-7479-42e8-9a8e-b981d79bf255', '2024-04-16 14:29:08.453541064+08:00', '2024-04-16 14:29:08.453541064+08:00', NULL, 30.60000038, 58.50000000, b'0', 2782.699951000, '16/04/2024 14:30', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('39d8b32e-cb6e-4c4d-88de-a071351ea20b', '2024-04-16 03:09:08.906766668+08:00', '2024-04-16 03:09:08.906766668+08:00', NULL, 21.60000038, 95.09999847, b'0', 0.000000000, '16/04/2024 03:10', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('3c79234a-d68e-4eed-ba62-69ce5aef23ea', '2024-04-16 01:39:09.26248821+08:00', '2024-04-16 01:39:09.26248821+08:00', NULL, 22.20000076, 93.80000305, b'0', 0.000000000, '16/04/2024 01:40', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('3cd732c7-de1b-4c73-aa1a-7b400b139391', '2024-04-16 02:29:09.183187942+08:00', '2024-04-16 02:29:09.183187942+08:00', NULL, 21.79999924, 95.30000305, b'0', 0.000000000, '16/04/2024 02:30', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('3e073018-9e05-4a31-83f5-419fe7f745fa', '2024-04-16 02:34:09.670249922+08:00', '2024-04-16 02:34:09.670249922+08:00', NULL, 21.70000076, 95.00000000, b'0', 0.000000000, '16/04/2024 02:35', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('3e25529f-6192-461d-b1b7-dd9762179d79', '2024-04-16 15:34:09.588350725+08:00', '2024-04-16 15:34:09.588350725+08:00', NULL, 32.59999847, 56.50000000, b'0', 2137.899902000, '16/04/2024 15:35', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('3ec82797-bd57-424f-aba6-f61c6beeb4a9', '2024-04-16 01:29:09.784675707+08:00', '2024-04-16 01:29:09.784675707+08:00', NULL, 22.20000076, 93.90000153, b'0', 0.000000000, '16/04/2024 01:30', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('3fe308ce-1113-4637-b98f-dca89a5b5994', '2024-04-15 23:59:09.274872661+08:00', '2024-04-15 23:59:09.274872661+08:00', NULL, 22.60000038, 89.50000000, b'0', 0.000000000, '16/04/2024 00:00', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('40551320-e463-4200-bda7-c8c93af110d4', '2024-04-16 14:24:09.035496291+08:00', '2024-04-16 14:24:09.035496291+08:00', NULL, 30.79999924, 58.20000076, b'0', 760.200012200, '16/04/2024 14:25', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('40758a74-8c5b-48d8-aa69-c1e5390142c8', '2024-04-16 07:04:07.107532794+08:00', '2024-04-16 07:04:07.107532794+08:00', NULL, 25.50000000, 77.59999847, b'0', 824.299987800, '16/04/2024 07:05', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('408c7fed-df74-49ce-b3a9-601efbde9012', '2024-04-16 06:29:08.705496316+08:00', '2024-04-16 06:29:08.705496316+08:00', NULL, 23.60000038, 80.30000305, b'0', 434.600006100, '16/04/2024 06:30', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('409e7bef-c967-4612-86ed-f950367a6371', '2024-04-16 02:14:09.093829866+08:00', '2024-04-16 02:14:09.093829866+08:00', NULL, 21.89999962, 94.69999695, b'0', 0.000000000, '16/04/2024 02:15', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('42c12787-baf2-4755-9ec0-41f940edbc49', '2024-04-16 01:54:09.041858923+08:00', '2024-04-16 01:54:09.041858923+08:00', NULL, 22.10000038, 93.69999695, b'0', 0.000000000, '16/04/2024 01:55', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('439a9d62-ee3e-4799-b91e-8b5072a88f86', '2024-04-16 13:54:07.91879341+08:00', '2024-04-16 13:54:07.91879341+08:00', NULL, 32.90000153, 51.59999847, b'0', 932.099975600, '16/04/2024 13:55', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('445eb9b7-db3e-444a-a5e3-81fdbf638f08', '2024-04-16 05:54:08.945686144+08:00', '2024-04-16 05:54:08.945686144+08:00', NULL, 21.89999962, 85.80000305, b'0', 72.099998470, '16/04/2024 05:55', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('45188e36-8f8b-4ac6-a665-177c9e888d9d', '2024-04-16 10:34:08.821107322+08:00', '2024-04-16 10:34:08.821107322+08:00', NULL, 29.79999924, 62.79999924, b'0', 3283.800049000, '16/04/2024 10:35', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('46b26ad3-ae7a-43d3-bb58-29a51919d6c5', '2024-04-16 09:34:09.697885782+08:00', '2024-04-16 09:34:09.697885782+08:00', NULL, 30.89999962, 60.20000076, b'0', 2947.000000000, '16/04/2024 09:35', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('46dda2df-1033-404f-980e-3671a27363b3', '2024-04-16 00:54:08.821230199+08:00', '2024-04-16 00:54:08.821230199+08:00', NULL, 22.20000076, 94.40000153, b'0', 0.000000000, '16/04/2024 00:55', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('47c3ca6b-d5a3-44ce-870d-741acff72fbc', '2024-04-16 11:19:08.673579832+08:00', '2024-04-16 11:19:08.673579832+08:00', NULL, 31.10000038, 57.59999847, b'0', 3833.199951000, '16/04/2024 11:20', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('48f35ddf-16e7-481f-9567-87c28e8429e4', '2024-04-16 10:24:09.482463628+08:00', '2024-04-16 10:24:09.482463628+08:00', NULL, 30.20000076, 61.40000153, b'0', 3414.100098000, '16/04/2024 10:25', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('49048ed5-1b0e-4871-8290-af7378cf09b3', '2024-04-16 06:14:08.661810021+08:00', '2024-04-16 06:14:08.661810021+08:00', NULL, 22.70000076, 82.40000153, b'0', 233.000000000, '16/04/2024 06:15', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('495a9da4-777c-453d-a79f-27624c2c2d2f', '2024-04-16 10:54:09.399563065+08:00', '2024-04-16 10:54:09.399563065+08:00', NULL, 30.70000076, 59.79999924, b'0', 4730.799805000, '16/04/2024 10:55', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('4b0c496f-b27a-48fb-8398-c8848a52f1ba', '2024-04-16 06:44:09.265339833+08:00', '2024-04-16 06:44:09.265339833+08:00', NULL, 24.29999924, 79.69999695, b'0', 2013.800049000, '16/04/2024 06:45', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('4c4b3fa2-b41e-4fc0-9e1a-ce5e424e3815', '2024-04-16 11:39:09.437794801+08:00', '2024-04-16 11:39:09.437794801+08:00', NULL, 32.20000076, 56.29999924, b'0', 3989.500000000, '16/04/2024 11:40', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('4c74ff30-c692-4872-92e3-9b361a1751c4', '2024-04-16 02:04:09.039969485+08:00', '2024-04-16 02:04:09.039969485+08:00', NULL, 22.00000000, 93.30000305, b'0', 0.000000000, '16/04/2024 02:05', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('4eb1b885-a6bd-4c41-a716-1383642f8405', '2024-04-16 05:34:09.84623765+08:00', '2024-04-16 05:34:09.84623765+08:00', NULL, 21.39999962, 91.19999695, b'0', 4.500000000, '16/04/2024 05:35', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('4f1bc97a-9d1e-4b1f-b29a-d35532eee03c', '2024-04-16 04:14:08.857732685+08:00', '2024-04-16 04:14:08.857732685+08:00', NULL, 21.29999924, 93.30000305, b'0', 0.000000000, '16/04/2024 04:15', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('510a7822-b7c3-46d9-980a-153a99ff9948', '2024-04-16 10:04:11.068376735+08:00', '2024-04-16 10:04:11.068376735+08:00', NULL, 30.29999924, 61.20000076, b'0', 2839.699951000, '16/04/2024 10:05', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('51c16b81-0cae-44f7-bcfd-2f74520a41ec', '2024-04-16 02:54:07.509447956+08:00', '2024-04-16 02:54:07.509447956+08:00', NULL, 21.70000076, 94.50000000, b'0', 0.000000000, '16/04/2024 02:55', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('53dc4676-4105-43af-b184-1510174d6a4c', '2024-04-16 04:29:09.11271276+08:00', '2024-04-16 04:29:09.11271276+08:00', NULL, 21.20000076, 92.00000000, b'0', 0.000000000, '16/04/2024 04:30', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('5490ed7d-3eb0-4c33-845d-cad69289eb29', '2024-04-16 08:29:08.532484645+08:00', '2024-04-16 08:29:08.532484645+08:00', NULL, 30.00000000, 63.20000076, b'0', 2769.300049000, '16/04/2024 08:30', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('54fbc225-c7b7-4182-9789-1955f27d33a4', '2024-04-16 03:49:09.39220395+08:00', '2024-04-16 03:49:09.39220395+08:00', NULL, 21.50000000, 93.90000153, b'0', 0.000000000, '16/04/2024 03:50', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('55fbacc2-03d1-4426-a9b5-b647cc371c3b', '2024-04-16 03:54:08.560340367+08:00', '2024-04-16 03:54:08.560340367+08:00', NULL, 21.39999962, 93.50000000, b'0', 0.000000000, '16/04/2024 03:55', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('573dfb9d-7756-4b65-8505-7ef6b6b48366', '2024-04-16 05:14:09.192017299+08:00', '2024-04-16 05:14:09.192017299+08:00', NULL, 21.29999924, 90.09999847, b'0', 0.000000000, '16/04/2024 05:15', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('578a1049-334f-4b8f-b0e0-02656150c922', '2024-04-16 03:29:09.277931804+08:00', '2024-04-16 03:29:09.277931804+08:00', NULL, 21.50000000, 95.30000305, b'0', 0.000000000, '16/04/2024 03:30', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('5960995c-c73d-4e3a-a190-f20a4f1929f9', '2024-04-16 07:49:09.104020565+08:00', '2024-04-16 07:49:09.104020565+08:00', NULL, 30.29999924, 65.00000000, b'0', 2256.600098000, '16/04/2024 07:50', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('598a4b40-9416-4607-bdfe-2d507f56f74b', '2024-04-16 07:19:09.745380876+08:00', '2024-04-16 07:19:09.745380876+08:00', NULL, 28.00000000, 69.59999847, b'0', 974.099975600, '16/04/2024 07:20', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('59f19a90-5b8a-4322-82d6-ca48a837461f', '2024-04-16 00:59:09.500809549+08:00', '2024-04-16 00:59:09.500809549+08:00', NULL, 22.20000076, 94.30000305, b'0', 0.000000000, '16/04/2024 01:00', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('5aa4a827-a3b8-4981-903e-06463f82a195', '2024-04-16 14:59:09.264974448+08:00', '2024-04-16 14:59:09.264974448+08:00', NULL, 31.50000000, 57.00000000, b'0', 899.000000000, '16/04/2024 15:00', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('5c8ff541-e241-4230-a83d-19e8043a8b80', '2024-04-16 12:19:09.599316412+08:00', '2024-04-16 12:19:09.599316412+08:00', NULL, 32.40000153, 56.09999847, b'0', 2230.100098000, '16/04/2024 12:20', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('5d81a8ea-3990-4ee0-b85e-90aa9a39eb62', '2024-04-16 06:54:09.071094398+08:00', '2024-04-16 06:54:09.071094398+08:00', NULL, 24.79999924, 79.50000000, b'0', 1695.099976000, '16/04/2024 06:55', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('5e485f56-3345-4a1d-b551-ef2fb2b927ae', '2024-04-16 08:59:09.325953136+08:00', '2024-04-16 08:59:09.325953136+08:00', NULL, 30.70000076, 60.90000153, b'0', 3367.000000000, '16/04/2024 09:00', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('5ee18603-9a74-4a88-b132-30ef7523b889', '2024-04-16 13:44:09.607545143+08:00', '2024-04-16 13:44:09.607545143+08:00', NULL, 32.79999924, 52.59999847, b'0', 3570.199951000, '16/04/2024 13:45', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('608a247a-3f77-43c8-8187-57c5a6775178', '2024-04-16 04:04:09.578201444+08:00', '2024-04-16 04:04:09.578201444+08:00', NULL, 21.39999962, 93.19999695, b'0', 0.000000000, '16/04/2024 04:05', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('61ad0876-508c-4e25-b190-1fcc6d603084', '2024-04-16 11:44:09.297512567+08:00', '2024-04-16 11:44:09.297512567+08:00', NULL, 31.50000000, 56.00000000, b'0', 4038.800049000, '16/04/2024 11:45', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('61cff521-7810-48de-8357-b9f20bf132cc', '2024-04-16 15:24:08.549549039+08:00', '2024-04-16 15:24:08.549549039+08:00', NULL, 31.10000038, 58.79999924, b'0', 788.599975600, '16/04/2024 15:25', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('62e9d4f4-9bb1-46b9-903c-9ad5e0091dbb', '2024-04-16 10:19:10.639301037+08:00', '2024-04-16 10:19:10.639301037+08:00', NULL, 30.10000038, 60.09999847, b'0', 3380.300049000, '16/04/2024 10:20', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('659b8bf6-2c1f-405b-807c-aa294e95978f', '2024-04-16 05:39:08.307654482+08:00', '2024-04-16 05:39:08.307654482+08:00', NULL, 21.50000000, 89.69999695, b'0', 12.600000380, '16/04/2024 05:40', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('65edcff9-9a9d-4996-aba2-48558668e44b', '2024-04-16 00:19:09.590915328+08:00', '2024-04-16 00:19:09.590915328+08:00', NULL, 22.39999962, 91.30000305, b'0', 0.000000000, '16/04/2024 00:20', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('68a55459-16a9-4568-b75f-70b3fe71e8bb', '2024-04-16 07:24:09.297381621+08:00', '2024-04-16 07:24:09.297381621+08:00', NULL, 28.50000000, 69.09999847, b'0', 1070.900024000, '16/04/2024 07:25', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('6a10300d-1652-41ea-b9d1-6348972fc27c', '2024-04-16 12:59:09.235977013+08:00', '2024-04-16 12:59:09.235977013+08:00', NULL, 33.20000076, 52.59999847, b'0', 3507.500000000, '16/04/2024 13:00', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('6bdfe5d0-867a-492b-89cf-96fc5a2b0f2e', '2024-04-16 06:59:08.389295324+08:00', '2024-04-16 06:59:08.389295324+08:00', NULL, 25.20000076, 78.09999847, b'0', 2161.000000000, '16/04/2024 07:00', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('6c73f18d-ec7d-4c77-8eec-173ef1e3f53e', '2024-04-16 09:14:09.006815465+08:00', '2024-04-16 09:14:09.006815465+08:00', NULL, 31.60000038, 60.29999924, b'0', 2978.199951000, '16/04/2024 09:15', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('6cafa25d-c2ce-4043-914c-9a6655366c0b', '2024-04-16 13:39:09.634080236+08:00', '2024-04-16 13:39:09.634080236+08:00', NULL, 32.50000000, 53.09999847, b'0', 3597.100098000, '16/04/2024 13:40', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('71be84cb-0346-4ffe-8024-b46d98ed909c', '2024-04-16 05:29:08.936249102+08:00', '2024-04-16 05:29:08.936249102+08:00', NULL, 21.39999962, 91.90000153, b'0', 1.299999952, '16/04/2024 05:30', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('71e3a568-ca26-4527-9bc7-01a2b80fbf60', '2024-04-16 00:39:09.119999909+08:00', '2024-04-16 00:39:09.119999909+08:00', NULL, 22.10000038, 94.59999847, b'0', 0.000000000, '16/04/2024 00:40', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('7521fa05-748f-4abd-a506-14eb14149318', '2024-04-16 04:54:08.389135864+08:00', '2024-04-16 04:54:08.389135864+08:00', NULL, 21.29999924, 86.59999847, b'0', 0.000000000, '16/04/2024 04:55', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('77db2966-ea05-4abe-b403-cca849340ad0', '2024-04-16 04:19:09.992496686+08:00', '2024-04-16 04:19:09.992496686+08:00', NULL, 21.29999924, 93.30000305, b'0', 0.000000000, '16/04/2024 04:20', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('77e0c8e0-d95b-4619-b676-d2bb88fc12f2', '2024-04-16 03:39:08.810306853+08:00', '2024-04-16 03:39:08.810306853+08:00', NULL, 21.50000000, 94.90000153, b'0', 0.000000000, '16/04/2024 03:40', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('7918cd88-aea7-4269-8909-d3768fb7a6c1', '2024-04-16 03:14:09.450331276+08:00', '2024-04-16 03:14:09.450331276+08:00', NULL, 21.50000000, 95.80000305, b'0', 0.000000000, '16/04/2024 03:15', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('7ab4eb51-9f02-4247-ada1-032ff06b202f', '2024-04-16 05:24:09.161518206+08:00', '2024-04-16 05:24:09.161518206+08:00', NULL, 21.39999962, 92.00000000, b'0', 0.100000001, '16/04/2024 05:25', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('7b4fa833-b69f-476a-8c32-7408c10901b6', '2024-04-16 11:29:09.358947927+08:00', '2024-04-16 11:29:09.358947927+08:00', NULL, 31.89999962, 57.29999924, b'0', 3930.199951000, '16/04/2024 11:30', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('7bb655b7-1dff-43e4-afab-b4eb2e0b98bf', '2024-04-16 08:34:09.133952958+08:00', '2024-04-16 08:34:09.133952958+08:00', NULL, 30.39999962, 61.59999847, b'0', 2869.500000000, '16/04/2024 08:35', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('7d23e345-5498-45aa-a62e-68a3a0a3d1bf', '2024-04-16 06:24:09.037365952+08:00', '2024-04-16 06:24:09.037365952+08:00', NULL, 24.39999962, 76.40000153, b'0', 322.100006100, '16/04/2024 06:25', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('7d50bba9-8853-4b5b-b51d-831c8e3b7ca0', '2024-04-16 15:29:09.736961075+08:00', '2024-04-16 15:29:09.736961075+08:00', NULL, 31.50000000, 59.29999924, b'0', 2456.500000000, '16/04/2024 15:30', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('83bacd8b-de18-4213-a981-70a4d693e5d2', '2024-04-16 13:19:08.793062288+08:00', '2024-04-16 13:19:08.793062288+08:00', NULL, 32.40000153, 55.50000000, b'0', 1191.800049000, '16/04/2024 13:20', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('83eac403-7743-4c53-a327-74fd2953e602', '2024-04-16 12:09:08.729748849+08:00', '2024-04-16 12:09:08.729748849+08:00', NULL, 31.89999962, 56.40000153, b'0', 1292.199951000, '16/04/2024 12:10', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('840f4fa6-18b4-4dad-8ffe-4bc94e3e5ff9', '2024-04-16 05:09:09.057178006+08:00', '2024-04-16 05:09:09.057178006+08:00', NULL, 21.29999924, 87.50000000, b'0', 0.000000000, '16/04/2024 05:10', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('8444a4cb-92f2-404f-892d-0f4042f2f882', '2024-04-16 01:09:08.87870853+08:00', '2024-04-16 01:09:08.87870853+08:00', NULL, 22.20000076, 94.30000305, b'0', 0.000000000, '16/04/2024 01:10', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('85289f05-cfad-4a68-867f-b1280d5d8ca2', '2024-04-16 04:59:09.290996242+08:00', '2024-04-16 04:59:09.290996242+08:00', NULL, 21.29999924, 86.40000153, b'0', 0.000000000, '16/04/2024 05:00', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('869b8f25-875e-4957-af6e-65077eda4e93', '2024-04-16 12:54:09.00954706+08:00', '2024-04-16 12:54:09.00954706+08:00', NULL, 33.00000000, 52.00000000, b'0', 3685.899902000, '16/04/2024 12:55', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('86fcf703-6aba-452e-afea-d149bab69477', '2024-04-16 14:34:08.780446947+08:00', '2024-04-16 14:34:08.780446947+08:00', NULL, 32.59999847, 54.90000153, b'0', 3683.399902000, '16/04/2024 14:35', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('8b8d3d05-7a49-4dfd-8f10-dbe252921dad', '2024-04-16 04:44:09.401871121+08:00', '2024-04-16 04:44:09.401871121+08:00', NULL, 21.39999962, 87.30000305, b'0', 0.000000000, '16/04/2024 04:45', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('8c0671fe-0c4c-4d79-9fed-15f9c03a233b', '2024-04-16 12:39:09.319307775+08:00', '2024-04-16 12:39:09.319307775+08:00', NULL, 31.89999962, 55.09999847, b'0', 3850.500000000, '16/04/2024 12:40', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('8ccab772-cba3-47e7-9a42-d36f66c0262e', '2024-04-16 00:09:09.537071584+08:00', '2024-04-16 00:09:09.537071584+08:00', NULL, 22.50000000, 89.69999695, b'0', 0.000000000, '16/04/2024 00:10', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('93b862c1-3487-45bc-b6de-f130dea035dd', '2024-04-16 07:29:08.757687124+08:00', '2024-04-16 07:29:08.757687124+08:00', NULL, 29.60000038, 65.50000000, b'0', 1180.599976000, '16/04/2024 07:30', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('98a480f4-cb07-4afd-b89a-2c38382cd0cf', '2024-04-16 00:44:09.254790293+08:00', '2024-04-16 00:44:09.254790293+08:00', NULL, 22.10000038, 94.80000305, b'0', 0.000000000, '16/04/2024 00:45', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('9b1fdd2f-5fc4-4497-afb7-e084da905f05', '2024-04-16 11:49:08.941728239+08:00', '2024-04-16 11:49:08.941728239+08:00', NULL, 31.60000038, 58.00000000, b'0', 4256.200195000, '16/04/2024 11:50', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('9b308bae-86d3-4c91-8ceb-4e864f736f8a', '2024-04-16 07:14:09.293729315+08:00', '2024-04-16 07:14:09.293729315+08:00', NULL, 28.00000000, 69.90000153, b'0', 895.900024400, '16/04/2024 07:15', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('9b893f75-5a62-4b28-b62f-f87f2a94ef77', '2024-04-16 15:14:08.812636828+08:00', '2024-04-16 15:14:08.812636828+08:00', NULL, 32.59999847, 55.79999924, b'0', 3072.300049000, '16/04/2024 15:15', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('9d9cb341-3f2c-432d-81db-f73b882c20f4', '2024-04-16 07:54:09.155459291+08:00', '2024-04-16 07:54:09.155459291+08:00', NULL, 30.20000076, 65.40000153, b'0', 3396.600098000, '16/04/2024 07:55', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('9dcea757-2f17-49a0-822d-cfee0b1b1083', '2024-04-16 00:49:09.414618083+08:00', '2024-04-16 00:49:09.414618083+08:00', NULL, 22.10000038, 94.90000153, b'0', 0.000000000, '16/04/2024 00:50', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('9f527d9d-058a-41f1-90c8-5cdafcc82e6d', '2024-04-16 09:29:09.312614284+08:00', '2024-04-16 09:29:09.312614284+08:00', NULL, 30.89999962, 60.00000000, b'0', 2871.000000000, '16/04/2024 09:30', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('9ffd2635-b1f6-4a32-9c0e-8f983474cd6f', '2024-04-16 05:49:09.510509901+08:00', '2024-04-16 05:49:09.510509901+08:00', NULL, 21.89999962, 86.69999695, b'0', 47.000000000, '16/04/2024 05:50', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('a0643a85-dc5e-4ff9-85d0-4fd2a738fc8b', '2024-04-16 09:39:09.369500393+08:00', '2024-04-16 09:39:09.369500393+08:00', NULL, 30.79999924, 60.40000153, b'0', 3029.800049000, '16/04/2024 09:40', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('a1d56c62-b48b-47cb-a6e9-033789e4ead7', '2024-04-16 05:19:09.326819723+08:00', '2024-04-16 05:19:09.326819723+08:00', NULL, 21.29999924, 91.30000305, b'0', 0.000000000, '16/04/2024 05:20', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('a4727bc0-fd97-4e63-ab85-dc850efdf95f', '2024-04-16 14:39:08.874032408+08:00', '2024-04-16 14:39:08.874032408+08:00', NULL, 31.39999962, 58.50000000, b'0', 740.200012200, '16/04/2024 14:40', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('a7a44b74-3d08-4ef5-b9db-88f859570309', '2024-04-16 02:19:08.67429303+08:00', '2024-04-16 02:19:08.67429303+08:00', NULL, 21.79999924, 95.09999847, b'0', 0.000000000, '16/04/2024 02:20', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('a8c317e3-6df5-4bc8-a84f-d0358f1e3e8b', '2024-04-16 09:09:09.071509497+08:00', '2024-04-16 09:09:09.071509497+08:00', NULL, 31.60000038, 61.70000076, b'0', 2935.699951000, '16/04/2024 09:10', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('ac35db90-cd00-4233-bc0c-e7c210e25632', '2024-04-16 05:04:10.030703299+08:00', '2024-04-16 05:04:10.030703299+08:00', NULL, 21.29999924, 86.69999695, b'0', 0.000000000, '16/04/2024 05:05', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('ad45ae16-e626-44d5-90a0-186070769683', '2024-04-16 05:44:08.992394531+08:00', '2024-04-16 05:44:08.992394531+08:00', NULL, 21.60000038, 89.09999847, b'0', 27.299999240, '16/04/2024 05:45', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('af736d0b-124f-44b3-ada3-ac5ff26aeeac', '2024-04-16 12:04:09.403302147+08:00', '2024-04-16 12:04:09.403302147+08:00', NULL, 33.40000153, 52.70000076, b'0', 4655.899902000, '16/04/2024 12:05', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('b0d08a9e-41d0-45d2-8041-01bafb25b49a', '2024-04-16 03:59:09.061666345+08:00', '2024-04-16 03:59:09.061666345+08:00', NULL, 21.39999962, 92.90000153, b'0', 0.000000000, '16/04/2024 04:00', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('b16c783f-b3cd-4533-b87d-3b25873515e5', '2024-04-16 07:59:08.661043557+08:00', '2024-04-16 07:59:08.661043557+08:00', NULL, 30.60000038, 63.50000000, b'0', 3788.100098000, '16/04/2024 08:00', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('b57c5699-a7d2-440a-8f00-200b408ef7bc', '2024-04-16 00:14:09.514026822+08:00', '2024-04-16 00:14:09.514026822+08:00', NULL, 22.50000000, 90.09999847, b'0', 0.000000000, '16/04/2024 00:15', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('b5f9510d-1c9e-47d2-857b-4e5c5f729a2b', '2024-04-16 01:34:08.745034166+08:00', '2024-04-16 01:34:08.745034166+08:00', NULL, 22.20000076, 93.30000305, b'0', 0.000000000, '16/04/2024 01:35', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('b7e57cf8-ab1b-4251-b46e-1b5bc1af6f79', '2024-04-16 13:24:09.25164834+08:00', '2024-04-16 13:24:09.25164834+08:00', NULL, 33.70000076, 52.09999847, b'0', 3474.699951000, '16/04/2024 13:25', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('b85002d3-1566-4ef6-925f-b83d92dab148', '2024-04-16 02:49:10.007277799+08:00', '2024-04-16 02:49:10.007277799+08:00', NULL, 21.70000076, 94.40000153, b'0', 0.000000000, '16/04/2024 02:50', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('b85b21ac-033a-4b36-8c29-bf332b32f0ae', '2024-04-16 06:04:09.432865378+08:00', '2024-04-16 06:04:09.432865378+08:00', NULL, 22.20000076, 84.80000305, b'0', 146.899993900, '16/04/2024 06:05', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('b8f29c51-282a-4fc3-b591-0d378a20d6aa', '2024-04-16 02:59:08.569573938+08:00', '2024-04-16 02:59:08.569573938+08:00', NULL, 21.70000076, 94.69999695, b'0', 0.000000000, '16/04/2024 03:00', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('ba91b198-949b-4957-a38d-d2df710deabc', '2024-04-16 08:04:09.766725197+08:00', '2024-04-16 08:04:09.766725197+08:00', NULL, 30.39999962, 63.79999924, b'0', 4024.300049000, '16/04/2024 08:05', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('bbf82e3a-deba-48f5-9fcb-46bf6ebe1886', '2024-04-16 11:24:08.998701387+08:00', '2024-04-16 11:24:08.998701387+08:00', NULL, 31.70000076, 57.50000000, b'0', 3915.899902000, '16/04/2024 11:25', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('bc385119-11b9-4057-a86b-6e0c1bb2674e', '2024-04-16 06:49:09.067063102+08:00', '2024-04-16 06:49:09.067063102+08:00', NULL, 24.39999962, 80.59999847, b'0', 740.900024400, '16/04/2024 06:50', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('be01e9dd-e0c0-4049-8929-5a328925a49e', '2024-04-16 00:34:09.826817839+08:00', '2024-04-16 00:34:09.826817839+08:00', NULL, 22.20000076, 94.40000153, b'0', 0.000000000, '16/04/2024 00:35', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('be1df4a7-cb99-4866-b617-31c7b3f58bbb', '2024-04-16 02:44:09.498161657+08:00', '2024-04-16 02:44:09.498161657+08:00', NULL, 21.70000076, 94.19999695, b'0', 0.000000000, '16/04/2024 02:45', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('c2b8df15-4053-48dd-a71d-7354cbda2ae9', '2024-04-16 14:44:08.61763568+08:00', '2024-04-16 14:44:08.61763568+08:00', NULL, 30.50000000, 60.29999924, b'0', 672.099975600, '16/04/2024 14:45', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('c3438b4e-3ed1-4dc9-9623-2a522b5da008', '2024-04-16 11:09:06.909762645+08:00', '2024-04-16 11:09:06.909762645+08:00', NULL, 31.29999924, 60.00000000, b'0', 3764.500000000, '16/04/2024 11:10', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('c3bc1828-e45c-4542-bc8a-b1acb300758d', '2024-04-16 02:24:08.292324044+08:00', '2024-04-16 02:24:08.292324044+08:00', NULL, 21.79999924, 95.19999695, b'0', 0.000000000, '16/04/2024 02:25', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('c5feb1a3-7615-496f-8efe-c82fb05926db', '2024-04-16 05:59:08.688428355+08:00', '2024-04-16 05:59:08.688428355+08:00', NULL, 22.00000000, 85.00000000, b'0', 106.300003100, '16/04/2024 06:00', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('c6f21459-b079-4033-aff7-0c2106ca5690', '2024-04-16 13:34:09.098859562+08:00', '2024-04-16 13:34:09.098859562+08:00', NULL, 33.20000076, 51.90000153, b'0', 1101.800049000, '16/04/2024 13:35', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('c75dff6f-54c1-4427-a6b4-e1aca8e8ec45', '2024-04-16 10:29:10.685731447+08:00', '2024-04-16 10:29:10.685731447+08:00', NULL, 29.60000038, 60.40000153, b'0', 3387.199951000, '16/04/2024 10:30', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('c77910ad-9a1b-4a5c-8eef-9b592550609a', '2024-04-16 03:24:08.868214115+08:00', '2024-04-16 03:24:08.868214115+08:00', NULL, 21.50000000, 95.30000305, b'0', 0.000000000, '16/04/2024 03:25', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('c8747c2e-fe4c-43dd-a146-35cc950a17ef', '2024-04-16 00:29:09.30037582+08:00', '2024-04-16 00:29:09.30037582+08:00', NULL, 22.29999924, 93.80000305, b'0', 0.000000000, '16/04/2024 00:30', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('cc22eefd-0d4e-415e-98fd-59a68ada5d4e', '2024-04-16 00:04:09.010162081+08:00', '2024-04-16 00:04:09.010162081+08:00', NULL, 22.60000038, 89.50000000, b'0', 0.000000000, '16/04/2024 00:05', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('cd15f083-8475-4e05-88ff-470a1f5ce622', '2024-04-16 14:54:08.788144579+08:00', '2024-04-16 14:54:08.788144579+08:00', NULL, 32.59999847, 55.90000153, b'0', 981.799987800, '16/04/2024 14:55', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('cd5e5c5b-fdef-40e6-8673-2bef494338a6', '2024-04-16 13:14:09.182073343+08:00', '2024-04-16 13:14:09.182073343+08:00', NULL, 33.09999847, 51.59999847, b'0', 3039.000000000, '16/04/2024 13:15', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('ce67ebaa-5c03-41e1-a21f-6daad34dec9c', '2024-04-16 07:09:09.608872791+08:00', '2024-04-16 07:09:09.608872791+08:00', NULL, 27.20000076, 72.30000305, b'0', 837.299987800, '16/04/2024 07:10', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('cfaeef7e-c316-4767-982d-70850126a97b', '2024-04-16 10:49:09.193530762+08:00', '2024-04-16 10:49:09.193530762+08:00', NULL, 29.89999962, 62.20000076, b'0', 3690.899902000, '16/04/2024 10:50', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('d3c69811-5388-4546-b80a-8514bc746a2b', '2024-04-16 09:49:09.497371867+08:00', '2024-04-16 09:49:09.497371867+08:00', NULL, 31.20000076, 57.79999924, b'0', 3447.300049000, '16/04/2024 09:50', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('d3ff25d3-1742-4f51-b48b-cb0282381149', '2024-04-16 03:44:08.665704352+08:00', '2024-04-16 03:44:08.665704352+08:00', NULL, 21.39999962, 94.69999695, b'0', 0.000000000, '16/04/2024 03:45', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('d5353cdf-8179-42dd-bd45-90dab9b6b293', '2024-04-16 13:29:09.711422877+08:00', '2024-04-16 13:29:09.711422877+08:00', NULL, 34.00000000, 50.59999847, b'0', 3560.500000000, '16/04/2024 13:30', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('d57a87dd-f79d-4abc-a642-cc3ee670ae91', '2024-04-16 04:49:09.470479248+08:00', '2024-04-16 04:49:09.470479248+08:00', NULL, 21.29999924, 87.00000000, b'0', 0.000000000, '16/04/2024 04:50', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('d780191a-a4ff-4a0b-8801-2c40a6d70a4d', '2024-04-16 12:44:09.348342346+08:00', '2024-04-16 12:44:09.348342346+08:00', NULL, 33.79999924, 52.00000000, b'0', 4104.600098000, '16/04/2024 12:45', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('d80c3b57-7c4e-4e80-9987-4331dc5289f5', '2024-04-16 10:44:09.933214231+08:00', '2024-04-16 10:44:09.933214231+08:00', NULL, 29.79999924, 61.09999847, b'0', 3289.699951000, '16/04/2024 10:45', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('d9ff2b0f-bbbc-425f-b3d1-7fb26d993a2b', '2024-04-16 01:44:09.523836835+08:00', '2024-04-16 01:44:09.523836835+08:00', NULL, 22.10000038, 93.90000153, b'0', 0.000000000, '16/04/2024 01:45', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('dbad2a7e-80d0-4d23-be8f-ffff94669c8e', '2024-04-16 09:44:09.145959979+08:00', '2024-04-16 09:44:09.145959979+08:00', NULL, 31.20000076, 59.50000000, b'0', 3010.899902000, '16/04/2024 09:45', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('dd093d3f-d789-4255-9ccf-df26563ec129', '2024-04-16 06:19:09.347061567+08:00', '2024-04-16 06:19:09.347061567+08:00', NULL, 22.89999962, 80.90000153, b'0', 268.700012200, '16/04/2024 06:20', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('dde85828-49c9-47c7-acb3-021aa6ca05fc', '2024-04-16 13:59:09.658493458+08:00', '2024-04-16 13:59:09.658493458+08:00', NULL, 32.59999847, 54.09999847, b'0', 3364.199951000, '16/04/2024 14:00', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('de414c95-7918-4618-a711-cd3feb7a1429', '2024-04-16 12:24:08.563573497+08:00', '2024-04-16 12:24:08.563573497+08:00', NULL, 31.79999924, 57.40000153, b'0', 1009.900024000, '16/04/2024 12:25', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('df891eaa-befe-4d87-b701-9530e97eee1b', '2024-04-16 10:09:14.294736955+08:00', '2024-04-16 10:09:14.294736955+08:00', NULL, 30.29999924, 59.50000000, b'0', 2899.699951000, '16/04/2024 10:10', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('e09076e8-e3bc-43c5-8571-26964123fa4c', '2024-04-16 07:34:09.084610424+08:00', '2024-04-16 07:34:09.084610424+08:00', NULL, 29.29999924, 67.80000305, b'0', 905.099975600, '16/04/2024 07:35', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('e1e316c3-c2c8-497c-b629-e395546e4a5c', '2024-04-16 01:14:09.530173685+08:00', '2024-04-16 01:14:09.530173685+08:00', NULL, 22.20000076, 94.09999847, b'0', 0.000000000, '16/04/2024 01:15', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('e2bf778f-4e4a-4136-ba42-033e7dd68b23', '2024-04-16 06:34:09.098633008+08:00', '2024-04-16 06:34:09.098633008+08:00', NULL, 23.79999924, 80.69999695, b'0', 945.299987800, '16/04/2024 06:35', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('e32c3401-ee5d-4aa8-897c-209c8cfb8ddd', '2024-04-16 13:04:08.404182341+08:00', '2024-04-16 13:04:08.404182341+08:00', NULL, 33.29999924, 51.79999924, b'0', 3604.199951000, '16/04/2024 13:05', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('e428612d-550d-4d50-901c-e939e8246c9c', '2024-04-16 15:19:09.209219286+08:00', '2024-04-16 15:19:09.209219286+08:00', NULL, 32.29999924, 57.00000000, b'0', 834.900024400, '16/04/2024 15:20', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('e4b37395-bd19-4f38-9caa-7b28efe42fec', '2024-04-16 14:09:09.356304553+08:00', '2024-04-16 14:09:09.356304553+08:00', NULL, 31.70000076, 55.09999847, b'0', 1071.800049000, '16/04/2024 14:10', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('e582ebfa-ce86-4bfb-8830-1a65efcd1fd1', '2024-04-16 08:39:10.693656872+08:00', '2024-04-16 08:39:10.693656872+08:00', NULL, 30.60000038, 62.09999847, b'0', 3018.600098000, '16/04/2024 08:40', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('e7196d05-6bc3-4216-bbba-4cafbc4919c8', '2024-04-16 11:34:09.61962085+08:00', '2024-04-16 11:34:09.61962085+08:00', NULL, 31.39999962, 55.90000153, b'0', 4117.299805000, '16/04/2024 11:35', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('e7ebb8e8-c126-49c3-9d7c-c87f19448378', '2024-04-16 00:24:08.367996544+08:00', '2024-04-16 00:24:08.367996544+08:00', NULL, 22.39999962, 93.09999847, b'0', 0.000000000, '16/04/2024 00:25', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('e84051cf-a406-476d-92be-b92764d0db32', '2024-04-16 01:59:09.718334115+08:00', '2024-04-16 01:59:09.718334115+08:00', NULL, 22.10000038, 93.19999695, b'0', 0.000000000, '16/04/2024 02:00', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('e9f6098e-5a4b-4388-8084-160d2306b334', '2024-04-16 10:59:09.909357029+08:00', '2024-04-16 10:59:09.909357029+08:00', NULL, 30.60000038, 57.90000153, b'0', 3985.100098000, '16/04/2024 11:00', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('ed430d02-5fc5-4785-a773-6d36f79a25e2', '2024-04-16 15:09:09.114766451+08:00', '2024-04-16 15:09:09.114766451+08:00', NULL, 32.09999847, 56.29999924, b'0', 2794.300049000, '16/04/2024 15:10', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('ee4b473c-7aef-4758-a2d7-329d0b8ee194', '2024-04-16 15:44:09.332822787+08:00', '2024-04-16 15:44:09.332822787+08:00', NULL, 31.70000076, 58.00000000, b'0', 1824.300049000, '16/04/2024 15:45', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('ee4d4ad8-38ac-45e3-a2d4-c6bbec84c70f', '2024-04-16 01:49:09.04872063+08:00', '2024-04-16 01:49:09.04872063+08:00', NULL, 22.10000038, 94.00000000, b'0', 0.000000000, '16/04/2024 01:50', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('f05595a4-2294-4ded-a2f8-b6511e45e963', '2024-04-16 09:24:09.315031812+08:00', '2024-04-16 09:24:09.315031812+08:00', NULL, 31.00000000, 59.20000076, b'0', 2725.899902000, '16/04/2024 09:25', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('f3db6ee1-8f21-4c66-ba0c-b45b726c5647', '2024-04-16 08:44:08.786851904+08:00', '2024-04-16 08:44:08.786851904+08:00', NULL, 30.70000076, 61.59999847, b'0', 3035.300049000, '16/04/2024 08:45', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('f5601e6a-71ef-40bf-bebd-aed98326a381', '2024-04-16 12:49:09.141423627+08:00', '2024-04-16 12:49:09.141423627+08:00', NULL, 32.00000000, 53.50000000, b'0', 1249.900024000, '16/04/2024 12:50', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('f692b996-bc75-4bef-96d7-b733d2263831', '2024-04-16 12:29:09.443912132+08:00', '2024-04-16 12:29:09.443912132+08:00', NULL, 32.70000076, 54.70000076, b'0', 1649.800049000, '16/04/2024 12:30', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('fd70d676-bf51-454f-b701-722476e53c9b', '2024-04-16 10:39:09.314687241+08:00', '2024-04-16 10:39:09.314687241+08:00', NULL, 29.70000076, 61.79999924, b'0', 3051.100098000, '16/04/2024 10:40', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('ff6c35f7-0be6-4847-b44a-e607cd11ba6e', '2024-04-16 13:09:09.305653338+08:00', '2024-04-16 13:09:09.305653338+08:00', NULL, 35.00000000, 49.79999924, b'0', 3056.100098000, '16/04/2024 13:10', '53dfff10-c2da-4ec3-85a0-43689e14e5ce'),
('fff415ac-d046-422a-9d6a-b080248d4ea2', '2024-04-16 09:54:09.730643398+08:00', '2024-04-16 09:54:09.730643398+08:00', NULL, 31.39999962, 59.20000076, b'0', 3492.699951000, '16/04/2024 09:55', '53dfff10-c2da-4ec3-85a0-43689e14e5ce');

-- --------------------------------------------------------

--
-- Table structure for table `sensors`
--

CREATE TABLE `sensors` (
  `id` varchar(36) NOT NULL,
  `created_at` varchar(10) DEFAULT NULL,
  `updated_at` varchar(10) DEFAULT NULL,
  `deleted_at` varchar(10) DEFAULT NULL,
  `name` varchar(36) DEFAULT NULL,
  `type_id` varchar(36) DEFAULT NULL,
  `parent_edge_device_id` varchar(36) DEFAULT NULL,
  `sensor_location` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `sensors`
--

INSERT INTO `sensors` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `type_id`, `parent_edge_device_id`, `sensor_location`) VALUES
('1', '2024-06-03', '2024-06-03', 'null', 'Air Temperature & Rel Humidity 1', '8da8027d-2e1a-4e36-a991-c81ec65c9d09', '09a52f4d-0b92-4050-80d7-c8f4f6e18688', 'inside'),
('10', '2024-06-03', '2024-06-03', 'null', 'Air Temperature & Rel Humidity 4', '8da8027d-2e1a-4e36-a991-c81ec65c9d09', 'a7cd79d5-0759-41bb-8857-cac4f696c93b', 'inside'),
('11', '2024-06-03', '2024-06-03', 'null', 'CO2 4', '8da8027d-2e1a-4e36-a991-c81ec65c9d09', 'a7cd79d5-0759-41bb-8857-cac4f696c93b', 'inside'),
('12', '2024-06-03', '2024-06-03', 'null', 'Illuminance 4', '8da8027d-2e1a-4e36-a991-c81ec65c9d09', 'a7cd79d5-0759-41bb-8857-cac4f696c93b', 'inside'),
('13', '2024-06-03', '2024-06-03', 'null', 'Air Temperature & Rel Humidity 5', '8da8027d-2e1a-4e36-a991-c81ec65c9d09', '1fcc0c3a-aa5d-4cc9-8a98-74f1298edbfc', 'inside'),
('14', '2024-06-03', '2024-06-03', 'null', 'CO2 5', '8da8027d-2e1a-4e36-a991-c81ec65c9d09', '1fcc0c3a-aa5d-4cc9-8a98-74f1298edbfc', 'inside'),
('15', '2024-06-03', '2024-06-03', 'null', 'Illuminance 5', '8da8027d-2e1a-4e36-a991-c81ec65c9d09', '1fcc0c3a-aa5d-4cc9-8a98-74f1298edbfc', 'inside'),
('16', '2024-06-03', '2024-06-03', 'null', 'Air Temperature & Rel Humidity 6', '8da8027d-2e1a-4e36-a991-c81ec65c9d09', '2aa53fc5-0369-483a-b618-8db6cae21313', 'inside'),
('17', '2024-06-03', '2024-06-03', 'null', 'CO2 6', '8da8027d-2e1a-4e36-a991-c81ec65c9d09', '2aa53fc5-0369-483a-b618-8db6cae21313', 'inside'),
('18', '2024-06-03', '2024-06-03', 'null', 'Illuminance 6', '8da8027d-2e1a-4e36-a991-c81ec65c9d09', '2aa53fc5-0369-483a-b618-8db6cae21313', 'inside'),
('19', '2024-06-03', '2024-06-03', 'null', 'Air Temperature & Rel Humidity 7', '8da8027d-2e1a-4e36-a991-c81ec65c9d09', '79dea917-a396-46aa-87b4-e0a6c9f8c4fe', 'inside'),
('2', '2024-06-03', '2024-06-03', 'null', 'CO2 1', '8da8027d-2e1a-4e36-a991-c81ec65c9d09', '09a52f4d-0b92-4050-80d7-c8f4f6e18688', 'inside'),
('20', '2024-06-03', '2024-06-03', 'null', 'CO2 7', '8da8027d-2e1a-4e36-a991-c81ec65c9d09', '79dea917-a396-46aa-87b4-e0a6c9f8c4fe', 'inside'),
('21', '2024-06-03', '2024-06-03', 'null', 'Illuminance 7', '8da8027d-2e1a-4e36-a991-c81ec65c9d09', '79dea917-a396-46aa-87b4-e0a6c9f8c4fe', 'inside'),
('22', '2024-06-03', '2024-06-03', 'null', 'Fish Tank D.O 1', '79f9ceba-45b7-4f7a-92fa-5232d13442d3', '09a52f4d-0b92-4050-80d7-c8f4f6e18688', 'inside'),
('23', '2024-06-03', '2024-06-03', 'null', 'Fish Tank pH & Water Temp 1', '79f9ceba-45b7-4f7a-92fa-5232d13442d3', '09a52f4d-0b92-4050-80d7-c8f4f6e18688', 'inside'),
('24', '2024-06-03', '2024-06-03', 'null', 'Fish Tank D.O 2', '79f9ceba-45b7-4f7a-92fa-5232d13442d3', 'dcf18b56-100d-41e0-a78c-d84f3123c124', 'inside'),
('25', '2024-06-03', '2024-06-03', 'null', 'Fish Tank pH & Water Temp 2', '79f9ceba-45b7-4f7a-92fa-5232d13442d3', 'dcf18b56-100d-41e0-a78c-d84f3123c124', 'inside'),
('26', '2024-06-03', '2024-06-03', 'null', 'Biofilter Nitrite 1', 'c8fc247b-0b08-4dd9-b57f-8f85cc34ed54', '09a52f4d-0b92-4050-80d7-c8f4f6e18688', 'inside'),
('27', '2024-06-03', '2024-06-03', 'null', 'Biofilter Nitrate 1', 'c8fc247b-0b08-4dd9-b57f-8f85cc34ed54', '09a52f4d-0b92-4050-80d7-c8f4f6e18688', 'inside'),
('28', '2024-06-03', '2024-06-03', 'null', 'Biofilter Ammonia 1', 'c8fc247b-0b08-4dd9-b57f-8f85cc34ed54', '09a52f4d-0b92-4050-80d7-c8f4f6e18688', 'inside'),
('29', '2024-06-03', '2024-06-03', 'null', 'Biofilter Nitrite 2', 'c8fc247b-0b08-4dd9-b57f-8f85cc34ed54', 'dcf18b56-100d-41e0-a78c-d84f3123c124', 'inside'),
('3', '2024-06-03', '2024-06-03', 'null', 'Illuminance 1', '8da8027d-2e1a-4e36-a991-c81ec65c9d09', '09a52f4d-0b92-4050-80d7-c8f4f6e18688', 'inside'),
('30', '2024-06-03', '2024-06-03', 'null', 'Biofilter Nitrate 2', 'c8fc247b-0b08-4dd9-b57f-8f85cc34ed54', 'dcf18b56-100d-41e0-a78c-d84f3123c124', 'inside'),
('31', '2024-06-03', '2024-06-03', 'null', 'Biofilter Ammonia 2', 'c8fc247b-0b08-4dd9-b57f-8f85cc34ed54', 'dcf18b56-100d-41e0-a78c-d84f3123c124', 'inside'),
('32', '2024-06-03', '2024-06-03', 'null', 'Testbed pH & Water Temp 1', 'df1b27db-7b69-4442-949e-9ef908c4fe72', '09a52f4d-0b92-4050-80d7-c8f4f6e18688', 'inside'),
('33', '2024-06-03', '2024-06-03', 'null', 'Testbed EC 1', 'df1b27db-7b69-4442-949e-9ef908c4fe72', '09a52f4d-0b92-4050-80d7-c8f4f6e18688', 'inside'),
('34', '2024-06-03', '2024-06-03', 'null', 'Testbed TDS 1', 'df1b27db-7b69-4442-949e-9ef908c4fe72', '09a52f4d-0b92-4050-80d7-c8f4f6e18688', 'inside'),
('35', '2024-06-03', '2024-06-03', 'null', 'Testbed DO 1', 'df1b27db-7b69-4442-949e-9ef908c4fe72', '09a52f4d-0b92-4050-80d7-c8f4f6e18688', 'inside'),
('36', '2024-06-03', '2024-06-03', 'null', 'Testbed Ammonia 1', 'df1b27db-7b69-4442-949e-9ef908c4fe72', '09a52f4d-0b92-4050-80d7-c8f4f6e18688', 'inside'),
('37', '2024-06-03', '2024-06-03', 'null', 'Testbed Nitrite 1', 'df1b27db-7b69-4442-949e-9ef908c4fe72', '09a52f4d-0b92-4050-80d7-c8f4f6e18688', 'inside'),
('38', '2024-06-03', '2024-06-03', 'null', 'Testbed Nitrate 1', 'df1b27db-7b69-4442-949e-9ef908c4fe72', '09a52f4d-0b92-4050-80d7-c8f4f6e18688', 'inside'),
('39', '2025-02-28', '2025-02-28', NULL, 'Plant Air Temperature & Rel Humidity', 'a63591c3-27dc-4379-8efd-425c533a65b6', 'a7cd79d5-0759-41bb-8857-cac4f696c93b', 'inside'),
('4', '2024-06-03', '2024-06-03', 'null', 'Air Temperature & Rel Humidity 2', '8da8027d-2e1a-4e36-a991-c81ec65c9d09', '100f800d-132c-4d92-a892-71a6c1cb45e7', 'inside'),
('40', '2025-02-28', '2025-02-28', 'null', 'Plant Air Temperature & Rel Humidity', 'a63591c3-27dc-4379-8efd-425c533a65b6', 'a7cd79d5-0759-41bb-8857-cac4f696c93b', 'inside'),
('5', '2024-06-03', '2024-06-03', 'null', 'CO2 2', '8da8027d-2e1a-4e36-a991-c81ec65c9d09', '100f800d-132c-4d92-a892-71a6c1cb45e7', 'inside'),
('6', '2024-06-03', '2024-06-03', 'null', 'Illuminance 2', '8da8027d-2e1a-4e36-a991-c81ec65c9d09', '100f800d-132c-4d92-a892-71a6c1cb45e7', 'inside'),
('7', '2024-06-03', '2024-06-03', 'null', 'Air Temperature & Rel Humidity 3', '8da8027d-2e1a-4e36-a991-c81ec65c9d09', 'dcf18b56-100d-41e0-a78c-d84f3123c124', 'inside'),
('8', '2024-06-03', '2024-06-03', 'null', 'CO2 3', '8da8027d-2e1a-4e36-a991-c81ec65c9d09', 'dcf18b56-100d-41e0-a78c-d84f3123c124', 'inside'),
('9', '2024-06-03', '2024-06-03', 'null', 'Illuminance 3', '8da8027d-2e1a-4e36-a991-c81ec65c9d09', 'dcf18b56-100d-41e0-a78c-d84f3123c124', 'inside');

-- --------------------------------------------------------

--
-- Stand-in structure for view `sensor_device_info`
-- (See below for the actual view)
--
CREATE TABLE `sensor_device_info` (
`sensor_id` varchar(36)
,`name` varchar(36)
,`type_id` varchar(36)
,`edge_device_status` tinyint(4)
,`parent_edge_device_id` varchar(36)
,`edge_device_name` varchar(18)
,`api_key` varchar(60)
,`passcode` varchar(60)
,`mqtt_client_id` varchar(44)
,`sensor_type_name` varchar(22)
,`icon_path` varchar(45)
,`sensor_created_at` varchar(10)
,`sensor_updated_at` varchar(10)
,`sensor_deleted_at` varchar(10)
,`edge_created_at` varchar(10)
,`edge_updated_at` varchar(10)
,`edge_deleted_at` varchar(0)
,`sensor_type_created_at` varchar(10)
,`sensor_type_updated_at` varchar(10)
,`sensor_type_deleted_at` varchar(10)
);

-- --------------------------------------------------------

--
-- Table structure for table `sensor_limits`
--

CREATE TABLE `sensor_limits` (
  `id` int(11) NOT NULL,
  `sensor_id` varchar(36) DEFAULT NULL,
  `limit_type` enum('width','height','weight','air_temperature','relative_humidity','co2_level','illumination_intensity','health','nitrate','nitrite','ammonia','ph_level','electrical_conductivity','dissolved_o2_level','water_temperature','total_dissolved_solids','size') DEFAULT NULL,
  `limit_floor` decimal(10,2) DEFAULT NULL,
  `limit_ceiling` decimal(10,2) DEFAULT NULL,
  `limit_floor_threshold` decimal(10,2) DEFAULT NULL,
  `limit_ceiling_threshold` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sensor_types`
--

CREATE TABLE `sensor_types` (
  `id` varchar(36) NOT NULL,
  `created_at` varchar(10) DEFAULT NULL,
  `updated_at` varchar(10) DEFAULT NULL,
  `deleted_at` varchar(10) DEFAULT NULL,
  `name` varchar(22) DEFAULT NULL,
  `icon_path` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `sensor_types`
--

INSERT INTO `sensor_types` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `icon_path`) VALUES
('79f9ceba-45b7-4f7a-92fa-5232d13442d3', '2024-03-06', '2024-03-06', '', 'fish', '/images/sensor_type_icons/fish.png'),
('8da8027d-2e1a-4e36-a991-c81ec65c9d09', '2024-03-07', '2024-03-07', '', 'green_house_monitoring', '/images/sensor_type_icons/greenhouse.png'),
('a63591c3-27dc-4379-8efd-425c533a65b6', '2024-03-08', '2024-03-08', '', 'plant', '/images/sensor_type_icons/plant.png'),
('c8fc247b-0b08-4dd9-b57f-8f85cc34ed54', '2024-02-29', '2024-02-29', '', 'water_biofilter', '/images/sensor_type_icons/water_biofilter.png'),
('df1b27db-7b69-4442-949e-9ef908c4fe72', '2024-03-02', '2024-03-02', '', 'water_test_bed', '/images/sensor_type_icons/water_test_bed.png');

-- --------------------------------------------------------

--
-- Table structure for table `server_notifications`
--

CREATE TABLE `server_notifications` (
  `id` varchar(36) DEFAULT NULL,
  `created_at` varchar(10) DEFAULT NULL,
  `updated_at` varchar(10) DEFAULT NULL,
  `deleted_at` varchar(0) DEFAULT NULL,
  `message` varchar(71) DEFAULT NULL,
  `severity` tinyint(4) DEFAULT NULL,
  `related_table` tinyint(4) DEFAULT NULL,
  `related_record_id` varchar(36) DEFAULT NULL,
  `timestamp` varchar(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `server_notifications`
--

INSERT INTO `server_notifications` (`id`, `created_at`, `updated_at`, `deleted_at`, `message`, `severity`, `related_table`, `related_record_id`, `timestamp`) VALUES
('651d3871-24a5-41fe-9632-5970716dbae6', '2024-04-27', '2024-04-20', '', 'Green house relative humidity is within high level threshold', 0, 8, '61534d56-5340-4d46-a222-eaba9ae3c212', '2024-04-20 00:58:59'),
('fb030748-77c4-4a54-9f45-413121b05a8a', '2024-04-28', '2024-04-22', '', 'Green house CO2 level has reached critically low level', 1, 8, '61534d56-5340-4d46-a222-eaba9ae3c212', '2024-04-20 00:58:59'),
('e9a54aa3-1ee9-4df2-85b6-fbaa4cd59435', '2024-04-29', '2024-04-29', '', 'Green house illumination intensity has reached critically low level', 1, 8, '61534d56-5340-4d46-a222-eaba9ae3c212', '2024-04-20 00:58:59'),
('f4a1208a-3b04-4638-982d-fa3bec25e2b6', '2024-04-21', '2024-04-24', '', 'Green house relative humidity is within high level threshold', 0, 8, '38c776a5-85f1-45ea-b768-3871705fb02b', '2024-04-20 01:03:59'),
('2be407fa-b0a2-4884-8801-f260495d17c9', '2024-04-22', '2024-04-28', '', 'Green house CO2 level has reached critically low level', 1, 8, '38c776a5-85f1-45ea-b768-3871705fb02b', '2024-04-20 01:03:59'),
('d5706791-e310-4fc9-a3d6-4abf10e86932', '2024-04-23', '2024-04-20', '', 'Green house illumination intensity has reached critically low level', 1, 8, '38c776a5-85f1-45ea-b768-3871705fb02b', '2024-04-20 01:03:59'),
('2c5d7f20-69f2-4b43-a311-97e9a827a28b', '2024-04-20', '2024-04-28', '', 'Green house relative humidity is within high level threshold', 0, 8, '983ffac9-56cb-4940-b14d-ecb727210e31', '2024-04-20 01:13:58'),
('dcf74bfe-8067-46fd-814a-b9160822cb5c', '2024-04-20', '2024-04-23', '', 'Green house CO2 level has reached critically low level', 1, 8, '983ffac9-56cb-4940-b14d-ecb727210e31', '2024-04-20 01:13:58'),
('1c7d2b47-7357-48e0-ade4-775fbaf9e4ff', '2024-04-22', '2024-04-29', '', 'Green house illumination intensity has reached critically low level', 1, 8, '983ffac9-56cb-4940-b14d-ecb727210e31', '2024-04-20 01:13:58'),
('e8245c0c-c4da-454e-bc97-af13899c87df', '2024-04-23', '2024-04-24', '', 'Green house relative humidity is within high level threshold', 0, 8, 'b62a6d5e-bff5-4ca5-aa02-a1305af3d2fc', '2024-04-20 01:18:58'),
('bab6c184-a117-4594-a546-273c71960d1e', '2024-04-25', '2024-04-30', '', 'Green house CO2 level has reached critically low level', 1, 8, 'b62a6d5e-bff5-4ca5-aa02-a1305af3d2fc', '2024-04-20 01:18:58'),
('fa4b7841-9d6a-40ab-b46e-c2582b06953d', '2024-04-27', '2024-04-20', '', 'Green house illumination intensity has reached critically low level', 1, 8, 'b62a6d5e-bff5-4ca5-aa02-a1305af3d2fc', '2024-04-20 01:18:58'),
('06101c95-664d-48a8-b986-2a5165c9e421', '2024-04-20', '2024-04-29', '', 'Green house relative humidity is within high level threshold', 0, 8, 'a430520b-b2bb-44ae-bc1e-e0c4b83f7f25', '2024-04-20 01:23:59'),
('4b9500cf-149d-4f88-aead-3a26aa33ca9b', '2024-04-22', '2024-04-21', '', 'Green house CO2 level has reached critically low level', 1, 8, 'a430520b-b2bb-44ae-bc1e-e0c4b83f7f25', '2024-04-20 01:23:59'),
('f6b6320e-2423-42d0-b105-506620f25335', '2024-04-24', '2024-04-24', '', 'Green house illumination intensity has reached critically low level', 1, 8, 'a430520b-b2bb-44ae-bc1e-e0c4b83f7f25', '2024-04-20 01:23:59'),
('cf192c83-0119-4325-b47d-f099068f32c9', '2024-05-01', '2024-04-25', '', 'Green house relative humidity is within high level threshold', 0, 8, 'c6d5bc33-b601-4c14-ad9c-65b77e8b489d', '2024-04-20 01:28:58'),
('b1a22db4-bd50-4fab-b6bc-f73a63ef0089', '2024-04-20', '2024-04-28', '', 'Green house CO2 level has reached critically low level', 1, 8, 'c6d5bc33-b601-4c14-ad9c-65b77e8b489d', '2024-04-20 01:28:59'),
('8ea10607-6d91-4c35-86e3-2fabbdd61ce6', '2024-04-22', '2024-04-29', '', 'Green house illumination intensity has reached critically low level', 1, 8, 'c6d5bc33-b601-4c14-ad9c-65b77e8b489d', '2024-04-20 01:28:59'),
('1317ded4-9d75-493f-9fee-f0d07986bde8', '2024-05-01', '2024-04-23', '', 'Green house relative humidity is within high level threshold', 0, 8, 'a0b54387-4c52-4fa1-8550-2bc1609fa221', '2024-04-20 01:33:57'),
('711e16e2-a118-45c8-9d84-34b06056027d', '2024-04-21', '2024-04-26', '', 'Green house CO2 level has reached critically low level', 1, 8, 'a0b54387-4c52-4fa1-8550-2bc1609fa221', '2024-04-20 01:33:58'),
('3da12e55-1baa-43ad-95c5-3da3659bbcb7', '2024-04-23', '2024-04-29', '', 'Green house illumination intensity has reached critically low level', 1, 8, 'a0b54387-4c52-4fa1-8550-2bc1609fa221', '2024-04-20 01:33:58'),
('08dfc25e-359f-4669-8646-bd5a051283c5', '2024-04-22', '2024-05-01', '', 'Green house relative humidity is within high level threshold', 0, 8, 'e7f0ccb8-9aa2-4983-95fb-8ecf547043d5', '2024-04-20 01:38:58'),
('db8351cc-a5e5-4f05-b59a-227884edad21', '2024-04-24', '2024-04-24', '', 'Green house CO2 level has reached critically low level', 1, 8, 'e7f0ccb8-9aa2-4983-95fb-8ecf547043d5', '2024-04-20 01:38:58'),
('d57d1d75-3433-45d8-b1cf-3edfc24a32d1', '2024-04-26', '2024-04-26', '', 'Green house illumination intensity has reached critically low level', 1, 8, 'e7f0ccb8-9aa2-4983-95fb-8ecf547043d5', '2024-04-20 01:38:58'),
('f2234ef7-39a8-4109-acc1-6c2cd4755114', '2024-04-27', '2024-04-28', '', 'Green house relative humidity is within high level threshold', 0, 8, '46919946-5bc1-4091-ad3a-f8c070bf9cf3', '2024-04-20 01:43:58'),
('f835f4ca-ebd5-40c9-9625-08f44ee03e86', '2024-04-29', '2024-05-02', '', 'Green house CO2 level has reached critically low level', 1, 8, '46919946-5bc1-4091-ad3a-f8c070bf9cf3', '2024-04-20 01:43:58'),
('73ce4d98-eee4-469e-9fba-ea71517961e5', '2024-04-20', '2024-04-25', '', 'Green house illumination intensity has reached critically low level', 1, 8, '46919946-5bc1-4091-ad3a-f8c070bf9cf3', '2024-04-20 01:43:59'),
('891322a4-baad-4c93-9648-9c3ac99f7aaf', '2024-04-21', '2024-04-23', '', 'Green house relative humidity is within high level threshold', 0, 8, '2e1f2b1b-200f-4b60-88eb-c6f6e0b1c4db', '2024-04-20 01:48:59'),
('6bc47325-0257-4ec5-99d9-1e3ff1303293', '2024-04-22', '2024-04-26', '', 'Green house CO2 level has reached critically low level', 1, 8, '2e1f2b1b-200f-4b60-88eb-c6f6e0b1c4db', '2024-04-20 01:48:59'),
('7199bd46-c68d-4ad6-aeb6-650c18dbe360', '2024-04-23', '2024-04-22', '', 'Green house illumination intensity has reached critically low level', 1, 8, '2e1f2b1b-200f-4b60-88eb-c6f6e0b1c4db', '2024-04-20 01:48:59'),
('fbf32990-0e17-46bb-9f07-4d374cba415d', '2024-04-30', '2024-04-25', '', 'Green house relative humidity is within high level threshold', 0, 8, '002808d6-18c8-4db8-b617-801b820f40cb', '2024-04-20 01:53:58'),
('a60de9f9-2e77-4e3d-9fea-66904e61739f', '2024-05-01', '2024-05-02', '', 'Green house CO2 level has reached critically low level', 1, 8, '002808d6-18c8-4db8-b617-801b820f40cb', '2024-04-20 01:53:58'),
('5762be9b-0805-4fc8-954e-5ad6d66b9dd8', '2024-04-21', '2024-04-21', '', 'Green house illumination intensity has reached critically low level', 1, 8, '002808d6-18c8-4db8-b617-801b820f40cb', '2024-04-20 01:53:59'),
('403724ec-62f8-42a0-8394-552dd485d16c', '2024-04-30', '2024-04-30', '', 'Green house relative humidity is within high level threshold', 0, 8, '7c9485f7-cb48-4b0b-95b5-fb14f886a041', '2024-04-20 01:58:58'),
('ed6f85f1-3999-4b09-a266-a9eef9cf825f', '2024-04-21', '2024-04-23', '', 'Green house CO2 level has reached critically low level', 1, 8, '7c9485f7-cb48-4b0b-95b5-fb14f886a041', '2024-04-20 01:58:59'),
('44cf0618-9f22-4402-8579-aef0ccf61d70', '2024-04-22', '2024-04-26', '', 'Green house illumination intensity has reached critically low level', 1, 8, '7c9485f7-cb48-4b0b-95b5-fb14f886a041', '2024-04-20 01:58:59'),
('30089320-3efd-4531-808a-c1ec89427977', '2024-04-30', '2024-04-30', '', 'Green house relative humidity is within high level threshold', 0, 8, '7fb283ce-57b8-404a-b9d8-8cfa6a3b5df8', '2024-04-20 02:03:57'),
('f7985fb8-b87b-49a4-919a-26393e9acb53', '2024-04-23', '2024-04-21', '', 'Green house CO2 level has reached critically low level', 1, 8, '7fb283ce-57b8-404a-b9d8-8cfa6a3b5df8', '2024-04-20 02:03:58'),
('be8c3bca-6a86-410a-b04d-bca103337c87', '2024-04-26', '2024-04-28', '', 'Green house illumination intensity has reached critically low level', 1, 8, '7fb283ce-57b8-404a-b9d8-8cfa6a3b5df8', '2024-04-20 02:03:58'),
('1893b443-9211-4a6e-a257-c780d55c3080', '2024-04-21', '2024-04-25', '', 'Green house relative humidity is within high level threshold', 0, 8, 'e0b24e5f-7f95-401f-b51a-b2576982998f', '2024-04-20 02:08:58'),
('10bdf4f6-c006-420a-a622-0b52dec9236e', '2024-04-23', '2024-04-21', '', 'Green house CO2 level has reached critically low level', 1, 8, 'e0b24e5f-7f95-401f-b51a-b2576982998f', '2024-04-20 02:08:58'),
('99825d92-d3b2-4c00-8f53-161f718c5e4a', '2024-04-24', '2024-04-23', '', 'Green house illumination intensity has reached critically low level', 1, 8, 'e0b24e5f-7f95-401f-b51a-b2576982998f', '2024-04-20 02:08:58'),
('25bf5b14-1ffa-427b-abab-861340dcbad7', '2024-04-28', '2024-04-28', '', 'Green house relative humidity is within high level threshold', 0, 8, '7b357e84-a1ea-4f54-923c-d895bce90987', '2024-04-20 02:13:58'),
('2f6317c1-d442-4c77-a01b-4dc668602468', '2024-04-30', '2024-04-30', '', 'Green house CO2 level has reached critically low level', 1, 8, '7b357e84-a1ea-4f54-923c-d895bce90987', '2024-04-20 02:13:58'),
('dc256f52-8e4f-4ab8-bd0d-4ce5f17ddb4b', '2024-04-20', '2024-04-23', '', 'Green house illumination intensity has reached critically low level', 1, 8, '7b357e84-a1ea-4f54-923c-d895bce90987', '2024-04-20 02:13:59'),
('c9b04ccc-2d43-489a-befe-a1e4a6a43f56', '2024-04-21', '2024-04-26', '', 'Green house relative humidity is within high level threshold', 0, 8, '0379ac30-3700-41eb-8aec-27e0442c08de', '2024-04-20 02:18:59'),
('07bec0a3-a153-4998-ae59-7f022c0fe857', '2024-04-23', '2024-04-21', '', 'Green house CO2 level has reached critically low level', 1, 8, '0379ac30-3700-41eb-8aec-27e0442c08de', '2024-04-20 02:18:59'),
('21363741-d272-4614-be16-e457d4707c16', '2024-04-24', '2024-04-30', '', 'Green house illumination intensity has reached critically low level', 1, 8, '0379ac30-3700-41eb-8aec-27e0442c08de', '2024-04-20 02:18:59'),
('2619cb7a-ffa0-4844-9aa2-9b619a656626', '2024-05-01', '2024-04-20', '', 'Green house relative humidity is within high level threshold', 0, 8, '85e44af7-eeeb-4b49-abf9-2fc222a8d5c6', '2024-04-20 02:23:58'),
('6a720250-a1ea-4391-9dd7-aa51d6d91a3b', '2024-04-21', '2024-04-22', '', 'Green house CO2 level has reached critically low level', 1, 8, '85e44af7-eeeb-4b49-abf9-2fc222a8d5c6', '2024-04-20 02:23:59'),
('9fca7b0d-0ea1-4182-ab8b-f73fab7d3a2a', '2024-04-23', '2024-04-20', '', 'Green house illumination intensity has reached critically low level', 1, 8, '85e44af7-eeeb-4b49-abf9-2fc222a8d5c6', '2024-04-20 02:23:59'),
('75921feb-914a-486d-a281-56212c688859', '2024-04-27', '2024-04-23', '', 'Green house relative humidity is within high level threshold', 0, 8, 'a9616d7e-f2e4-411c-a9bf-e8ec7deae6b1', '2024-04-20 02:28:58'),
('37022b4f-f7c7-4eb4-8cd3-91e9ddae06ff', '2024-04-30', '2024-04-30', '', 'Green house CO2 level has reached critically low level', 1, 8, 'a9616d7e-f2e4-411c-a9bf-e8ec7deae6b1', '2024-04-20 02:28:58'),
('12fa1fe5-f3a0-43e9-8cd9-42bf322831a2', '2024-04-20', '2024-04-29', '', 'Green house illumination intensity has reached critically low level', 1, 8, 'a9616d7e-f2e4-411c-a9bf-e8ec7deae6b1', '2024-04-20 02:28:59'),
('89574f6e-28bf-4a41-9f8b-cab229fc5ad9', '2024-04-21', '2024-04-21', '', 'Green house relative humidity is within high level threshold', 0, 8, 'c24baa22-a1ac-475f-84f7-58c79d3df0c6', '2024-04-20 02:33:58'),
('5c44ccfa-38d3-43b5-9f53-624bd8b669bb', '2024-04-20', '2024-04-24', '', 'Green house CO2 level has reached critically low level', 1, 8, 'c24baa22-a1ac-475f-84f7-58c79d3df0c6', '2024-04-20 02:33:58'),
('c813f1e5-5d98-4e4d-aaae-4306c3eb1824', '2024-04-25', '2024-04-26', '', 'Green house illumination intensity has reached critically low level', 1, 8, 'c24baa22-a1ac-475f-84f7-58c79d3df0c6', '2024-04-20 02:33:58'),
('4ab523e3-fb2e-45be-851e-9b637f39b786', '2024-04-21', '2024-04-21', '', 'Green house relative humidity is within high level threshold', 0, 8, '280107e3-802c-46ed-9b4a-64d248cac4f1', '2024-04-20 02:38:59'),
('6aa3a13d-1c1e-4287-9f84-1b6167dbc2b3', '2024-04-25', '2024-04-21', '', 'Green house CO2 level has reached critically low level', 1, 8, '280107e3-802c-46ed-9b4a-64d248cac4f1', '2024-04-20 02:38:59'),
('ce6dd240-e4ce-4fd8-b031-1d8a64c0a611', '2024-04-27', '2024-05-01', '', 'Green house illumination intensity has reached critically low level', 1, 8, '280107e3-802c-46ed-9b4a-64d248cac4f1', '2024-04-20 02:38:59'),
('4f4aead8-9804-4d78-a873-f84cc26cd9cc', '2024-04-30', '2024-04-28', '', 'Green house relative humidity is within high level threshold', 0, 8, '7edeaaf3-22cd-4c81-84f5-5fdcff4e39fc', '2024-04-20 02:43:58'),
('c81fef2d-df01-463d-af17-96a0c647406d', '2024-05-01', '2024-04-24', '', 'Green house CO2 level has reached critically low level', 1, 8, '7edeaaf3-22cd-4c81-84f5-5fdcff4e39fc', '2024-04-20 02:43:58'),
('7b1ce348-b6a3-44f9-bd1a-28d05918ed72', '2024-04-21', '2024-04-20', '', 'Green house illumination intensity has reached critically low level', 1, 8, '7edeaaf3-22cd-4c81-84f5-5fdcff4e39fc', '2024-04-20 02:43:59'),
('d307a053-434a-4bb8-972c-545aa29d98dc', '2024-04-23', '2024-04-28', '', 'Green house relative humidity is within high level threshold', 0, 8, '9639c580-14df-4b92-bf8e-11b26bd3daa2', '2024-04-20 02:48:58'),
('b7e3e1c0-7730-45b5-8271-177d0b79ed43', '2024-04-26', '2024-04-21', '', 'Green house CO2 level has reached critically low level', 1, 8, '9639c580-14df-4b92-bf8e-11b26bd3daa2', '2024-04-20 02:48:58'),
('792e3f85-2494-4918-aede-ec20dc982e65', '2024-04-20', '2024-04-22', '', 'Green house illumination intensity has reached critically low level', 1, 8, '9639c580-14df-4b92-bf8e-11b26bd3daa2', '2024-04-20 02:48:58'),
('c7ea5b90-197a-4c07-b8e6-a39372d4d036', '2024-04-24', '2024-05-01', '', 'Green house relative humidity is within high level threshold', 0, 8, '68ef2075-9c5f-4b8a-a809-9017a5df5e0e', '2024-04-20 02:53:58'),
('131e9755-8b97-4a1a-b57d-6ef8793f82c5', '2024-04-27', '2024-04-20', '', 'Green house CO2 level has reached critically low level', 1, 8, '68ef2075-9c5f-4b8a-a809-9017a5df5e0e', '2024-04-20 02:53:58'),
('36ee4dc7-6bd0-4a58-a8a1-07fb0e1ec2b8', '2024-04-29', '2024-04-26', '', 'Green house illumination intensity has reached critically low level', 1, 8, '68ef2075-9c5f-4b8a-a809-9017a5df5e0e', '2024-04-20 02:53:58'),
('2c6313ae-eac9-4d8c-aba9-d3d05100e4cf', '2024-04-20', '2024-04-21', '', 'Green house relative humidity is within high level threshold', 0, 8, '924f325b-07d5-4901-b1fd-ff978116fb50', '2024-04-20 02:58:58'),
('06f9b008-65e9-4975-96bd-92a98b9a2f9c', '2024-04-22', '2024-04-21', '', 'Green house CO2 level has reached critically low level', 1, 8, '924f325b-07d5-4901-b1fd-ff978116fb50', '2024-04-20 02:58:58'),
('69382a9e-d810-46ed-a659-880e614b9a5f', '2024-04-24', '2024-04-21', '', 'Green house illumination intensity has reached critically low level', 1, 8, '924f325b-07d5-4901-b1fd-ff978116fb50', '2024-04-20 02:58:58'),
('26c1d380-0b9f-455e-adf2-def4b618f874', '2024-04-28', '2024-04-21', '', 'Green house relative humidity is within high level threshold', 0, 8, 'e8400513-05d2-4b40-818b-21bf96ae81c9', '2024-04-20 03:03:58'),
('b0ee37e5-1800-464e-8ef8-807516e5f44d', '2024-04-30', '2024-04-20', '', 'Green house CO2 level has reached critically low level', 1, 8, 'e8400513-05d2-4b40-818b-21bf96ae81c9', '2024-04-20 03:03:58'),
('62ac1db1-1655-4437-9a92-8bc9bc0cf4cc', '2024-04-20', '2024-04-28', '', 'Green house illumination intensity has reached critically low level', 1, 8, 'e8400513-05d2-4b40-818b-21bf96ae81c9', '2024-04-20 03:03:59'),
('eda1f783-4502-4c44-b7dd-f840c8bd977f', '2024-04-22', '2024-04-22', '', 'Green house relative humidity is within high level threshold', 0, 8, '795aee78-f208-43d1-9996-b798e81deb51', '2024-04-20 03:08:59'),
('2fb9530f-ec6c-41df-8176-377591afda61', '2024-04-24', '2024-04-27', '', 'Green house CO2 level has reached critically low level', 1, 8, '795aee78-f208-43d1-9996-b798e81deb51', '2024-04-20 03:08:59'),
('a1c90df4-f4d0-450f-9f21-6b979b7c6132', '2024-04-27', '2024-04-20', '', 'Green house illumination intensity has reached critically low level', 1, 8, '795aee78-f208-43d1-9996-b798e81deb51', '2024-04-20 03:08:59'),
('10a40ff3-a5da-4983-a2ea-89b63f50556c', '2024-04-22', '2024-04-27', '', 'Green house relative humidity is within high level threshold', 0, 8, '2c90eb91-2c5c-445b-9207-da145f7c5775', '2024-04-20 03:13:58'),
('5e6dffa9-7c36-4d2b-8c74-ebcb168739bb', '2024-04-24', '2024-04-28', '', 'Green house CO2 level has reached critically low level', 1, 8, '2c90eb91-2c5c-445b-9207-da145f7c5775', '2024-04-20 03:13:58'),
('4078b877-767b-43eb-a040-4c72cb53300e', '2024-04-26', '2024-04-29', '', 'Green house illumination intensity has reached critically low level', 1, 8, '2c90eb91-2c5c-445b-9207-da145f7c5775', '2024-04-20 03:13:58'),
('b84062ee-8233-4bbe-af1a-07a22a372353', '2024-04-23', '2024-04-20', '', 'Green house relative humidity is within high level threshold', 0, 8, '9f643996-32d3-413d-ba82-37e5bef0282b', '2024-04-20 03:18:58'),
('aa7e1901-c7ca-4a85-9674-7001c832bf44', '2024-04-26', '2024-04-28', '', 'Green house CO2 level has reached critically low level', 1, 8, '9f643996-32d3-413d-ba82-37e5bef0282b', '2024-04-20 03:18:58'),
('1be950d6-0ac0-4e04-8169-a3c7c12346eb', '2024-04-28', '2024-04-26', '', 'Green house illumination intensity has reached critically low level', 1, 8, '9f643996-32d3-413d-ba82-37e5bef0282b', '2024-04-20 03:18:58'),
('15d65438-0b19-487c-9678-7e6a2c529d68', '2024-04-26', '2024-04-30', '', 'Green house relative humidity is within high level threshold', 0, 8, 'b163755b-e890-491e-87ec-79187f8cdef4', '2024-04-20 03:23:58'),
('d02710f9-c676-4110-8a2f-5b6b17e3bf42', '2024-04-29', '2024-04-24', '', 'Green house CO2 level has reached critically low level', 1, 8, 'b163755b-e890-491e-87ec-79187f8cdef4', '2024-04-20 03:23:58'),
('9ab757d6-919d-44cf-86a0-687c2d45e3aa', '2024-05-01', '2024-05-01', '', 'Green house illumination intensity has reached critically low level', 1, 8, 'b163755b-e890-491e-87ec-79187f8cdef4', '2024-04-20 03:23:58'),
('2dbbed12-d3df-46ab-9930-38e634b2b5db', '2024-04-22', '2024-04-26', '', 'Green house relative humidity is within high level threshold', 0, 8, '56c1de03-6063-4db4-8f42-27a051639909', '2024-04-20 03:28:59'),
('c0c7aae9-3181-472d-9bf3-278402c83a62', '2024-04-25', '2024-04-29', '', 'Green house CO2 level has reached critically low level', 1, 8, '56c1de03-6063-4db4-8f42-27a051639909', '2024-04-20 03:28:59'),
('05e2ad8d-f162-436d-993d-9f774c011667', '2024-04-26', '2024-04-26', '', 'Green house illumination intensity has reached critically low level', 1, 8, '56c1de03-6063-4db4-8f42-27a051639909', '2024-04-20 03:28:59'),
('2134fc99-daaa-4c72-afb8-aa563a1af1b6', '2024-04-29', '2024-04-28', '', 'Green house relative humidity is within high level threshold', 0, 8, '76dfd50a-58fa-4d2d-b151-dd10fbfb9cb4', '2024-04-20 03:33:58'),
('24b46467-c728-4232-bac6-a9eece493580', '2024-04-30', '2024-05-01', '', 'Green house CO2 level has reached critically low level', 1, 8, '76dfd50a-58fa-4d2d-b151-dd10fbfb9cb4', '2024-04-20 03:33:58'),
('221583e5-22c8-457b-8e0e-fec8ba2d97bf', '2024-04-20', '2024-04-26', '', 'Green house illumination intensity has reached critically low level', 1, 8, '76dfd50a-58fa-4d2d-b151-dd10fbfb9cb4', '2024-04-20 03:33:59'),
('99be8133-9d11-4635-a738-cacfeb5e69d9', '2024-04-26', '2024-04-28', '', 'Green house relative humidity is within high level threshold', 0, 8, '9558b106-9971-44b6-a4ba-4da0e9c2e001', '2024-04-20 03:38:57'),
('b56ab88d-60fb-4b2f-90dd-abf00e5f8a2b', '2024-04-27', '2024-04-24', '', 'Green house CO2 level has reached critically low level', 1, 8, '9558b106-9971-44b6-a4ba-4da0e9c2e001', '2024-04-20 03:38:57'),
('79db9ef4-e517-427c-982a-c6424f5c5cdf', '2024-04-28', '2024-04-25', '', 'Green house illumination intensity has reached critically low level', 1, 8, '9558b106-9971-44b6-a4ba-4da0e9c2e001', '2024-04-20 03:38:57'),
('eab8dd85-ed84-40d2-9129-58618914a234', '2024-04-30', '2024-04-20', '', 'Green house relative humidity is within high level threshold', 0, 8, 'c850f4dd-73ec-4059-94a1-9543a14f80af', '2024-04-20 03:43:57'),
('febdfdec-8a78-4871-aad4-aeb07e3f58a5', '2024-04-20', '2024-04-24', '', 'Green house CO2 level has reached critically low level', 1, 8, 'c850f4dd-73ec-4059-94a1-9543a14f80af', '2024-04-20 03:43:58'),
('5e5d8178-fa20-42d0-b533-4d6218c0a400', '2024-04-20', '2024-04-25', '', 'Green house illumination intensity has reached critically low level', 1, 8, 'c850f4dd-73ec-4059-94a1-9543a14f80af', '2024-04-20 03:43:58'),
('2ccb5aef-8148-4345-bad5-02af85ae0e79', '2024-04-24', '2024-04-20', '', 'Green house relative humidity is within high level threshold', 0, 8, '400c2733-fdfc-40ff-9b6c-a287f4f2dd34', '2024-04-20 03:48:59');

-- --------------------------------------------------------

--
-- Table structure for table `useraccounts`
--

CREATE TABLE `useraccounts` (
  `id` int(11) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `useraccounts`
--

INSERT INTO `useraccounts` (`id`, `fname`, `lname`, `email`, `username`, `password`, `created_at`) VALUES
(2, 'Ali', 'Atlantis', 'atlantismail@email.com', 'usernametry', '2MDyjIbr7XvDVbaC9+rKY1gfuUwwBzpSboQP9/qNiB5J33dYDMiruvQAzj/aBTC4', '2025-02-13 06:16:23');

-- --------------------------------------------------------

--
-- Table structure for table `water_bed`
--

CREATE TABLE `water_bed` (
  `id` varchar(36) NOT NULL,
  `created_at` varchar(35) NOT NULL,
  `updated_at` varchar(35) NOT NULL,
  `deleted_at` varchar(30) DEFAULT NULL,
  `water_temperature` decimal(11,8) NOT NULL,
  `dissolved_o2_level` decimal(11,9) NOT NULL,
  `electrical_conductivity` int(11) NOT NULL,
  `total_dissolved_solids` int(11) NOT NULL,
  `nitrate` decimal(11,6) NOT NULL,
  `nitrite` decimal(11,8) NOT NULL,
  `ammonia` decimal(11,9) NOT NULL,
  `ph_level` decimal(11,9) NOT NULL,
  `timestamp` varchar(16) NOT NULL,
  `sensor_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `water_bed`
--

INSERT INTO `water_bed` (`id`, `created_at`, `updated_at`, `deleted_at`, `water_temperature`, `dissolved_o2_level`, `electrical_conductivity`, `total_dissolved_solids`, `nitrate`, `nitrite`, `ammonia`, `ph_level`, `timestamp`, `sensor_id`) VALUES
('c0962865-c848-4ae9-8bf8-ef2d3421a72c', '2024-04-15 23:59:31.944358836+08:00', '2024-04-15 23:59:31.944358836+08:00', NULL, 27.60000038, 3.069999933, 540, 418, 3447.399902, 31.00000000, 0.389999986, 7.349999905, '16/04/2024 00:00', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('e7f9f551-ed67-4b19-91e8-23b3be4c458d', '2024-04-16 00:04:31.821272838+08:00', '2024-04-16 00:04:31.821272838+08:00', NULL, 27.60000038, 3.039999962, 540, 421, 3447.399902, 30.79999924, 0.389999986, 7.349999905, '16/04/2024 00:05', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('1704f36a-51a8-4844-ae3e-58ce56bc3e39', '2024-04-16 00:09:32.534422051+08:00', '2024-04-16 00:09:32.534422051+08:00', NULL, 27.60000038, 3.099999905, 540, 421, 3447.399902, 31.10000038, 0.389999986, 7.349999905, '16/04/2024 00:10', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('07af002d-3626-4dbc-9fbb-2472d16fa1bd', '2024-04-16 00:14:32.275480128+08:00', '2024-04-16 00:14:32.275480128+08:00', NULL, 27.60000038, 3.259999990, 540, 421, 3447.399902, 31.10000038, 0.389999986, 7.329999924, '16/04/2024 00:15', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('49aaf681-d56c-4ee9-87a7-a815b216597f', '2024-04-16 00:19:32.618999996+08:00', '2024-04-16 00:19:32.618999996+08:00', NULL, 27.60000038, 3.990000010, 540, 421, 3447.399902, 30.89999962, 0.389999986, 7.349999905, '16/04/2024 00:20', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('a247691a-bb8a-4f56-975d-65e65e8ccec3', '2024-04-16 00:24:31.410140308+08:00', '2024-04-16 00:24:31.410140308+08:00', NULL, 27.60000038, 3.910000086, 540, 421, 3447.399902, 31.10000038, 0.389999986, 7.349999905, '16/04/2024 00:25', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('33a8a1db-6386-409d-9693-7cba162f43a3', '2024-04-16 00:29:32.02603173+08:00', '2024-04-16 00:29:32.02603173+08:00', NULL, 27.60000038, 4.090000153, 540, 421, 3447.399902, 31.00000000, 0.389999986, 7.349999905, '16/04/2024 00:30', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('5cb1ce15-de12-431b-a6ab-8320ab2d6dc1', '2024-04-16 00:34:32.765405511+08:00', '2024-04-16 00:34:32.765405511+08:00', NULL, 27.60000038, 3.779999971, 540, 421, 3447.399902, 31.10000038, 0.389999986, 7.349999905, '16/04/2024 00:35', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('2f39f36f-976d-4f42-9b44-a35a728a9fd0', '2024-04-16 00:39:32.028479517+08:00', '2024-04-16 00:39:32.028479517+08:00', NULL, 27.50000000, 3.819999933, 540, 421, 3447.399902, 31.50000000, 0.389999986, 7.349999905, '16/04/2024 00:40', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('498d3697-cb5a-4ee2-99d7-411494a95d40', '2024-04-16 00:44:32.557883713+08:00', '2024-04-16 00:44:32.557883713+08:00', NULL, 27.60000038, 3.509999990, 541, 421, 3447.399902, 30.89999962, 0.389999986, 7.349999905, '16/04/2024 00:45', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('9dd41111-7a5c-4de2-80b9-7efbc9b90817', '2024-04-16 00:49:30.829086665+08:00', '2024-04-16 00:49:30.829086665+08:00', NULL, 27.50000000, 3.309999943, 541, 419, 3447.399902, 31.10000038, 0.389999986, 7.349999905, '16/04/2024 00:50', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('70516b29-4638-40af-be94-3a3a3f48dd0d', '2024-04-16 00:54:31.23348292+08:00', '2024-04-16 00:54:31.23348292+08:00', NULL, 27.50000000, 3.730000019, 541, 421, 3447.399902, 31.10000038, 0.389999986, 7.329999924, '16/04/2024 00:55', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('5f8ce625-78d0-43e8-b153-fd6d5ad18ade', '2024-04-16 00:59:30.808196335+08:00', '2024-04-16 00:59:30.808196335+08:00', NULL, 27.50000000, 5.260000229, 541, 417, 3447.399902, 31.20000076, 0.389999986, 7.329999924, '16/04/2024 01:00', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('88380868-2875-46f2-a10f-3b68d8fe8731', '2024-04-16 01:04:32.135539914+08:00', '2024-04-16 01:04:32.135539914+08:00', NULL, 27.50000000, 5.329999924, 541, 421, 3447.399902, 30.60000038, 0.389999986, 7.329999924, '16/04/2024 01:05', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('671c3f19-9d74-42a0-ae76-ca2dfb70306f', '2024-04-16 01:09:31.159005152+08:00', '2024-04-16 01:09:31.159005152+08:00', NULL, 27.50000000, 6.599999905, 541, 421, 3447.399902, 31.39999962, 0.389999986, 7.329999924, '16/04/2024 01:10', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('66fccdab-54f7-4974-a334-5c228e175103', '2024-04-16 01:14:32.548253583+08:00', '2024-04-16 01:14:32.548253583+08:00', NULL, 27.50000000, 5.940000057, 541, 421, 3447.399902, 31.10000038, 0.389999986, 7.329999924, '16/04/2024 01:15', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('a09df4a1-19b5-4c16-8c8e-43db5ff4412b', '2024-04-16 01:19:31.582980551+08:00', '2024-04-16 01:19:31.582980551+08:00', NULL, 27.50000000, 4.809999943, 541, 421, 3447.399902, 31.29999924, 0.389999986, 7.329999924, '16/04/2024 01:20', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('8e8dd571-ff3c-489a-9bc8-adca621b8508', '2024-04-16 01:24:31.582281768+08:00', '2024-04-16 01:24:31.582281768+08:00', NULL, 27.50000000, 4.480000019, 541, 421, 3447.399902, 31.00000000, 0.389999986, 7.329999924, '16/04/2024 01:25', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('a0369600-2d51-4c51-894a-8837df84b4e3', '2024-04-16 01:29:32.685836839+08:00', '2024-04-16 01:29:32.685836839+08:00', NULL, 27.50000000, 4.000000000, 541, 421, 3447.399902, 31.39999962, 0.389999986, 7.329999924, '16/04/2024 01:30', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('61ce389d-abf2-4759-8c65-eb679a8ee0c0', '2024-04-16 01:34:31.742879864+08:00', '2024-04-16 01:34:31.742879864+08:00', NULL, 27.50000000, 4.380000114, 541, 421, 3447.399902, 30.89999962, 0.389999986, 7.329999924, '16/04/2024 01:35', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('2c5be52d-9812-489f-af32-f1491ad80993', '2024-04-16 01:39:31.746631095+08:00', '2024-04-16 01:39:31.746631095+08:00', NULL, 27.50000000, 6.440000057, 541, 417, 3447.399902, 31.00000000, 0.389999986, 7.349999905, '16/04/2024 01:40', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('9bc5eeff-091f-480c-b4cf-c245b2305bca', '2024-04-16 01:44:32.575770184+08:00', '2024-04-16 01:44:32.575770184+08:00', NULL, 27.39999962, 6.380000114, 541, 417, 3447.399902, 30.70000076, 0.389999986, 7.349999905, '16/04/2024 01:45', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('38c02dbf-96be-4496-a524-facb4e2753db', '2024-04-16 01:49:31.985733619+08:00', '2024-04-16 01:49:31.985733619+08:00', NULL, 27.39999962, 5.000000000, 541, 417, 3447.399902, 30.70000076, 0.389999986, 7.329999924, '16/04/2024 01:50', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('509a0790-50bd-40a1-9db9-0fac4055979f', '2024-04-16 01:54:31.642273954+08:00', '2024-04-16 01:54:31.642273954+08:00', NULL, 27.39999962, 5.199999809, 538, 421, 3447.399902, 31.00000000, 0.389999986, 7.349999905, '16/04/2024 01:55', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('571e6392-8349-4820-b324-6c7236a5610d', '2024-04-16 01:59:32.952873284+08:00', '2024-04-16 01:59:32.952873284+08:00', NULL, 27.39999962, 5.480000019, 542, 419, 3447.399902, 31.10000038, 0.389999986, 7.349999905, '16/04/2024 02:00', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('3155fa7b-5b85-45e6-b296-eadfe8f1b5d8', '2024-04-16 02:04:32.007665358+08:00', '2024-04-16 02:04:32.007665358+08:00', NULL, 27.39999962, 4.969999790, 540, 416, 3447.399902, 30.60000038, 0.389999986, 7.329999924, '16/04/2024 02:05', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('f365d98c-4a51-4a28-a5af-85170a142c46', '2024-04-16 02:09:31.384583132+08:00', '2024-04-16 02:09:31.384583132+08:00', NULL, 27.39999962, 5.650000095, 540, 417, 3447.399902, 31.29999924, 0.389999986, 7.349999905, '16/04/2024 02:10', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('f79605ba-ff30-45ea-8e27-0a18e7721862', '2024-04-16 02:14:32.006795443+08:00', '2024-04-16 02:14:32.006795443+08:00', NULL, 27.29999924, 4.829999924, 542, 421, 3447.399902, 31.20000076, 0.389999986, 7.349999905, '16/04/2024 02:15', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('220ecb5b-0dcf-473c-8b68-2ffe619cc753', '2024-04-16 02:19:31.535999498+08:00', '2024-04-16 02:19:31.535999498+08:00', NULL, 27.39999962, 4.469999790, 542, 421, 3447.399902, 31.29999924, 0.389999986, 7.349999905, '16/04/2024 02:20', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('787cb697-39cf-4317-8b53-17ed70b47956', '2024-04-16 02:24:31.489878308+08:00', '2024-04-16 02:24:31.489878308+08:00', NULL, 27.29999924, 3.720000029, 540, 419, 3447.399902, 30.89999962, 0.389999986, 7.349999905, '16/04/2024 02:25', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('9894f5b7-a65b-440e-8dd6-6192f73ae801', '2024-04-16 02:29:31.779100041+08:00', '2024-04-16 02:29:31.779100041+08:00', NULL, 27.29999924, 4.090000153, 541, 419, 3447.399902, 31.10000038, 0.389999986, 7.349999905, '16/04/2024 02:30', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('8bd31cb9-ce18-47a0-b620-ab94b4e2eae6', '2024-04-16 02:34:32.371681359+08:00', '2024-04-16 02:34:32.371681359+08:00', NULL, 27.39999962, 3.980000019, 541, 419, 3447.399902, 31.10000038, 0.389999986, 7.349999905, '16/04/2024 02:35', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('a2f43cfb-e12a-4941-af99-699ac428c0b2', '2024-04-16 02:39:32.177614191+08:00', '2024-04-16 02:39:32.177614191+08:00', NULL, 27.29999924, 3.470000029, 541, 419, 3447.399902, 30.89999962, 0.389999986, 7.349999905, '16/04/2024 02:40', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('fd9b9f1e-fa59-4e74-9564-ad6a0dbfd8ff', '2024-04-16 02:44:32.523364301+08:00', '2024-04-16 02:44:32.523364301+08:00', NULL, 27.29999924, 3.319999933, 541, 419, 3447.399902, 31.00000000, 0.389999986, 7.349999905, '16/04/2024 02:45', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('df4bead1-69bc-438a-8de8-36bb3c0b6769', '2024-04-16 02:49:32.929752374+08:00', '2024-04-16 02:49:32.929752374+08:00', NULL, 27.29999924, 4.329999924, 541, 419, 3447.399902, 30.89999962, 0.389999986, 7.349999905, '16/04/2024 02:50', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('50a13db4-33e1-4354-b1be-5570579acc0e', '2024-04-16 02:54:25.82196108+08:00', '2024-04-16 02:54:25.82196108+08:00', NULL, 27.29999924, 4.449999809, 541, 422, 3447.399902, 30.89999962, 0.389999986, 7.349999905, '16/04/2024 02:55', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('6116054c-677c-4f18-94c4-0002949196dd', '2024-04-16 02:59:31.075105763+08:00', '2024-04-16 02:59:31.075105763+08:00', NULL, 27.29999924, 4.860000134, 541, 422, 3447.399902, 31.29999924, 0.389999986, 7.329999924, '16/04/2024 03:00', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('57084fb0-e7d5-450e-b079-f9757c8caeda', '2024-04-16 03:04:32.746206992+08:00', '2024-04-16 03:04:32.746206992+08:00', NULL, 27.29999924, 4.420000076, 541, 421, 3447.399902, 31.10000038, 0.389999986, 7.329999924, '16/04/2024 03:05', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('7e85d7fa-3dd3-476e-9daf-6b95b0f80bc3', '2024-04-16 03:09:31.624560054+08:00', '2024-04-16 03:09:31.624560054+08:00', NULL, 27.29999924, 4.550000191, 541, 421, 3447.399902, 31.29999924, 0.389999986, 7.349999905, '16/04/2024 03:10', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('aa1e1004-c4c2-40a1-ab37-b3b900c57259', '2024-04-16 03:14:31.990611749+08:00', '2024-04-16 03:14:31.990611749+08:00', NULL, 27.29999924, 4.909999847, 541, 422, 3447.399902, 31.00000000, 0.389999986, 7.349999905, '16/04/2024 03:15', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('d5174595-3f87-4957-984c-d810f1f0b40b', '2024-04-16 03:19:32.317231483+08:00', '2024-04-16 03:19:32.317231483+08:00', NULL, 27.29999924, 5.010000229, 541, 421, 3447.399902, 31.10000038, 0.389999986, 7.349999905, '16/04/2024 03:20', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('5411d2af-6a5c-4b2a-a594-4631b32b5f95', '2024-04-16 03:24:32.121040544+08:00', '2024-04-16 03:24:32.121040544+08:00', NULL, 27.29999924, 4.289999962, 541, 422, 3447.399902, 30.89999962, 0.389999986, 7.349999905, '16/04/2024 03:25', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('e19ef02d-f2ee-402d-8798-32bbe0d55c40', '2024-04-16 03:29:32.169285515+08:00', '2024-04-16 03:29:32.169285515+08:00', NULL, 27.29999924, 4.449999809, 541, 422, 3447.399902, 31.20000076, 0.389999986, 7.349999905, '16/04/2024 03:30', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('fb9fb331-9476-46b7-9012-5af857b2f824', '2024-04-16 03:34:32.249393013+08:00', '2024-04-16 03:34:32.249393013+08:00', NULL, 27.29999924, 3.799999952, 541, 422, 3447.399902, 30.89999962, 0.389999986, 7.349999905, '16/04/2024 03:35', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('0714aeae-2034-4f19-87c2-f17ed5d1cb42', '2024-04-16 03:39:31.288994096+08:00', '2024-04-16 03:39:31.288994096+08:00', NULL, 27.20000076, 4.389999866, 541, 421, 3447.399902, 30.89999962, 0.389999986, 7.349999905, '16/04/2024 03:40', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('658c29e3-ea2d-48b0-bdc3-16026e28338d', '2024-04-16 03:44:31.369887147+08:00', '2024-04-16 03:44:31.369887147+08:00', NULL, 27.20000076, 3.940000057, 541, 419, 3447.399902, 31.39999962, 0.389999986, 7.329999924, '16/04/2024 03:45', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('ea864ee4-b9e7-4c37-9f08-4cfc4f153700', '2024-04-16 03:49:32.464396751+08:00', '2024-04-16 03:49:32.464396751+08:00', NULL, 27.20000076, 5.059999943, 541, 422, 3447.399902, 31.00000000, 0.389999986, 7.349999905, '16/04/2024 03:50', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('d4909295-a5a2-4683-bb4f-bf4b3bfb6528', '2024-04-16 03:54:31.749850515+08:00', '2024-04-16 03:54:31.749850515+08:00', NULL, 27.20000076, 4.400000095, 541, 422, 3447.399902, 31.39999962, 0.389999986, 7.369999886, '16/04/2024 03:55', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('e104b385-0dfe-479f-945b-290f18d6fb19', '2024-04-16 03:59:31.934426334+08:00', '2024-04-16 03:59:31.934426334+08:00', NULL, 27.20000076, 4.590000153, 541, 421, 3447.399902, 31.00000000, 0.389999986, 7.349999905, '16/04/2024 04:00', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('886885f9-51f7-42e8-80b8-61119c1806b0', '2024-04-16 04:04:32.451159701+08:00', '2024-04-16 04:04:32.451159701+08:00', NULL, 27.20000076, 5.179999828, 541, 421, 3447.399902, 31.10000038, 0.389999986, 7.369999886, '16/04/2024 04:05', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('ff01fcd6-07af-493c-937c-a569e0c13ef2', '2024-04-16 04:09:31.6027916+08:00', '2024-04-16 04:09:31.6027916+08:00', NULL, 27.10000038, 5.170000076, 541, 422, 3447.399902, 30.60000038, 0.389999986, 7.349999905, '16/04/2024 04:10', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('1189369f-6a83-48ed-a8c1-ec45b63797b6', '2024-04-16 04:14:31.383976918+08:00', '2024-04-16 04:14:31.383976918+08:00', NULL, 27.20000076, 4.449999809, 541, 422, 3447.399902, 30.79999924, 0.389999986, 7.349999905, '16/04/2024 04:15', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('33475888-593d-4a9f-b933-9cf4ba97b336', '2024-04-16 04:19:32.825469827+08:00', '2024-04-16 04:19:32.825469827+08:00', NULL, 27.20000076, 4.179999828, 541, 422, 3447.399902, 30.89999962, 0.389999986, 7.349999905, '16/04/2024 04:20', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('9ba7a7cd-855f-4988-b19b-f345912f617c', '2024-04-16 04:24:31.196077059+08:00', '2024-04-16 04:24:31.196077059+08:00', NULL, 27.10000038, 4.699999809, 541, 422, 3447.399902, 30.79999924, 0.389999986, 7.349999905, '16/04/2024 04:25', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('a669ef93-bc03-4a92-a866-ba02d0632991', '2024-04-16 04:29:32.019195168+08:00', '2024-04-16 04:29:32.019195168+08:00', NULL, 27.20000076, 3.900000095, 542, 424, 3447.399902, 31.50000000, 0.389999986, 7.369999886, '16/04/2024 04:30', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('2526fbea-d9af-40c8-b5f7-ee3f8135147f', '2024-04-16 04:34:32.545155566+08:00', '2024-04-16 04:34:32.545155566+08:00', NULL, 27.10000038, 4.699999809, 541, 424, 3447.399902, 30.79999924, 0.389999986, 7.349999905, '16/04/2024 04:35', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('b1702489-a024-4b6c-9d78-add2d085633a', '2024-04-16 04:39:31.930713718+08:00', '2024-04-16 04:39:31.930713718+08:00', NULL, 27.10000038, 5.019999981, 540, 421, 3447.399902, 30.89999962, 0.389999986, 7.349999905, '16/04/2024 04:40', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('bc98aaf8-0bdd-4a19-a07e-4d73e4c67f8e', '2024-04-16 04:44:32.421790498+08:00', '2024-04-16 04:44:32.421790498+08:00', NULL, 27.10000038, 4.730000019, 540, 425, 3447.399902, 30.89999962, 0.389999986, 7.349999905, '16/04/2024 04:45', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('fb33991b-d9be-4e2c-a5b9-1466301a3605', '2024-04-16 04:49:32.350135622+08:00', '2024-04-16 04:49:32.350135622+08:00', NULL, 27.10000038, 3.730000019, 540, 419, 3447.399902, 31.00000000, 0.389999986, 7.349999905, '16/04/2024 04:50', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('bc7536c0-f582-4cb2-aee1-a381a86cec5d', '2024-04-16 04:54:31.233349721+08:00', '2024-04-16 04:54:31.233349721+08:00', NULL, 27.10000038, 4.030000210, 540, 421, 3447.399902, 31.70000076, 0.389999986, 7.349999905, '16/04/2024 04:55', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('1b16fd44-3680-4482-b4a6-6f05eaa3dda7', '2024-04-16 04:59:32.161990756+08:00', '2024-04-16 04:59:32.161990756+08:00', NULL, 27.10000038, 3.819999933, 540, 421, 3447.399902, 30.60000038, 0.389999986, 7.349999905, '16/04/2024 05:00', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('c916ffc1-89d0-4f90-bb4e-d2ab35cff286', '2024-04-16 05:04:32.591116227+08:00', '2024-04-16 05:04:32.591116227+08:00', NULL, 27.10000038, 4.050000191, 540, 419, 3447.399902, 30.89999962, 0.389999986, 7.349999905, '16/04/2024 05:05', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('875bb1a4-375c-455d-89ef-e851b3599d95', '2024-04-16 05:09:31.441838706+08:00', '2024-04-16 05:09:31.441838706+08:00', NULL, 27.10000038, 4.099999905, 540, 421, 3447.399902, 31.10000038, 0.389999986, 7.349999905, '16/04/2024 05:10', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('f1296e31-6c96-4297-a3e4-87bf3eff93a9', '2024-04-16 05:14:31.977808652+08:00', '2024-04-16 05:14:31.977808652+08:00', NULL, 27.10000038, 4.239999771, 540, 421, 3447.399902, 31.29999924, 0.389999986, 7.349999905, '16/04/2024 05:15', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('fc4ff747-e641-4cb6-9f3e-a9017b587b46', '2024-04-16 05:19:32.485952049+08:00', '2024-04-16 05:19:32.485952049+08:00', NULL, 27.10000038, 4.400000095, 540, 421, 3447.399902, 30.89999962, 0.389999986, 7.369999886, '16/04/2024 05:20', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('496963a8-e925-4991-80a5-1facdc8c5c88', '2024-04-16 05:24:31.894098125+08:00', '2024-04-16 05:24:31.894098125+08:00', NULL, 27.10000038, 4.750000000, 540, 421, 3447.399902, 31.10000038, 0.389999986, 7.369999886, '16/04/2024 05:25', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('c4837da8-40f3-4292-a5b6-45057ae269b1', '2024-04-16 05:29:31.889893857+08:00', '2024-04-16 05:29:31.889893857+08:00', NULL, 27.10000038, 4.530000210, 538, 419, 3447.399902, 30.89999962, 0.389999986, 7.349999905, '16/04/2024 05:30', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('2d63b690-d523-44a5-8a19-ce67b4aa1d86', '2024-04-16 05:34:32.799332607+08:00', '2024-04-16 05:34:32.799332607+08:00', NULL, 27.10000038, 4.099999905, 540, 421, 3447.399902, 30.60000038, 0.389999986, 7.369999886, '16/04/2024 05:35', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('f6845555-89b4-4898-bbc8-bc7e1c59504c', '2024-04-16 05:39:31.353693156+08:00', '2024-04-16 05:39:31.353693156+08:00', NULL, 27.10000038, 4.150000095, 540, 421, 3447.399902, 31.00000000, 0.389999986, 7.369999886, '16/04/2024 05:40', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('b98e8b11-91df-4c31-b207-802113b26927', '2024-04-16 05:44:32.006222031+08:00', '2024-04-16 05:44:32.006222031+08:00', NULL, 27.10000038, 4.570000172, 541, 421, 3447.399902, 30.60000038, 0.389999986, 7.349999905, '16/04/2024 05:45', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('bfd0724e-f147-43ab-91ed-16eff93a330d', '2024-04-16 05:49:32.435664674+08:00', '2024-04-16 05:49:32.435664674+08:00', NULL, 27.10000038, 5.150000095, 538, 421, 3447.399902, 30.89999962, 0.389999986, 7.349999905, '16/04/2024 05:50', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('c2264c1b-1be9-4647-bf4a-b643ca9cb588', '2024-04-16 05:54:31.831837473+08:00', '2024-04-16 05:54:31.831837473+08:00', NULL, 27.10000038, 4.599999905, 538, 418, 3447.399902, 30.79999924, 0.389999986, 7.349999905, '16/04/2024 05:55', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('5bed2ef8-b462-4e58-bc9a-af222611a8c3', '2024-04-16 05:59:31.8502619+08:00', '2024-04-16 05:59:31.8502619+08:00', NULL, 27.10000038, 3.940000057, 538, 421, 3447.399902, 31.10000038, 0.389999986, 7.369999886, '16/04/2024 06:00', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('dbf2db2a-18e0-4f9a-993e-ba4eb838bdec', '2024-04-16 06:04:32.575714393+08:00', '2024-04-16 06:04:32.575714393+08:00', NULL, 27.10000038, 4.090000153, 538, 418, 3447.399902, 31.20000076, 0.389999986, 7.369999886, '16/04/2024 06:05', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('065ff67b-b77d-499e-a464-3c1f54cb488d', '2024-04-16 06:09:31.690726005+08:00', '2024-04-16 06:09:31.690726005+08:00', NULL, 27.00000000, 4.739999771, 538, 422, 3447.399902, 31.39999962, 0.389999986, 7.369999886, '16/04/2024 06:10', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('699c0afb-ac65-4383-b6b9-5afefd043644', '2024-04-16 06:14:31.911292069+08:00', '2024-04-16 06:14:31.911292069+08:00', NULL, 27.00000000, 4.800000191, 538, 419, 3447.399902, 31.10000038, 0.389999986, 7.369999886, '16/04/2024 06:15', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('546a7e28-dea7-461c-af02-ab14efb4ff43', '2024-04-16 06:19:32.268527012+08:00', '2024-04-16 06:19:32.268527012+08:00', NULL, 27.00000000, 4.039999962, 538, 421, 3447.399902, 31.00000000, 0.389999986, 7.369999886, '16/04/2024 06:20', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('dc8ec54d-2314-4a1f-b013-45fc0b41bc58', '2024-04-16 06:24:31.897388056+08:00', '2024-04-16 06:24:31.897388056+08:00', NULL, 27.00000000, 5.059999943, 538, 419, 3447.399902, 30.89999962, 0.389999986, 7.369999886, '16/04/2024 06:25', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('5484d44e-a11f-40ca-ad70-2a3a4259a624', '2024-04-16 06:29:31.497738411+08:00', '2024-04-16 06:29:31.497738411+08:00', NULL, 27.00000000, 4.440000057, 538, 421, 3447.399902, 31.10000038, 0.389999986, 7.369999886, '16/04/2024 06:30', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('3e473813-6f0b-46f5-8726-65aec4511f5f', '2024-04-16 06:34:31.753260581+08:00', '2024-04-16 06:34:31.753260581+08:00', NULL, 27.10000038, 4.960000038, 538, 422, 3447.399902, 31.00000000, 0.389999986, 7.369999886, '16/04/2024 06:35', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('acb5e231-9bdb-4aaf-b4c1-2da58cc4436a', '2024-04-16 06:39:33.073090895+08:00', '2024-04-16 06:39:33.073090895+08:00', NULL, 27.00000000, 5.280000210, 538, 421, 3447.399902, 31.20000076, 0.389999986, 7.369999886, '16/04/2024 06:40', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('f8a48070-1abb-4610-a4e0-c56ffa9d0cb7', '2024-04-16 06:44:32.278967886+08:00', '2024-04-16 06:44:32.278967886+08:00', NULL, 27.10000038, 5.449999809, 538, 421, 3447.399902, 31.20000076, 0.389999986, 7.380000114, '16/04/2024 06:45', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('7a4a39c2-8e1e-4424-86d4-ac85b8b5a61d', '2024-04-16 06:49:31.582971623+08:00', '2024-04-16 06:49:31.582971623+08:00', NULL, 27.00000000, 5.190000057, 538, 424, 3447.399902, 31.10000038, 0.389999986, 7.380000114, '16/04/2024 06:50', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('61f1b511-5c09-4616-a6a9-ef0e7fad73ab', '2024-04-16 06:54:32.440690889+08:00', '2024-04-16 06:54:32.440690889+08:00', NULL, 27.10000038, 5.389999866, 538, 421, 3447.399902, 31.10000038, 0.389999986, 7.369999886, '16/04/2024 06:55', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('f85f02c8-5e81-45aa-a182-e17d463f2370', '2024-04-16 06:59:31.715742173+08:00', '2024-04-16 06:59:31.715742173+08:00', NULL, 27.10000038, 4.570000172, 536, 416, 3447.399902, 31.89999962, 0.389999986, 7.380000114, '16/04/2024 07:00', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('8ccd1022-3ff1-44ce-8c77-5c253d89e1b5', '2024-04-16 07:04:25.631770603+08:00', '2024-04-16 07:04:25.631770603+08:00', NULL, 27.10000038, 5.610000134, 536, 424, 3447.399902, 30.89999962, 0.389999986, 7.380000114, '16/04/2024 07:05', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('3a5d5659-789d-43fe-a52f-6bdaa6e2598f', '2024-04-16 07:09:32.524074739+08:00', '2024-04-16 07:09:32.524074739+08:00', NULL, 27.10000038, 5.880000114, 538, 419, 3447.399902, 31.10000038, 0.389999986, 7.380000114, '16/04/2024 07:10', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('e9a24741-326e-4a26-b5f6-0d1e8fb95cac', '2024-04-16 07:14:32.329683687+08:00', '2024-04-16 07:14:32.329683687+08:00', NULL, 27.10000038, 5.840000153, 536, 418, 3447.399902, 30.89999962, 0.389999986, 7.380000114, '16/04/2024 07:15', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('04bac0c0-e170-4283-b92b-db36616dbdfa', '2024-04-16 07:19:32.154372774+08:00', '2024-04-16 07:19:32.154372774+08:00', NULL, 27.10000038, 6.699999809, 538, 419, 3447.399902, 31.10000038, 0.389999986, 7.380000114, '16/04/2024 07:20', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('6cfff9cb-4394-4c7c-af52-f016660a4eb1', '2024-04-16 07:24:32.228335226+08:00', '2024-04-16 07:24:32.228335226+08:00', NULL, 27.10000038, 6.179999828, 536, 414, 3447.399902, 30.79999924, 0.389999986, 7.400000095, '16/04/2024 07:25', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('132bac16-c91f-4dcb-b787-01aca48bb821', '2024-04-16 07:29:31.752536202+08:00', '2024-04-16 07:29:31.752536202+08:00', NULL, 27.10000038, 6.429999828, 536, 416, 3447.399902, 30.79999924, 0.389999986, 7.400000095, '16/04/2024 07:30', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('6cf700a4-31a5-4a40-b683-7cfd1a39b82f', '2024-04-16 07:34:31.662209287+08:00', '2024-04-16 07:34:31.662209287+08:00', NULL, 27.10000038, 6.340000153, 536, 417, 3447.399902, 30.60000038, 0.389999986, 7.400000095, '16/04/2024 07:35', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('df789c42-f8b9-4fcd-ba40-b5664562e4f7', '2024-04-16 07:39:33.541905461+08:00', '2024-04-16 07:39:33.541905461+08:00', NULL, 27.10000038, 7.090000153, 536, 416, 3447.399902, 30.89999962, 0.389999986, 7.400000095, '16/04/2024 07:40', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('d2eea21c-3474-4e04-9c0c-3346a3dd3d3b', '2024-04-16 07:44:32.774568496+08:00', '2024-04-16 07:44:32.774568496+08:00', NULL, 27.10000038, 7.539999962, 536, 418, 3447.399902, 31.60000038, 0.389999986, 7.400000095, '16/04/2024 07:45', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('c9e0161b-4e65-4092-a9ba-0838682ebf72', '2024-04-16 07:49:31.738491104+08:00', '2024-04-16 07:49:31.738491104+08:00', NULL, 27.10000038, 9.199999809, 536, 421, 3447.399902, 30.89999962, 0.389999986, 7.420000076, '16/04/2024 07:50', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('39f439bb-fe71-4294-b2e5-2b36de4641ae', '2024-04-16 07:54:32.436793511+08:00', '2024-04-16 07:54:32.436793511+08:00', NULL, 27.10000038, 7.679999828, 536, 417, 3447.399902, 31.10000038, 0.389999986, 7.400000095, '16/04/2024 07:55', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('b617a1c5-99d1-48e1-95f0-de3601434050', '2024-04-16 07:59:31.89347585+08:00', '2024-04-16 07:59:31.89347585+08:00', NULL, 27.20000076, 7.510000229, 536, 418, 3447.399902, 30.79999924, 0.389999986, 7.400000095, '16/04/2024 08:00', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('a95e32c6-4df9-4377-a11e-a0191d4c90ce', '2024-04-16 08:04:32.350800459+08:00', '2024-04-16 08:04:32.350800459+08:00', NULL, 27.20000076, 7.800000191, 536, 414, 3447.399902, 30.89999962, 0.389999986, 7.420000076, '16/04/2024 08:05', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('79a05b0a-6688-4818-ab18-1e5f0f93cf2f', '2024-04-16 08:09:32.392976181+08:00', '2024-04-16 08:09:32.392976181+08:00', NULL, 27.20000076, 7.480000019, 536, 414, 3447.399902, 30.89999962, 0.389999986, 7.420000076, '16/04/2024 08:10', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('8b653746-ee2a-4470-bfd3-1d6f4d29a15a', '2024-04-16 08:14:31.58224714+08:00', '2024-04-16 08:14:31.58224714+08:00', NULL, 27.20000076, 7.059999943, 538, 417, 3447.399902, 31.00000000, 0.389999986, 7.420000076, '16/04/2024 08:15', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('1ebbed97-e7e5-4ec9-af52-123cd260cbaf', '2024-04-16 08:19:32.673396661+08:00', '2024-04-16 08:19:32.673396661+08:00', NULL, 27.20000076, 7.590000153, 536, 417, 3447.399902, 31.10000038, 0.389999986, 7.420000076, '16/04/2024 08:20', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('e893a9f8-e23c-4c45-a39b-d330780d97f9', '2024-04-16 08:24:32.207009204+08:00', '2024-04-16 08:24:32.207009204+08:00', NULL, 27.20000076, 7.019999981, 536, 418, 3447.399902, 31.10000038, 0.389999986, 7.400000095, '16/04/2024 08:25', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('5a2ed57d-c372-48bd-86da-896dbb420e95', '2024-04-16 08:29:31.665410792+08:00', '2024-04-16 08:29:31.665410792+08:00', NULL, 27.20000076, 6.039999962, 536, 421, 3447.399902, 30.89999962, 0.389999986, 7.420000076, '16/04/2024 08:30', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('f8d469a2-eed2-4914-accd-f4cc81a94a37', '2024-04-16 08:34:31.845881655+08:00', '2024-04-16 08:34:31.845881655+08:00', NULL, 27.20000076, 6.000000000, 536, 418, 3447.399902, 30.89999962, 0.389999986, 7.420000076, '16/04/2024 08:35', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('60765a58-950a-464c-847b-c925b9854a2a', '2024-04-16 08:39:35.153090203+08:00', '2024-04-16 08:39:35.153090203+08:00', NULL, 27.29999924, 7.190000057, 536, 418, 3447.399902, 31.10000038, 0.389999986, 7.400000095, '16/04/2024 08:40', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('0b95c615-98bc-4348-96c4-c40c67fc496f', '2024-04-16 08:44:32.231281164+08:00', '2024-04-16 08:44:32.231281164+08:00', NULL, 27.10000038, 7.820000172, 536, 418, 3447.399902, 31.00000000, 0.389999986, 7.400000095, '16/04/2024 08:45', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('5d9150a7-dbdf-4872-9b56-d814e693e545', '2024-04-16 08:49:32.33351413+08:00', '2024-04-16 08:49:32.33351413+08:00', NULL, 27.10000038, 9.189999580, 536, 418, 3447.399902, 31.00000000, 0.389999986, 7.400000095, '16/04/2024 08:50', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('30da8cf1-1ebb-4a1a-a0f3-034b11b0bd6f', '2024-04-16 08:54:32.435683998+08:00', '2024-04-16 08:54:32.435683998+08:00', NULL, 27.20000076, 9.180000305, 534, 418, 3447.399902, 30.70000076, 0.389999986, 7.420000076, '16/04/2024 08:55', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('4ac9aa67-66c7-4f66-8b6b-8806ef01aabd', '2024-04-16 08:59:32.523733405+08:00', '2024-04-16 08:59:32.523733405+08:00', NULL, 27.20000076, 7.889999866, 534, 414, 3447.399902, 30.89999962, 0.389999986, 7.420000076, '16/04/2024 09:00', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('46203ca6-ed81-46fb-b0ea-ea999a176ff4', '2024-04-16 09:04:32.838963503+08:00', '2024-04-16 09:04:32.838963503+08:00', NULL, 27.10000038, 7.789999962, 534, 417, 3447.399902, 30.89999962, 0.389999986, 7.420000076, '16/04/2024 09:05', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('96cae566-3e35-49d7-8df0-65027a93d427', '2024-04-16 09:09:31.871915428+08:00', '2024-04-16 09:09:31.871915428+08:00', NULL, 27.39999962, 7.619999886, 534, 418, 3447.399902, 30.89999962, 0.389999986, 7.420000076, '16/04/2024 09:10', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('43a59138-189f-43b1-a754-fbb4cd391f52', '2024-04-16 09:14:31.760974823+08:00', '2024-04-16 09:14:31.760974823+08:00', NULL, 27.29999924, 7.550000191, 533, 414, 3447.399902, 31.10000038, 0.389999986, 7.420000076, '16/04/2024 09:15', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('e552519a-14df-4817-a496-9b3eff85d1a9', '2024-04-16 09:19:32.463632391+08:00', '2024-04-16 09:19:32.463632391+08:00', NULL, 27.39999962, 7.739999771, 533, 414, 3447.399902, 30.60000038, 0.389999986, 7.420000076, '16/04/2024 09:20', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('2df4dd8f-f24f-4e03-96e7-fbdefc7d5d2b', '2024-04-16 09:24:32.401459856+08:00', '2024-04-16 09:24:32.401459856+08:00', NULL, 27.29999924, 7.800000191, 533, 417, 3447.399902, 30.89999962, 0.389999986, 7.429999828, '16/04/2024 09:25', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('cb5cc66b-9a46-4eaf-8a92-75094ea09ee5', '2024-04-16 09:29:32.157659197+08:00', '2024-04-16 09:29:32.157659197+08:00', NULL, 27.39999962, 9.239999771, 536, 417, 3447.399902, 30.50000000, 0.389999986, 7.429999828, '16/04/2024 09:30', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('3a70fd60-06f6-4c1f-b5c4-48f0b7d3e0ff', '2024-04-16 09:34:32.641303255+08:00', '2024-04-16 09:34:32.641303255+08:00', NULL, 27.29999924, 9.270000458, 533, 418, 3447.399902, 30.60000038, 0.389999986, 7.429999828, '16/04/2024 09:35', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('d3c19735-6b52-4302-af6d-076c9ae6b089', '2024-04-16 09:39:32.647758967+08:00', '2024-04-16 09:39:32.647758967+08:00', NULL, 27.20000076, 7.880000114, 533, 413, 3447.399902, 30.60000038, 0.389999986, 7.429999828, '16/04/2024 09:40', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('e9a97f02-5a47-4965-96dc-beb62b15e8a0', '2024-04-16 09:44:31.974152181+08:00', '2024-04-16 09:44:31.974152181+08:00', NULL, 27.50000000, 7.429999828, 533, 413, 3447.399902, 30.60000038, 0.389999986, 7.449999809, '16/04/2024 09:45', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('4c2e242c-78d1-46bd-a010-4b16ee0b91cc', '2024-04-16 09:49:33.65738346+08:00', '2024-04-16 09:49:33.65738346+08:00', NULL, 27.50000000, 7.920000076, 533, 411, 3447.399902, 31.10000038, 0.389999986, 7.429999828, '16/04/2024 09:50', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('32f7bcfc-e683-4122-a648-535873bce2af', '2024-04-16 09:54:36.967852537+08:00', '2024-04-16 09:54:36.967852537+08:00', NULL, 27.29999924, 9.239999771, 533, 413, 3447.399902, 30.39999962, 0.389999986, 7.449999809, '16/04/2024 09:55', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('505a153c-e1fc-4e93-be40-341a1931b2f2', '2024-04-16 09:59:39.484327467+08:00', '2024-04-16 09:59:39.484327467+08:00', NULL, 27.50000000, 9.270000458, 533, 410, 3447.399902, 30.20000076, 0.389999986, 7.420000076, '16/04/2024 10:00', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('f415c37a-344e-4881-bca8-5075bddef651', '2024-04-16 10:04:37.82255861+08:00', '2024-04-16 10:04:37.82255861+08:00', NULL, 27.39999962, 7.780000210, 533, 413, 3447.399902, 30.29999924, 0.389999986, 7.429999828, '16/04/2024 10:05', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('8b5fa52f-42e2-4af7-96eb-a6e7bcb85f54', '2024-04-16 10:09:37.961364235+08:00', '2024-04-16 10:09:37.961364235+08:00', NULL, 27.50000000, 7.809999943, 533, 413, 3447.399902, 30.60000038, 0.389999986, 7.429999828, '16/04/2024 10:10', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('d3a2402f-35bf-4f20-bc13-9eeac02c096d', '2024-04-16 10:14:32.477733384+08:00', '2024-04-16 10:14:32.477733384+08:00', NULL, 27.29999924, 9.189999580, 532, 413, 3447.399902, 30.79999924, 0.389999986, 7.420000076, '16/04/2024 10:15', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('c3ec7e33-9a0c-432a-8f8d-4aae0ae7fcd2', '2024-04-16 10:19:39.407668223+08:00', '2024-04-16 10:19:39.407668223+08:00', NULL, 27.50000000, 7.460000038, 534, 413, 3447.399902, 30.89999962, 0.389999986, 7.400000095, '16/04/2024 10:20', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('d0e04b38-1e66-4b38-8fda-2b911806e045', '2024-04-16 10:24:32.824103547+08:00', '2024-04-16 10:24:32.824103547+08:00', NULL, 27.50000000, 7.250000000, 532, 413, 3447.399902, 30.60000038, 0.389999986, 7.420000076, '16/04/2024 10:25', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('aeeec277-ed7e-4354-8755-98c7e51768fb', '2024-04-16 10:29:33.690988676+08:00', '2024-04-16 10:29:33.690988676+08:00', NULL, 27.50000000, 7.239999771, 532, 411, 3447.399902, 30.29999924, 0.389999986, 7.420000076, '16/04/2024 10:30', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('75b1f050-f910-4746-a931-7b559de9006d', '2024-04-16 10:34:31.958036715+08:00', '2024-04-16 10:34:31.958036715+08:00', NULL, 27.50000000, 7.199999809, 533, 411, 3447.399902, 30.70000076, 0.389999986, 7.420000076, '16/04/2024 10:35', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('61ea2f78-d3fa-4af7-9d2f-f130235c58ef', '2024-04-16 10:39:34.023931112+08:00', '2024-04-16 10:39:34.023931112+08:00', NULL, 27.50000000, 7.230000019, 531, 413, 3447.399902, 30.89999962, 0.389999986, 7.420000076, '16/04/2024 10:40', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('6d4c0466-6c8e-4257-b756-adbfb17957aa', '2024-04-16 10:44:33.088837423+08:00', '2024-04-16 10:44:33.088837423+08:00', NULL, 27.50000000, 7.119999886, 531, 408, 3447.399902, 30.70000076, 0.389999986, 7.420000076, '16/04/2024 10:45', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('11002dd8-e052-4e21-bb5d-aa72c65d4985', '2024-04-16 10:49:32.32914448+08:00', '2024-04-16 10:49:32.32914448+08:00', NULL, 27.60000038, 7.199999809, 533, 413, 3447.399902, 31.10000038, 0.389999986, 7.420000076, '16/04/2024 10:50', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('b786a763-765b-41ea-837d-d5ac37a9c0bf', '2024-04-16 10:54:32.030212917+08:00', '2024-04-16 10:54:32.030212917+08:00', NULL, 27.60000038, 7.190000057, 531, 411, 3447.399902, 30.39999962, 0.389999986, 7.420000076, '16/04/2024 10:55', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('bb0246cb-0584-4664-b722-4832959974fa', '2024-04-16 10:59:33.641562023+08:00', '2024-04-16 10:59:33.641562023+08:00', NULL, 27.70000076, 7.260000229, 531, 413, 3447.399902, 31.39999962, 0.389999986, 7.429999828, '16/04/2024 11:00', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('10cd411c-0528-4f16-9225-a25f277f106e', '2024-04-16 11:04:32.634912524+08:00', '2024-04-16 11:04:32.634912524+08:00', NULL, 27.70000076, 7.449999809, 533, 411, 3447.399902, 30.89999962, 0.389999986, 7.429999828, '16/04/2024 11:05', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('3e2bc938-fdc1-42f5-92e0-5f191b31dbbb', '2024-04-16 11:09:29.989927543+08:00', '2024-04-16 11:09:29.989927543+08:00', NULL, 27.60000038, 7.420000076, 533, 411, 3447.399902, 30.39999962, 0.389999986, 7.429999828, '16/04/2024 11:10', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('eaa71d9a-efdc-439f-a139-e581e952505a', '2024-04-16 11:14:32.25179359+08:00', '2024-04-16 11:14:32.25179359+08:00', NULL, 27.70000076, 7.460000038, 532, 407, 3447.399902, 30.70000076, 0.389999986, 7.429999828, '16/04/2024 11:15', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('7a2907bd-fede-4fec-a0cf-57b3b3ea290f', '2024-04-16 11:19:27.112412702+08:00', '2024-04-16 11:19:27.112412702+08:00', NULL, 27.79999924, 7.539999962, 532, 413, 3447.399902, 30.20000076, 0.389999986, 7.449999809, '16/04/2024 11:20', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('8028ba04-6383-492c-966e-63ccfbb2c9d4', '2024-04-16 11:24:32.274329132+08:00', '2024-04-16 11:24:32.274329132+08:00', NULL, 27.70000076, 7.460000038, 532, 416, 3447.399902, 30.39999962, 0.389999986, 7.429999828, '16/04/2024 11:25', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('2e805284-fa6e-4abf-a9bd-b1c9a34d8c07', '2024-04-16 11:29:34.220346213+08:00', '2024-04-16 11:29:34.220346213+08:00', NULL, 27.70000076, 7.239999771, 531, 411, 3447.399902, 30.60000038, 0.389999986, 7.420000076, '16/04/2024 11:30', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('be3788d6-1ae2-4c57-90b8-c9eb9e926c80', '2024-04-16 11:34:34.474523067+08:00', '2024-04-16 11:34:34.474523067+08:00', NULL, 27.79999924, 7.170000076, 532, 413, 3447.399902, 30.89999962, 0.389999986, 7.429999828, '16/04/2024 11:35', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('5d29ea22-ce3c-4d7c-8d1d-c62cc9989da9', '2024-04-16 11:39:32.411127216+08:00', '2024-04-16 11:39:32.411127216+08:00', NULL, 27.70000076, 7.239999771, 531, 411, 3447.399902, 30.10000038, 0.389999986, 7.429999828, '16/04/2024 11:40', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('998468fd-63c5-41c4-8fed-51b23382cff7', '2024-04-16 11:44:32.227474022+08:00', '2024-04-16 11:44:32.227474022+08:00', NULL, 27.89999962, 7.130000114, 531, 410, 3447.399902, 30.60000038, 0.389999986, 7.449999809, '16/04/2024 11:45', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('af144f46-04f7-43ff-a924-db3d6fe04832', '2024-04-16 11:49:31.372850606+08:00', '2024-04-16 11:49:31.372850606+08:00', NULL, 27.79999924, 6.829999924, 531, 411, 3447.399902, 30.39999962, 0.389999986, 7.429999828, '16/04/2024 11:50', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('7c4fa9d3-79d5-408f-9f61-c675c5d71606', '2024-04-16 11:54:32.524936284+08:00', '2024-04-16 11:54:32.524936284+08:00', NULL, 27.89999962, 7.130000114, 531, 410, 3447.399902, 30.79999924, 0.389999986, 7.429999828, '16/04/2024 11:55', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('928932c4-94f9-4663-890e-e6cb7b2e0ff4', '2024-04-16 11:59:39.567054986+08:00', '2024-04-16 11:59:39.567054986+08:00', NULL, 27.79999924, 6.889999866, 531, 411, 3447.399902, 30.10000038, 0.389999986, 7.429999828, '16/04/2024 12:00', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('f0e9f1a5-df59-48cc-8ee5-74a459925fd0', '2024-04-16 12:04:32.242492554+08:00', '2024-04-16 12:04:32.242492554+08:00', NULL, 27.79999924, 6.940000057, 531, 410, 3447.399902, 30.70000076, 0.389999986, 7.429999828, '16/04/2024 12:05', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('b7edc45e-28e2-48bc-aff1-faf2f2381736', '2024-04-16 12:09:31.744219777+08:00', '2024-04-16 12:09:31.744219777+08:00', NULL, 27.89999962, 6.769999981, 531, 410, 3447.399902, 30.39999962, 0.389999986, 7.449999809, '16/04/2024 12:10', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('f25b689b-0dd8-4fc2-a886-e179160deb5c', '2024-04-16 12:14:30.782965247+08:00', '2024-04-16 12:14:30.782965247+08:00', NULL, 27.79999924, 6.800000191, 531, 410, 3447.399902, 30.39999962, 0.389999986, 7.429999828, '16/04/2024 12:15', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('4113e016-e2ac-4653-bb3d-6168265ea3e2', '2024-04-16 12:19:32.584184787+08:00', '2024-04-16 12:19:32.584184787+08:00', NULL, 27.70000076, 6.420000076, 531, 410, 3447.399902, 30.50000000, 0.389999986, 7.429999828, '16/04/2024 12:20', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('11b34c7e-f210-472a-acee-53f95002e74f', '2024-04-16 12:24:31.703798657+08:00', '2024-04-16 12:24:31.703798657+08:00', NULL, 27.89999962, 6.530000210, 531, 410, 3447.399902, 30.00000000, 0.389999986, 7.449999809, '16/04/2024 12:25', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('f9d2f189-60e8-404b-b48c-d85ce45808ed', '2024-04-16 12:29:32.429638938+08:00', '2024-04-16 12:29:32.429638938+08:00', NULL, 27.89999962, 6.489999771, 531, 410, 3447.399902, 30.29999924, 0.389999986, 7.429999828, '16/04/2024 12:30', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('dbc36cde-de41-4c29-9089-2e58e46965b4', '2024-04-16 12:34:31.0764266+08:00', '2024-04-16 12:34:31.0764266+08:00', NULL, 28.00000000, 6.369999886, 531, 410, 3447.399902, 30.20000076, 0.389999986, 7.449999809, '16/04/2024 12:35', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('23f460e3-7f35-4aa9-a22e-d0ac704fe7a7', '2024-04-16 12:39:31.759277461+08:00', '2024-04-16 12:39:31.759277461+08:00', NULL, 27.89999962, 6.340000153, 532, 413, 3447.399902, 30.60000038, 0.389999986, 7.449999809, '16/04/2024 12:40', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('eb95301d-3a5e-4931-9741-c81b8852995d', '2024-04-16 12:44:32.255744992+08:00', '2024-04-16 12:44:32.255744992+08:00', NULL, 27.89999962, 6.719999790, 532, 410, 3447.399902, 30.39999962, 0.389999986, 7.429999828, '16/04/2024 12:45', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('289065f6-34aa-482c-8ae4-1c2bd3edb657', '2024-04-16 12:49:32.170433401+08:00', '2024-04-16 12:49:32.170433401+08:00', NULL, 27.89999962, 6.369999886, 532, 407, 3447.399902, 30.00000000, 0.389999986, 7.429999828, '16/04/2024 12:50', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('4388ccf5-0c9f-4951-9ba8-9b7a1673d709', '2024-04-16 12:54:31.955084586+08:00', '2024-04-16 12:54:31.955084586+08:00', NULL, 27.89999962, 6.409999847, 514, 410, 3447.399902, 30.39999962, 0.389999986, 7.429999828, '16/04/2024 12:55', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('f2e4cc93-c793-4c60-856c-6dd87a4c357d', '2024-04-16 12:59:32.930119149+08:00', '2024-04-16 12:59:32.930119149+08:00', NULL, 28.00000000, 6.630000114, 529, 407, 3447.399902, 30.39999962, 0.389999986, 7.449999809, '16/04/2024 13:00', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('d3afca2e-b18d-4e60-9600-9ca0596687d7', '2024-04-16 13:04:31.172747456+08:00', '2024-04-16 13:04:31.172747456+08:00', NULL, 28.00000000, 6.739999771, 529, 407, 3447.399902, 30.39999962, 0.389999986, 7.429999828, '16/04/2024 13:05', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('0de8c3ca-3c83-4c51-8090-1752abc28445', '2024-04-16 13:09:29.038845225+08:00', '2024-04-16 13:09:29.038845225+08:00', NULL, 28.10000038, 6.869999886, 529, 405, 3447.399902, 30.79999924, 0.389999986, 7.429999828, '16/04/2024 13:10', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('2ba76e41-64e0-4132-af4c-3de629cbe33b', '2024-04-16 13:14:33.604063769+08:00', '2024-04-16 13:14:33.604063769+08:00', NULL, 28.10000038, 7.110000134, 529, 405, 3447.399902, 30.20000076, 0.389999986, 7.429999828, '16/04/2024 13:15', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('1846017d-171a-4577-b8bb-282bbd05551e', '2024-04-16 13:19:31.911453926+08:00', '2024-04-16 13:19:31.911453926+08:00', NULL, 28.10000038, 6.820000172, 529, 405, 3447.399902, 30.00000000, 0.389999986, 7.429999828, '16/04/2024 13:20', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('ea6382cf-a87d-4ac0-ac30-5a8b55164575', '2024-04-16 13:24:32.386400255+08:00', '2024-04-16 13:24:32.386400255+08:00', NULL, 28.10000038, 6.809999943, 529, 405, 3447.399902, 30.50000000, 0.389999986, 7.449999809, '16/04/2024 13:25', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('8ccba47c-e30b-4b2c-b2f7-5e3d12dab8a5', '2024-04-16 13:29:32.748579464+08:00', '2024-04-16 13:29:32.748579464+08:00', NULL, 28.10000038, 6.920000076, 531, 405, 3447.399902, 29.70000076, 0.389999986, 7.449999809, '16/04/2024 13:30', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('6b9244b0-d7f2-45b8-9b26-1f69ad4c3266', '2024-04-16 13:34:32.082651855+08:00', '2024-04-16 13:34:32.082651855+08:00', NULL, 28.10000038, 7.079999924, 528, 403, 3447.399902, 30.00000000, 0.389999986, 7.449999809, '16/04/2024 13:35', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('ea0d9b01-fee9-420e-b44c-58f58dab26ed', '2024-04-16 13:39:32.698316433+08:00', '2024-04-16 13:39:32.698316433+08:00', NULL, 28.10000038, 6.539999962, 531, 405, 3447.399902, 29.79999924, 0.389999986, 7.429999828, '16/04/2024 13:40', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('c9cd191e-7e0d-4a91-9cad-ae8c7a43b261', '2024-04-16 13:44:32.668954026+08:00', '2024-04-16 13:44:32.668954026+08:00', NULL, 28.10000038, 5.429999828, 529, 403, 3447.399902, 29.89999962, 0.389999986, 7.429999828, '16/04/2024 13:45', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('9caceaf8-5f62-46c8-9137-3433372ef98e', '2024-04-16 13:49:32.006595316+08:00', '2024-04-16 13:49:32.006595316+08:00', NULL, 28.20000076, 5.449999809, 527, 405, 3447.399902, 29.60000038, 0.389999986, 7.429999828, '16/04/2024 13:50', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('85c4f299-30f3-4367-9fe2-b3923ca25063', '2024-04-16 13:54:38.179087056+08:00', '2024-04-16 13:54:38.179087056+08:00', NULL, 28.10000038, 5.420000076, 528, 405, 3447.399902, 30.39999962, 0.389999986, 7.429999828, '16/04/2024 13:55', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('37121221-8f6d-4e2d-8c39-9c48417a12c0', '2024-04-16 13:59:32.803923918+08:00', '2024-04-16 13:59:32.803923918+08:00', NULL, 28.20000076, 5.610000134, 529, 405, 3447.399902, 29.89999962, 0.389999986, 7.429999828, '16/04/2024 14:00', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('30d40846-d006-45e7-b64d-eebc40bfbb69', '2024-04-16 14:04:30.406408496+08:00', '2024-04-16 14:04:30.406408496+08:00', NULL, 27.89999962, 5.679999828, 529, 407, 3447.399902, 30.70000076, 0.389999986, 7.409999847, '16/04/2024 14:05', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('8fe8b625-da29-4a74-828c-efbcb8a55267', '2024-04-16 14:09:32.002631238+08:00', '2024-04-16 14:09:32.002631238+08:00', NULL, 27.89999962, 5.869999886, 529, 405, 3447.399902, 29.89999962, 0.389999986, 7.409999847, '16/04/2024 14:10', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('7457b4cc-be67-447d-85cf-8ef43a980d98', '2024-04-16 14:14:29.624396945+08:00', '2024-04-16 14:14:29.624396945+08:00', NULL, 28.20000076, 5.289999962, 529, 405, 3447.399902, 30.00000000, 0.389999986, 7.429999828, '16/04/2024 14:15', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('0f3c3c25-db4f-4f31-b03e-a18b5b1cbd2b', '2024-04-16 14:19:32.694744962+08:00', '2024-04-16 14:19:32.694744962+08:00', NULL, 28.20000076, 5.630000114, 529, 405, 3447.399902, 30.29999924, 0.389999986, 7.409999847, '16/04/2024 14:20', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('a686b159-89fd-43e5-8045-10816de8eb3c', '2024-04-16 14:24:30.514145985+08:00', '2024-04-16 14:24:30.514145985+08:00', NULL, 28.10000038, 5.260000229, 532, 407, 3447.399902, 30.00000000, 0.389999986, 7.429999828, '16/04/2024 14:25', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('0b083771-d5e3-41e2-8a6a-4f5d6a3534d4', '2024-04-16 14:29:31.926959283+08:00', '2024-04-16 14:29:31.926959283+08:00', NULL, 28.10000038, 6.190000057, 532, 408, 3447.399902, 30.10000038, 0.389999986, 7.409999847, '16/04/2024 14:30', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('d4f1eb08-9643-4f2f-9291-0e128ebbd7c1', '2024-04-16 14:34:30.060982319+08:00', '2024-04-16 14:34:30.060982319+08:00', NULL, 28.29999924, 6.349999905, 532, 407, 3447.399902, 30.00000000, 0.389999986, 7.429999828, '16/04/2024 14:35', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('14367816-34a3-4e00-9fcd-eabfa2d3dfdf', '2024-04-16 14:39:31.706032529+08:00', '2024-04-16 14:39:31.706032529+08:00', NULL, 28.20000076, 5.409999847, 532, 405, 3447.399902, 29.70000076, 0.389999986, 7.429999828, '16/04/2024 14:40', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('0dfefe1b-bb25-43f2-b036-1c82ee7cccae', '2024-04-16 14:44:31.284673176+08:00', '2024-04-16 14:44:31.284673176+08:00', NULL, 28.10000038, 5.050000191, 532, 405, 3447.399902, 29.79999924, 0.389999986, 7.409999847, '16/04/2024 14:45', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('31caef73-9145-49e5-8ea2-6263a4d17a2c', '2024-04-16 14:49:32.215683987+08:00', '2024-04-16 14:49:32.215683987+08:00', NULL, 28.29999924, 5.280000210, 532, 405, 3447.399902, 29.89999962, 0.389999986, 7.409999847, '16/04/2024 14:50', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('6a13d0d4-f337-44cd-8d5e-27ae573795a5', '2024-04-16 14:54:31.996772345+08:00', '2024-04-16 14:54:31.996772345+08:00', NULL, 28.29999924, 5.900000095, 532, 406, 3447.399902, 29.60000038, 0.389999986, 7.409999847, '16/04/2024 14:55', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('fb4ab6fd-bd13-411f-b1af-38d81053ce93', '2024-04-16 14:59:32.239853759+08:00', '2024-04-16 14:59:32.239853759+08:00', NULL, 28.10000038, 5.659999847, 532, 407, 3447.399902, 29.70000076, 0.389999986, 7.409999847, '16/04/2024 15:00', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('1c9517a1-7651-4cd9-b092-d41510fdf3fb', '2024-04-16 15:04:31.808508387+08:00', '2024-04-16 15:04:31.808508387+08:00', NULL, 28.10000038, 5.070000172, 532, 407, 3447.399902, 29.79999924, 0.389999986, 7.400000095, '16/04/2024 15:05', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('6489a654-bc0e-4079-b91d-45f824f3b1b1', '2024-04-16 15:09:32.024911718+08:00', '2024-04-16 15:09:32.024911718+08:00', NULL, 28.10000038, 4.840000153, 532, 406, 3447.399902, 29.60000038, 0.389999986, 7.409999847, '16/04/2024 15:10', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d');
INSERT INTO `water_bed` (`id`, `created_at`, `updated_at`, `deleted_at`, `water_temperature`, `dissolved_o2_level`, `electrical_conductivity`, `total_dissolved_solids`, `nitrate`, `nitrite`, `ammonia`, `ph_level`, `timestamp`, `sensor_id`) VALUES
('1185a2d4-99a7-4273-ab64-1068fe970af3', '2024-04-16 15:14:32.086736453+08:00', '2024-04-16 15:14:32.086736453+08:00', NULL, 28.29999924, 5.369999886, 532, 406, 3447.399902, 29.60000038, 0.389999986, 7.429999828, '16/04/2024 15:15', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('2775dd24-67ab-4bce-bae3-6ee5a3cc340a', '2024-04-16 15:19:32.278417406+08:00', '2024-04-16 15:19:32.278417406+08:00', NULL, 28.10000038, 5.079999924, 531, 406, 3447.399902, 29.89999962, 0.389999986, 7.400000095, '16/04/2024 15:20', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('62e720bb-11a3-4d9e-ada1-094ce52ddee0', '2024-04-16 15:24:31.654697737+08:00', '2024-04-16 15:24:31.654697737+08:00', NULL, 28.20000076, 5.489999771, 531, 407, 3447.399902, 30.39999962, 0.389999986, 7.409999847, '16/04/2024 15:25', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('05337634-e294-46f6-80ab-9e2dec29d42e', '2024-04-16 15:29:32.627361499+08:00', '2024-04-16 15:29:32.627361499+08:00', NULL, 28.20000076, 5.570000172, 531, 407, 3447.399902, 30.29999924, 0.389999986, 7.409999847, '16/04/2024 15:30', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('c71fa21b-7c17-438f-a0e0-191e7bcc13c1', '2024-04-16 15:34:32.581057141+08:00', '2024-04-16 15:34:32.581057141+08:00', NULL, 28.29999924, 5.619999886, 531, 407, 3447.399902, 30.60000038, 0.389999986, 7.409999847, '16/04/2024 15:35', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('daa6abc1-273c-4ae9-8ab3-1b6b646194e4', '2024-04-16 15:39:31.685403619+08:00', '2024-04-16 15:39:31.685403619+08:00', NULL, 28.29999924, 5.760000229, 531, 407, 3447.399902, 30.39999962, 0.389999986, 7.429999828, '16/04/2024 15:40', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d'),
('960d9f27-3df4-408e-b87c-9052a2fea306', '2024-04-16 15:44:32.275381945+08:00', '2024-04-16 15:44:32.275381945+08:00', NULL, 28.10000038, 5.889999866, 531, 406, 3447.399902, 29.79999924, 0.389999986, 7.409999847, '16/04/2024 15:45', '8faf1a52-b3b2-40fc-8a47-91f8a4bf0f8d');

-- --------------------------------------------------------

--
-- Table structure for table `water_biofilter`
--

CREATE TABLE `water_biofilter` (
  `id` varchar(36) NOT NULL,
  `created_at` varchar(35) NOT NULL,
  `updated_at` varchar(35) NOT NULL,
  `deleted_at` varchar(30) DEFAULT NULL,
  `nitrate` decimal(11,7) NOT NULL,
  `nitrite` decimal(11,8) NOT NULL,
  `ammonia` decimal(11,9) NOT NULL,
  `timestamp` varchar(16) NOT NULL,
  `sensor_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `water_biofilter`
--

INSERT INTO `water_biofilter` (`id`, `created_at`, `updated_at`, `deleted_at`, `nitrate`, `nitrite`, `ammonia`, `timestamp`, `sensor_id`) VALUES
('00c2e45e-542c-4c4e-b054-08b2e71aab36', '2024-04-16 12:59:21.315267529+08:00', '2024-04-16 12:59:21.315267529+08:00', NULL, 347.5000000, 30.39999962, 0.389999986, '16/04/2024 13:00', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('01484409-88af-4466-bbc2-e1e7c4674a1f', '2024-04-16 08:19:21.381234001+08:00', '2024-04-16 08:19:21.381234001+08:00', NULL, 354.7999878, 31.10000038, 0.389999986, '16/04/2024 08:20', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('0249fa58-5691-419f-baf9-fdb3673f3c19', '2024-04-16 08:29:20.324019784+08:00', '2024-04-16 08:29:20.324019784+08:00', NULL, 365.6000061, 30.89999962, 0.389999986, '16/04/2024 08:30', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('02cb211f-fcb8-407d-a8d8-db0d41c3fa42', '2024-04-16 03:59:20.577106955+08:00', '2024-04-16 03:59:20.577106955+08:00', NULL, 364.7000122, 31.10000038, 0.389999986, '16/04/2024 04:00', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('04b71dd6-6cf8-4d1f-ac11-34b6390e3f95', '2024-04-16 13:44:21.364557648+08:00', '2024-04-16 13:44:21.364557648+08:00', NULL, 356.3999939, 29.89999962, 0.389999986, '16/04/2024 13:45', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('06dffa0d-a5fb-49a7-8db1-3e2d979b7318', '2024-04-16 08:44:20.544512623+08:00', '2024-04-16 08:44:20.544512623+08:00', NULL, 354.0000000, 31.00000000, 0.389999986, '16/04/2024 08:45', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('0746185c-a208-41b5-813c-70bd560cc668', '2024-04-16 12:09:20.445885833+08:00', '2024-04-16 12:09:20.445885833+08:00', NULL, 375.7999878, 30.39999962, 0.389999986, '16/04/2024 12:10', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('077f4007-708b-4960-a0b6-7927a592d3d4', '2024-04-16 13:49:20.591699339+08:00', '2024-04-16 13:49:20.591699339+08:00', NULL, 354.7999878, 29.70000076, 0.389999986, '16/04/2024 13:50', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('08140931-128e-4d57-877d-4b10f10b4798', '2024-04-16 06:29:20.143966029+08:00', '2024-04-16 06:29:20.143966029+08:00', NULL, 352.2999878, 31.10000038, 0.389999986, '16/04/2024 06:30', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('08627b69-bdfa-46d3-8f95-7256bd06be83', '2024-04-16 10:44:21.715173406+08:00', '2024-04-16 10:44:21.715173406+08:00', NULL, 366.3999939, 30.70000076, 0.389999986, '16/04/2024 10:45', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('099d4b1a-3854-4c12-a80b-7c95fd64cd11', '2024-04-16 02:34:20.998799737+08:00', '2024-04-16 02:34:20.998799737+08:00', NULL, 350.7000122, 31.10000038, 0.389999986, '16/04/2024 02:35', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('0b6fdbd0-42cc-49cd-83bb-c1c8e767fa0b', '2024-04-16 02:24:20.122783186+08:00', '2024-04-16 02:24:20.122783186+08:00', NULL, 370.6000061, 30.89999962, 0.389999986, '16/04/2024 02:25', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('0bede3f2-3997-45b4-8b01-82d439e9208b', '2024-04-16 12:44:20.936315948+08:00', '2024-04-16 12:44:20.936315948+08:00', NULL, 369.0000000, 30.39999962, 0.389999986, '16/04/2024 12:45', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('0c4704db-87db-4603-a698-00455ffdb3af', '2024-04-16 11:39:21.019453009+08:00', '2024-04-16 11:39:21.019453009+08:00', NULL, 352.2999878, 30.00000000, 0.389999986, '16/04/2024 11:40', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('0dcb6b8c-a604-494c-b054-58e6396ee7b0', '2024-04-16 05:49:21.198298982+08:00', '2024-04-16 05:49:21.198298982+08:00', NULL, 353.1000061, 30.89999962, 0.389999986, '16/04/2024 05:50', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('0e481436-1d48-4588-baeb-6051df53302e', '2024-04-16 01:24:20.338796264+08:00', '2024-04-16 01:24:20.338796264+08:00', NULL, 374.1000061, 31.00000000, 0.389999986, '16/04/2024 01:25', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('0ffe75cb-4bf2-4fb1-aa0c-dd77a86edc73', '2024-04-16 12:24:20.18591366+08:00', '2024-04-16 12:24:20.18591366+08:00', NULL, 341.2000122, 30.00000000, 0.389999986, '16/04/2024 12:25', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('123984e4-46be-4900-89f6-44dc65b4cfd1', '2024-04-16 08:14:20.313157108+08:00', '2024-04-16 08:14:20.313157108+08:00', NULL, 358.8999939, 30.89999962, 0.389999986, '16/04/2024 08:15', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('127f81dd-b0db-4890-8955-f53208e1a626', '2024-04-16 07:44:21.194320123+08:00', '2024-04-16 07:44:21.194320123+08:00', NULL, 355.6000061, 31.60000038, 0.389999986, '16/04/2024 07:45', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('13202494-53c5-426d-8687-4a5c7ef7a7ff', '2024-04-16 06:04:21.311237424+08:00', '2024-04-16 06:04:21.311237424+08:00', NULL, 374.8999939, 31.20000076, 0.389999986, '16/04/2024 06:05', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('14edb1f2-cec1-4388-9606-b1bb6412bb98', '2024-04-16 06:14:20.506867527+08:00', '2024-04-16 06:14:20.506867527+08:00', NULL, 347.5000000, 31.10000038, 0.389999986, '16/04/2024 06:15', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('15064aa8-2967-49f7-a023-e264f4d92712', '2024-04-16 07:59:20.717931471+08:00', '2024-04-16 07:59:20.717931471+08:00', NULL, 354.7999878, 30.70000076, 0.389999986, '16/04/2024 08:00', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('168f1a89-173d-4a75-a08f-e74f039685ac', '2024-04-16 01:54:20.342682736+08:00', '2024-04-16 01:54:20.342682736+08:00', NULL, 350.7000122, 31.00000000, 0.389999986, '16/04/2024 01:55', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('1756e447-33a4-49b5-bfbf-4486461a1cf7', '2024-04-16 12:49:20.926707627+08:00', '2024-04-16 12:49:20.926707627+08:00', NULL, 366.3999939, 29.89999962, 0.389999986, '16/04/2024 12:50', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('18764577-cb58-49d9-a507-bd6d6d41d767', '2024-04-16 10:34:20.556019643+08:00', '2024-04-16 10:34:20.556019643+08:00', NULL, 350.7000122, 30.60000038, 0.389999986, '16/04/2024 10:35', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('18b0fe1f-2396-4800-9f41-f27b3ee5afce', '2024-04-16 09:29:20.743400609+08:00', '2024-04-16 09:29:20.743400609+08:00', NULL, 354.7999878, 30.39999962, 0.389999986, '16/04/2024 09:30', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('18ffdd04-9d09-465a-aee1-8824ba335613', '2024-04-16 05:59:20.580337343+08:00', '2024-04-16 05:59:20.580337343+08:00', NULL, 357.2999878, 31.10000038, 0.389999986, '16/04/2024 06:00', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('1af77708-da03-4d33-9e19-467e978aecdd', '2024-04-16 09:49:21.964859015+08:00', '2024-04-16 09:49:21.964859015+08:00', NULL, 351.5000000, 31.10000038, 0.389999986, '16/04/2024 09:50', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('1b219182-c4dd-4d2d-a459-143d24f36610', '2024-04-16 06:54:21.141590442+08:00', '2024-04-16 06:54:21.141590442+08:00', NULL, 348.2999878, 31.10000038, 0.389999986, '16/04/2024 06:55', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('21b96dfd-e648-4c0a-ba2b-e933dcd5456c', '2024-04-16 06:19:20.931500013+08:00', '2024-04-16 06:19:20.931500013+08:00', NULL, 350.7000122, 31.10000038, 0.389999986, '16/04/2024 06:20', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('2432caf3-f5ed-4d6a-9e57-82a94a4793ed', '2024-04-16 15:34:21.254671425+08:00', '2024-04-16 15:34:21.254671425+08:00', NULL, 346.7000122, 30.70000076, 0.389999986, '16/04/2024 15:35', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('26fb3f07-0fc2-4502-a05c-9ca51ac1402e', '2024-04-16 09:34:21.305669846+08:00', '2024-04-16 09:34:21.305669846+08:00', NULL, 349.1000061, 30.60000038, 0.389999986, '16/04/2024 09:35', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('271c1e02-a6c5-4ff0-a38c-3b01fdfdf3be', '2024-04-16 07:04:16.636472346+08:00', '2024-04-16 07:04:16.636472346+08:00', NULL, 346.7000122, 30.89999962, 0.389999986, '16/04/2024 07:05', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('280278a6-48a0-48ca-95db-962617d806be', '2024-04-16 00:29:20.706719211+08:00', '2024-04-16 00:29:20.706719211+08:00', NULL, 376.7000122, 30.89999962, 0.389999986, '16/04/2024 00:30', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('292adaea-7018-404e-a751-136ceaaa740a', '2024-04-16 01:19:20.130754186+08:00', '2024-04-16 01:19:20.130754186+08:00', NULL, 383.7000122, 31.29999924, 0.389999986, '16/04/2024 01:20', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('2a51957f-12e2-4882-9b47-03e0539c59e9', '2024-04-16 12:04:20.824058986+08:00', '2024-04-16 12:04:20.824058986+08:00', NULL, 370.6000061, 30.79999924, 0.389999986, '16/04/2024 12:05', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('2cc6bbc0-2e00-450a-abfd-9ff8dbb389b3', '2024-04-16 13:39:21.354372111+08:00', '2024-04-16 13:39:21.354372111+08:00', NULL, 348.2999878, 29.89999962, 0.389999986, '16/04/2024 13:40', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('2df9118f-a7ca-4de0-ba66-45db46477fd9', '2024-04-16 10:14:21.124757968+08:00', '2024-04-16 10:14:21.124757968+08:00', NULL, 346.7000122, 30.89999962, 0.389999986, '16/04/2024 10:15', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('300500da-4bdd-4d4d-9c15-cd754b7d0d3c', '2024-04-16 14:34:20.416016983+08:00', '2024-04-16 14:34:20.416016983+08:00', NULL, 349.1000061, 30.00000000, 0.389999986, '16/04/2024 14:35', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('302667af-cddc-4ee8-84a4-ce42af3d0630', '2024-04-16 05:04:21.315011878+08:00', '2024-04-16 05:04:21.315011878+08:00', NULL, 352.2999878, 30.89999962, 0.389999986, '16/04/2024 05:05', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('30d39115-c10a-49ee-ab95-d6681fc151db', '2024-04-16 03:34:20.947011179+08:00', '2024-04-16 03:34:20.947011179+08:00', NULL, 355.6000061, 30.89999962, 0.389999986, '16/04/2024 03:35', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('310e8137-3de8-4e73-9f74-a202298c56b7', '2024-04-16 05:19:21.104369311+08:00', '2024-04-16 05:19:21.104369311+08:00', NULL, 351.5000000, 30.89999962, 0.389999986, '16/04/2024 05:20', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('35c29789-9dae-4acb-a1e9-eeeed8e7356e', '2024-04-16 09:04:21.377819296+08:00', '2024-04-16 09:04:21.377819296+08:00', NULL, 377.6000061, 31.00000000, 0.389999986, '16/04/2024 09:05', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('36397561-8e0b-4910-b289-fbaba8afdf0a', '2024-04-16 09:39:21.406325392+08:00', '2024-04-16 09:39:21.406325392+08:00', NULL, 350.7000122, 30.60000038, 0.389999986, '16/04/2024 09:40', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('36b4dbba-6561-4f6d-bdfa-9bb33068c049', '2024-04-16 06:59:20.270058391+08:00', '2024-04-16 06:59:20.270058391+08:00', NULL, 349.8999939, 31.79999924, 0.389999986, '16/04/2024 07:00', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('39069b6f-bfbc-4a2c-a7cd-1664070d64e7', '2024-04-16 04:49:21.046111304+08:00', '2024-04-16 04:49:21.046111304+08:00', NULL, 356.3999939, 31.10000038, 0.389999986, '16/04/2024 04:50', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('3b75bba4-15b0-4e2a-a133-153f68fe1d1e', '2024-04-16 15:44:20.951570333+08:00', '2024-04-16 15:44:20.951570333+08:00', NULL, 382.7999878, 29.89999962, 0.389999986, '16/04/2024 15:45', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('3da8f7ee-b72b-4e9a-bc1a-8b19331d873d', '2024-04-16 14:59:20.939213509+08:00', '2024-04-16 14:59:20.939213509+08:00', NULL, 380.2000122, 29.70000076, 0.389999986, '16/04/2024 15:00', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('3f266c4a-5c9c-46c9-834f-c4c5a1905be2', '2024-04-16 03:54:20.354726845+08:00', '2024-04-16 03:54:20.354726845+08:00', NULL, 343.5000000, 31.39999962, 0.389999986, '16/04/2024 03:55', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('4094ef9b-9b30-4704-9fa5-53cd1ffb83b8', '2024-04-16 12:34:19.770144519+08:00', '2024-04-16 12:34:19.770144519+08:00', NULL, 346.7000122, 30.20000076, 0.389999986, '16/04/2024 12:35', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('423776aa-0438-4edc-90ca-809b17622e4d', '2024-04-16 06:34:20.413602102+08:00', '2024-04-16 06:34:20.413602102+08:00', NULL, 353.1000061, 31.00000000, 0.389999986, '16/04/2024 06:35', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('43bfe455-6cdc-4406-b823-a1785c6c4115', '2024-04-16 14:29:19.774108465+08:00', '2024-04-16 14:29:19.774108465+08:00', NULL, 346.7000122, 30.10000038, 0.389999986, '16/04/2024 14:30', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('451d8643-6b7f-4a11-93b3-0548e329149f', '2024-04-16 01:49:20.746437122+08:00', '2024-04-16 01:49:20.746437122+08:00', NULL, 388.1000061, 30.79999924, 0.389999986, '16/04/2024 01:50', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('45f6d53d-ce9a-492a-b868-5591a38010ce', '2024-04-16 04:14:20.084914241+08:00', '2024-04-16 04:14:20.084914241+08:00', NULL, 359.7000122, 30.70000076, 0.389999986, '16/04/2024 04:15', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('4692c342-c576-42ee-bed1-ae088eed6151', '2024-04-16 01:59:21.547976576+08:00', '2024-04-16 01:59:21.547976576+08:00', NULL, 356.3999939, 31.00000000, 0.389999986, '16/04/2024 02:00', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('46be5574-9cef-49b8-a3d4-cf1ea9f74732', '2024-04-16 08:39:22.727182964+08:00', '2024-04-16 08:39:22.727182964+08:00', NULL, 354.7999878, 31.10000038, 0.389999986, '16/04/2024 08:40', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('47a71db7-a8c9-42ab-aa96-dcfc555b22f9', '2024-04-16 09:24:21.012823202+08:00', '2024-04-16 09:24:21.012823202+08:00', NULL, 352.2999878, 30.89999962, 0.389999986, '16/04/2024 09:25', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('48a714a9-f7d7-4141-8143-9ae6df1283cd', '2024-04-16 04:09:20.18133816+08:00', '2024-04-16 04:09:20.18133816+08:00', NULL, 359.7000122, 30.60000038, 0.389999986, '16/04/2024 04:10', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('4955091a-d95e-45a5-a5bc-5d09b072f3de', '2024-04-16 14:04:19.114632041+08:00', '2024-04-16 14:04:19.114632041+08:00', NULL, 349.1000061, 30.70000076, 0.389999986, '16/04/2024 14:05', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('4a1f6e38-3091-4a48-ac91-026c7e08b1dd', '2024-04-16 06:09:20.503417023+08:00', '2024-04-16 06:09:20.503417023+08:00', NULL, 357.2999878, 31.39999962, 0.389999986, '16/04/2024 06:10', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('4a864396-000e-4b9d-a408-63c79b4553c3', '2024-04-16 14:39:20.343169278+08:00', '2024-04-16 14:39:20.343169278+08:00', NULL, 352.2999878, 29.70000076, 0.389999986, '16/04/2024 14:40', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('4ade6d84-c6f9-4f86-a93c-6c041dbc2611', '2024-04-16 04:24:19.871247919+08:00', '2024-04-16 04:24:19.871247919+08:00', NULL, 371.5000000, 30.70000076, 0.389999986, '16/04/2024 04:25', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('4ba03dec-c3f7-4617-9da4-61d41e496609', '2024-04-16 04:39:20.6111703+08:00', '2024-04-16 04:39:20.6111703+08:00', NULL, 354.7999878, 30.89999962, 0.389999986, '16/04/2024 04:40', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('4be3c50a-45a1-421a-bb7c-57ddf1917c8b', '2024-04-16 06:39:21.453123178+08:00', '2024-04-16 06:39:21.453123178+08:00', NULL, 392.6000061, 31.20000076, 0.389999986, '16/04/2024 06:40', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('4c15a2cf-59e0-4466-8be0-1c8a6d2b2920', '2024-04-16 02:29:20.472203464+08:00', '2024-04-16 02:29:20.472203464+08:00', NULL, 377.6000061, 31.10000038, 0.389999986, '16/04/2024 02:30', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('4cc2f9b4-9f92-423e-81fc-e0b489014ff4', '2024-04-16 15:29:21.15822155+08:00', '2024-04-16 15:29:21.15822155+08:00', NULL, 360.6000061, 30.20000076, 0.389999986, '16/04/2024 15:30', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('4d62375e-7d53-4a82-ac0d-a9863ca2f36e', '2024-04-16 00:44:21.170275042+08:00', '2024-04-16 00:44:21.170275042+08:00', NULL, 394.3999939, 30.89999962, 0.389999986, '16/04/2024 00:45', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('4dfe9f25-11a0-4205-8adf-3c0b7d359f4e', '2024-04-16 00:14:20.815487998+08:00', '2024-04-16 00:14:20.815487998+08:00', NULL, 382.7999878, 31.10000038, 0.389999986, '16/04/2024 00:15', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('4e1b73a0-5464-4ea0-8aaa-57c6c6fd844d', '2024-04-16 03:44:20.091177965+08:00', '2024-04-16 03:44:20.091177965+08:00', NULL, 362.2000122, 31.39999962, 0.389999986, '16/04/2024 03:45', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('4ec977f7-a983-4e64-8974-33432548f1a2', '2024-04-16 08:54:21.063886993+08:00', '2024-04-16 08:54:21.063886993+08:00', NULL, 354.7999878, 30.60000038, 0.389999986, '16/04/2024 08:55', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('4f6bfb17-55a1-4c20-ab7e-578e3b2c5af3', '2024-04-16 10:24:21.433536925+08:00', '2024-04-16 10:24:21.433536925+08:00', NULL, 349.8999939, 30.60000038, 0.389999986, '16/04/2024 10:25', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('510c1804-c730-418b-b8e8-f5efd2abf237', '2024-04-16 10:29:22.421226829+08:00', '2024-04-16 10:29:22.421226829+08:00', NULL, 351.5000000, 30.39999962, 0.389999986, '16/04/2024 10:30', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('53c1811b-e80d-47f9-a55f-031c07b61892', '2024-04-16 14:49:20.934288944+08:00', '2024-04-16 14:49:20.934288944+08:00', NULL, 356.3999939, 30.00000000, 0.389999986, '16/04/2024 14:50', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('545f9f3e-705a-471d-985f-b2d755ad9d40', '2024-04-16 01:39:20.496985083+08:00', '2024-04-16 01:39:20.496985083+08:00', NULL, 377.6000061, 31.00000000, 0.389999986, '16/04/2024 01:40', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('55366263-c96c-43e9-a875-23fc9d495aa1', '2024-04-16 00:59:21.016023296+08:00', '2024-04-16 00:59:21.016023296+08:00', NULL, 383.7000122, 31.20000076, 0.389999986, '16/04/2024 01:00', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('559bf7ed-b95b-42b2-b879-0ffe114a78a1', '2024-04-16 06:24:20.627436088+08:00', '2024-04-16 06:24:20.627436088+08:00', NULL, 360.6000061, 30.89999962, 0.389999986, '16/04/2024 06:25', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('570d31e3-59ab-4911-8ca0-2aca7d953f83', '2024-04-16 05:54:20.541068809+08:00', '2024-04-16 05:54:20.541068809+08:00', NULL, 350.7000122, 30.79999924, 0.389999986, '16/04/2024 05:55', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('57764dc7-4c49-4cf2-9e6b-dad3ec54f677', '2024-04-16 04:59:20.800672173+08:00', '2024-04-16 04:59:20.800672173+08:00', NULL, 393.5000000, 30.70000076, 0.389999986, '16/04/2024 05:00', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('5990c8d6-576c-447d-9fe8-21d69d5b61ae', '2024-04-16 11:44:20.960296864+08:00', '2024-04-16 11:44:20.960296864+08:00', NULL, 352.2999878, 30.60000038, 0.389999986, '16/04/2024 11:45', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('5d978ac1-8884-46e1-ab97-69db18f4fb96', '2024-04-16 03:39:20.054602296+08:00', '2024-04-16 03:39:20.054602296+08:00', NULL, 360.6000061, 30.79999924, 0.389999986, '16/04/2024 03:40', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('61503308-4b1c-4e41-816d-b85e3510263c', '2024-04-16 05:14:20.666998123+08:00', '2024-04-16 05:14:20.666998123+08:00', NULL, 356.3999939, 31.29999924, 0.389999986, '16/04/2024 05:15', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('617d80fb-544e-4dc9-b4b9-73b0bd741226', '2024-04-16 08:49:21.098215921+08:00', '2024-04-16 08:49:21.098215921+08:00', NULL, 354.0000000, 31.00000000, 0.389999986, '16/04/2024 08:50', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('65939911-4644-461e-bdac-5f480c103e13', '2024-04-16 06:44:20.991502513+08:00', '2024-04-16 06:44:20.991502513+08:00', NULL, 360.6000061, 31.20000076, 0.389999986, '16/04/2024 06:45', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('67fc4c1b-9812-4375-aa0f-b781e2e07b99', '2024-04-16 05:29:20.516339102+08:00', '2024-04-16 05:29:20.516339102+08:00', NULL, 363.8999939, 30.89999962, 0.389999986, '16/04/2024 05:30', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('687a08ef-e815-4327-af4f-17e70b875a2d', '2024-04-16 08:09:21.081937362+08:00', '2024-04-16 08:09:21.081937362+08:00', NULL, 353.1000061, 30.89999962, 0.389999986, '16/04/2024 08:10', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('68d9a5f7-353c-4117-910c-9800952d3229', '2024-04-16 12:29:21.020459023+08:00', '2024-04-16 12:29:21.020459023+08:00', NULL, 349.8999939, 30.29999924, 0.389999986, '16/04/2024 12:30', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('6aae745b-7838-4f87-9e03-7d2fa992a8f9', '2024-04-16 03:49:21.196638425+08:00', '2024-04-16 03:49:21.196638425+08:00', NULL, 354.0000000, 31.00000000, 0.389999986, '16/04/2024 03:50', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('6eb3645c-5f31-4755-8bb5-00262bbe1a45', '2024-04-16 11:29:22.045422469+08:00', '2024-04-16 11:29:22.045422469+08:00', NULL, 373.2999878, 30.60000038, 0.389999986, '16/04/2024 11:30', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('72f188ff-2562-4d2e-a4a9-ac4a453313c0', '2024-04-16 13:19:20.613232469+08:00', '2024-04-16 13:19:20.613232469+08:00', NULL, 351.5000000, 30.00000000, 0.389999986, '16/04/2024 13:20', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('74169090-b0cc-4817-a4d3-b0a670fe50eb', '2024-04-16 01:44:21.209931123+08:00', '2024-04-16 01:44:21.209931123+08:00', NULL, 381.0000000, 30.70000076, 0.389999986, '16/04/2024 01:45', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('75d1e1c5-d49f-496f-9642-abb2058bf1f1', '2024-04-16 10:04:24.634301915+08:00', '2024-04-16 10:04:24.634301915+08:00', NULL, 349.8999939, 30.29999924, 0.389999986, '16/04/2024 10:05', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('761abd14-84a2-440a-bb5d-b5976cfec592', '2024-04-16 11:24:20.837849013+08:00', '2024-04-16 11:24:20.837849013+08:00', NULL, 372.2999878, 30.29999924, 0.389999986, '16/04/2024 11:25', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('787e12e6-76b7-4e62-9411-91da1e0b4656', '2024-04-16 15:19:20.901203838+08:00', '2024-04-16 15:19:20.901203838+08:00', NULL, 354.0000000, 29.89999962, 0.389999986, '16/04/2024 15:20', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('78e3d593-9750-490d-88fc-bc28bf122333', '2024-04-16 11:34:22.299559516+08:00', '2024-04-16 11:34:22.299559516+08:00', NULL, 354.0000000, 30.89999962, 0.389999986, '16/04/2024 11:35', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('7aeda1a4-1f37-430a-8df1-05cfb51cb86e', '2024-04-16 09:59:27.990033444+08:00', '2024-04-16 09:59:27.990033444+08:00', NULL, 380.2000122, 30.20000076, 0.389999986, '16/04/2024 10:00', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('7e47dec9-b198-4aff-9a4f-9775bb8bab89', '2024-04-16 10:19:23.704519452+08:00', '2024-04-16 10:19:23.704519452+08:00', NULL, 349.1000061, 30.89999962, 0.389999986, '16/04/2024 10:20', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('811a0658-fbd4-4907-a83e-be6ea448458a', '2024-04-16 01:09:20.126388722+08:00', '2024-04-16 01:09:20.126388722+08:00', NULL, 386.2999878, 31.39999962, 0.389999986, '16/04/2024 01:10', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('815571ea-d7b5-4a0f-a271-edf93664ad06', '2024-04-16 14:09:20.741272447+08:00', '2024-04-16 14:09:20.741272447+08:00', NULL, 382.7999878, 29.89999962, 0.389999986, '16/04/2024 14:10', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('81a007f0-e8be-4c59-be93-df8e6cdd9ada', '2024-04-16 01:04:20.864562653+08:00', '2024-04-16 01:04:20.864562653+08:00', NULL, 395.2999878, 30.50000000, 0.389999986, '16/04/2024 01:05', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('81d11fb0-cfda-40b4-b3e5-39ed03fb4885', '2024-04-16 00:54:20.101219845+08:00', '2024-04-16 00:54:20.101219845+08:00', NULL, 390.7999878, 31.10000038, 0.389999986, '16/04/2024 00:55', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('834a661c-ec8c-4ccf-b82e-401a9ba6d7a2', '2024-04-16 13:04:19.810626294+08:00', '2024-04-16 13:04:19.810626294+08:00', NULL, 352.2999878, 30.39999962, 0.389999986, '16/04/2024 13:05', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('869a22ba-1479-4657-8634-2642062a1620', '2024-04-16 03:19:21.051801933+08:00', '2024-04-16 03:19:21.051801933+08:00', NULL, 357.2999878, 31.00000000, 0.389999986, '16/04/2024 03:20', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('87871ccb-7053-4798-9075-006c3390c38f', '2024-04-16 05:24:20.6851818+08:00', '2024-04-16 05:24:20.6851818+08:00', NULL, 358.8999939, 31.00000000, 0.389999986, '16/04/2024 05:25', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('89537130-d067-4469-b76e-3b09e141a42e', '2024-04-16 08:24:20.847510766+08:00', '2024-04-16 08:24:20.847510766+08:00', NULL, 382.7999878, 31.10000038, 0.389999986, '16/04/2024 08:25', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('8a30d85e-47ec-45cd-81ac-04becab422b4', '2024-04-16 02:49:21.660040085+08:00', '2024-04-16 02:49:21.660040085+08:00', NULL, 361.3999939, 30.89999962, 0.389999986, '16/04/2024 02:50', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('8b25fb4b-3697-460c-a4de-ae27acd1393b', '2024-04-15 23:59:20.609958101+08:00', '2024-04-15 23:59:20.609958101+08:00', NULL, 367.2999878, 31.00000000, 0.389999986, '16/04/2024 00:00', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('8b3914f3-8075-43c9-90eb-3d1042806b6b', '2024-04-16 03:14:20.664410596+08:00', '2024-04-16 03:14:20.664410596+08:00', NULL, 399.0000000, 30.89999962, 0.389999986, '16/04/2024 03:15', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('8b93334e-9709-4093-bc59-fa1c388b59a0', '2024-04-16 00:34:21.461090368+08:00', '2024-04-16 00:34:21.461090368+08:00', NULL, 363.8999939, 31.10000038, 0.389999986, '16/04/2024 00:35', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('8c1fd842-4e0d-4bec-995c-a19c69f6d5d7', '2024-04-16 12:19:21.353522837+08:00', '2024-04-16 12:19:21.353522837+08:00', NULL, 353.1000061, 30.50000000, 0.389999986, '16/04/2024 12:20', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('8cf4d683-90a0-4e69-94d1-e8bfed703af6', '2024-04-16 02:54:16.958713872+08:00', '2024-04-16 02:54:16.958713872+08:00', NULL, 354.7999878, 30.89999962, 0.389999986, '16/04/2024 02:55', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('8cf5e6b0-bf34-4207-9691-870d234fc7a3', '2024-04-16 05:34:21.468758791+08:00', '2024-04-16 05:34:21.468758791+08:00', NULL, 357.2999878, 30.60000038, 0.389999986, '16/04/2024 05:35', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('8f55d009-03aa-4164-aea6-feee7a0ff4ca', '2024-04-16 02:19:20.248246053+08:00', '2024-04-16 02:19:20.248246053+08:00', NULL, 370.6000061, 31.20000076, 0.389999986, '16/04/2024 02:20', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('9088d3b6-50c8-4158-943e-6f46dff315d6', '2024-04-16 02:39:20.859552004+08:00', '2024-04-16 02:39:20.859552004+08:00', NULL, 351.5000000, 30.89999962, 0.389999986, '16/04/2024 02:40', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('9526fbc6-9144-41ad-8f36-56136187bf68', '2024-04-16 07:24:20.829405034+08:00', '2024-04-16 07:24:20.829405034+08:00', NULL, 341.2000122, 30.79999924, 0.389999986, '16/04/2024 07:25', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('9989dbf7-6954-4052-a3a1-f03e177f0964', '2024-04-16 07:34:20.362329757+08:00', '2024-04-16 07:34:20.362329757+08:00', NULL, 348.2999878, 30.60000038, 0.389999986, '16/04/2024 07:35', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('9c23adba-cb32-4431-8e9a-6d61de594e2d', '2024-04-16 04:29:20.81104885+08:00', '2024-04-16 04:29:20.81104885+08:00', NULL, 359.7000122, 31.39999962, 0.389999986, '16/04/2024 04:30', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('9d46d3a1-7791-4afd-9c3f-627b1ec28405', '2024-04-16 08:34:20.629133121+08:00', '2024-04-16 08:34:20.629133121+08:00', NULL, 357.2999878, 30.89999962, 0.389999986, '16/04/2024 08:35', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('9e1f14f2-7e60-4fd4-81dc-d946938affc4', '2024-04-16 00:24:20.006627538+08:00', '2024-04-16 00:24:20.006627538+08:00', NULL, 377.6000061, 31.00000000, 0.389999986, '16/04/2024 00:25', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('9e35261e-c185-4fad-bf7c-783c0f0f7b7a', '2024-04-16 10:39:21.165122123+08:00', '2024-04-16 10:39:21.165122123+08:00', NULL, 353.1000061, 30.89999962, 0.389999986, '16/04/2024 10:40', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('9e74b9f7-22ea-4175-a9d0-828af0185982', '2024-04-16 09:44:20.57638504+08:00', '2024-04-16 09:44:20.57638504+08:00', NULL, 354.0000000, 30.60000038, 0.389999986, '16/04/2024 09:45', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('a0352f04-aa6a-4e21-8c06-74e38d414615', '2024-04-16 01:29:21.415070907+08:00', '2024-04-16 01:29:21.415070907+08:00', NULL, 365.6000061, 31.39999962, 0.389999986, '16/04/2024 01:30', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('a0a5fb62-aeea-4051-b8f5-14a99a321bc1', '2024-04-16 14:24:19.775601896+08:00', '2024-04-16 14:24:19.775601896+08:00', NULL, 350.7000122, 30.00000000, 0.389999986, '16/04/2024 14:25', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('a0e2e952-fb30-4aaa-9096-a84171bb4cdf', '2024-04-16 02:09:20.265047249+08:00', '2024-04-16 02:09:20.265047249+08:00', NULL, 375.7999878, 31.10000038, 0.389999986, '16/04/2024 02:10', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('a5095783-cac4-48e2-a1e1-529db1f71a79', '2024-04-16 09:54:25.392945552+08:00', '2024-04-16 09:54:25.392945552+08:00', NULL, 373.2999878, 30.39999962, 0.389999986, '16/04/2024 09:55', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('a7d2f315-1dcd-4653-8c20-3464e512417c', '2024-04-16 15:14:20.624362792+08:00', '2024-04-16 15:14:20.624362792+08:00', NULL, 357.2999878, 29.60000038, 0.389999986, '16/04/2024 15:15', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('a8d72f09-6d38-4ac4-9d2b-088626235f07', '2024-04-16 12:14:19.467469868+08:00', '2024-04-16 12:14:19.467469868+08:00', NULL, 351.5000000, 30.39999962, 0.389999986, '16/04/2024 12:15', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('a9111625-c3b9-4381-9ab5-63771d041f17', '2024-04-16 09:19:21.150802353+08:00', '2024-04-16 09:19:21.150802353+08:00', NULL, 354.0000000, 30.60000038, 0.389999986, '16/04/2024 09:20', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('a9a1213b-2755-4fe5-920b-c5cbe486cc7d', '2024-04-16 07:49:20.50484195+08:00', '2024-04-16 07:49:20.50484195+08:00', NULL, 356.3999939, 30.89999962, 0.389999986, '16/04/2024 07:50', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('aa565fe3-9f42-4aab-b0ae-7e301d06d7a0', '2024-04-16 09:09:20.563188905+08:00', '2024-04-16 09:09:20.563188905+08:00', NULL, 375.7999878, 30.89999962, 0.389999986, '16/04/2024 09:10', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('abae33f5-84d1-451d-b1a2-52972e75be7f', '2024-04-16 13:14:21.178484719+08:00', '2024-04-16 13:14:21.178484719+08:00', NULL, 353.1000061, 30.20000076, 0.389999986, '16/04/2024 13:15', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('ad081b7f-b7dc-49b7-bb45-dad116fada8c', '2024-04-16 04:34:21.113795022+08:00', '2024-04-16 04:34:21.113795022+08:00', NULL, 349.1000061, 30.89999962, 0.389999986, '16/04/2024 04:35', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('adb3ccb7-8611-4b37-aff2-6e5216fe61d1', '2024-04-16 00:49:20.485168859+08:00', '2024-04-16 00:49:20.485168859+08:00', NULL, 387.2999878, 31.10000038, 0.389999986, '16/04/2024 00:50', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('af0a77b5-4d0c-44b4-b41b-52f4eab2d5b9', '2024-04-16 11:04:21.074102803+08:00', '2024-04-16 11:04:21.074102803+08:00', NULL, 350.7000122, 30.89999962, 0.389999986, '16/04/2024 11:05', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('af229e74-ff6b-4e61-8fd7-bf5213494fc6', '2024-04-16 12:54:20.373612697+08:00', '2024-04-16 12:54:20.373612697+08:00', NULL, 341.2000122, 30.29999924, 0.389999986, '16/04/2024 12:55', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('b07b34d4-8cbf-4df9-8dca-ff31b4ca3399', '2024-04-16 02:14:20.679002775+08:00', '2024-04-16 02:14:20.679002775+08:00', NULL, 372.2999878, 31.20000076, 0.389999986, '16/04/2024 02:15', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('b0efb987-4433-4954-ad42-b76399090207', '2024-04-16 13:34:20.717368414+08:00', '2024-04-16 13:34:20.717368414+08:00', NULL, 353.1000061, 30.00000000, 0.389999986, '16/04/2024 13:35', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('b132a44a-2f7a-4a44-83c0-32ddc5d69762', '2024-04-16 07:39:21.452778565+08:00', '2024-04-16 07:39:21.452778565+08:00', NULL, 357.2999878, 30.89999962, 0.389999986, '16/04/2024 07:40', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('b521f6e0-0e05-4d28-932d-a9d4d46d19aa', '2024-04-16 03:29:20.948393163+08:00', '2024-04-16 03:29:20.948393163+08:00', NULL, 349.8999939, 31.10000038, 0.389999986, '16/04/2024 03:30', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('ba56c486-16f5-4f79-945c-c58ea7d230d5', '2024-04-16 07:14:21.040562108+08:00', '2024-04-16 07:14:21.040562108+08:00', NULL, 356.3999939, 30.89999962, 0.389999986, '16/04/2024 07:15', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('bc576739-be41-4f7a-b4e4-01de448d87dc', '2024-04-16 04:19:21.438648202+08:00', '2024-04-16 04:19:21.438648202+08:00', NULL, 373.2999878, 30.89999962, 0.389999986, '16/04/2024 04:20', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('bcb5140a-0f27-4071-be23-e6e5317a70c2', '2024-04-16 11:19:18.282982277+08:00', '2024-04-16 11:19:18.282982277+08:00', NULL, 347.5000000, 30.20000076, 0.389999986, '16/04/2024 11:20', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('becb299b-654a-48f8-b8c6-e0e70e44b752', '2024-04-16 00:04:20.424965908+08:00', '2024-04-16 00:04:20.424965908+08:00', NULL, 385.5000000, 30.79999924, 0.389999986, '16/04/2024 00:05', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('bed5a92e-23f8-4676-b79b-cbeea5313a86', '2024-04-16 11:54:21.206276652+08:00', '2024-04-16 11:54:21.206276652+08:00', NULL, 345.1000061, 30.79999924, 0.389999986, '16/04/2024 11:55', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('c13035c8-d634-40cb-b0c1-9b8817df720d', '2024-04-16 01:14:21.328765365+08:00', '2024-04-16 01:14:21.328765365+08:00', NULL, 385.5000000, 31.10000038, 0.389999986, '16/04/2024 01:15', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('c1b1f535-6547-4604-aa6e-5da80ecb4dea', '2024-04-16 14:54:20.50112274+08:00', '2024-04-16 14:54:20.50112274+08:00', NULL, 376.7000122, 29.70000076, 0.389999986, '16/04/2024 14:55', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('c20841e8-7432-4cc4-83fc-03bbc37d021f', '2024-04-16 07:54:21.136825886+08:00', '2024-04-16 07:54:21.136825886+08:00', NULL, 356.3999939, 31.10000038, 0.389999986, '16/04/2024 07:55', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('c453440f-4507-4837-ad17-575649f1b9f6', '2024-04-16 10:49:20.931400887+08:00', '2024-04-16 10:49:20.931400887+08:00', NULL, 370.6000061, 31.00000000, 0.389999986, '16/04/2024 10:50', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('c53c7364-b4c1-47f1-bb9f-0f3b6b7d2ef2', '2024-04-16 10:54:20.610905325+08:00', '2024-04-16 10:54:20.610905325+08:00', NULL, 345.8999939, 30.39999962, 0.389999986, '16/04/2024 10:55', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('c5b3f326-0ca9-4346-a832-61770a9b463a', '2024-04-16 06:49:20.269406288+08:00', '2024-04-16 06:49:20.269406288+08:00', NULL, 346.7000122, 31.10000038, 0.389999986, '16/04/2024 06:50', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('c713127d-cc95-4460-af20-fea96ce791cf', '2024-04-16 14:44:19.873711966+08:00', '2024-04-16 14:44:19.873711966+08:00', NULL, 352.2999878, 29.79999924, 0.389999986, '16/04/2024 14:45', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('c7dbc50b-ab00-4b1c-9c7c-fec4471292cd', '2024-04-16 01:34:20.43880536+08:00', '2024-04-16 01:34:20.43880536+08:00', NULL, 379.2000122, 30.89999962, 0.389999986, '16/04/2024 01:35', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('c7e2f5b1-0f0e-476c-89b2-a19cb4cf97c4', '2024-04-16 04:54:20.01954449+08:00', '2024-04-16 04:54:20.01954449+08:00', NULL, 358.8999939, 31.70000076, 0.389999986, '16/04/2024 04:55', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('c9064e5a-3d12-46d8-8480-af6bbd0a7ce1', '2024-04-16 07:29:20.45600844+08:00', '2024-04-16 07:29:20.45600844+08:00', NULL, 350.7000122, 30.79999924, 0.389999986, '16/04/2024 07:30', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('cb9732e5-e773-4ee4-9767-a869c64f9a38', '2024-04-16 05:09:20.265557439+08:00', '2024-04-16 05:09:20.265557439+08:00', NULL, 354.0000000, 31.10000038, 0.389999986, '16/04/2024 05:10', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('cc2c89e3-df47-4b51-9a4e-c66c0857bcc6', '2024-04-16 08:59:21.05024332+08:00', '2024-04-16 08:59:21.05024332+08:00', NULL, 354.7999878, 30.79999924, 0.389999986, '16/04/2024 09:00', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('d0621901-c2f2-47f9-948b-eea01d4798d4', '2024-04-16 13:54:26.562555253+08:00', '2024-04-16 13:54:26.562555253+08:00', NULL, 346.7000122, 30.39999962, 0.389999986, '16/04/2024 13:55', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('d2674d49-be50-4a5c-af49-92d14cebd7b5', '2024-04-16 15:39:20.344583846+08:00', '2024-04-16 15:39:20.344583846+08:00', NULL, 380.2000122, 30.39999962, 0.389999986, '16/04/2024 15:40', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('d3a17d5c-458f-430e-b6f8-66866c419a9b', '2024-04-16 10:59:22.34318682+08:00', '2024-04-16 10:59:22.34318682+08:00', NULL, 350.7000122, 31.39999962, 0.389999986, '16/04/2024 11:00', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('d3f46c46-7787-4764-abb7-ac2d674baa79', '2024-04-16 14:19:21.356086738+08:00', '2024-04-16 14:19:21.356086738+08:00', NULL, 374.1000061, 30.29999924, 0.389999986, '16/04/2024 14:20', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('d40d8b8a-a084-4e45-a6d5-910ded37fce5', '2024-04-16 14:14:18.299901938+08:00', '2024-04-16 14:14:18.299901938+08:00', NULL, 377.6000061, 30.10000038, 0.389999986, '16/04/2024 14:15', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('d72df849-59b8-4980-b7e5-608611f6a6e0', '2024-04-16 02:44:21.22802607+08:00', '2024-04-16 02:44:21.22802607+08:00', NULL, 351.5000000, 30.89999962, 0.389999986, '16/04/2024 02:45', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('d876033e-b840-49d6-bb87-9f4697faba49', '2024-04-16 07:19:20.965707709+08:00', '2024-04-16 07:19:20.965707709+08:00', NULL, 354.7999878, 31.10000038, 0.389999986, '16/04/2024 07:20', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('d92a9802-80ec-43fc-96e4-bd2d1c008079', '2024-04-16 13:59:21.523330908+08:00', '2024-04-16 13:59:21.523330908+08:00', NULL, 343.5000000, 29.89999962, 0.389999986, '16/04/2024 14:00', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('d950ab9c-391f-4634-a621-840b9d7413c3', '2024-04-16 13:29:21.384420946+08:00', '2024-04-16 13:29:21.384420946+08:00', NULL, 376.7000122, 29.70000076, 0.389999986, '16/04/2024 13:30', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('d988e292-8da2-4899-9d9a-4d49c1f8a1c0', '2024-04-16 04:04:21.159346305+08:00', '2024-04-16 04:04:21.159346305+08:00', NULL, 356.3999939, 31.10000038, 0.389999986, '16/04/2024 04:05', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('d98febf4-8c53-472c-9f7b-859f68a1bea3', '2024-04-16 11:49:20.176032461+08:00', '2024-04-16 11:49:20.176032461+08:00', NULL, 354.0000000, 30.39999962, 0.389999986, '16/04/2024 11:50', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('da7d01f6-1a36-4257-a32a-6ea937178db7', '2024-04-16 03:24:20.821934996+08:00', '2024-04-16 03:24:20.821934996+08:00', NULL, 355.6000061, 30.89999962, 0.389999986, '16/04/2024 03:25', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('dbb26f2b-d1e1-46bd-8c0e-7a2384d1b405', '2024-04-16 00:39:20.911677899+08:00', '2024-04-16 00:39:20.911677899+08:00', NULL, 374.8999939, 31.60000038, 0.389999986, '16/04/2024 00:40', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('dda02a40-e533-4bb0-9581-d219727733c2', '2024-04-16 07:09:21.256395121+08:00', '2024-04-16 07:09:21.256395121+08:00', NULL, 354.7999878, 31.10000038, 0.389999986, '16/04/2024 07:10', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('e09e6dda-273d-478d-bbcc-ff6482b3ce5e', '2024-04-16 13:24:20.624483788+08:00', '2024-04-16 13:24:20.624483788+08:00', NULL, 367.2999878, 30.39999962, 0.389999986, '16/04/2024 13:25', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('e0f12a55-e361-44ec-b819-b32dd55eab29', '2024-04-16 08:04:21.001259595+08:00', '2024-04-16 08:04:21.001259595+08:00', NULL, 352.2999878, 30.89999962, 0.389999986, '16/04/2024 08:05', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('e2622f3c-123d-427d-b653-a112df2d83f6', '2024-04-16 15:04:20.460168253+08:00', '2024-04-16 15:04:20.460168253+08:00', NULL, 380.2000122, 29.79999924, 0.389999986, '16/04/2024 15:05', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('e50da6db-341e-4d41-a7b9-bbb6769b487f', '2024-04-16 12:39:20.530174218+08:00', '2024-04-16 12:39:20.530174218+08:00', NULL, 346.7000122, 30.60000038, 0.389999986, '16/04/2024 12:40', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('e5670361-18e7-46a9-a3c7-111313cda585', '2024-04-16 03:09:20.322495676+08:00', '2024-04-16 03:09:20.322495676+08:00', NULL, 363.8999939, 31.20000076, 0.389999986, '16/04/2024 03:10', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('e6b98212-b7f0-4fd9-bc6d-b002ba8eefbe', '2024-04-16 05:39:20.079558445+08:00', '2024-04-16 05:39:20.079558445+08:00', NULL, 349.8999939, 31.00000000, 0.389999986, '16/04/2024 05:40', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('e80d4dee-31ce-4823-9d69-c792257d3342', '2024-04-16 00:09:21.204198439+08:00', '2024-04-16 00:09:21.204198439+08:00', NULL, 385.5000000, 31.10000038, 0.389999986, '16/04/2024 00:10', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('e8844dd4-30c7-4301-8f7f-2b4b571bb42c', '2024-04-16 02:59:19.825332437+08:00', '2024-04-16 02:59:19.825332437+08:00', NULL, 363.0000000, 31.29999924, 0.389999986, '16/04/2024 03:00', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('eb183578-f33e-433d-8bb1-1c9696ffa036', '2024-04-16 04:44:21.189104476+08:00', '2024-04-16 04:44:21.189104476+08:00', NULL, 354.7999878, 30.89999962, 0.389999986, '16/04/2024 04:45', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('ef25598b-ee0b-483e-85f9-74b7d7526a60', '2024-04-16 05:44:20.562933864+08:00', '2024-04-16 05:44:20.562933864+08:00', NULL, 353.1000061, 30.50000000, 0.389999986, '16/04/2024 05:45', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('f288ffc4-4cf1-42e0-ac3a-3fe06e4abe50', '2024-04-16 11:14:20.813535723+08:00', '2024-04-16 11:14:20.813535723+08:00', NULL, 350.7000122, 30.70000076, 0.389999986, '16/04/2024 11:15', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('f3beb870-e838-40fe-81dd-c5fd6466543c', '2024-04-16 11:09:18.62289742+08:00', '2024-04-16 11:09:18.62289742+08:00', NULL, 353.1000061, 30.39999962, 0.389999986, '16/04/2024 11:10', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('f4c6c53b-fefb-4a40-8a49-4618529ba9ed', '2024-04-16 00:19:21.293643624+08:00', '2024-04-16 00:19:21.293643624+08:00', NULL, 382.7999878, 30.89999962, 0.389999986, '16/04/2024 00:20', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('f6b86ec4-fdcb-46f8-9c73-aaf938ce6559', '2024-04-16 15:09:20.736476098+08:00', '2024-04-16 15:09:20.736476098+08:00', NULL, 369.7999878, 29.60000038, 0.389999986, '16/04/2024 15:10', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('f6f705ca-2ea3-45d0-b468-b5bb306987f9', '2024-04-16 03:04:21.458316548+08:00', '2024-04-16 03:04:21.458316548+08:00', NULL, 392.6000061, 31.10000038, 0.389999986, '16/04/2024 03:05', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('f87adb95-74eb-463a-9d4e-cc446e643149', '2024-04-16 11:59:26.984282237+08:00', '2024-04-16 11:59:26.984282237+08:00', NULL, 346.7000122, 30.10000038, 0.389999986, '16/04/2024 12:00', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('fb3e609d-02ef-4186-80e1-9bdea5a48058', '2024-04-16 13:09:19.849049459+08:00', '2024-04-16 13:09:19.849049459+08:00', NULL, 348.2999878, 30.79999924, 0.389999986, '16/04/2024 13:10', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('fcf38449-42a0-44c9-9554-891a6cc5fe30', '2024-04-16 10:09:26.462773105+08:00', '2024-04-16 10:09:26.462773105+08:00', NULL, 348.2999878, 30.60000038, 0.389999986, '16/04/2024 10:10', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('fd172226-799e-4df6-8184-5dc55154ffff', '2024-04-16 15:24:20.261749723+08:00', '2024-04-16 15:24:20.261749723+08:00', NULL, 357.2999878, 30.39999962, 0.389999986, '16/04/2024 15:25', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('fd66c3d1-00dd-492c-87b5-ca79a7100a51', '2024-04-16 02:04:20.682068789+08:00', '2024-04-16 02:04:20.682068789+08:00', NULL, 375.7999878, 30.60000038, 0.389999986, '16/04/2024 02:05', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1'),
('fe6c5b55-ad8e-4243-8a69-c485c1ced62e', '2024-04-16 09:14:20.530392029+08:00', '2024-04-16 09:14:20.530392029+08:00', NULL, 352.2999878, 31.10000038, 0.389999986, '16/04/2024 09:15', '8ed9b0f6-02d6-4ef3-9c11-77991b7b70a1');

-- --------------------------------------------------------

--
-- Structure for view `edge_actuator_view`
--
DROP TABLE IF EXISTS `edge_actuator_view`;

CREATE  VIEW `edge_actuator_view`  AS SELECT `e`.`id` AS `edge_device_id`, `e`.`name` AS `edge_device_name`, `e`.`description` AS `edge_device_description`, `e`.`statusz` AS `edge_device_status`, `e`.`api_key` AS `api_key`, `e`.`passcode` AS `passcode`, `e`.`mqtt_client_id` AS `mqtt_client_id`, `a`.`id` AS `actuator_id`, `a`.`device_name` AS `actuator_name`, `a`.`type_id` AS `actuator_type`, `a`.`statusz` AS `actuator_status`, `a`.`parent_edge_device_id` AS `parent_edge_device_id` FROM (`edge_device_infos` `e` join `actuator_device_infos` `a` on(`e`.`id` = `a`.`parent_edge_device_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `sensor_device_info`
--
DROP TABLE IF EXISTS `sensor_device_info`;

CREATE  VIEW `sensor_device_info`  AS SELECT `s`.`id` AS `sensor_id`, `s`.`name` AS `name`, `s`.`type_id` AS `type_id`, `e`.`statusz` AS `edge_device_status`, `s`.`parent_edge_device_id` AS `parent_edge_device_id`, `e`.`name` AS `edge_device_name`, `e`.`api_key` AS `api_key`, `e`.`passcode` AS `passcode`, `e`.`mqtt_client_id` AS `mqtt_client_id`, `st`.`name` AS `sensor_type_name`, `st`.`icon_path` AS `icon_path`, `s`.`created_at` AS `sensor_created_at`, `s`.`updated_at` AS `sensor_updated_at`, `s`.`deleted_at` AS `sensor_deleted_at`, `e`.`created_at` AS `edge_created_at`, `e`.`updated_at` AS `edge_updated_at`, `e`.`deleted_at` AS `edge_deleted_at`, `st`.`created_at` AS `sensor_type_created_at`, `st`.`updated_at` AS `sensor_type_updated_at`, `st`.`deleted_at` AS `sensor_type_deleted_at` FROM ((`sensors` `s` left join `edge_device_infos` `e` on(`s`.`parent_edge_device_id` = `e`.`id`)) left join `sensor_types` `st` on(`s`.`type_id` = `st`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actuator_device_infos`
--
ALTER TABLE `actuator_device_infos`
  ADD PRIMARY KEY (`row_id`),
  ADD KEY `fk_parent_edge_device_1` (`parent_edge_device_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `edge_device_infos`
--
ALTER TABLE `edge_device_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sensors`
--
ALTER TABLE `sensors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `fk_parent_edge_device` (`parent_edge_device_id`);

--
-- Indexes for table `sensor_limits`
--
ALTER TABLE `sensor_limits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sensor_id` (`sensor_id`);

--
-- Indexes for table `sensor_types`
--
ALTER TABLE `sensor_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `useraccounts`
--
ALTER TABLE `useraccounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actuator_device_infos`
--
ALTER TABLE `actuator_device_infos`
  MODIFY `row_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `sensor_limits`
--
ALTER TABLE `sensor_limits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `useraccounts`
--
ALTER TABLE `useraccounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `actuator_device_infos`
--
ALTER TABLE `actuator_device_infos`
  ADD CONSTRAINT `fk_parent_edge_device_1` FOREIGN KEY (`parent_edge_device_id`) REFERENCES `edge_device_infos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `sensors`
--
ALTER TABLE `sensors`
  ADD CONSTRAINT `fk_parent_edge_device` FOREIGN KEY (`parent_edge_device_id`) REFERENCES `edge_device_infos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `sensors_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `sensor_types` (`id`);

--
-- Constraints for table `sensor_limits`
--
ALTER TABLE `sensor_limits`
  ADD CONSTRAINT `sensor_limits_ibfk_1` FOREIGN KEY (`sensor_id`) REFERENCES `sensors` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
