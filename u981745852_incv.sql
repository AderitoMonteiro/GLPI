-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 06-Maio-2026 às 13:10
-- Versão do servidor: 11.8.6-MariaDB-log
-- versão do PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de dados: `u981745852_incv`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_agents`
--

CREATE TABLE `glpi_agents` (
  `id` int(10) UNSIGNED NOT NULL,
  `deviceid` varchar(255) NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `agenttypes_id` int(10) UNSIGNED NOT NULL,
  `last_contact` timestamp NULL DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `locked` tinyint(4) NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL,
  `useragent` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `port` varchar(6) DEFAULT NULL,
  `remote_addr` varchar(255) DEFAULT NULL,
  `threads_networkdiscovery` int(11) NOT NULL DEFAULT 1 COMMENT 'Number of threads for Network discovery',
  `threads_networkinventory` int(11) NOT NULL DEFAULT 1 COMMENT 'Number of threads for Network inventory',
  `timeout_networkdiscovery` int(11) NOT NULL DEFAULT 0 COMMENT 'Network Discovery task timeout (disabled by default)',
  `timeout_networkinventory` int(11) NOT NULL DEFAULT 0 COMMENT 'Network Inventory task timeout (disabled by default)',
  `use_module_wake_on_lan` tinyint(4) NOT NULL DEFAULT 0,
  `use_module_computer_inventory` tinyint(4) NOT NULL DEFAULT 0,
  `use_module_esx_remote_inventory` tinyint(4) NOT NULL DEFAULT 0,
  `use_module_remote_inventory` tinyint(4) NOT NULL DEFAULT 0,
  `use_module_network_inventory` tinyint(4) NOT NULL DEFAULT 0,
  `use_module_network_discovery` tinyint(4) NOT NULL DEFAULT 0,
  `use_module_package_deployment` tinyint(4) NOT NULL DEFAULT 0,
  `use_module_collect_data` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_agenttypes`
--

CREATE TABLE `glpi_agenttypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_agenttypes`
--

INSERT INTO `glpi_agenttypes` (`id`, `name`) VALUES
(1, 'Core');

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_alerts`
--

CREATE TABLE `glpi_alerts` (
  `id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(100) NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0 COMMENT 'see define.php ALERT_* constant',
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_apiclients`
--

CREATE TABLE `glpi_apiclients` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `ipv4_range_start` bigint(20) DEFAULT NULL,
  `ipv4_range_end` bigint(20) DEFAULT NULL,
  `ipv6` varchar(255) DEFAULT NULL,
  `app_token` varchar(255) DEFAULT NULL,
  `app_token_date` timestamp NULL DEFAULT NULL,
  `dolog_method` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_apiclients`
--

INSERT INTO `glpi_apiclients` (`id`, `entities_id`, `is_recursive`, `name`, `date_mod`, `date_creation`, `is_active`, `ipv4_range_start`, `ipv4_range_end`, `ipv6`, `app_token`, `app_token_date`, `dolog_method`, `comment`) VALUES
(1, 0, 1, 'full access from localhost', NULL, NULL, 1, 2130706433, 2130706433, '::1', NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_applianceenvironments`
--

CREATE TABLE `glpi_applianceenvironments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_appliances`
--

CREATE TABLE `glpi_appliances` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `appliancetypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `applianceenvironments_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `externalidentifier` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `is_helpdesk_visible` tinyint(4) NOT NULL DEFAULT 1,
  `pictures` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_appliances_items`
--

CREATE TABLE `glpi_appliances_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `appliances_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_appliances_items_relations`
--

CREATE TABLE `glpi_appliances_items_relations` (
  `id` int(10) UNSIGNED NOT NULL,
  `appliances_items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_appliancetypes`
--

CREATE TABLE `glpi_appliancetypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `comment` text DEFAULT NULL,
  `externalidentifier` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_authldapreplicates`
--

CREATE TABLE `glpi_authldapreplicates` (
  `id` int(10) UNSIGNED NOT NULL,
  `authldaps_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `host` varchar(255) DEFAULT NULL,
  `port` int(11) NOT NULL DEFAULT 389,
  `name` varchar(255) DEFAULT NULL,
  `timeout` int(11) NOT NULL DEFAULT 10
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_authldaps`
--

CREATE TABLE `glpi_authldaps` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `basedn` varchar(255) DEFAULT NULL,
  `rootdn` varchar(255) DEFAULT NULL,
  `port` int(11) NOT NULL DEFAULT 389,
  `condition` text DEFAULT NULL,
  `login_field` varchar(255) DEFAULT 'uid',
  `sync_field` varchar(255) DEFAULT NULL,
  `use_tls` tinyint(4) NOT NULL DEFAULT 0,
  `group_field` varchar(255) DEFAULT NULL,
  `group_condition` text DEFAULT NULL,
  `group_search_type` int(11) NOT NULL DEFAULT 0,
  `group_member_field` varchar(255) DEFAULT NULL,
  `email1_field` varchar(255) DEFAULT NULL,
  `realname_field` varchar(255) DEFAULT NULL,
  `firstname_field` varchar(255) DEFAULT NULL,
  `phone_field` varchar(255) DEFAULT NULL,
  `phone2_field` varchar(255) DEFAULT NULL,
  `mobile_field` varchar(255) DEFAULT NULL,
  `comment_field` varchar(255) DEFAULT NULL,
  `use_dn` tinyint(4) NOT NULL DEFAULT 1,
  `time_offset` int(11) NOT NULL DEFAULT 0 COMMENT 'in seconds',
  `deref_option` int(11) NOT NULL DEFAULT 0,
  `title_field` varchar(255) DEFAULT NULL,
  `category_field` varchar(255) DEFAULT NULL,
  `language_field` varchar(255) DEFAULT NULL,
  `entity_field` varchar(255) DEFAULT NULL,
  `entity_condition` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `rootdn_passwd` varchar(255) DEFAULT NULL,
  `registration_number_field` varchar(255) DEFAULT NULL,
  `email2_field` varchar(255) DEFAULT NULL,
  `email3_field` varchar(255) DEFAULT NULL,
  `email4_field` varchar(255) DEFAULT NULL,
  `location_field` varchar(255) DEFAULT NULL,
  `responsible_field` varchar(255) DEFAULT NULL,
  `pagesize` int(11) NOT NULL DEFAULT 0,
  `ldap_maxlimit` int(11) NOT NULL DEFAULT 0,
  `can_support_pagesize` tinyint(4) NOT NULL DEFAULT 0,
  `picture_field` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `inventory_domain` varchar(255) DEFAULT NULL,
  `tls_certfile` text DEFAULT NULL,
  `tls_keyfile` text DEFAULT NULL,
  `use_bind` tinyint(4) NOT NULL DEFAULT 1,
  `timeout` int(11) NOT NULL DEFAULT 10
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_authmails`
--

CREATE TABLE `glpi_authmails` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `connect_string` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_autoupdatesystems`
--

CREATE TABLE `glpi_autoupdatesystems` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_blacklistedmailcontents`
--

CREATE TABLE `glpi_blacklistedmailcontents` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_blacklists`
--

CREATE TABLE `glpi_blacklists` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_blacklists`
--

INSERT INTO `glpi_blacklists` (`id`, `type`, `name`, `value`, `comment`, `date_mod`, `date_creation`) VALUES
(1, 3, 'invalid serial', 'N/A', NULL, NULL, NULL),
(2, 3, 'invalid serial', '(null string)', NULL, NULL, NULL),
(3, 3, 'invalid serial', 'INVALID', NULL, NULL, NULL),
(4, 3, 'invalid serial', 'SYS-1234567890', NULL, NULL, NULL),
(5, 3, 'invalid serial', 'SYS-9876543210', NULL, NULL, NULL),
(6, 3, 'invalid serial', 'SN-12345', NULL, NULL, NULL),
(7, 3, 'invalid serial', 'SN-1234567890', NULL, NULL, NULL),
(8, 3, 'invalid serial', '/^0+$/', NULL, NULL, NULL),
(9, 3, 'invalid serial', '/^1+$/', NULL, NULL, NULL),
(10, 3, 'invalid serial', '/\\d\\.\\d(\\.\\d)?/', NULL, NULL, NULL),
(11, 3, 'invalid serial', '/^(0|1)+$/', NULL, NULL, NULL),
(12, 3, 'invalid serial', '0123456789', NULL, NULL, NULL),
(13, 3, 'invalid serial', '12345', NULL, NULL, NULL),
(14, 3, 'invalid serial', '123456', NULL, NULL, NULL),
(15, 3, 'invalid serial', '1234567', NULL, NULL, NULL),
(16, 3, 'invalid serial', '12345678', NULL, NULL, NULL),
(17, 3, 'invalid serial', '123456789', NULL, NULL, NULL),
(18, 3, 'invalid serial', '1234567890', NULL, NULL, NULL),
(19, 3, 'invalid serial', '123456789000', NULL, NULL, NULL),
(20, 3, 'invalid serial', '12345678901234567', NULL, NULL, NULL),
(21, 3, 'invalid serial', 'NNNNNNN', NULL, NULL, NULL),
(22, 3, 'invalid serial', 'xxxxxxxxxxx', NULL, NULL, NULL),
(23, 3, 'invalid serial', 'EVAL', NULL, NULL, NULL),
(24, 3, 'invalid serial', 'IATPASS', NULL, NULL, NULL),
(25, 3, 'invalid serial', 'none', NULL, NULL, NULL),
(26, 3, 'invalid serial', 'To Be Filled By O.E.M.', NULL, NULL, NULL),
(27, 3, 'invalid serial', 'Tulip Computers', NULL, NULL, NULL),
(28, 3, 'invalid serial', 'Serial Number xxxxxx', NULL, NULL, NULL),
(29, 3, 'invalid serial', 'SN-123456fvgv3i0b8o5n6n7k', NULL, NULL, NULL),
(30, 3, 'invalid serial', 'Unknow', NULL, NULL, NULL),
(31, 3, 'invalid serial', 'System Serial Number', NULL, NULL, NULL),
(32, 3, 'invalid serial', 'MB-1234567890', NULL, NULL, NULL),
(33, 3, 'invalid serial', 'empty', NULL, NULL, NULL),
(34, 3, 'invalid serial', 'Not Specified', NULL, NULL, NULL),
(35, 3, 'invalid serial', 'OEM_Serial', NULL, NULL, NULL),
(36, 3, 'invalid serial', 'SystemSerialNumb', NULL, NULL, NULL),
(37, 4, 'invalid UUID', 'FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF', NULL, NULL, NULL),
(38, 4, 'invalid UUID', '03000200-0400-0500-0006-000700080009', NULL, NULL, NULL),
(39, 4, 'invalid UUID', '6AB5B300-538D-1014-9FB5-B0684D007B53', NULL, NULL, NULL),
(40, 4, 'invalid UUID', '01010101-0101-0101-0101-010101010101', NULL, NULL, NULL),
(41, 4, 'invalid UUID', '2', NULL, NULL, NULL),
(42, 2, 'empty MAC', '', NULL, NULL, NULL),
(43, 2, 'invalid MAC', '20:41:53:59:4e:ff', NULL, NULL, NULL),
(44, 2, 'invalid MAC', '02:00:4e:43:50:49', NULL, NULL, NULL),
(45, 2, 'invalid MAC', 'e2:e6:16:20:0a:35', NULL, NULL, NULL),
(46, 2, 'invalid MAC', 'd2:0a:2d:a0:04:be', NULL, NULL, NULL),
(47, 2, 'invalid MAC', '00:a0:c6:00:00:00', NULL, NULL, NULL),
(48, 2, 'invalid MAC', 'd2:6b:25:2f:2c:e7', NULL, NULL, NULL),
(49, 2, 'invalid MAC', '33:50:6f:45:30:30', NULL, NULL, NULL),
(50, 2, 'invalid MAC', '0a:00:27:00:00:00', NULL, NULL, NULL),
(51, 2, 'invalid MAC', '00:50:56:C0:00:01', NULL, NULL, NULL),
(52, 2, 'invalid MAC', '00:50:56:C0:00:08', NULL, NULL, NULL),
(53, 2, 'invalid MAC', '02:80:37:EC:02:00', NULL, NULL, NULL),
(54, 2, 'invalid MAC', '50:50:54:50:30:30', NULL, NULL, NULL),
(55, 2, 'invalid MAC', '24:b6:20:52:41:53', NULL, NULL, NULL),
(56, 2, 'invalid MAC', '00:50:56:C0:00:02', NULL, NULL, NULL),
(57, 2, 'invalid MAC', '/00:50:56:C0:[0-9a-f]+:[0-9a-f]+/i', NULL, NULL, NULL),
(58, 2, 'invalid MAC', 'FE:FF:FF:FF:FF:FF', NULL, NULL, NULL),
(59, 2, 'invalid MAC', '00:00:00:00:00:00', NULL, NULL, NULL),
(60, 2, 'invalid MAC', '00:0b:ca:fe:00:00', NULL, NULL, NULL),
(61, 6, 'Unknow', 'Unknow', NULL, NULL, NULL),
(62, 6, 'To Be Filled By O.E.M.', 'To Be Filled By O.E.M.', NULL, NULL, NULL),
(63, 6, '*', '*', NULL, NULL, NULL),
(64, 6, 'System Product Name', 'System Product Name', NULL, NULL, NULL),
(65, 6, 'Product Name', 'Product Name', NULL, NULL, NULL),
(66, 6, 'System Name', 'System Name', NULL, NULL, NULL),
(67, 6, 'All Series', 'All Series', NULL, NULL, NULL),
(68, 8, 'System manufacturer', 'System manufacturer', NULL, NULL, NULL),
(69, 1, 'empty IP', '', NULL, NULL, NULL),
(70, 1, 'zero IP', '0.0.0.0', NULL, NULL, NULL),
(71, 1, 'localhost', '127.0.0.1', NULL, NULL, NULL),
(72, 1, 'IPV6 localhost', '::1', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_budgets`
--

CREATE TABLE `glpi_budgets` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `value` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `budgettypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_budgettypes`
--

CREATE TABLE `glpi_budgettypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_businesscriticities`
--

CREATE TABLE `glpi_businesscriticities` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `businesscriticities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `completename` text DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `ancestors_cache` longtext DEFAULT NULL,
  `sons_cache` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_cables`
--

CREATE TABLE `glpi_cables` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `itemtype_endpoint_a` varchar(255) DEFAULT NULL,
  `itemtype_endpoint_b` varchar(255) DEFAULT NULL,
  `items_id_endpoint_a` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `items_id_endpoint_b` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `socketmodels_id_endpoint_a` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `socketmodels_id_endpoint_b` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sockets_id_endpoint_a` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sockets_id_endpoint_b` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cablestrands_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `color` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cabletypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_cablestrands`
--

CREATE TABLE `glpi_cablestrands` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_cabletypes`
--

CREATE TABLE `glpi_cabletypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_calendars`
--

CREATE TABLE `glpi_calendars` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `cache_duration` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_calendars`
--

INSERT INTO `glpi_calendars` (`id`, `name`, `entities_id`, `is_recursive`, `comment`, `date_mod`, `cache_duration`, `date_creation`) VALUES
(1, 'Default', 0, 1, 'Default calendar', NULL, '[0,43200,43200,43200,43200,43200,0]', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_calendarsegments`
--

CREATE TABLE `glpi_calendarsegments` (
  `id` int(10) UNSIGNED NOT NULL,
  `calendars_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `day` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'numer of the day based on date(w)',
  `begin` time DEFAULT NULL,
  `end` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_calendarsegments`
--

INSERT INTO `glpi_calendarsegments` (`id`, `calendars_id`, `entities_id`, `is_recursive`, `day`, `begin`, `end`) VALUES
(1, 1, 0, 0, 1, '08:00:00', '20:00:00'),
(2, 1, 0, 0, 2, '08:00:00', '20:00:00'),
(3, 1, 0, 0, 3, '08:00:00', '20:00:00'),
(4, 1, 0, 0, 4, '08:00:00', '20:00:00'),
(5, 1, 0, 0, 5, '08:00:00', '20:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_calendars_holidays`
--

CREATE TABLE `glpi_calendars_holidays` (
  `id` int(10) UNSIGNED NOT NULL,
  `calendars_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `holidays_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_cartridgeitems`
--

CREATE TABLE `glpi_cartridgeitems` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cartridgeitemtypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `alarm_threshold` int(11) NOT NULL DEFAULT 10,
  `stock_target` int(11) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `pictures` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_cartridgeitems_printermodels`
--

CREATE TABLE `glpi_cartridgeitems_printermodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `cartridgeitems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `printermodels_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_cartridgeitemtypes`
--

CREATE TABLE `glpi_cartridgeitemtypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_cartridges`
--

CREATE TABLE `glpi_cartridges` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cartridgeitems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `printers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_in` date DEFAULT NULL,
  `date_use` date DEFAULT NULL,
  `date_out` date DEFAULT NULL,
  `pages` int(11) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_certificates`
--

CREATE TABLE `glpi_certificates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `certificatetypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'RELATION to glpi_certificatetypes (id)',
  `dns_name` varchar(255) DEFAULT NULL,
  `dns_suffix` varchar(255) DEFAULT NULL,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'RELATION to glpi_users (id)',
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'RELATION to glpi_groups (id)',
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'RELATION to glpi_locations (id)',
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'RELATION to glpi_manufacturers (id)',
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_autosign` tinyint(4) NOT NULL DEFAULT 0,
  `date_expiration` date DEFAULT NULL,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'RELATION to states (id)',
  `command` text DEFAULT NULL,
  `certificate_request` text DEFAULT NULL,
  `certificate_item` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_certificates_items`
--

CREATE TABLE `glpi_certificates_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `certificates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'RELATION to various tables, according to itemtype (id)',
  `itemtype` varchar(100) NOT NULL COMMENT 'see .class.php file',
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_certificatetypes`
--

CREATE TABLE `glpi_certificatetypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_changecosts`
--

CREATE TABLE `glpi_changecosts` (
  `id` int(10) UNSIGNED NOT NULL,
  `changes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `actiontime` int(11) NOT NULL DEFAULT 0,
  `cost_time` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `cost_fixed` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `cost_material` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `budgets_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_changes`
--

CREATE TABLE `glpi_changes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `content` longtext DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `solvedate` timestamp NULL DEFAULT NULL,
  `closedate` timestamp NULL DEFAULT NULL,
  `time_to_resolve` timestamp NULL DEFAULT NULL,
  `users_id_recipient` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_lastupdater` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `urgency` int(11) NOT NULL DEFAULT 1,
  `impact` int(11) NOT NULL DEFAULT 1,
  `priority` int(11) NOT NULL DEFAULT 1,
  `itilcategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `impactcontent` longtext DEFAULT NULL,
  `controlistcontent` longtext DEFAULT NULL,
  `rolloutplancontent` longtext DEFAULT NULL,
  `backoutplancontent` longtext DEFAULT NULL,
  `checklistcontent` longtext DEFAULT NULL,
  `global_validation` int(11) NOT NULL DEFAULT 1,
  `validation_percent` int(11) NOT NULL DEFAULT 0,
  `actiontime` int(11) NOT NULL DEFAULT 0,
  `begin_waiting_date` timestamp NULL DEFAULT NULL,
  `waiting_duration` int(11) NOT NULL DEFAULT 0,
  `close_delay_stat` int(11) NOT NULL DEFAULT 0,
  `solve_delay_stat` int(11) NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_changes_groups`
--

CREATE TABLE `glpi_changes_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `changes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_changes_items`
--

CREATE TABLE `glpi_changes_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `changes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_changes_problems`
--

CREATE TABLE `glpi_changes_problems` (
  `id` int(10) UNSIGNED NOT NULL,
  `changes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `problems_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_changes_suppliers`
--

CREATE TABLE `glpi_changes_suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `changes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `suppliers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1,
  `use_notification` tinyint(4) NOT NULL DEFAULT 0,
  `alternative_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_changes_tickets`
--

CREATE TABLE `glpi_changes_tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `changes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tickets_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_changes_users`
--

CREATE TABLE `glpi_changes_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `changes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1,
  `use_notification` tinyint(4) NOT NULL DEFAULT 0,
  `alternative_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_changetasks`
--

CREATE TABLE `glpi_changetasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `changes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `taskcategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `state` int(11) NOT NULL DEFAULT 0,
  `date` timestamp NULL DEFAULT NULL,
  `begin` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_editor` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `content` longtext DEFAULT NULL,
  `actiontime` int(11) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `tasktemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `timeline_position` tinyint(4) NOT NULL DEFAULT 0,
  `is_private` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_changetemplatehiddenfields`
--

CREATE TABLE `glpi_changetemplatehiddenfields` (
  `id` int(10) UNSIGNED NOT NULL,
  `changetemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `num` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_changetemplatemandatoryfields`
--

CREATE TABLE `glpi_changetemplatemandatoryfields` (
  `id` int(10) UNSIGNED NOT NULL,
  `changetemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `num` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_changetemplatemandatoryfields`
--

INSERT INTO `glpi_changetemplatemandatoryfields` (`id`, `changetemplates_id`, `num`) VALUES
(1, 1, 21);

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_changetemplatepredefinedfields`
--

CREATE TABLE `glpi_changetemplatepredefinedfields` (
  `id` int(10) UNSIGNED NOT NULL,
  `changetemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `num` int(11) NOT NULL DEFAULT 0,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_changetemplates`
--

CREATE TABLE `glpi_changetemplates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_changetemplates`
--

INSERT INTO `glpi_changetemplates` (`id`, `name`, `entities_id`, `is_recursive`, `comment`) VALUES
(1, 'Default', 0, 1, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_changevalidations`
--

CREATE TABLE `glpi_changevalidations` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `changes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_validate` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment_submission` text DEFAULT NULL,
  `comment_validation` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 2,
  `submission_date` timestamp NULL DEFAULT NULL,
  `validation_date` timestamp NULL DEFAULT NULL,
  `timeline_position` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_clusters`
--

CREATE TABLE `glpi_clusters` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'RELATION to states (id)',
  `comment` text DEFAULT NULL,
  `clustertypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `autoupdatesystems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_clustertypes`
--

CREATE TABLE `glpi_clustertypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_computerantiviruses`
--

CREATE TABLE `glpi_computerantiviruses` (
  `id` int(10) UNSIGNED NOT NULL,
  `computers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `antivirus_version` varchar(255) DEFAULT NULL,
  `signature_version` varchar(255) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_uptodate` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `date_expiration` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_computermodels`
--

CREATE TABLE `glpi_computermodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT 0,
  `required_units` int(11) NOT NULL DEFAULT 1,
  `depth` float NOT NULL DEFAULT 1,
  `power_connections` int(11) NOT NULL DEFAULT 0,
  `power_consumption` int(11) NOT NULL DEFAULT 0,
  `is_half_rack` tinyint(4) NOT NULL DEFAULT 0,
  `picture_front` text DEFAULT NULL,
  `picture_rear` text DEFAULT NULL,
  `pictures` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_computers`
--

CREATE TABLE `glpi_computers` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `autoupdatesystems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `networks_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `computermodels_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `computertypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ticket_tco` decimal(20,4) DEFAULT 0.0000,
  `uuid` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `last_inventory_update` timestamp NULL DEFAULT NULL,
  `last_boot` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_computers_items`
--

CREATE TABLE `glpi_computers_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'RELATION to various table, according to itemtype (ID)',
  `computers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_computertypes`
--

CREATE TABLE `glpi_computertypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_computervirtualmachines`
--

CREATE TABLE `glpi_computervirtualmachines` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `computers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `virtualmachinestates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `virtualmachinesystems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `virtualmachinetypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `uuid` varchar(255) NOT NULL DEFAULT '',
  `vcpu` int(11) NOT NULL DEFAULT 0,
  `ram` int(10) UNSIGNED DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_configs`
--

CREATE TABLE `glpi_configs` (
  `id` int(10) UNSIGNED NOT NULL,
  `context` varchar(150) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_configs`
--

INSERT INTO `glpi_configs` (`id`, `context`, `name`, `value`) VALUES
(1, 'core', 'version', '10.0.18'),
(2, 'core', 'show_jobs_at_login', '0'),
(3, 'core', 'cut', '250'),
(4, 'core', 'list_limit', '15'),
(5, 'core', 'list_limit_max', '50'),
(6, 'core', 'url_maxlength', '30'),
(7, 'core', 'event_loglevel', '5'),
(8, 'core', 'notifications_mailing', '1'),
(9, 'core', 'admin_email', 'suporteincv@suporteincv.com'),
(10, 'core', 'admin_email_name', 'incv'),
(11, 'core', 'from_email', ''),
(12, 'core', 'from_email_name', ''),
(13, 'core', 'noreply_email', ''),
(14, 'core', 'noreply_email_name', ''),
(15, 'core', 'replyto_email', ''),
(16, 'core', 'replyto_email_name', ''),
(17, 'core', 'mailing_signature', 'SIGNATURE'),
(18, 'core', 'use_anonymous_helpdesk', '0'),
(19, 'core', 'use_anonymous_followups', '0'),
(20, 'core', 'language', 'pt_PT'),
(21, 'core', 'priority_1', '#fff2f2'),
(22, 'core', 'priority_2', '#ffe0e0'),
(23, 'core', 'priority_3', '#ffcece'),
(24, 'core', 'priority_4', '#ffbfbf'),
(25, 'core', 'priority_5', '#ffadad'),
(26, 'core', 'priority_6', '#ff5555'),
(27, 'core', 'date_tax', '2005-12-31'),
(28, 'core', 'cas_host', ''),
(29, 'core', 'cas_port', '443'),
(30, 'core', 'cas_uri', ''),
(31, 'core', 'cas_logout', ''),
(32, 'core', 'cas_version', 'CAS_VERSION_2_0'),
(33, 'core', 'existing_auth_server_field_clean_domain', '0'),
(34, 'core', 'planning_begin', '08:00'),
(35, 'core', 'planning_end', '20:00'),
(36, 'core', 'utf8_conv', '1'),
(37, 'core', 'use_public_faq', '0'),
(38, 'core', 'url_base', 'https://suporteincv.com'),
(39, 'core', 'show_link_in_mail', '0'),
(40, 'core', 'text_login', '&#60;p&#62;&#60;strong&#62;Benvindo ao portal do suporte da INCV&#60;/strong&#62;&#60;/p&#62;\r\n&#60;p&#62;&#60;strong&#62;Por favor faça o seu login para solicitação.&#60;/strong&#62;&#60;/p&#62;\r\n&#60;p&#62;&#60;strong&#62;Imprensa Nacional de Cabo Verde.&#60;/strong&#62;&#60;/p&#62;'),
(41, 'core', 'founded_new_version', ''),
(42, 'core', 'dropdown_max', '100'),
(43, 'core', 'ajax_wildcard', '*'),
(44, 'core', 'ajax_limit_count', '10'),
(45, 'core', 'is_users_auto_add', '1'),
(46, 'core', 'date_format', '1'),
(47, 'core', 'number_format', '2'),
(48, 'core', 'csv_delimiter', ';'),
(49, 'core', 'is_ids_visible', '0'),
(50, 'core', 'smtp_mode', '0'),
(51, 'core', 'smtp_host', ''),
(52, 'core', 'smtp_port', '25'),
(53, 'core', 'smtp_username', ''),
(54, 'core', 'smtp_oauth_provider', ''),
(55, 'core', 'smtp_oauth_client_id', ''),
(56, 'core', 'smtp_oauth_client_secret', ''),
(57, 'core', 'smtp_oauth_options', '{}'),
(58, 'core', 'smtp_oauth_refresh_token', ''),
(59, 'core', 'proxy_name', ''),
(60, 'core', 'proxy_port', '8080'),
(61, 'core', 'proxy_user', ''),
(62, 'core', 'add_followup_on_update_ticket', '1'),
(63, 'core', 'keep_tickets_on_delete', '0'),
(64, 'core', 'time_step', '5'),
(65, 'core', 'decimal_number', '2'),
(66, 'core', 'helpdesk_doc_url', ''),
(67, 'core', 'central_doc_url', ''),
(68, 'core', 'documentcategories_id_forticket', '0'),
(69, 'core', 'monitors_management_restrict', '2'),
(70, 'core', 'phones_management_restrict', '2'),
(71, 'core', 'peripherals_management_restrict', '2'),
(72, 'core', 'printers_management_restrict', '2'),
(73, 'core', 'use_log_in_files', '1'),
(74, 'core', 'time_offset', '0'),
(75, 'core', 'is_contact_autoupdate', '1'),
(76, 'core', 'is_user_autoupdate', '1'),
(77, 'core', 'is_group_autoupdate', '1'),
(78, 'core', 'is_location_autoupdate', '1'),
(79, 'core', 'state_autoupdate_mode', '0'),
(80, 'core', 'is_contact_autoclean', '0'),
(81, 'core', 'is_user_autoclean', '0'),
(82, 'core', 'is_group_autoclean', '0'),
(83, 'core', 'is_location_autoclean', '0'),
(84, 'core', 'state_autoclean_mode', '0'),
(85, 'core', 'use_flat_dropdowntree', '0'),
(86, 'core', 'use_flat_dropdowntree_on_search_result', '1'),
(87, 'core', 'use_autoname_by_entity', '1'),
(88, 'core', 'softwarecategories_id_ondelete', '1'),
(89, 'core', 'x509_email_field', ''),
(90, 'core', 'x509_cn_restrict', ''),
(91, 'core', 'x509_o_restrict', ''),
(92, 'core', 'x509_ou_restrict', ''),
(93, 'core', 'default_mailcollector_filesize_max', '14680064'),
(94, 'core', 'followup_private', '0'),
(95, 'core', 'task_private', '0'),
(96, 'core', 'default_software_helpdesk_visible', '1'),
(97, 'core', 'names_format', '1'),
(98, 'core', 'default_requesttypes_id', '1'),
(99, 'core', 'use_noright_users_add', '1'),
(100, 'core', 'cron_limit', '5'),
(101, 'core', 'priority_matrix', '{\"1\":{\"1\":\"1\",\"2\":\"1\",\"3\":\"2\",\"4\":\"2\",\"5\":\"2\"},\"2\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"2\",\"4\":\"3\",\"5\":\"3\"},\"3\":{\"1\":\"2\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"4\"},\"4\":{\"1\":\"2\",\"2\":\"3\",\"3\":\"4\",\"4\":\"4\",\"5\":\"5\"},\"5\":{\"1\":\"2\",\"2\":\"3\",\"3\":\"4\",\"4\":\"5\",\"5\":\"5\"}}'),
(102, 'core', 'urgency_mask', '62'),
(103, 'core', 'impact_mask', '62'),
(104, 'core', 'user_deleted_ldap', '0'),
(105, 'core', 'user_restored_ldap', '0'),
(106, 'core', 'auto_create_infocoms', '0'),
(107, 'core', 'use_slave_for_search', '0'),
(108, 'core', 'proxy_passwd', ''),
(109, 'core', 'smtp_passwd', ''),
(110, 'core', 'show_count_on_tabs', '1'),
(111, 'core', 'refresh_views', '0'),
(112, 'core', 'set_default_tech', '1'),
(113, 'core', 'allow_search_view', '2'),
(114, 'core', 'allow_search_all', '0'),
(115, 'core', 'allow_search_global', '1'),
(116, 'core', 'display_count_on_home', '5'),
(117, 'core', 'use_password_security', '0'),
(118, 'core', 'password_min_length', '8'),
(119, 'core', 'password_need_number', '1'),
(120, 'core', 'password_need_letter', '1'),
(121, 'core', 'password_need_caps', '1'),
(122, 'core', 'password_need_symbol', '1'),
(123, 'core', 'use_check_pref', '0'),
(124, 'core', 'notification_to_myself', '1'),
(125, 'core', 'duedateok_color', '#06ff00'),
(126, 'core', 'duedatewarning_color', '#ffb800'),
(127, 'core', 'duedatecritical_color', '#ff0000'),
(128, 'core', 'duedatewarning_less', '20'),
(129, 'core', 'duedatecritical_less', '5'),
(130, 'core', 'duedatewarning_unit', '%'),
(131, 'core', 'duedatecritical_unit', '%'),
(132, 'core', 'realname_ssofield', ''),
(133, 'core', 'firstname_ssofield', ''),
(134, 'core', 'email1_ssofield', ''),
(135, 'core', 'email2_ssofield', ''),
(136, 'core', 'email3_ssofield', ''),
(137, 'core', 'email4_ssofield', ''),
(138, 'core', 'phone_ssofield', ''),
(139, 'core', 'phone2_ssofield', ''),
(140, 'core', 'mobile_ssofield', ''),
(141, 'core', 'comment_ssofield', ''),
(142, 'core', 'title_ssofield', ''),
(143, 'core', 'category_ssofield', ''),
(144, 'core', 'language_ssofield', ''),
(145, 'core', 'entity_ssofield', ''),
(146, 'core', 'registration_number_ssofield', ''),
(147, 'core', 'ssovariables_id', '0'),
(148, 'core', 'ssologout_url', ''),
(149, 'core', 'translate_kb', '0'),
(150, 'core', 'translate_dropdowns', '0'),
(151, 'core', 'translate_reminders', '0'),
(152, 'core', 'pdffont', 'dejavusans'),
(153, 'core', 'keep_devices_when_purging_item', '0'),
(154, 'core', 'maintenance_mode', '0'),
(155, 'core', 'maintenance_text', ''),
(156, 'core', 'attach_ticket_documents_to_mail', '0'),
(157, 'core', 'backcreated', '0'),
(158, 'core', 'task_state', '1'),
(159, 'core', 'palette', 'lightblue'),
(160, 'core', 'page_layout', 'vertical'),
(161, 'core', 'fold_menu', '0'),
(162, 'core', 'fold_search', '0'),
(163, 'core', 'savedsearches_pinned', '0'),
(164, 'core', 'timeline_order', 'natural'),
(165, 'core', 'itil_layout', ''),
(166, 'core', 'richtext_layout', 'classic'),
(167, 'core', 'lock_use_lock_item', '0'),
(168, 'core', 'lock_autolock_mode', '1'),
(169, 'core', 'lock_directunlock_notification', '0'),
(170, 'core', 'lock_item_list', '[]'),
(171, 'core', 'lock_lockprofile_id', '8'),
(172, 'core', 'set_default_requester', '1'),
(173, 'core', 'highcontrast_css', '0'),
(174, 'core', 'default_central_tab', '0'),
(175, 'core', 'smtp_check_certificate', '1'),
(176, 'core', 'enable_api', '0'),
(177, 'core', 'enable_api_login_credentials', '0'),
(178, 'core', 'enable_api_login_external_token', '1'),
(179, 'core', 'url_base_api', 'https://suporteincv.com/apirest.php/'),
(180, 'core', 'login_remember_time', '604800'),
(181, 'core', 'login_remember_default', '1'),
(182, 'core', 'use_notifications', '1'),
(183, 'core', 'notifications_ajax', '0'),
(184, 'core', 'notifications_ajax_check_interval', '5'),
(185, 'core', 'notifications_ajax_sound', NULL),
(186, 'core', 'notifications_ajax_icon_url', '/pics/glpi.png'),
(187, 'core', 'dbversion', '10.0.18@d64066799f068b16ee973b377bdd13f984fe062a'),
(188, 'core', 'smtp_max_retries', '5'),
(189, 'core', 'smtp_sender', NULL),
(190, 'core', 'instance_uuid', NULL),
(191, 'core', 'registration_uuid', '1UhkEoDaflBYPIoIaqxEfppjaZtXdFQ8dldqgLVu'),
(192, 'core', 'smtp_retry_time', '5'),
(193, 'core', 'purge_addrelation', '0'),
(194, 'core', 'purge_deleterelation', '0'),
(195, 'core', 'purge_createitem', '0'),
(196, 'core', 'purge_deleteitem', '0'),
(197, 'core', 'purge_restoreitem', '0'),
(198, 'core', 'purge_updateitem', '0'),
(199, 'core', 'purge_item_software_install', '0'),
(200, 'core', 'purge_software_item_install', '0'),
(201, 'core', 'purge_software_version_install', '0'),
(202, 'core', 'purge_infocom_creation', '0'),
(203, 'core', 'purge_profile_user', '0'),
(204, 'core', 'purge_group_user', '0'),
(205, 'core', 'purge_adddevice', '0'),
(206, 'core', 'purge_updatedevice', '0'),
(207, 'core', 'purge_deletedevice', '0'),
(208, 'core', 'purge_connectdevice', '0'),
(209, 'core', 'purge_disconnectdevice', '0'),
(210, 'core', 'purge_userdeletedfromldap', '0'),
(211, 'core', 'purge_comments', '0'),
(212, 'core', 'purge_datemod', '0'),
(213, 'core', 'purge_all', '0'),
(214, 'core', 'purge_user_auth_changes', '0'),
(215, 'core', 'purge_plugins', '0'),
(216, 'core', 'purge_refusedequipment', '0'),
(217, 'core', 'display_login_source', '1'),
(218, 'core', 'devices_in_menu', '[\"Item_DeviceSimcard\"]'),
(219, 'core', 'password_expiration_delay', '-1'),
(220, 'core', 'password_expiration_notice', '-1'),
(221, 'core', 'password_expiration_lock_delay', '-1'),
(222, 'core', 'default_dashboard_central', 'central'),
(223, 'core', 'default_dashboard_assets', 'assets'),
(224, 'core', 'default_dashboard_helpdesk', 'assistance'),
(225, 'core', 'default_dashboard_mini_ticket', 'mini_tickets'),
(226, 'core', 'impact_enabled_itemtypes', '[\"Appliance\",\"Cluster\",\"Computer\",\"Datacenter\",\"DCRoom\",\"Domain\",\"Enclosure\",\"Monitor\",\"NetworkEquipment\",\"PDU\",\"Peripheral\",\"Phone\",\"Printer\",\"Rack\",\"Software\",\"DatabaseInstance\"]'),
(227, 'core', 'document_max_size', '1536'),
(228, 'core', 'planning_work_days', '[1,2,3,4,5,6,0]'),
(229, 'core', 'system_user', '6'),
(230, 'core', 'support_legacy_data', '0'),
(231, 'core', 'initialized_rules_collections', '[\"RuleImportAssetCollection\",\"RuleMailCollectorCollection\",\"RuleRightCollection\",\"RuleSoftwareCategoryCollection\",\"RuleTicketCollection\",\"RuleAssetCollection\",\"RuleDictionnaryOperatingSystemCollection\",\"RuleDictionnaryOperatingSystemVersionCollection\",\"RuleDictionnaryOperatingSystemEditionCollection\"]'),
(232, 'core', 'timeline_action_btn_layout', '0'),
(233, 'core', 'timeline_date_format', '0'),
(234, 'inventory', 'enabled_inventory', '0'),
(235, 'inventory', 'import_software', '1'),
(236, 'inventory', 'import_volume', '1'),
(237, 'inventory', 'import_antivirus', '1'),
(238, 'inventory', 'import_registry', '1'),
(239, 'inventory', 'import_process', '1'),
(240, 'inventory', 'import_vm', '1'),
(241, 'inventory', 'import_monitor_on_partial_sn', '0'),
(242, 'inventory', 'import_unmanaged', '1'),
(243, 'inventory', 'component_processor', '1'),
(244, 'inventory', 'component_memory', '1'),
(245, 'inventory', 'component_harddrive', '1'),
(246, 'inventory', 'component_networkcard', '1'),
(247, 'inventory', 'component_graphiccard', '1'),
(248, 'inventory', 'component_soundcard', '1'),
(249, 'inventory', 'component_drive', '1'),
(250, 'inventory', 'component_networkdrive', '1'),
(251, 'inventory', 'component_networkcardvirtual', '1'),
(252, 'inventory', 'component_control', '1'),
(253, 'inventory', 'component_battery', '1'),
(254, 'inventory', 'component_simcard', '1'),
(255, 'inventory', 'states_id_default', '0'),
(256, 'inventory', 'entities_id_default', '0'),
(257, 'inventory', 'location', '0'),
(258, 'inventory', 'group', '0'),
(259, 'inventory', 'vm_type', '0'),
(260, 'inventory', 'vm_components', '0'),
(261, 'inventory', 'vm_as_computer', '0'),
(262, 'inventory', 'component_removablemedia', '1'),
(263, 'inventory', 'component_powersupply', '1'),
(264, 'inventory', 'inventory_frequency', '24'),
(265, 'inventory', 'import_monitor', '1'),
(266, 'inventory', 'import_printer', '1'),
(267, 'inventory', 'import_peripheral', '1'),
(268, 'inventory', 'stale_agents_delay', '0'),
(269, 'inventory', 'stale_agents_action', '[0]'),
(270, 'inventory', 'stale_agents_status', '0'),
(271, 'core', 'marketplace_replace_plugins', '2'),
(272, 'core', 'glpinetwork_registration_key', 'PAJHc/v5gP/n5Dj+M/9fcmT8OT9KN4FKEsGPj6DzLX1Xr8V/7eZzMIlDY/JeC5DL7PJWq74EQwXhoUCGzEgZDGjytLlNhmZd+q2XAXa97mOP9o4xBXW1/0akSfaJKTRnJh23ObFBRHsVmJRFGCS0LSoaFWNC5k3/BKHsk3/118qoPVK2yn7rX75D4qTNJSpL1QJ+Ytuk9bUQ22s5FPnCtVJoZ4pLpbX1Ushz5Rh5eH4839MKAG6TQtqJ1rwejhM/y3YaDpHtX40+bx+wFGUsYohBPrG/RO7dh3Bmxsr8OKQYPBpgAfA1+80HbAmaLPORToQZN2sTu+Pos0QjjQHJxv5Ihm5sjgc196/E6Qps1hun3tvtGN6Z+IeWZFH6pXImWYt9+TF8m2/+c6iLb/qXSEu/Yj0U2XD08LOZZocrg3TFvUPaO5SJBrl12ddECvOx6IzuTiLvld9z6JMa8uusOjArHbUQ3ovPGcOzvSk/zIaSOdmNCqWfEjfWkukhpkS8li7PYwAiYr2fIaQCBfagsL/Imxs/64yBZg2t4W2zkKDUudtxRbCReZ2IbS+wpIQlzmPXqjXVB4tpqHeCYQbojMqyEwb6n2vD+aU+gtDx2OyhKROdl9rOHzTN9zHqF4gVj7lBFDuZcHzCnd6G3k0sXY3Z69gM3m1ME41rsmG4MKspoiXw9eufgT1WBeeJrOBY6NehmOP0UKdMF27+ZQ2KbSevmtw3RpFFkMt5zIOkK1KOGlSli0MgGmBOatp4wqcjmQYcLxhyt+GSiHzs'),
(273, 'core', 'glpi_network_uuid', 'QYQmFPJ8tFuuoSaIroEwpuNz0D9PiRoOvqTzJnVj'),
(274, 'core', '_matrix', '1'),
(275, 'core', '_impact_5', '1'),
(276, 'core', '_impact_4', '1'),
(277, 'core', '_impact_3', '1'),
(278, 'core', '_impact_2', '1'),
(279, 'core', '_impact_1', '1'),
(280, 'core', '_urgency_5', '1'),
(281, 'core', '_matrix_5_5', '5'),
(282, 'core', '_matrix_5_4', '5'),
(283, 'core', '_matrix_5_3', '4'),
(284, 'core', '_matrix_5_2', '3'),
(285, 'core', '_matrix_5_1', '2'),
(286, 'core', '_urgency_4', '1'),
(287, 'core', '_matrix_4_5', '5'),
(288, 'core', '_matrix_4_4', '4'),
(289, 'core', '_matrix_4_3', '4'),
(290, 'core', '_matrix_4_2', '3'),
(291, 'core', '_matrix_4_1', '2'),
(292, 'core', '_urgency_3', '1'),
(293, 'core', '_matrix_3_5', '4'),
(294, 'core', '_matrix_3_4', '4'),
(295, 'core', '_matrix_3_3', '3'),
(296, 'core', '_matrix_3_2', '2'),
(297, 'core', '_matrix_3_1', '2'),
(298, 'core', '_urgency_2', '1'),
(299, 'core', '_matrix_2_5', '3'),
(300, 'core', '_matrix_2_4', '3'),
(301, 'core', '_matrix_2_3', '2'),
(302, 'core', '_matrix_2_2', '2'),
(303, 'core', '_matrix_2_1', '1'),
(304, 'core', '_urgency_1', '1'),
(305, 'core', '_matrix_1_5', '2'),
(306, 'core', '_matrix_1_4', '2'),
(307, 'core', '_matrix_1_3', '2'),
(308, 'core', '_matrix_1_2', '1'),
(309, 'core', '_matrix_1_1', '1'),
(310, 'core', 'notification_uuid', 'hcpl9F7STwaJcBpLTSLVP0odrznnbBcqIGF9F3tY');

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_consumableitems`
--

CREATE TABLE `glpi_consumableitems` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `consumableitemtypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `alarm_threshold` int(11) NOT NULL DEFAULT 10,
  `stock_target` int(11) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `pictures` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_consumableitemtypes`
--

CREATE TABLE `glpi_consumableitemtypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_consumables`
--

CREATE TABLE `glpi_consumables` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `consumableitems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_in` date DEFAULT NULL,
  `date_out` date DEFAULT NULL,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_contacts`
--

CREATE TABLE `glpi_contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `registration_number` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `phone2` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contacttypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `usertitles_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `address` text DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `pictures` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_contacts_suppliers`
--

CREATE TABLE `glpi_contacts_suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `suppliers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `contacts_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_contacttypes`
--

CREATE TABLE `glpi_contacttypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_contractcosts`
--

CREATE TABLE `glpi_contractcosts` (
  `id` int(10) UNSIGNED NOT NULL,
  `contracts_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `cost` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `budgets_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_contracts`
--

CREATE TABLE `glpi_contracts` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `num` varchar(255) DEFAULT NULL,
  `contracttypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `begin_date` date DEFAULT NULL,
  `duration` int(11) NOT NULL DEFAULT 0,
  `notice` int(11) NOT NULL DEFAULT 0,
  `periodicity` int(11) NOT NULL DEFAULT 0,
  `billing` int(11) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `accounting_number` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `week_begin_hour` time NOT NULL DEFAULT '00:00:00',
  `week_end_hour` time NOT NULL DEFAULT '00:00:00',
  `saturday_begin_hour` time NOT NULL DEFAULT '00:00:00',
  `saturday_end_hour` time NOT NULL DEFAULT '00:00:00',
  `use_saturday` tinyint(4) NOT NULL DEFAULT 0,
  `sunday_begin_hour` time NOT NULL DEFAULT '00:00:00',
  `sunday_end_hour` time NOT NULL DEFAULT '00:00:00',
  `use_sunday` tinyint(4) NOT NULL DEFAULT 0,
  `max_links_allowed` int(11) NOT NULL DEFAULT 0,
  `alert` int(11) NOT NULL DEFAULT 0,
  `renewal` int(11) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_contracts_items`
--

CREATE TABLE `glpi_contracts_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `contracts_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_contracts_suppliers`
--

CREATE TABLE `glpi_contracts_suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `suppliers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `contracts_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_contracttypes`
--

CREATE TABLE `glpi_contracttypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_crontasklogs`
--

CREATE TABLE `glpi_crontasklogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `crontasks_id` int(10) UNSIGNED NOT NULL,
  `crontasklogs_id` int(10) UNSIGNED NOT NULL COMMENT 'id of ''start'' event',
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `state` int(11) NOT NULL COMMENT '0:start, 1:run, 2:stop',
  `elapsed` float NOT NULL COMMENT 'time elapsed since start',
  `volume` int(11) NOT NULL COMMENT 'for statistics',
  `content` varchar(255) DEFAULT NULL COMMENT 'message'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_crontasklogs`
--

INSERT INTO `glpi_crontasklogs` (`id`, `crontasks_id`, `crontasklogs_id`, `date`, `state`, `elapsed`, `volume`, `content`) VALUES
(1, 5, 0, '2026-03-01 14:18:24', 0, 0, 0, 'Run mode: GLPI'),
(2, 5, 1, '2026-03-01 14:18:24', 2, 0.00571418, 0, 'Action completed, no processing required'),
(3, 6, 0, '2026-03-01 14:23:47', 0, 0, 0, 'Run mode: GLPI'),
(4, 6, 3, '2026-03-01 14:23:47', 2, 0.00439787, 0, 'Action completed, no processing required'),
(5, 9, 0, '2026-03-01 14:35:54', 0, 0, 0, 'Run mode: GLPI'),
(6, 9, 5, '2026-03-01 14:35:54', 2, 0.00948715, 0, 'Action completed, no processing required'),
(7, 12, 0, '2026-03-01 14:40:20', 0, 0, 0, 'Run mode: GLPI'),
(8, 12, 7, '2026-03-01 14:40:20', 2, 0.00385809, 0, 'Action completed, no processing required'),
(9, 13, 0, '2026-03-01 15:02:07', 0, 0, 0, 'Run mode: GLPI'),
(10, 13, 9, '2026-03-01 15:02:07', 2, 0.0113881, 0, 'Action completed, no processing required'),
(11, 14, 0, '2026-03-01 15:45:20', 0, 0, 0, 'Run mode: GLPI'),
(12, 14, 11, '2026-03-01 15:45:20', 2, 0.010082, 0, 'Action completed, no processing required'),
(13, 15, 0, '2026-03-01 15:57:25', 0, 0, 0, 'Run mode: GLPI'),
(14, 15, 13, '2026-03-01 15:57:25', 2, 0.00974607, 0, 'Action completed, no processing required'),
(15, 16, 0, '2026-03-01 17:30:40', 0, 0, 0, 'Run mode: GLPI'),
(16, 16, 15, '2026-03-01 17:30:40', 2, 0.0105748, 0, 'Action completed, no processing required'),
(17, 17, 0, '2026-03-01 17:38:46', 0, 0, 0, 'Run mode: GLPI'),
(18, 17, 17, '2026-03-01 17:38:46', 2, 0.00844598, 0, 'Action completed, no processing required'),
(19, 18, 0, '2026-03-01 17:39:24', 0, 0, 0, 'Run mode: GLPI'),
(20, 18, 19, '2026-03-01 17:39:24', 2, 0.0130961, 0, 'Action completed, no processing required'),
(21, 19, 0, '2026-03-01 17:40:58', 0, 0, 0, 'Run mode: GLPI'),
(22, 19, 21, '2026-03-01 17:40:58', 2, 0.00502992, 0, 'Action completed, fully processed'),
(23, 20, 0, '2026-03-01 17:41:44', 0, 0, 0, 'Run mode: GLPI'),
(24, 20, 23, '2026-03-01 17:41:44', 2, 0.00776696, 0, 'Action completed, no processing required'),
(25, 21, 0, '2026-03-01 19:51:05', 0, 0, 0, 'Run mode: GLPI'),
(26, 21, 25, '2026-03-01 19:51:05', 2, 0.00979805, 0, 'Action completed, no processing required'),
(27, 22, 0, '2026-03-01 20:06:27', 0, 0, 0, 'Run mode: GLPI'),
(28, 22, 27, '2026-03-01 20:06:27', 2, 0.0122471, 0, 'Action completed, no processing required'),
(29, 23, 0, '2026-03-01 20:06:54', 0, 0, 0, 'Run mode: GLPI'),
(30, 23, 29, '2026-03-01 20:06:54', 2, 0.0109849, 0, 'Action completed, no processing required'),
(31, 24, 0, '2026-03-01 20:10:00', 0, 0, 0, 'Run mode: GLPI'),
(32, 24, 31, '2026-03-01 20:10:00', 2, 0.00378895, 0, 'Action completed, no processing required'),
(33, 25, 0, '2026-03-01 21:10:42', 0, 0, 0, 'Run mode: GLPI'),
(34, 25, 33, '2026-03-01 21:10:42', 2, 0.0116692, 0, 'Action completed, no processing required'),
(35, 31, 0, '2026-03-01 21:17:35', 0, 0, 0, 'Run mode: GLPI'),
(36, 31, 35, '2026-03-01 21:17:35', 2, 0.00537992, 0, 'Action completed, no processing required'),
(37, 32, 0, '2026-03-01 21:17:57', 0, 0, 0, 'Run mode: GLPI'),
(38, 32, 37, '2026-03-01 21:17:57', 2, 0.004421, 0, 'Action completed, no processing required'),
(39, 9, 0, '2026-03-01 21:18:22', 0, 0, 0, 'Run mode: GLPI'),
(40, 9, 39, '2026-03-01 21:18:22', 2, 0.00525808, 0, 'Action completed, no processing required'),
(41, 13, 0, '2026-03-01 21:19:50', 0, 0, 0, 'Run mode: GLPI'),
(42, 13, 41, '2026-03-01 21:19:50', 2, 0.00361991, 0, 'Action completed, no processing required'),
(43, 14, 0, '2026-03-01 21:33:14', 0, 0, 0, 'Run mode: GLPI'),
(44, 14, 43, '2026-03-01 21:33:14', 2, 0.0100951, 0, 'Action completed, no processing required'),
(45, 17, 0, '2026-03-01 21:33:28', 0, 0, 0, 'Run mode: GLPI'),
(46, 17, 45, '2026-03-01 21:33:28', 2, 0.00436807, 0, 'Action completed, no processing required'),
(47, 20, 0, '2026-03-01 21:39:54', 0, 0, 0, 'Run mode: GLPI'),
(48, 20, 47, '2026-03-01 21:39:54', 2, 0.00454283, 0, 'Action completed, no processing required'),
(49, 21, 0, '2026-03-01 21:44:58', 0, 0, 0, 'Run mode: GLPI'),
(50, 21, 49, '2026-03-01 21:44:58', 2, 0.00625992, 0, 'Action completed, no processing required'),
(51, 22, 0, '2026-03-01 23:32:50', 0, 0, 0, 'Run mode: GLPI'),
(52, 22, 51, '2026-03-01 23:32:50', 2, 0.0211549, 0, 'Action completed, no processing required'),
(53, 24, 0, '2026-03-02 00:41:03', 0, 0, 0, 'Run mode: GLPI'),
(54, 24, 53, '2026-03-02 00:41:03', 2, 0.0116341, 0, 'Action completed, no processing required'),
(55, 32, 0, '2026-03-02 02:45:02', 0, 0, 0, 'Run mode: GLPI'),
(56, 32, 55, '2026-03-02 02:45:02', 2, 0.0128839, 0, 'Action completed, no processing required'),
(57, 9, 0, '2026-03-02 07:11:46', 0, 0, 0, 'Run mode: GLPI'),
(58, 9, 57, '2026-03-02 07:11:46', 2, 0.013891, 0, 'Action completed, no processing required'),
(59, 17, 0, '2026-03-02 10:35:33', 0, 0, 0, 'Run mode: GLPI'),
(60, 17, 59, '2026-03-02 10:35:33', 2, 0.00989318, 0, 'Action completed, no processing required'),
(61, 21, 0, '2026-03-02 11:06:31', 0, 0, 0, 'Run mode: GLPI'),
(62, 21, 61, '2026-03-02 11:06:31', 2, 0.010144, 0, 'Action completed, no processing required'),
(63, 13, 0, '2026-03-02 11:16:32', 0, 0, 0, 'Run mode: GLPI'),
(64, 13, 63, '2026-03-02 11:16:32', 2, 0.0117159, 0, 'Action completed, no processing required'),
(65, 14, 0, '2026-03-02 16:42:00', 0, 0, 0, 'Run mode: GLPI'),
(66, 14, 65, '2026-03-02 16:42:00', 2, 0.0106659, 0, 'Action completed, no processing required'),
(67, 20, 0, '2026-03-02 16:47:52', 0, 0, 0, 'Run mode: GLPI'),
(68, 20, 67, '2026-03-02 16:47:52', 2, 0.0125771, 0, 'Action completed, no processing required'),
(69, 22, 0, '2026-03-02 16:56:42', 0, 0, 0, 'Run mode: GLPI'),
(70, 22, 69, '2026-03-02 16:56:42', 2, 0.00946212, 0, 'Action completed, no processing required'),
(71, 24, 0, '2026-03-03 00:18:30', 0, 0, 0, 'Run mode: GLPI'),
(72, 24, 71, '2026-03-03 00:18:30', 2, 0.012234, 0, 'Action completed, no processing required'),
(73, 32, 0, '2026-03-03 00:18:33', 0, 0, 0, 'Run mode: GLPI'),
(74, 32, 73, '2026-03-03 00:18:33', 2, 0.015909, 0, 'Action completed, no processing required'),
(75, 15, 0, '2026-03-03 08:40:20', 0, 0, 0, 'Run mode: GLPI'),
(76, 15, 75, '2026-03-03 08:40:20', 2, 0.0132539, 0, 'Action completed, no processing required'),
(77, 16, 0, '2026-03-03 08:46:30', 0, 0, 0, 'Run mode: GLPI'),
(78, 16, 77, '2026-03-03 08:46:30', 2, 0.00817585, 0, 'Action completed, no processing required'),
(79, 9, 0, '2026-03-03 09:30:03', 0, 0, 0, 'Run mode: GLPI'),
(80, 9, 79, '2026-03-03 09:30:03', 2, 0.0108011, 0, 'Action completed, no processing required'),
(81, 17, 0, '2026-03-03 12:44:16', 0, 0, 0, 'Run mode: GLPI'),
(82, 17, 81, '2026-03-03 12:44:16', 2, 0.010468, 0, 'Action completed, no processing required'),
(83, 21, 0, '2026-03-03 13:01:53', 0, 0, 0, 'Run mode: GLPI'),
(84, 21, 83, '2026-03-03 13:01:53', 2, 0.012115, 0, 'Action completed, no processing required'),
(85, 13, 0, '2026-03-03 14:07:40', 0, 0, 0, 'Run mode: GLPI'),
(86, 13, 85, '2026-03-03 14:07:40', 2, 0.0101891, 0, 'Action completed, no processing required'),
(87, 5, 0, '2026-03-03 14:07:48', 0, 0, 0, 'Run mode: GLPI'),
(88, 5, 87, '2026-03-03 14:07:48', 2, 0.0122201, 0, 'Action completed, no processing required'),
(89, 6, 0, '2026-03-03 14:33:03', 0, 0, 0, 'Run mode: GLPI'),
(90, 6, 89, '2026-03-03 14:33:03', 2, 0.010211, 0, 'Action completed, no processing required'),
(91, 12, 0, '2026-03-03 17:05:09', 0, 0, 0, 'Run mode: GLPI'),
(92, 12, 91, '2026-03-03 17:05:09', 1, 0.046454, 142, 'Clean 142 session files created since more than 1440 seconds\n'),
(93, 12, 91, '2026-03-03 17:05:09', 2, 0.0471539, 142, 'Action completed, fully processed'),
(94, 22, 0, '2026-03-03 17:14:32', 0, 0, 0, 'Run mode: GLPI'),
(95, 22, 94, '2026-03-03 17:14:32', 2, 0.014405, 0, 'Action completed, no processing required'),
(96, 18, 0, '2026-03-03 18:34:59', 0, 0, 0, 'Run mode: GLPI'),
(97, 18, 96, '2026-03-03 18:34:59', 2, 0.0136399, 0, 'Action completed, no processing required'),
(98, 19, 0, '2026-03-03 19:42:03', 0, 0, 0, 'Run mode: GLPI'),
(99, 19, 98, '2026-03-03 19:42:03', 2, 0.012825, 0, 'Action completed, fully processed'),
(100, 14, 0, '2026-03-03 23:09:53', 0, 0, 0, 'Run mode: GLPI'),
(101, 14, 100, '2026-03-03 23:09:53', 2, 0.0104802, 0, 'Action completed, no processing required'),
(102, 20, 0, '2026-03-04 02:18:08', 0, 0, 0, 'Run mode: GLPI'),
(103, 20, 102, '2026-03-04 02:18:08', 2, 0.0145891, 0, 'Action completed, no processing required'),
(104, 23, 0, '2026-03-04 08:14:31', 0, 0, 0, 'Run mode: GLPI'),
(105, 23, 104, '2026-03-04 08:14:31', 2, 0.011554, 0, 'Action completed, no processing required'),
(106, 25, 0, '2026-03-04 11:12:21', 0, 0, 0, 'Run mode: GLPI'),
(107, 25, 106, '2026-03-04 11:12:21', 2, 0.013623, 0, 'Action completed, no processing required'),
(108, 31, 0, '2026-03-04 11:13:01', 0, 0, 0, 'Run mode: GLPI'),
(109, 31, 108, '2026-03-04 11:13:01', 2, 0.0055449, 0, 'Action completed, no processing required'),
(110, 32, 0, '2026-03-04 11:15:47', 0, 0, 0, 'Run mode: GLPI'),
(111, 32, 110, '2026-03-04 11:15:47', 2, 0.00496292, 0, 'Action completed, no processing required'),
(112, 24, 0, '2026-03-04 11:17:32', 0, 0, 0, 'Run mode: GLPI'),
(113, 24, 112, '2026-03-04 11:17:32', 2, 0.00549793, 0, 'Action completed, no processing required'),
(114, 9, 0, '2026-03-04 11:18:19', 0, 0, 0, 'Run mode: GLPI'),
(115, 9, 114, '2026-03-04 11:18:19', 2, 0.00692606, 0, 'Action completed, no processing required'),
(116, 17, 0, '2026-03-04 11:40:16', 0, 0, 0, 'Run mode: GLPI'),
(117, 17, 116, '2026-03-04 11:40:16', 2, 0.0104759, 0, 'Action completed, no processing required'),
(118, 21, 0, '2026-03-04 15:25:22', 0, 0, 0, 'Run mode: GLPI'),
(119, 21, 118, '2026-03-04 15:25:22', 2, 0.018826, 0, 'Action completed, no processing required'),
(120, 13, 0, '2026-03-04 15:26:11', 0, 0, 0, 'Run mode: GLPI'),
(121, 13, 120, '2026-03-04 15:26:11', 2, 0.00599408, 0, 'Action completed, no processing required'),
(122, 22, 0, '2026-03-04 15:28:22', 0, 0, 0, 'Run mode: GLPI'),
(123, 22, 122, '2026-03-04 15:28:22', 2, 0.0104868, 0, 'Action completed, no processing required'),
(124, 15, 0, '2026-03-04 15:28:57', 0, 0, 0, 'Run mode: GLPI'),
(125, 15, 124, '2026-03-04 15:28:57', 2, 0.00517583, 0, 'Action completed, no processing required'),
(126, 16, 0, '2026-03-04 17:23:12', 0, 0, 0, 'Run mode: GLPI'),
(127, 16, 126, '2026-03-04 17:23:12', 2, 0.0100129, 0, 'Action completed, no processing required'),
(128, 14, 0, '2026-03-04 20:58:31', 0, 0, 0, 'Run mode: GLPI'),
(129, 14, 128, '2026-03-04 20:58:31', 2, 0.0115449, 0, 'Action completed, no processing required'),
(130, 20, 0, '2026-03-05 11:17:33', 0, 0, 0, 'Run mode: GLPI'),
(131, 20, 130, '2026-03-05 11:17:33', 2, 0.0153258, 0, 'Action completed, no processing required'),
(132, 32, 0, '2026-03-05 12:40:07', 0, 0, 0, 'Run mode: GLPI'),
(133, 32, 132, '2026-03-05 12:40:07', 2, 0.013768, 0, 'Action completed, no processing required'),
(134, 9, 0, '2026-03-05 13:00:12', 0, 0, 0, 'Run mode: GLPI'),
(135, 9, 134, '2026-03-05 13:00:12', 2, 0.00720501, 0, 'Action completed, no processing required'),
(136, 17, 0, '2026-03-05 13:05:48', 0, 0, 0, 'Run mode: GLPI'),
(137, 17, 136, '2026-03-05 13:05:48', 2, 0.00560403, 0, 'Action completed, no processing required'),
(138, 24, 0, '2026-03-05 13:10:53', 0, 0, 0, 'Run mode: GLPI'),
(139, 24, 138, '2026-03-05 13:10:53', 2, 0.00384498, 0, 'Action completed, no processing required'),
(140, 5, 0, '2026-03-05 13:17:26', 0, 0, 0, 'Run mode: GLPI'),
(141, 5, 140, '2026-03-05 13:17:26', 2, 0.00575185, 0, 'Action completed, no processing required'),
(142, 6, 0, '2026-03-05 13:22:47', 0, 0, 0, 'Run mode: GLPI'),
(143, 6, 142, '2026-03-05 13:22:47', 2, 0.0041399, 0, 'Action completed, no processing required'),
(144, 22, 0, '2026-03-05 13:41:06', 0, 0, 0, 'Run mode: GLPI'),
(145, 22, 144, '2026-03-05 13:41:06', 2, 0.0157969, 0, 'Action completed, no processing required'),
(146, 21, 0, '2026-03-06 03:20:33', 0, 0, 0, 'Run mode: GLPI'),
(147, 21, 146, '2026-03-06 03:20:33', 2, 0.0150559, 0, 'Action completed, no processing required'),
(148, 13, 0, '2026-03-06 14:52:56', 0, 0, 0, 'Run mode: GLPI'),
(149, 13, 148, '2026-03-06 14:52:56', 2, 0.012183, 0, 'Action completed, no processing required'),
(150, 12, 0, '2026-03-06 15:10:16', 0, 0, 0, 'Run mode: GLPI'),
(151, 12, 150, '2026-03-06 15:10:16', 1, 0.0364928, 94, 'Clean 94 session files created since more than 1440 seconds\n'),
(152, 12, 150, '2026-03-06 15:10:16', 2, 0.0370278, 94, 'Action completed, fully processed'),
(153, 18, 0, '2026-03-06 15:10:28', 0, 0, 0, 'Run mode: GLPI'),
(154, 18, 153, '2026-03-06 15:10:28', 2, 0.010654, 0, 'Action completed, no processing required'),
(155, 19, 0, '2026-03-06 16:26:27', 0, 0, 0, 'Run mode: GLPI'),
(156, 19, 155, '2026-03-06 16:26:27', 2, 0.010263, 0, 'Action completed, fully processed'),
(157, 14, 0, '2026-03-06 17:12:50', 0, 0, 0, 'Run mode: GLPI'),
(158, 14, 157, '2026-03-06 17:12:50', 2, 0.0256538, 0, 'Action completed, no processing required'),
(159, 15, 0, '2026-03-06 17:22:18', 0, 0, 0, 'Run mode: GLPI'),
(160, 15, 159, '2026-03-06 17:22:18', 2, 0.0101249, 0, 'Action completed, no processing required'),
(161, 16, 0, '2026-03-06 17:23:15', 0, 0, 0, 'Run mode: GLPI'),
(162, 16, 161, '2026-03-06 17:23:15', 2, 0.00863385, 0, 'Action completed, no processing required'),
(163, 23, 0, '2026-03-06 17:23:25', 0, 0, 0, 'Run mode: GLPI'),
(164, 23, 163, '2026-03-06 17:23:25', 2, 0.0047791, 0, 'Action completed, no processing required'),
(165, 25, 0, '2026-03-07 00:19:11', 0, 0, 0, 'Run mode: GLPI'),
(166, 25, 165, '2026-03-07 00:19:11', 2, 0.0153148, 0, 'Action completed, no processing required'),
(167, 31, 0, '2026-03-07 03:18:05', 0, 0, 0, 'Run mode: GLPI'),
(168, 31, 167, '2026-03-07 03:18:05', 2, 0.010577, 0, 'Action completed, no processing required'),
(169, 20, 0, '2026-03-07 03:32:48', 0, 0, 0, 'Run mode: GLPI'),
(170, 20, 169, '2026-03-07 03:32:48', 2, 0.014281, 0, 'Action completed, no processing required'),
(171, 32, 0, '2026-03-07 03:34:26', 0, 0, 0, 'Run mode: GLPI'),
(172, 32, 171, '2026-03-07 03:34:26', 2, 0.005234, 0, 'Action completed, no processing required'),
(173, 9, 0, '2026-03-07 03:35:13', 0, 0, 0, 'Run mode: GLPI'),
(174, 9, 173, '2026-03-07 03:35:13', 2, 0.00542212, 0, 'Action completed, no processing required'),
(175, 17, 0, '2026-03-07 07:40:18', 0, 0, 0, 'Run mode: GLPI'),
(176, 17, 175, '2026-03-07 07:40:18', 2, 0.012064, 0, 'Action completed, no processing required'),
(177, 22, 0, '2026-03-07 11:21:46', 0, 0, 0, 'Run mode: GLPI'),
(178, 22, 177, '2026-03-07 11:21:46', 2, 0.0173111, 0, 'Action completed, no processing required'),
(179, 24, 0, '2026-03-07 17:21:26', 0, 0, 0, 'Run mode: GLPI'),
(180, 24, 179, '2026-03-07 17:21:26', 1, 0.0121889, 1, 'Clean 1 temporary files created since more than 3600 seconds\n'),
(181, 24, 179, '2026-03-07 17:21:26', 2, 0.0126538, 1, 'Action completed, fully processed'),
(182, 21, 0, '2026-03-07 17:21:58', 0, 0, 0, 'Run mode: GLPI'),
(183, 21, 182, '2026-03-07 17:21:58', 2, 0.00895596, 0, 'Action completed, no processing required'),
(184, 5, 0, '2026-03-08 23:09:21', 0, 0, 0, 'Run mode: GLPI'),
(185, 5, 184, '2026-03-08 23:09:21', 2, 0.013582, 0, 'Action completed, no processing required'),
(186, 6, 0, '2026-03-09 09:27:27', 0, 0, 0, 'Run mode: GLPI'),
(187, 6, 186, '2026-03-09 09:27:27', 2, 0.00788784, 0, 'Action completed, no processing required'),
(188, 13, 0, '2026-03-09 12:35:09', 0, 0, 0, 'Run mode: GLPI'),
(189, 13, 188, '2026-03-09 12:35:09', 2, 0.010401, 0, 'Action completed, no processing required'),
(190, 14, 0, '2026-03-09 12:36:04', 0, 0, 0, 'Run mode: GLPI'),
(191, 14, 190, '2026-03-09 12:36:04', 2, 0.005512, 0, 'Action completed, no processing required'),
(192, 32, 0, '2026-03-09 12:36:04', 0, 0, 0, 'Run mode: GLPI'),
(193, 32, 192, '2026-03-09 12:36:04', 2, 0.00452709, 0, 'Action completed, no processing required'),
(194, 9, 0, '2026-03-09 12:36:44', 0, 0, 0, 'Run mode: GLPI'),
(195, 9, 194, '2026-03-09 12:36:44', 2, 0.00676799, 0, 'Action completed, no processing required'),
(196, 20, 0, '2026-03-09 12:37:13', 0, 0, 0, 'Run mode: GLPI'),
(197, 20, 196, '2026-03-09 12:37:13', 2, 0.00734711, 0, 'Action completed, no processing required'),
(198, 15, 0, '2026-03-09 16:55:02', 0, 0, 0, 'Run mode: GLPI'),
(199, 15, 198, '2026-03-09 16:55:02', 2, 0.0122211, 0, 'Action completed, no processing required'),
(200, 16, 0, '2026-03-09 17:22:37', 0, 0, 0, 'Run mode: GLPI'),
(201, 16, 200, '2026-03-09 17:22:37', 2, 0.00920391, 0, 'Action completed, no processing required'),
(202, 17, 0, '2026-03-09 17:23:14', 0, 0, 0, 'Run mode: GLPI'),
(203, 17, 202, '2026-03-09 17:23:14', 2, 0.00427699, 0, 'Action completed, no processing required'),
(204, 22, 0, '2026-03-09 17:27:43', 0, 0, 0, 'Run mode: GLPI'),
(205, 22, 204, '2026-03-09 17:27:43', 2, 0.0121701, 0, 'Action completed, no processing required'),
(206, 12, 0, '2026-03-09 19:21:27', 0, 0, 0, 'Run mode: GLPI'),
(207, 12, 206, '2026-03-09 19:21:27', 1, 0.037123, 102, 'Clean 102 session files created since more than 1440 seconds\n'),
(208, 12, 206, '2026-03-09 19:21:27', 2, 0.037611, 102, 'Action completed, fully processed'),
(209, 18, 0, '2026-03-10 00:21:51', 0, 0, 0, 'Run mode: GLPI'),
(210, 18, 209, '2026-03-10 00:21:51', 2, 0.0137699, 0, 'Action completed, no processing required'),
(211, 19, 0, '2026-03-10 06:40:22', 0, 0, 0, 'Run mode: GLPI'),
(212, 19, 211, '2026-03-10 06:40:22', 2, 0.0126801, 0, 'Action completed, fully processed'),
(213, 23, 0, '2026-03-10 20:46:15', 0, 0, 0, 'Run mode: GLPI'),
(214, 23, 213, '2026-03-10 20:46:15', 2, 0.0148909, 0, 'Action completed, no processing required'),
(215, 21, 0, '2026-03-10 20:46:15', 0, 0, 0, 'Run mode: GLPI'),
(216, 21, 215, '2026-03-10 20:46:15', 2, 0.0096581, 0, 'Action completed, no processing required'),
(217, 24, 0, '2026-03-11 14:26:07', 0, 0, 0, 'Run mode: GLPI'),
(218, 24, 217, '2026-03-11 14:26:07', 2, 0.013732, 0, 'Action completed, no processing required'),
(219, 25, 0, '2026-03-11 17:32:28', 0, 0, 0, 'Run mode: GLPI'),
(220, 25, 219, '2026-03-11 17:32:28', 2, 0.0113389, 0, 'Action completed, no processing required'),
(221, 31, 0, '2026-03-11 20:06:55', 0, 0, 0, 'Run mode: GLPI'),
(222, 31, 221, '2026-03-11 20:06:55', 2, 0.012944, 0, 'Action completed, no processing required'),
(223, 32, 0, '2026-03-12 06:28:59', 0, 0, 0, 'Run mode: GLPI'),
(224, 32, 223, '2026-03-12 06:28:59', 2, 0.0150349, 0, 'Action completed, no processing required'),
(225, 9, 0, '2026-03-12 10:05:47', 0, 0, 0, 'Run mode: GLPI'),
(226, 9, 225, '2026-03-12 10:05:47', 2, 0.0130188, 0, 'Action completed, no processing required'),
(227, 13, 0, '2026-03-12 10:06:17', 0, 0, 0, 'Run mode: GLPI'),
(228, 13, 227, '2026-03-12 10:06:17', 2, 0.00409412, 0, 'Action completed, no processing required'),
(229, 14, 0, '2026-03-12 10:06:44', 0, 0, 0, 'Run mode: GLPI'),
(230, 14, 229, '2026-03-12 10:06:44', 2, 0.00530887, 0, 'Action completed, no processing required'),
(231, 20, 0, '2026-03-12 10:08:31', 0, 0, 0, 'Run mode: GLPI'),
(232, 20, 231, '2026-03-12 10:08:31', 2, 0.00813603, 0, 'Action completed, no processing required'),
(233, 17, 0, '2026-03-12 11:55:50', 0, 0, 0, 'Run mode: GLPI'),
(234, 17, 233, '2026-03-12 11:55:50', 2, 0.01266, 0, 'Action completed, no processing required'),
(235, 22, 0, '2026-03-13 08:52:59', 0, 0, 0, 'Run mode: GLPI'),
(236, 22, 235, '2026-03-13 08:52:59', 2, 0.0212622, 0, 'Action completed, no processing required'),
(237, 5, 0, '2026-03-13 20:24:53', 0, 0, 0, 'Run mode: GLPI'),
(238, 5, 237, '2026-03-13 20:24:53', 2, 0.0175869, 0, 'Action completed, no processing required'),
(239, 15, 0, '2026-03-14 02:38:52', 0, 0, 0, 'Run mode: GLPI'),
(240, 15, 239, '2026-03-14 02:38:52', 2, 0.0127549, 0, 'Action completed, no processing required'),
(241, 16, 0, '2026-03-14 11:36:57', 0, 0, 0, 'Run mode: GLPI'),
(242, 16, 241, '2026-03-14 11:36:57', 2, 0.0118661, 0, 'Action completed, no processing required'),
(243, 6, 0, '2026-03-16 12:00:17', 0, 0, 0, 'Run mode: GLPI'),
(244, 6, 243, '2026-03-16 12:00:17', 2, 0.00924611, 0, 'Action completed, no processing required'),
(245, 12, 0, '2026-03-16 17:43:01', 0, 0, 0, 'Run mode: GLPI'),
(246, 12, 245, '2026-03-16 17:43:01', 1, 0.017508, 17, 'Clean 17 session files created since more than 1440 seconds\n'),
(247, 12, 245, '2026-03-16 17:43:01', 2, 0.0180628, 17, 'Action completed, fully processed'),
(248, 21, 0, '2026-03-17 11:00:44', 0, 0, 0, 'Run mode: GLPI'),
(249, 21, 248, '2026-03-17 11:00:44', 2, 0.0183909, 0, 'Action completed, no processing required'),
(250, 18, 0, '2026-03-19 17:26:35', 0, 0, 0, 'Run mode: GLPI'),
(251, 18, 250, '2026-03-19 17:26:35', 2, 0.0149181, 0, 'Action completed, no processing required'),
(252, 24, 0, '2026-03-20 16:20:33', 0, 0, 0, 'Run mode: GLPI'),
(253, 24, 252, '2026-03-20 16:20:33', 2, 0.0121391, 0, 'Action completed, no processing required'),
(254, 23, 0, '2026-03-20 16:21:00', 0, 0, 0, 'Run mode: GLPI'),
(255, 23, 254, '2026-03-20 16:21:00', 2, 0.0148802, 0, 'Action completed, no processing required'),
(256, 32, 0, '2026-03-20 17:07:32', 0, 0, 0, 'Run mode: GLPI'),
(257, 32, 256, '2026-03-20 17:07:32', 2, 0.0130241, 0, 'Action completed, no processing required'),
(258, 9, 0, '2026-03-20 17:22:23', 0, 0, 0, 'Run mode: GLPI'),
(259, 9, 258, '2026-03-20 17:22:23', 2, 0.0109229, 0, 'Action completed, no processing required'),
(260, 13, 0, '2026-03-20 17:23:01', 0, 0, 0, 'Run mode: GLPI'),
(261, 13, 260, '2026-03-20 17:23:01', 2, 0.004246, 0, 'Action completed, no processing required'),
(262, 14, 0, '2026-03-21 17:57:28', 0, 0, 0, 'Run mode: GLPI'),
(263, 14, 262, '2026-03-21 17:57:28', 2, 0.0122859, 0, 'Action completed, no processing required'),
(264, 20, 0, '2026-03-22 10:54:01', 0, 0, 0, 'Run mode: GLPI'),
(265, 20, 264, '2026-03-22 10:54:01', 2, 0.0160031, 0, 'Action completed, no processing required'),
(266, 17, 0, '2026-03-23 04:13:18', 0, 0, 0, 'Run mode: GLPI'),
(267, 17, 266, '2026-03-23 04:13:18', 2, 0.0111752, 0, 'Action completed, no processing required'),
(268, 25, 0, '2026-03-24 17:45:32', 0, 0, 0, 'Run mode: GLPI'),
(269, 25, 268, '2026-03-24 17:45:32', 2, 0.0807898, 0, 'Action completed, no processing required'),
(270, 31, 0, '2026-03-25 22:16:47', 0, 0, 0, 'Run mode: GLPI'),
(271, 31, 270, '2026-03-25 22:16:47', 2, 0.0115609, 0, 'Action completed, no processing required'),
(272, 22, 0, '2026-03-25 22:17:31', 0, 0, 0, 'Run mode: GLPI'),
(273, 22, 272, '2026-03-25 22:17:31', 2, 0.0122299, 0, 'Action completed, no processing required'),
(274, 15, 0, '2026-03-25 22:18:50', 0, 0, 0, 'Run mode: GLPI'),
(275, 15, 274, '2026-03-25 22:18:50', 2, 0.00567484, 0, 'Action completed, no processing required'),
(276, 5, 0, '2026-03-25 22:19:45', 0, 0, 0, 'Run mode: GLPI'),
(277, 5, 276, '2026-03-25 22:19:45', 2, 0.00455284, 0, 'Action completed, no processing required'),
(278, 16, 0, '2026-03-25 22:28:29', 0, 0, 0, 'Run mode: GLPI'),
(279, 16, 278, '2026-03-25 22:28:29', 2, 0.00627017, 0, 'Action completed, no processing required'),
(280, 21, 0, '2026-03-25 22:34:02', 0, 0, 0, 'Run mode: GLPI'),
(281, 21, 280, '2026-03-25 22:34:02', 2, 0.00588822, 0, 'Action completed, no processing required'),
(282, 6, 0, '2026-03-26 09:51:45', 0, 0, 0, 'Run mode: GLPI'),
(283, 6, 282, '2026-03-26 09:51:45', 2, 0.00960684, 0, 'Action completed, no processing required'),
(284, 12, 0, '2026-03-26 12:30:14', 0, 0, 0, 'Run mode: GLPI'),
(285, 12, 284, '2026-03-26 12:30:14', 1, 0.0529399, 179, 'Clean 179 session files created since more than 1440 seconds\n'),
(286, 12, 284, '2026-03-26 12:30:14', 2, 0.0705719, 179, 'Action completed, fully processed'),
(287, 32, 0, '2026-03-26 12:39:54', 0, 0, 0, 'Run mode: GLPI'),
(288, 32, 287, '2026-03-26 12:39:54', 2, 0.04831, 0, 'Action completed, no processing required'),
(289, 24, 0, '2026-03-26 12:46:36', 0, 0, 0, 'Run mode: GLPI'),
(290, 24, 289, '2026-03-26 12:46:36', 2, 0.00522208, 0, 'Action completed, no processing required'),
(291, 18, 0, '2026-03-26 18:10:29', 0, 0, 0, 'Run mode: GLPI'),
(292, 18, 291, '2026-03-26 18:10:29', 2, 0.0148649, 0, 'Action completed, no processing required'),
(293, 9, 0, '2026-03-27 10:33:44', 0, 0, 0, 'Run mode: GLPI'),
(294, 9, 293, '2026-03-27 10:33:44', 2, 0.0106401, 0, 'Action completed, no processing required'),
(295, 13, 0, '2026-03-27 10:40:15', 0, 0, 0, 'Run mode: GLPI'),
(296, 13, 295, '2026-03-27 10:40:15', 2, 0.00461078, 0, 'Action completed, no processing required'),
(297, 23, 0, '2026-03-27 10:40:47', 0, 0, 0, 'Run mode: GLPI'),
(298, 23, 297, '2026-03-27 10:40:47', 2, 0.00538683, 0, 'Action completed, no processing required'),
(299, 14, 0, '2026-03-27 10:44:19', 0, 0, 0, 'Run mode: GLPI'),
(300, 14, 299, '2026-03-27 10:44:19', 2, 0.00387311, 0, 'Action completed, no processing required'),
(301, 20, 0, '2026-03-27 10:44:49', 0, 0, 0, 'Run mode: GLPI'),
(302, 20, 301, '2026-03-27 10:44:49', 2, 0.005373, 0, 'Action completed, no processing required'),
(303, 17, 0, '2026-03-27 10:58:35', 0, 0, 0, 'Run mode: GLPI'),
(304, 17, 303, '2026-03-27 10:58:35', 2, 0.00863981, 0, 'Action completed, no processing required'),
(305, 25, 0, '2026-03-27 11:04:23', 0, 0, 0, 'Run mode: GLPI'),
(306, 25, 305, '2026-03-27 11:04:23', 2, 0.00878477, 0, 'Action completed, no processing required'),
(307, 22, 0, '2026-03-27 11:05:11', 0, 0, 0, 'Run mode: GLPI'),
(308, 22, 307, '2026-03-27 11:05:11', 2, 0.00763297, 0, 'Action completed, no processing required'),
(309, 21, 0, '2026-03-27 11:06:55', 0, 0, 0, 'Run mode: GLPI'),
(310, 21, 309, '2026-03-27 11:06:55', 2, 0.00658011, 0, 'Action completed, no processing required'),
(311, 15, 0, '2026-03-27 11:23:27', 0, 0, 0, 'Run mode: GLPI'),
(312, 15, 311, '2026-03-27 11:23:27', 2, 0.00900698, 0, 'Action completed, no processing required'),
(313, 16, 0, '2026-03-27 11:29:58', 0, 0, 0, 'Run mode: GLPI'),
(314, 16, 313, '2026-03-27 11:29:58', 2, 0.010684, 0, 'Action completed, no processing required'),
(315, 32, 0, '2026-03-27 11:48:31', 0, 0, 0, 'Run mode: GLPI'),
(316, 32, 315, '2026-03-27 11:48:31', 2, 0.010184, 0, 'Action completed, no processing required'),
(317, 24, 0, '2026-03-27 11:57:19', 0, 0, 0, 'Run mode: GLPI'),
(318, 24, 317, '2026-03-27 11:57:19', 2, 0.00717998, 0, 'Action completed, no processing required'),
(319, 31, 0, '2026-03-27 12:04:35', 0, 0, 0, 'Run mode: GLPI'),
(320, 31, 319, '2026-03-27 12:04:35', 2, 0.00812197, 0, 'Action completed, no processing required'),
(321, 5, 0, '2026-03-27 23:40:10', 0, 0, 0, 'Run mode: GLPI'),
(322, 5, 321, '2026-03-27 23:40:10', 2, 0.012423, 0, 'Action completed, no processing required'),
(323, 6, 0, '2026-03-29 17:14:28', 0, 0, 0, 'Run mode: GLPI'),
(324, 6, 323, '2026-03-29 17:14:28', 2, 0.0107381, 0, 'Action completed, no processing required'),
(325, 9, 0, '2026-03-29 19:52:23', 0, 0, 0, 'Run mode: GLPI'),
(326, 9, 325, '2026-03-29 19:52:23', 2, 0.014652, 0, 'Action completed, no processing required'),
(327, 17, 0, '2026-03-29 19:54:59', 0, 0, 0, 'Run mode: GLPI'),
(328, 17, 327, '2026-03-29 19:54:59', 2, 0.00486588, 0, 'Action completed, no processing required'),
(329, 22, 0, '2026-03-29 19:55:19', 0, 0, 0, 'Run mode: GLPI'),
(330, 22, 329, '2026-03-29 19:55:19', 2, 0.0106709, 0, 'Action completed, no processing required'),
(331, 21, 0, '2026-03-29 20:03:57', 0, 0, 0, 'Run mode: GLPI'),
(332, 21, 331, '2026-03-29 20:03:57', 2, 0.0108061, 0, 'Action completed, no processing required'),
(333, 13, 0, '2026-03-29 20:19:53', 0, 0, 0, 'Run mode: GLPI'),
(334, 13, 333, '2026-03-29 20:19:53', 2, 0.00493789, 0, 'Action completed, no processing required'),
(335, 14, 0, '2026-03-29 20:28:24', 0, 0, 0, 'Run mode: GLPI'),
(336, 14, 335, '2026-03-29 20:28:24', 2, 0.00747895, 0, 'Action completed, no processing required'),
(337, 20, 0, '2026-03-29 20:40:21', 0, 0, 0, 'Run mode: GLPI'),
(338, 20, 337, '2026-03-29 20:40:21', 2, 0.012301, 0, 'Action completed, no processing required'),
(339, 32, 0, '2026-03-29 20:45:44', 0, 0, 0, 'Run mode: GLPI'),
(340, 32, 339, '2026-03-29 20:45:44', 2, 0.00427294, 0, 'Action completed, no processing required'),
(341, 12, 0, '2026-03-29 20:51:02', 0, 0, 0, 'Run mode: GLPI'),
(342, 12, 341, '2026-03-29 20:51:02', 1, 0.021559, 75, 'Clean 75 session files created since more than 1440 seconds\n'),
(343, 12, 341, '2026-03-29 20:51:02', 2, 0.022125, 75, 'Action completed, fully processed'),
(344, 24, 0, '2026-03-30 01:22:56', 0, 0, 0, 'Run mode: GLPI'),
(345, 24, 344, '2026-03-30 01:22:56', 1, 0.012799, 1, 'Clean 1 temporary files created since more than 3600 seconds\n'),
(346, 24, 344, '2026-03-30 01:22:56', 2, 0.013221, 1, 'Action completed, fully processed'),
(347, 18, 0, '2026-03-30 01:28:43', 0, 0, 0, 'Run mode: GLPI'),
(348, 18, 347, '2026-03-30 01:28:43', 2, 0.012207, 0, 'Action completed, no processing required'),
(349, 15, 0, '2026-03-30 06:17:09', 0, 0, 0, 'Run mode: GLPI'),
(350, 15, 349, '2026-03-30 06:17:09', 2, 0.0102661, 0, 'Action completed, no processing required'),
(351, 16, 0, '2026-03-30 06:26:52', 0, 0, 0, 'Run mode: GLPI'),
(352, 16, 351, '2026-03-30 06:26:52', 2, 0.004776, 0, 'Action completed, no processing required'),
(353, 23, 0, '2026-03-30 06:35:14', 0, 0, 0, 'Run mode: GLPI'),
(354, 23, 353, '2026-03-30 06:35:14', 2, 0.00397921, 0, 'Action completed, no processing required'),
(355, 25, 0, '2026-03-30 06:41:09', 0, 0, 0, 'Run mode: GLPI'),
(356, 25, 355, '2026-03-30 06:41:09', 2, 0.00490618, 0, 'Action completed, no processing required'),
(357, 31, 0, '2026-03-30 06:41:32', 0, 0, 0, 'Run mode: GLPI'),
(358, 31, 357, '2026-03-30 06:41:32', 2, 0.0049572, 0, 'Action completed, no processing required'),
(359, 5, 0, '2026-03-30 06:43:41', 0, 0, 0, 'Run mode: GLPI'),
(360, 5, 359, '2026-03-30 06:43:41', 2, 0.00623083, 0, 'Action completed, no processing required'),
(361, 22, 0, '2026-03-30 06:54:14', 0, 0, 0, 'Run mode: GLPI'),
(362, 22, 361, '2026-03-30 06:54:14', 2, 0.0108979, 0, 'Action completed, no processing required'),
(363, 17, 0, '2026-03-30 06:59:52', 0, 0, 0, 'Run mode: GLPI'),
(364, 17, 363, '2026-03-30 06:59:52', 2, 0.00520992, 0, 'Action completed, no processing required'),
(365, 9, 0, '2026-03-30 07:05:14', 0, 0, 0, 'Run mode: GLPI'),
(366, 9, 365, '2026-03-30 07:05:14', 2, 0.00535607, 0, 'Action completed, no processing required'),
(367, 21, 0, '2026-03-30 07:05:52', 0, 0, 0, 'Run mode: GLPI'),
(368, 21, 367, '2026-03-30 07:05:52', 2, 0.00491405, 0, 'Action completed, no processing required'),
(369, 32, 0, '2026-03-30 07:08:06', 0, 0, 0, 'Run mode: GLPI'),
(370, 32, 369, '2026-03-30 07:08:06', 2, 0.00496817, 0, 'Action completed, no processing required'),
(371, 13, 0, '2026-03-30 07:19:02', 0, 0, 0, 'Run mode: GLPI'),
(372, 13, 371, '2026-03-30 07:19:02', 2, 0.00447297, 0, 'Action completed, no processing required'),
(373, 14, 0, '2026-03-30 09:44:41', 0, 0, 0, 'Run mode: GLPI'),
(374, 14, 373, '2026-03-30 09:44:41', 2, 0.012131, 0, 'Action completed, no processing required'),
(375, 20, 0, '2026-03-30 09:44:47', 0, 0, 0, 'Run mode: GLPI'),
(376, 20, 375, '2026-03-30 09:44:47', 2, 0.00769997, 0, 'Action completed, no processing required'),
(377, 24, 0, '2026-03-30 09:45:04', 0, 0, 0, 'Run mode: GLPI'),
(378, 24, 377, '2026-03-30 09:45:04', 2, 0.00527883, 0, 'Action completed, no processing required'),
(379, 22, 0, '2026-03-30 09:51:28', 0, 0, 0, 'Run mode: GLPI'),
(380, 22, 379, '2026-03-30 09:51:28', 2, 0.00952506, 0, 'Action completed, no processing required'),
(381, 17, 0, '2026-03-30 10:39:48', 0, 0, 0, 'Run mode: GLPI'),
(382, 17, 381, '2026-03-30 10:39:48', 2, 0.00647998, 0, 'Action completed, no processing required'),
(383, 21, 0, '2026-03-30 10:39:57', 0, 0, 0, 'Run mode: GLPI'),
(384, 21, 383, '2026-03-30 10:39:57', 2, 0.00738287, 0, 'Action completed, no processing required'),
(385, 32, 0, '2026-03-30 11:40:17', 0, 0, 0, 'Run mode: GLPI'),
(386, 32, 385, '2026-03-30 11:40:17', 2, 0.007303, 0, 'Action completed, no processing required'),
(387, 9, 0, '2026-03-30 12:08:23', 0, 0, 0, 'Run mode: GLPI'),
(388, 9, 387, '2026-03-30 12:08:23', 2, 0.013602, 0, 'Action completed, no processing required'),
(389, 13, 0, '2026-03-30 15:31:02', 0, 0, 0, 'Run mode: GLPI'),
(390, 13, 389, '2026-03-30 15:31:02', 2, 0.0219879, 0, 'Action completed, no processing required'),
(391, 22, 0, '2026-03-30 15:40:10', 0, 0, 0, 'Run mode: GLPI'),
(392, 22, 391, '2026-03-30 15:40:10', 2, 0.0170951, 0, 'Action completed, no processing required'),
(393, 14, 0, '2026-03-30 15:45:11', 0, 0, 0, 'Run mode: GLPI'),
(394, 14, 393, '2026-03-30 15:45:11', 2, 0.00582814, 0, 'Action completed, no processing required'),
(395, 17, 0, '2026-03-30 16:34:13', 0, 0, 0, 'Run mode: GLPI'),
(396, 17, 395, '2026-03-30 16:34:13', 2, 0.00622201, 0, 'Action completed, no processing required'),
(397, 20, 0, '2026-03-31 06:23:42', 0, 0, 0, 'Run mode: GLPI'),
(398, 20, 397, '2026-03-31 06:23:42', 2, 0.00810409, 0, 'Action completed, no processing required'),
(399, 21, 0, '2026-03-31 06:28:54', 0, 0, 0, 'Run mode: GLPI'),
(400, 21, 399, '2026-03-31 06:28:54', 2, 0.00499701, 0, 'Action completed, no processing required'),
(401, 24, 0, '2026-03-31 06:29:21', 0, 0, 0, 'Run mode: GLPI'),
(402, 24, 401, '2026-03-31 06:29:21', 2, 0.00437188, 0, 'Action completed, no processing required'),
(403, 32, 0, '2026-03-31 06:29:49', 0, 0, 0, 'Run mode: GLPI'),
(404, 32, 403, '2026-03-31 06:29:49', 2, 0.00408697, 0, 'Action completed, no processing required'),
(405, 9, 0, '2026-03-31 06:30:16', 0, 0, 0, 'Run mode: GLPI'),
(406, 9, 405, '2026-03-31 06:30:16', 2, 0.00529814, 0, 'Action completed, no processing required'),
(407, 22, 0, '2026-03-31 06:30:45', 0, 0, 0, 'Run mode: GLPI'),
(408, 22, 407, '2026-03-31 06:30:45', 2, 0.00875092, 0, 'Action completed, no processing required'),
(409, 13, 0, '2026-03-31 09:20:39', 0, 0, 0, 'Run mode: GLPI'),
(410, 13, 409, '2026-03-31 09:20:39', 2, 0.00598502, 0, 'Action completed, no processing required'),
(411, 17, 0, '2026-03-31 10:13:41', 0, 0, 0, 'Run mode: GLPI'),
(412, 17, 411, '2026-03-31 10:13:41', 2, 0.0102549, 0, 'Action completed, no processing required'),
(413, 14, 0, '2026-03-31 10:13:50', 0, 0, 0, 'Run mode: GLPI'),
(414, 14, 413, '2026-03-31 10:13:50', 2, 0.00456381, 0, 'Action completed, no processing required'),
(415, 6, 0, '2026-03-31 10:15:58', 0, 0, 0, 'Run mode: GLPI'),
(416, 6, 415, '2026-03-31 10:15:58', 2, 0.00472617, 0, 'Action completed, no processing required'),
(417, 15, 0, '2026-03-31 10:16:35', 0, 0, 0, 'Run mode: GLPI'),
(418, 15, 417, '2026-03-31 10:16:35', 2, 0.00564408, 0, 'Action completed, no processing required'),
(419, 16, 0, '2026-03-31 10:18:18', 0, 0, 0, 'Run mode: GLPI'),
(420, 16, 419, '2026-03-31 10:18:18', 2, 0.00436401, 0, 'Action completed, no processing required'),
(421, 12, 0, '2026-03-31 10:21:44', 0, 0, 0, 'Run mode: GLPI'),
(422, 12, 421, '2026-03-31 10:21:44', 1, 0.0188792, 52, 'Clean 52 session files created since more than 1440 seconds\n'),
(423, 12, 421, '2026-03-31 10:21:44', 2, 0.0193532, 52, 'Action completed, fully processed'),
(424, 18, 0, '2026-03-31 10:24:03', 0, 0, 0, 'Run mode: GLPI'),
(425, 18, 424, '2026-03-31 10:24:03', 2, 0.024847, 0, 'Action completed, no processing required'),
(426, 22, 0, '2026-03-31 10:27:50', 0, 0, 0, 'Run mode: GLPI'),
(427, 22, 426, '2026-03-31 10:27:50', 2, 0.15764, 2, 'Action completed, fully processed'),
(428, 21, 0, '2026-03-31 10:29:40', 0, 0, 0, 'Run mode: GLPI'),
(429, 21, 428, '2026-03-31 10:29:40', 2, 0.0062542, 0, 'Action completed, no processing required'),
(430, 32, 0, '2026-03-31 10:31:13', 0, 0, 0, 'Run mode: GLPI'),
(431, 32, 430, '2026-03-31 10:31:13', 2, 0.00461006, 0, 'Action completed, no processing required'),
(432, 23, 0, '2026-03-31 10:31:28', 0, 0, 0, 'Run mode: GLPI'),
(433, 23, 432, '2026-03-31 10:31:28', 2, 0.00421405, 0, 'Action completed, no processing required'),
(434, 9, 0, '2026-03-31 10:32:53', 0, 0, 0, 'Run mode: GLPI'),
(435, 9, 434, '2026-03-31 10:32:53', 2, 0.00720286, 0, 'Action completed, no processing required'),
(436, 25, 0, '2026-03-31 10:33:09', 0, 0, 0, 'Run mode: GLPI'),
(437, 25, 436, '2026-03-31 10:33:09', 2, 0.00383186, 0, 'Action completed, no processing required'),
(438, 31, 0, '2026-03-31 10:37:10', 0, 0, 0, 'Run mode: GLPI'),
(439, 31, 438, '2026-03-31 10:37:10', 2, 0.00396109, 0, 'Action completed, no processing required'),
(440, 5, 0, '2026-03-31 10:37:44', 0, 0, 0, 'Run mode: GLPI'),
(441, 5, 440, '2026-03-31 10:37:44', 2, 0.00549412, 0, 'Action completed, no processing required'),
(442, 20, 0, '2026-03-31 10:38:08', 0, 0, 0, 'Run mode: GLPI'),
(443, 20, 442, '2026-03-31 10:38:08', 2, 0.00459504, 0, 'Action completed, no processing required'),
(444, 24, 0, '2026-03-31 10:43:04', 0, 0, 0, 'Run mode: GLPI'),
(445, 24, 444, '2026-03-31 10:43:04', 2, 0.00405407, 0, 'Action completed, no processing required'),
(446, 17, 0, '2026-03-31 10:44:35', 0, 0, 0, 'Run mode: GLPI'),
(447, 17, 446, '2026-03-31 10:44:35', 2, 0.00388908, 0, 'Action completed, no processing required'),
(448, 13, 0, '2026-03-31 10:44:42', 0, 0, 0, 'Run mode: GLPI'),
(449, 13, 448, '2026-03-31 10:44:42', 2, 0.00550795, 0, 'Action completed, no processing required'),
(450, 22, 0, '2026-03-31 10:53:05', 0, 0, 0, 'Run mode: GLPI'),
(451, 22, 450, '2026-03-31 10:53:05', 2, 0.0890391, 1, 'Action completed, fully processed'),
(452, 21, 0, '2026-03-31 10:53:46', 0, 0, 0, 'Run mode: GLPI'),
(453, 21, 452, '2026-03-31 10:53:46', 2, 0.00533199, 0, 'Action completed, no processing required'),
(454, 32, 0, '2026-03-31 10:54:25', 0, 0, 0, 'Run mode: GLPI'),
(455, 32, 454, '2026-03-31 10:54:25', 2, 0.00429296, 0, 'Action completed, no processing required'),
(456, 9, 0, '2026-03-31 10:57:34', 0, 0, 0, 'Run mode: GLPI'),
(457, 9, 456, '2026-03-31 10:57:34', 2, 0.00592279, 0, 'Action completed, no processing required'),
(458, 17, 0, '2026-03-31 10:58:13', 0, 0, 0, 'Run mode: GLPI'),
(459, 17, 458, '2026-03-31 10:58:13', 2, 0.00475907, 0, 'Action completed, no processing required'),
(460, 22, 0, '2026-03-31 10:58:19', 0, 0, 0, 'Run mode: GLPI'),
(461, 22, 460, '2026-03-31 10:58:19', 2, 0.00441194, 0, 'Action completed, no processing required'),
(462, 21, 0, '2026-03-31 11:01:29', 0, 0, 0, 'Run mode: GLPI'),
(463, 21, 462, '2026-03-31 11:01:29', 2, 0.00445008, 0, 'Action completed, no processing required'),
(464, 22, 0, '2026-03-31 11:03:28', 0, 0, 0, 'Run mode: GLPI'),
(465, 22, 464, '2026-03-31 11:03:28', 2, 0.00472307, 0, 'Action completed, no processing required'),
(466, 32, 0, '2026-03-31 11:03:29', 0, 0, 0, 'Run mode: GLPI'),
(467, 32, 466, '2026-03-31 11:03:29', 2, 0.00441599, 0, 'Action completed, no processing required'),
(468, 17, 0, '2026-03-31 11:08:51', 0, 0, 0, 'Run mode: GLPI'),
(469, 17, 468, '2026-03-31 11:08:51', 2, 0.00393701, 0, 'Action completed, no processing required'),
(470, 22, 0, '2026-03-31 11:41:03', 0, 0, 0, 'Run mode: GLPI'),
(471, 22, 470, '2026-03-31 11:41:03', 2, 0.0110981, 0, 'Action completed, no processing required'),
(472, 21, 0, '2026-03-31 11:46:44', 0, 0, 0, 'Run mode: GLPI'),
(473, 21, 472, '2026-03-31 11:46:44', 2, 0.0519321, 0, 'Action completed, no processing required'),
(474, 9, 0, '2026-03-31 11:47:26', 0, 0, 0, 'Run mode: GLPI'),
(475, 9, 474, '2026-03-31 11:47:26', 2, 0.0123069, 0, 'Action completed, no processing required'),
(476, 32, 0, '2026-03-31 11:47:35', 0, 0, 0, 'Run mode: GLPI'),
(477, 32, 476, '2026-03-31 11:47:35', 2, 0.00626493, 0, 'Action completed, no processing required'),
(478, 14, 0, '2026-03-31 11:47:59', 0, 0, 0, 'Run mode: GLPI'),
(479, 14, 478, '2026-03-31 11:47:59', 2, 0.00816798, 0, 'Action completed, no processing required'),
(480, 17, 0, '2026-03-31 11:54:05', 0, 0, 0, 'Run mode: GLPI'),
(481, 17, 480, '2026-03-31 11:54:05', 2, 0.00677991, 0, 'Action completed, no processing required'),
(482, 20, 0, '2026-03-31 11:54:21', 0, 0, 0, 'Run mode: GLPI'),
(483, 20, 482, '2026-03-31 11:54:21', 2, 0.00583506, 0, 'Action completed, no processing required'),
(484, 22, 0, '2026-03-31 11:54:41', 0, 0, 0, 'Run mode: GLPI'),
(485, 22, 484, '2026-03-31 11:54:41', 2, 0.0767791, 1, 'Action completed, fully processed'),
(486, 24, 0, '2026-03-31 11:57:50', 0, 0, 0, 'Run mode: GLPI'),
(487, 24, 486, '2026-03-31 11:57:50', 1, 0.00408888, 1, 'Apagou-se 1 ficheiros temporários, dado que demorou 3600 segundos\n'),
(488, 24, 486, '2026-03-31 11:57:50', 2, 0.00442696, 1, 'Action completed, fully processed'),
(489, 13, 0, '2026-03-31 12:00:22', 0, 0, 0, 'Run mode: GLPI'),
(490, 13, 489, '2026-03-31 12:00:22', 2, 0.0038352, 0, 'Action completed, no processing required'),
(491, 21, 0, '2026-03-31 12:05:40', 0, 0, 0, 'Run mode: GLPI'),
(492, 21, 491, '2026-03-31 12:05:40', 2, 0.00866199, 0, 'Action completed, no processing required'),
(493, 32, 0, '2026-03-31 12:08:01', 0, 0, 0, 'Run mode: GLPI'),
(494, 32, 493, '2026-03-31 12:08:01', 2, 0.00506997, 0, 'Action completed, no processing required'),
(495, 22, 0, '2026-03-31 12:10:36', 0, 0, 0, 'Run mode: GLPI'),
(496, 22, 495, '2026-03-31 12:10:36', 2, 0.170311, 2, 'Action completed, fully processed'),
(497, 9, 0, '2026-03-31 12:11:27', 0, 0, 0, 'Run mode: GLPI'),
(498, 9, 497, '2026-03-31 12:11:27', 2, 0.00627208, 0, 'Action completed, no processing required'),
(499, 17, 0, '2026-03-31 12:26:52', 0, 0, 0, 'Run mode: GLPI'),
(500, 17, 499, '2026-03-31 12:26:52', 2, 0.00636101, 0, 'Action completed, no processing required'),
(501, 21, 0, '2026-03-31 12:44:44', 0, 0, 0, 'Run mode: GLPI'),
(502, 21, 501, '2026-03-31 12:44:44', 2, 0.0145729, 0, 'Action completed, no processing required'),
(503, 22, 0, '2026-03-31 12:54:22', 0, 0, 0, 'Run mode: GLPI'),
(504, 22, 503, '2026-03-31 12:54:22', 2, 0.00778103, 0, 'Action completed, no processing required'),
(505, 32, 0, '2026-04-01 02:55:46', 0, 0, 0, 'Run mode: GLPI'),
(506, 32, 505, '2026-04-01 02:55:46', 2, 0.014401, 0, 'Action completed, no processing required'),
(507, 9, 0, '2026-04-01 13:08:42', 0, 0, 0, 'Run mode: GLPI'),
(508, 9, 507, '2026-04-01 13:08:42', 2, 0.013417, 0, 'Action completed, no processing required'),
(509, 17, 0, '2026-04-01 16:30:11', 0, 0, 0, 'Run mode: GLPI'),
(510, 17, 509, '2026-04-01 16:30:11', 2, 0.0273461, 0, 'Action completed, no processing required'),
(511, 14, 0, '2026-04-01 16:58:56', 0, 0, 0, 'Run mode: GLPI'),
(512, 14, 511, '2026-04-01 16:58:56', 2, 0.012306, 0, 'Action completed, no processing required'),
(513, 21, 0, '2026-04-02 04:31:24', 0, 0, 0, 'Run mode: GLPI'),
(514, 21, 513, '2026-04-02 04:31:24', 2, 0.016516, 0, 'Action completed, no processing required'),
(515, 20, 0, '2026-04-02 10:10:33', 0, 0, 0, 'Run mode: GLPI'),
(516, 20, 515, '2026-04-02 10:10:33', 2, 0.027617, 0, 'Action completed, no processing required'),
(517, 22, 0, '2026-04-02 22:14:44', 0, 0, 0, 'Run mode: GLPI'),
(518, 22, 517, '2026-04-02 22:14:44', 2, 0.0202432, 0, 'Action completed, no processing required'),
(519, 24, 0, '2026-04-07 16:24:24', 0, 0, 0, 'Run mode: GLPI'),
(520, 24, 519, '2026-04-07 16:24:24', 1, 0.0128882, 1, 'Clean 1 temporary files created since more than 3600 seconds\n'),
(521, 24, 519, '2026-04-07 16:24:24', 2, 0.013484, 1, 'Action completed, fully processed'),
(522, 13, 0, '2026-04-28 12:39:29', 0, 0, 0, 'Run mode: GLPI'),
(523, 13, 522, '2026-04-28 12:39:29', 2, 0.0143411, 0, 'Action completed, no processing required'),
(524, 15, 0, '2026-04-28 15:37:21', 0, 0, 0, 'Run mode: GLPI'),
(525, 15, 524, '2026-04-28 15:37:21', 2, 0.0081768, 0, 'Action completed, no processing required'),
(526, 16, 0, '2026-04-28 16:14:10', 0, 0, 0, 'Run mode: GLPI'),
(527, 16, 526, '2026-04-28 16:14:10', 2, 0.0109811, 0, 'Action completed, no processing required'),
(528, 32, 0, '2026-04-28 16:19:10', 0, 0, 0, 'Run mode: GLPI'),
(529, 32, 528, '2026-04-28 16:19:10', 2, 0.00583696, 0, 'Action completed, no processing required'),
(530, 6, 0, '2026-04-28 16:19:11', 0, 0, 0, 'Run mode: GLPI'),
(531, 6, 530, '2026-04-28 16:19:11', 2, 0.00907707, 0, 'Action completed, no processing required'),
(532, 12, 0, '2026-04-29 10:59:50', 0, 0, 0, 'Run mode: GLPI'),
(533, 12, 532, '2026-04-29 10:59:50', 1, 0.0459731, 126, 'Clean 126 session files created since more than 1440 seconds\n'),
(534, 12, 532, '2026-04-29 10:59:50', 2, 0.0465701, 126, 'Action completed, fully processed'),
(535, 18, 0, '2026-04-29 11:26:12', 0, 0, 0, 'Run mode: GLPI'),
(536, 18, 535, '2026-04-29 11:26:12', 2, 0.00910187, 0, 'Action completed, no processing required'),
(537, 23, 0, '2026-04-29 12:30:06', 0, 0, 0, 'Run mode: GLPI'),
(538, 23, 537, '2026-04-29 12:30:06', 2, 0.0136092, 0, 'Action completed, no processing required'),
(539, 25, 0, '2026-04-29 12:59:15', 0, 0, 0, 'Run mode: GLPI'),
(540, 25, 539, '2026-04-29 12:59:15', 2, 0.0085268, 0, 'Action completed, no processing required'),
(541, 5, 0, '2026-04-29 13:17:28', 0, 0, 0, 'Run mode: GLPI'),
(542, 5, 541, '2026-04-29 13:17:28', 2, 0.0113249, 0, 'Action completed, no processing required'),
(543, 31, 0, '2026-04-30 22:48:32', 0, 0, 0, 'Run mode: GLPI'),
(544, 31, 543, '2026-04-30 22:48:32', 2, 0.011121, 0, 'Action completed, no processing required'),
(545, 9, 0, '2026-05-02 15:41:20', 0, 0, 0, 'Run mode: GLPI'),
(546, 9, 545, '2026-05-02 15:41:20', 2, 0.0148609, 0, 'Action completed, no processing required'),
(547, 17, 0, '2026-05-03 02:07:14', 0, 0, 0, 'Run mode: GLPI'),
(548, 17, 547, '2026-05-03 02:07:14', 2, 0.0140419, 0, 'Action completed, no processing required'),
(549, 14, 0, '2026-05-03 02:07:14', 0, 0, 0, 'Run mode: GLPI'),
(550, 14, 549, '2026-05-03 02:07:14', 2, 0.00399399, 0, 'Action completed, no processing required'),
(551, 21, 0, '2026-05-04 14:02:38', 0, 0, 0, 'Run mode: GLPI'),
(552, 21, 551, '2026-05-04 14:02:38', 2, 0.014353, 0, 'Action completed, no processing required'),
(553, 20, 0, '2026-05-04 14:03:00', 0, 0, 0, 'Run mode: GLPI'),
(554, 20, 553, '2026-05-04 14:03:00', 2, 0.00730395, 0, 'Action completed, no processing required'),
(555, 22, 0, '2026-05-04 16:14:21', 0, 0, 0, 'Run mode: GLPI'),
(556, 22, 555, '2026-05-04 16:14:21', 2, 0.0165548, 0, 'Action completed, no processing required'),
(557, 24, 0, '2026-05-04 16:19:30', 0, 0, 0, 'Run mode: GLPI'),
(558, 24, 557, '2026-05-04 16:19:30', 2, 0.00384092, 0, 'Action completed, no processing required'),
(559, 13, 0, '2026-05-04 16:20:10', 0, 0, 0, 'Run mode: GLPI'),
(560, 13, 559, '2026-05-04 16:20:10', 2, 0.00470591, 0, 'Action completed, no processing required'),
(561, 32, 0, '2026-05-05 16:22:19', 0, 0, 0, 'Run mode: GLPI'),
(562, 32, 561, '2026-05-05 16:22:19', 2, 0.0122299, 0, 'Action completed, no processing required'),
(563, 15, 0, '2026-05-05 16:42:01', 0, 0, 0, 'Run mode: GLPI'),
(564, 15, 563, '2026-05-05 16:42:01', 2, 0.0123742, 0, 'Action completed, no processing required'),
(565, 16, 0, '2026-05-05 16:48:19', 0, 0, 0, 'Run mode: GLPI'),
(566, 16, 565, '2026-05-05 16:48:19', 2, 0.0038321, 0, 'Action completed, no processing required'),
(567, 6, 0, '2026-05-05 16:56:51', 0, 0, 0, 'Run mode: GLPI'),
(568, 6, 567, '2026-05-05 16:56:51', 2, 0.00560188, 0, 'Action completed, no processing required'),
(569, 12, 0, '2026-05-06 10:40:02', 0, 0, 0, 'Run mode: GLPI'),
(570, 12, 569, '2026-05-06 10:40:02', 1, 0.0667081, 368, 'Clean 368 session files created since more than 1440 seconds\n'),
(571, 12, 569, '2026-05-06 10:40:02', 2, 0.0674081, 368, 'Action completed, fully processed'),
(572, 18, 0, '2026-05-06 10:40:36', 0, 0, 0, 'Run mode: GLPI'),
(573, 18, 572, '2026-05-06 10:40:36', 2, 0.00814795, 0, 'Action completed, no processing required'),
(574, 23, 0, '2026-05-06 11:09:04', 0, 0, 0, 'Run mode: GLPI'),
(575, 23, 574, '2026-05-06 11:09:04', 2, 0.00970197, 6, 'Action completed, fully processed'),
(576, 25, 0, '2026-05-06 11:14:32', 0, 0, 0, 'Run mode: GLPI'),
(577, 25, 576, '2026-05-06 11:14:32', 2, 0.00503588, 0, 'Action completed, no processing required'),
(578, 5, 0, '2026-05-06 12:06:09', 0, 0, 0, 'Run mode: GLPI'),
(579, 5, 578, '2026-05-06 12:06:09', 2, 0.00677896, 0, 'Action completed, no processing required'),
(580, 31, 0, '2026-05-06 12:09:59', 0, 0, 0, 'Run mode: GLPI'),
(581, 31, 580, '2026-05-06 12:09:59', 2, 0.00453186, 0, 'Action completed, no processing required'),
(582, 9, 0, '2026-05-06 12:10:12', 0, 0, 0, 'Run mode: GLPI'),
(583, 9, 582, '2026-05-06 12:10:12', 2, 0.0058651, 0, 'Action completed, no processing required'),
(584, 17, 0, '2026-05-06 12:11:03', 0, 0, 0, 'Run mode: GLPI'),
(585, 17, 584, '2026-05-06 12:11:03', 2, 0.00509596, 0, 'Action completed, no processing required'),
(586, 14, 0, '2026-05-06 12:14:09', 0, 0, 0, 'Run mode: GLPI'),
(587, 14, 586, '2026-05-06 12:14:09', 2, 0.00538802, 0, 'Action completed, no processing required'),
(588, 21, 0, '2026-05-06 12:15:03', 0, 0, 0, 'Run mode: GLPI'),
(589, 21, 588, '2026-05-06 12:15:03', 2, 0.00488186, 0, 'Action completed, no processing required'),
(590, 20, 0, '2026-05-06 13:09:03', 0, 0, 0, 'Run mode: GLPI'),
(591, 20, 590, '2026-05-06 13:09:03', 2, 0.0119851, 0, 'Action completed, no processing required');

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_crontasks`
--

CREATE TABLE `glpi_crontasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(100) NOT NULL,
  `name` varchar(150) NOT NULL COMMENT 'task name',
  `frequency` int(11) NOT NULL COMMENT 'second between launch',
  `param` int(11) DEFAULT NULL COMMENT 'task specify parameter',
  `state` int(11) NOT NULL DEFAULT 1 COMMENT '0:disabled, 1:waiting, 2:running',
  `mode` int(11) NOT NULL DEFAULT 1 COMMENT '1:internal, 2:external',
  `allowmode` int(11) NOT NULL DEFAULT 3 COMMENT '1:internal, 2:external, 3:both',
  `hourmin` int(11) NOT NULL DEFAULT 0,
  `hourmax` int(11) NOT NULL DEFAULT 24,
  `logs_lifetime` int(11) NOT NULL DEFAULT 30 COMMENT 'number of days',
  `lastrun` timestamp NULL DEFAULT NULL COMMENT 'last run date',
  `lastcode` int(11) DEFAULT NULL COMMENT 'last run return code',
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Task run by internal / external cron.' ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_crontasks`
--

INSERT INTO `glpi_crontasks` (`id`, `itemtype`, `name`, `frequency`, `param`, `state`, `mode`, `allowmode`, `hourmin`, `hourmax`, `logs_lifetime`, `lastrun`, `lastcode`, `comment`, `date_mod`, `date_creation`) VALUES
(2, 'CartridgeItem', 'cartridge', 86400, 10, 0, 1, 3, 0, 24, 30, NULL, NULL, NULL, NULL, NULL),
(3, 'ConsumableItem', 'consumable', 86400, 10, 0, 1, 3, 0, 24, 30, NULL, NULL, NULL, NULL, NULL),
(4, 'SoftwareLicense', 'software', 86400, NULL, 0, 1, 3, 0, 24, 30, NULL, NULL, NULL, NULL, NULL),
(5, 'Contract', 'contract', 86400, NULL, 1, 1, 3, 0, 24, 30, '2026-05-06 12:06:00', NULL, NULL, NULL, NULL),
(6, 'Infocom', 'infocom', 86400, NULL, 1, 1, 3, 0, 24, 30, '2026-05-05 16:56:00', NULL, NULL, NULL, NULL),
(7, 'CronTask', 'logs', 86400, 30, 0, 1, 3, 0, 24, 30, NULL, NULL, NULL, NULL, NULL),
(9, 'MailCollector', 'mailgate', 600, 10, 1, 1, 3, 0, 24, 30, '2026-05-06 12:10:00', NULL, NULL, NULL, NULL),
(10, 'DBconnection', 'checkdbreplicate', 300, NULL, 0, 1, 3, 0, 24, 30, NULL, NULL, NULL, NULL, NULL),
(11, 'CronTask', 'checkupdate', 604800, NULL, 0, 1, 3, 0, 24, 30, NULL, NULL, NULL, NULL, NULL),
(12, 'CronTask', 'session', 86400, NULL, 1, 1, 3, 0, 24, 30, '2026-05-06 10:40:00', NULL, NULL, NULL, NULL),
(13, 'CronTask', 'graph', 3600, NULL, 1, 1, 3, 0, 24, 30, '2026-05-04 16:20:00', NULL, NULL, NULL, NULL),
(14, 'ReservationItem', 'reservation', 3600, NULL, 1, 1, 3, 0, 24, 30, '2026-05-06 12:14:00', NULL, NULL, NULL, NULL),
(15, 'Ticket', 'closeticket', 43200, NULL, 1, 1, 3, 0, 24, 30, '2026-05-05 16:42:00', NULL, NULL, NULL, NULL),
(16, 'Ticket', 'alertnotclosed', 43200, NULL, 1, 1, 3, 0, 24, 30, '2026-05-05 16:48:00', NULL, NULL, NULL, NULL),
(17, 'SlaLevel_Ticket', 'slaticket', 300, NULL, 1, 1, 3, 0, 24, 30, '2026-05-06 12:11:00', NULL, NULL, NULL, NULL),
(18, 'Ticket', 'createinquest', 86400, NULL, 1, 1, 3, 0, 24, 30, '2026-05-06 10:40:00', NULL, NULL, NULL, NULL),
(19, 'CronTask', 'watcher', 86400, NULL, 2, 1, 3, 0, 24, 30, '2026-03-20 13:25:00', NULL, NULL, NULL, NULL),
(20, 'CommonITILRecurrentCron', 'RecurrentItems', 3600, NULL, 1, 1, 3, 0, 24, 30, '2026-05-06 13:09:00', NULL, NULL, NULL, NULL),
(21, 'PlanningRecall', 'planningrecall', 300, NULL, 1, 1, 3, 0, 24, 30, '2026-05-06 12:15:00', NULL, NULL, NULL, NULL),
(22, 'QueuedNotification', 'queuednotification', 60, 50, 1, 1, 3, 0, 24, 30, '2026-05-04 16:14:00', NULL, NULL, NULL, NULL),
(23, 'QueuedNotification', 'queuednotificationclean', 86400, 30, 1, 1, 3, 0, 24, 30, '2026-05-06 11:09:00', NULL, NULL, NULL, NULL),
(24, 'CronTask', 'temp', 3600, NULL, 1, 1, 3, 0, 24, 30, '2026-05-04 16:19:00', NULL, NULL, NULL, NULL),
(25, 'MailCollector', 'mailgateerror', 86400, NULL, 1, 1, 3, 0, 24, 30, '2026-05-06 11:14:00', NULL, NULL, NULL, NULL),
(26, 'CronTask', 'circularlogs', 86400, 4, 0, 1, 3, 0, 24, 30, NULL, NULL, NULL, NULL, NULL),
(27, 'ObjectLock', 'unlockobject', 86400, 4, 0, 1, 3, 0, 24, 30, NULL, NULL, NULL, NULL, NULL),
(28, 'SavedSearch', 'countAll', 604800, NULL, 0, 1, 3, 0, 24, 30, NULL, NULL, NULL, NULL, NULL),
(29, 'SavedSearch_Alert', 'savedsearchesalerts', 86400, NULL, 0, 1, 3, 0, 24, 30, NULL, NULL, NULL, NULL, NULL),
(30, 'Telemetry', 'telemetry', 2592000, NULL, 0, 1, 3, 0, 24, 30, NULL, NULL, NULL, NULL, NULL),
(31, 'Certificate', 'certificate', 86400, NULL, 1, 1, 3, 0, 24, 30, '2026-05-06 12:09:00', NULL, NULL, NULL, NULL),
(32, 'OlaLevel_Ticket', 'olaticket', 300, NULL, 1, 1, 3, 0, 24, 30, '2026-05-05 16:22:00', NULL, NULL, NULL, NULL),
(33, 'PurgeLogs', 'PurgeLogs', 604800, 24, 1, 2, 3, 0, 24, 30, NULL, NULL, NULL, NULL, NULL),
(34, 'Ticket', 'purgeticket', 604800, NULL, 0, 2, 3, 0, 24, 30, NULL, NULL, NULL, NULL, NULL),
(35, 'Document', 'cleanorphans', 604800, NULL, 0, 2, 3, 0, 24, 30, NULL, NULL, NULL, NULL, NULL),
(36, 'User', 'passwordexpiration', 86400, 100, 0, 2, 3, 0, 24, 30, NULL, NULL, NULL, NULL, NULL),
(37, 'Glpi\\Marketplace\\Controller', 'checkAllUpdates', 86400, NULL, 1, 2, 3, 0, 24, 30, NULL, NULL, NULL, NULL, NULL),
(38, 'CleanSoftwareCron', 'cleansoftware', 2592000, 1000, 0, 2, 3, 0, 24, 300, NULL, NULL, NULL, NULL, NULL),
(39, 'Domain', 'DomainsAlert', 86400, NULL, 1, 2, 3, 0, 24, 30, NULL, NULL, NULL, NULL, NULL),
(40, 'Glpi\\Inventory\\Inventory', 'cleantemp', 86400, NULL, 0, 2, 3, 0, 24, 30, NULL, NULL, NULL, NULL, NULL),
(41, 'Glpi\\Inventory\\Inventory', 'cleanorphans', 604800, NULL, 1, 2, 3, 0, 24, 30, NULL, NULL, NULL, NULL, NULL),
(42, 'PendingReasonCron', 'pendingreason_autobump_autosolve', 1800, NULL, 1, 2, 3, 0, 24, 60, NULL, NULL, NULL, NULL, NULL),
(43, 'Agent', 'Cleanoldagents', 86400, NULL, 1, 2, 3, 0, 24, 30, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_dashboards_dashboards`
--

CREATE TABLE `glpi_dashboards_dashboards` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `context` varchar(100) NOT NULL DEFAULT 'core',
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_dashboards_dashboards`
--

INSERT INTO `glpi_dashboards_dashboards` (`id`, `key`, `name`, `context`, `users_id`) VALUES
(1, 'central', 'Central', 'core', 0),
(2, 'assets', 'Recursos', 'core', 0),
(3, 'assistance', 'Assistência', 'core', 0),
(4, 'mini_tickets', 'Mini painel de tickets', 'mini_core', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_dashboards_filters`
--

CREATE TABLE `glpi_dashboards_filters` (
  `id` int(10) UNSIGNED NOT NULL,
  `dashboards_dashboards_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `filter` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_dashboards_items`
--

CREATE TABLE `glpi_dashboards_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `dashboards_dashboards_id` int(10) UNSIGNED NOT NULL,
  `gridstack_id` varchar(255) NOT NULL,
  `card_id` varchar(255) NOT NULL,
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `card_options` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_dashboards_items`
--

INSERT INTO `glpi_dashboards_items` (`id`, `dashboards_dashboards_id`, `gridstack_id`, `card_id`, `x`, `y`, `width`, `height`, `card_options`) VALUES
(1, 1, 'bn_count_Computer_4a315743-151c-40cb-a20b-762250668dac', 'bn_count_Computer', 3, 0, 3, 2, '{\"color\":\"#e69393\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(2, 1, 'bn_count_Software_0690f524-e826-47a9-b50a-906451196b83', 'bn_count_Software', 0, 0, 3, 2, '{\"color\":\"#aaddac\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(3, 1, 'bn_count_Rack_c6502e0a-5991-46b4-a771-7f355137306b', 'bn_count_Rack', 6, 2, 3, 2, '{\"color\":\"#0e87a0\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(4, 1, 'bn_count_SoftwareLicense_e755fd06-283e-4479-ba35-2d548f8f8a90', 'bn_count_SoftwareLicense', 0, 2, 3, 2, '{\"color\":\"#27ab3c\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(5, 1, 'bn_count_Monitor_7059b94c-583c-4ba7-b100-d40461165318', 'bn_count_Monitor', 3, 2, 3, 2, '{\"color\":\"#b52d30\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(6, 1, 'bn_count_Ticket_a74c0903-3387-4a07-9111-b0938af8f1e7', 'bn_count_Ticket', 14, 7, 3, 2, '{\"color\":\"#ffdc64\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(7, 1, 'bn_count_Problem_c1cf5cfb-f626-472e-82a1-49c3e200e746', 'bn_count_Problem', 20, 7, 3, 2, '{\"color\":\"#f08d7b\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(8, 1, 'count_Computer_Manufacturer_6129c451-42b5-489d-b693-c362adf32d49', 'count_Computer_Manufacturer', 0, 4, 5, 4, '{\"color\":\"#f8faf9\",\"widgettype\":\"donut\",\"use_gradient\":\"1\",\"limit\":\"5\"}'),
(9, 1, 'top_ticket_user_requester_c74f52a8-046a-4077-b1a6-c9f840d34b82', 'top_ticket_user_requester', 14, 9, 6, 5, '{\"color\":\"#f9fafb\",\"widgettype\":\"hbar\",\"use_gradient\":\"1\",\"limit\":\"5\"}'),
(10, 1, 'bn_count_tickets_late_04c47208-d7e5-4aca-9566-d46e68c45c67', 'bn_count_tickets_late', 17, 7, 3, 2, '{\"color\":\"#f8911f\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(11, 1, 'ticket_status_2e4e968b-d4e6-4e33-9ce9-a1aaff53dfde', 'ticket_status', 14, 0, 12, 7, '{\"color\":\"#fafafa\",\"widgettype\":\"stackedbars\",\"use_gradient\":\"0\",\"limit\":\"12\"}'),
(12, 1, 'top_ticket_ITILCategory_37736ba9-d429-4cb3-9058-ef4d111d9269', 'top_ticket_ITILCategory', 20, 9, 6, 5, '{\"color\":\"#fbf9f9\",\"widgettype\":\"hbar\",\"use_gradient\":\"1\",\"limit\":\"5\"}'),
(13, 1, 'bn_count_Printer_517684b0-b064-49dd-943e-fcb6f915e453', 'bn_count_Printer', 9, 2, 3, 2, '{\"color\":\"#365a8f\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(14, 1, 'bn_count_Phone_f70c489f-02c1-46e5-978b-94a95b5038ee', 'bn_count_Phone', 9, 0, 3, 2, '{\"color\":\"#d5e1ec\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(15, 1, 'bn_count_Change_ab950dbd-cd25-466d-8dff-7dcaca386564', 'bn_count_Change', 23, 7, 3, 2, '{\"color\":\"#cae3c4\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(16, 1, 'bn_count_Group_b84a93f2-a26c-49d7-82a4-5446697cc5b0', 'bn_count_Group', 4, 8, 4, 2, '{\"color\":\"#e0e0e0\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(17, 1, 'bn_count_Profile_770b35e8-68e9-4b4f-9e09-5a11058f069f', 'bn_count_Profile', 4, 10, 4, 2, '{\"color\":\"#e0e0e0\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(18, 1, 'bn_count_Supplier_36ff9011-e4cf-4d89-b9ab-346b9857d734', 'bn_count_Supplier', 8, 8, 3, 2, '{\"color\":\"#c9c9c9\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(19, 1, 'bn_count_KnowbaseItem_a3785a56-bed4-4a30-8387-f251f5365b3b', 'bn_count_KnowbaseItem', 8, 10, 3, 2, '{\"color\":\"#c9c9c9\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(20, 1, 'bn_count_Entity_9b82951a-ba52-45cc-a2d3-1d238ec37adf', 'bn_count_Entity', 0, 10, 4, 2, '{\"color\":\"#f9f9f9\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(21, 1, 'bn_count_Document_7dc7f4b8-61ff-4147-b994-5541bddd7b66', 'bn_count_Document', 11, 8, 3, 2, '{\"color\":\"#b4b4b4\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(22, 1, 'bn_count_Project_4d412ee2-8b79-469b-995f-4c0a05ab849d', 'bn_count_Project', 11, 10, 3, 2, '{\"color\":\"#b3b3b3\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(23, 1, 'bn_count_NetworkEquipment_c537e334-d584-43bc-b6de-b4a939143e89', 'bn_count_NetworkEquipment', 6, 0, 3, 2, '{\"color\":\"#bfe7ea\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(24, 1, 'bn_count_User_ac0cbe52-3593-43c1-8ecc-0eb115de494d', 'bn_count_User', 0, 8, 4, 2, '{\"color\":\"#fafafa\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(25, 1, 'count_Monitor_MonitorModel_5a476ff9-116e-4270-858b-c003c20841a9', 'count_Monitor_MonitorModel', 5, 4, 5, 4, '{\"color\":\"#f5fafa\",\"widgettype\":\"donut\",\"use_gradient\":\"1\",\"limit\":\"5\"}'),
(26, 1, 'count_NetworkEquipment_State_81f2ae35-b366-4065-ac26-02ea4e3704a6', 'count_NetworkEquipment_State', 10, 4, 4, 4, '{\"color\":\"#f5f3ef\",\"widgettype\":\"donut\",\"use_gradient\":\"1\",\"limit\":\"5\"}'),
(27, 2, 'bn_count_Computer_34cfbaf9-a471-4852-b48c-0dadea7644de', 'bn_count_Computer', 0, 0, 4, 3, '{\"color\":\"#f3d0d0\",\"widgettype\":\"bigNumber\"}'),
(28, 2, 'bn_count_Software_60091467-2137-49f4-8834-f6602a482079', 'bn_count_Software', 4, 0, 4, 3, '{\"color\":\"#d1f1a8\",\"widgettype\":\"bigNumber\"}'),
(29, 2, 'bn_count_Printer_c9a385d4-76a3-4971-ad0e-1470efeafacc', 'bn_count_Printer', 8, 3, 4, 3, '{\"color\":\"#5da8d6\",\"widgettype\":\"bigNumber\"}'),
(30, 2, 'bn_count_PDU_60053eb6-8dda-4416-9a4b-afd51889bd09', 'bn_count_PDU', 12, 3, 4, 3, '{\"color\":\"#ffb62f\",\"widgettype\":\"bigNumber\"}'),
(31, 2, 'bn_count_Rack_0fdc196f-20d2-4f63-9ddb-b75c165cc664', 'bn_count_Rack', 12, 0, 4, 3, '{\"color\":\"#f7d79a\",\"widgettype\":\"bigNumber\"}'),
(32, 2, 'bn_count_Phone_c31fde2d-510a-4482-b17d-2f65b61eae08', 'bn_count_Phone', 16, 3, 4, 3, '{\"color\":\"#a0cec2\",\"widgettype\":\"bigNumber\"}'),
(33, 2, 'bn_count_Enclosure_c21ce30a-58c3-456a-81ec-3c5f01527a8f', 'bn_count_Enclosure', 16, 0, 4, 3, '{\"color\":\"#d7e8e4\",\"widgettype\":\"bigNumber\"}'),
(34, 2, 'bn_count_NetworkEquipment_76f1e239-777b-4552-b053-ae5c64190347', 'bn_count_NetworkEquipment', 8, 0, 4, 3, '{\"color\":\"#c8dae4\",\"widgettype\":\"bigNumber\"}'),
(35, 2, 'bn_count_SoftwareLicense_576e58fe-a386-480f-b405-1c2315b8ab47', 'bn_count_SoftwareLicense', 4, 3, 4, 3, '{\"color\":\"#9bc06b\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(36, 2, 'bn_count_Monitor_890e16d3-b121-48c6-9713-d9c239d9a970', 'bn_count_Monitor', 0, 3, 4, 3, '{\"color\":\"#dc6f6f\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(37, 2, 'count_Computer_Manufacturer_986e92e8-32e8-4a6f-806f-6f5383acbb3f', 'count_Computer_Manufacturer', 4, 6, 4, 4, '{\"color\":\"#f3f5f1\",\"widgettype\":\"hbar\",\"use_gradient\":\"1\",\"limit\":\"5\"}'),
(38, 2, 'count_Computer_State_290c5920-9eab-4db8-8753-46108e60f1d8', 'count_Computer_State', 0, 6, 4, 4, '{\"color\":\"#fbf7f7\",\"widgettype\":\"donut\",\"use_gradient\":\"1\",\"limit\":\"5\"}'),
(39, 2, 'count_Computer_ComputerType_c58f9c7e-22d5-478b-8226-d2a752bcbb09', 'count_Computer_ComputerType', 8, 6, 4, 4, '{\"color\":\"#f5f9fa\",\"widgettype\":\"donut\",\"use_gradient\":\"1\",\"limit\":\"5\"}'),
(40, 2, 'count_NetworkEquipment_Manufacturer_8132b21c-6f7f-4dc1-af54-bea794cb96e9', 'count_NetworkEquipment_Manufacturer', 12, 6, 4, 4, '{\"color\":\"#fcf8ed\",\"widgettype\":\"hbar\",\"use_gradient\":\"0\",\"limit\":\"5\"}'),
(41, 2, 'count_Monitor_Manufacturer_43b0c16b-af82-418e-aac1-f32b39705c0d', 'count_Monitor_Manufacturer', 16, 6, 4, 4, '{\"color\":\"#f9fbfb\",\"widgettype\":\"donut\",\"use_gradient\":\"1\",\"limit\":\"5\"}'),
(42, 3, 'bn_count_Ticket_344e761b-f7e8-4617-8c90-154b266b4d67', 'bn_count_Ticket', 0, 0, 3, 2, '{\"color\":\"#ffdc64\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(43, 3, 'bn_count_Problem_bdb4002b-a674-4493-820f-af85bed44d2a', 'bn_count_Problem', 0, 4, 3, 2, '{\"color\":\"#f0967b\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(44, 3, 'bn_count_Change_b9b87513-4f40-41e6-8621-f51f9a30fb19', 'bn_count_Change', 0, 6, 3, 2, '{\"color\":\"#cae3c4\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(45, 3, 'bn_count_tickets_late_1e9ae481-21b4-4463-a830-dec1b68ec5e7', 'bn_count_tickets_late', 0, 2, 3, 2, '{\"color\":\"#f8911f\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(46, 3, 'bn_count_tickets_incoming_336a36d9-67fe-4475-880e-447bd766b8fe', 'bn_count_tickets_incoming', 3, 6, 3, 2, '{\"color\":\"#a0e19d\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(47, 3, 'bn_count_tickets_closed_e004bab5-f2b6-4060-a401-a2a8b9885245', 'bn_count_tickets_closed', 9, 8, 3, 2, '{\"color\":\"#515151\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(48, 3, 'bn_count_tickets_assigned_7455c855-6df8-4514-a3d9-8b0fce52bd63', 'bn_count_tickets_assigned', 6, 6, 3, 2, '{\"color\":\"#eaf5f7\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(49, 3, 'bn_count_tickets_solved_5e9759b3-ee7e-4a14-b68f-1ac024ef55ee', 'bn_count_tickets_solved', 9, 6, 3, 2, '{\"color\":\"#d8d8d8\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(50, 3, 'bn_count_tickets_waiting_102b2c2a-6ac6-4d73-ba47-8b09382fe00e', 'bn_count_tickets_waiting', 3, 8, 3, 2, '{\"color\":\"#ffcb7d\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(51, 3, 'bn_count_TicketRecurrent_13f79539-61f6-45f7-8dde-045706e652f2', 'bn_count_TicketRecurrent', 0, 8, 3, 2, '{\"color\":\"#fafafa\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(52, 3, 'bn_count_tickets_planned_267bf627-9d5e-4b6c-b53d-b8623d793ccf', 'bn_count_tickets_planned', 6, 8, 3, 2, '{\"color\":\"#6298d5\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(53, 3, 'top_ticket_ITILCategory_0cba0c84-6c62-4cd8-8564-18614498d8e4', 'top_ticket_ITILCategory', 12, 6, 4, 4, '{\"color\":\"#f1f5ef\",\"widgettype\":\"donut\",\"use_gradient\":\"1\",\"limit\":\"7\"}'),
(54, 3, 'top_ticket_RequestType_b9e43f34-8e94-4a6e-9023-c5d1e2ce7859', 'top_ticket_RequestType', 16, 6, 4, 4, '{\"color\":\"#f9fafb\",\"widgettype\":\"hbar\",\"use_gradient\":\"1\",\"limit\":\"4\"}'),
(55, 3, 'top_ticket_Entity_a8e65812-519c-488e-9892-9adbe22fbd5c', 'top_ticket_Entity', 20, 6, 4, 4, '{\"color\":\"#f7f1f0\",\"widgettype\":\"donut\",\"use_gradient\":\"1\",\"limit\":\"7\"}'),
(56, 3, 'ticket_evolution_76fd4926-ee5e-48db-b6d6-e2947c190c5e', 'ticket_evolution', 3, 0, 12, 6, '{\"color\":\"#f3f7f8\",\"widgettype\":\"areas\",\"use_gradient\":\"0\",\"limit\":\"12\"}'),
(57, 3, 'ticket_status_5b256a35-b36b-4db5-ba11-ea7c125f126e', 'ticket_status', 15, 0, 11, 6, '{\"color\":\"#f7f3f2\",\"widgettype\":\"stackedbars\",\"use_gradient\":\"0\",\"limit\":\"12\"}'),
(58, 4, 'bn_count_tickets_closed_ccf7246b-645a-40d2-8206-fa33c769e3f5', 'bn_count_tickets_closed', 24, 0, 4, 2, '{\"color\":\"#fafafa\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(59, 4, 'bn_count_Ticket_d5bf3576-5033-40fb-bbdb-292294a7698e', 'bn_count_Ticket', 0, 0, 4, 2, '{\"color\":\"#ffd957\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(60, 4, 'bn_count_tickets_incoming_055e813c-b0ce-4687-91ef-559249e8ddd8', 'bn_count_tickets_incoming', 4, 0, 4, 2, '{\"color\":\"#6fd169\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(61, 4, 'bn_count_tickets_waiting_793c665b-b620-4b3a-a5a8-cf502defc008', 'bn_count_tickets_waiting', 8, 0, 4, 2, '{\"color\":\"#ffcb7d\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(62, 4, 'bn_count_tickets_assigned_d3d2f697-52b4-435e-9030-a760dd649085', 'bn_count_tickets_assigned', 12, 0, 4, 2, '{\"color\":\"#eaf4f7\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(63, 4, 'bn_count_tickets_planned_0c7f3569-c23b-4ee3-8e85-279229b23e70', 'bn_count_tickets_planned', 16, 0, 4, 2, '{\"color\":\"#6298d5\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(64, 4, 'bn_count_tickets_solved_ae2406cf-e8e8-410b-b355-46e3f5705ee8', 'bn_count_tickets_solved', 20, 0, 4, 2, '{\"color\":\"#d7d7d7\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}');

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_dashboards_rights`
--

CREATE TABLE `glpi_dashboards_rights` (
  `id` int(10) UNSIGNED NOT NULL,
  `dashboards_dashboards_id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(100) NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_databaseinstancecategories`
--

CREATE TABLE `glpi_databaseinstancecategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_databaseinstances`
--

CREATE TABLE `glpi_databaseinstances` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(255) NOT NULL DEFAULT '',
  `port` varchar(10) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL DEFAULT '',
  `size` int(11) NOT NULL DEFAULT 0,
  `databaseinstancetypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `databaseinstancecategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL DEFAULT '',
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_onbackup` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_helpdesk_visible` tinyint(4) NOT NULL DEFAULT 1,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `autoupdatesystems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_lastboot` timestamp NULL DEFAULT NULL,
  `date_lastbackup` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_databaseinstancetypes`
--

CREATE TABLE `glpi_databaseinstancetypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_databases`
--

CREATE TABLE `glpi_databases` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `size` int(11) NOT NULL DEFAULT 0,
  `databaseinstances_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_onbackup` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_update` timestamp NULL DEFAULT NULL,
  `date_lastbackup` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_datacenters`
--

CREATE TABLE `glpi_datacenters` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `pictures` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_dcrooms`
--

CREATE TABLE `glpi_dcrooms` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `vis_cols` int(11) DEFAULT NULL,
  `vis_rows` int(11) DEFAULT NULL,
  `blueprint` text DEFAULT NULL,
  `datacenters_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicebatteries`
--

CREATE TABLE `glpi_devicebatteries` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `voltage` int(11) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `devicebatterytypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicebatterymodels_id` int(10) UNSIGNED DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicebatterymodels`
--

CREATE TABLE `glpi_devicebatterymodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicebatterytypes`
--

CREATE TABLE `glpi_devicebatterytypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicecameramodels`
--

CREATE TABLE `glpi_devicecameramodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicecameras`
--

CREATE TABLE `glpi_devicecameras` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `flashunit` tinyint(4) NOT NULL DEFAULT 0,
  `lensfacing` varchar(255) DEFAULT NULL,
  `orientation` varchar(255) DEFAULT NULL,
  `focallength` varchar(255) DEFAULT NULL,
  `sensorsize` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicecameramodels_id` int(10) UNSIGNED DEFAULT NULL,
  `support` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicecasemodels`
--

CREATE TABLE `glpi_devicecasemodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicecases`
--

CREATE TABLE `glpi_devicecases` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `devicecasetypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicecasemodels_id` int(10) UNSIGNED DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicecasetypes`
--

CREATE TABLE `glpi_devicecasetypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicecontrolmodels`
--

CREATE TABLE `glpi_devicecontrolmodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicecontrols`
--

CREATE TABLE `glpi_devicecontrols` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `is_raid` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `interfacetypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicecontrolmodels_id` int(10) UNSIGNED DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicedrivemodels`
--

CREATE TABLE `glpi_devicedrivemodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicedrives`
--

CREATE TABLE `glpi_devicedrives` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `is_writer` tinyint(4) NOT NULL DEFAULT 1,
  `speed` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `interfacetypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicedrivemodels_id` int(10) UNSIGNED DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicefirmwaremodels`
--

CREATE TABLE `glpi_devicefirmwaremodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicefirmwares`
--

CREATE TABLE `glpi_devicefirmwares` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date` date DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `devicefirmwaretypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicefirmwaremodels_id` int(10) UNSIGNED DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicefirmwaretypes`
--

CREATE TABLE `glpi_devicefirmwaretypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_devicefirmwaretypes`
--

INSERT INTO `glpi_devicefirmwaretypes` (`id`, `name`, `comment`, `date_mod`, `date_creation`) VALUES
(1, 'BIOS', NULL, NULL, NULL),
(2, 'UEFI', NULL, NULL, NULL),
(3, 'Firmware', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicegenericmodels`
--

CREATE TABLE `glpi_devicegenericmodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicegenerics`
--

CREATE TABLE `glpi_devicegenerics` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `devicegenerictypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `devicegenericmodels_id` int(10) UNSIGNED DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicegenerictypes`
--

CREATE TABLE `glpi_devicegenerictypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicegraphiccardmodels`
--

CREATE TABLE `glpi_devicegraphiccardmodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicegraphiccards`
--

CREATE TABLE `glpi_devicegraphiccards` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `interfacetypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `memory_default` int(11) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicegraphiccardmodels_id` int(10) UNSIGNED DEFAULT NULL,
  `chipset` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_deviceharddrivemodels`
--

CREATE TABLE `glpi_deviceharddrivemodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_deviceharddrives`
--

CREATE TABLE `glpi_deviceharddrives` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `rpm` varchar(255) DEFAULT NULL,
  `interfacetypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cache` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `capacity_default` int(11) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `deviceharddrivemodels_id` int(10) UNSIGNED DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicememories`
--

CREATE TABLE `glpi_devicememories` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `frequence` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `size_default` int(11) NOT NULL DEFAULT 0,
  `devicememorytypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicememorymodels_id` int(10) UNSIGNED DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicememorymodels`
--

CREATE TABLE `glpi_devicememorymodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicememorytypes`
--

CREATE TABLE `glpi_devicememorytypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_devicememorytypes`
--

INSERT INTO `glpi_devicememorytypes` (`id`, `name`, `comment`, `date_mod`, `date_creation`) VALUES
(1, 'EDO', NULL, NULL, NULL),
(2, 'DDR', NULL, NULL, NULL),
(3, 'SDRAM', NULL, NULL, NULL),
(4, 'SDRAM-2', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicemotherboardmodels`
--

CREATE TABLE `glpi_devicemotherboardmodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicemotherboards`
--

CREATE TABLE `glpi_devicemotherboards` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `chipset` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicemotherboardmodels_id` int(10) UNSIGNED DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicenetworkcardmodels`
--

CREATE TABLE `glpi_devicenetworkcardmodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicenetworkcards`
--

CREATE TABLE `glpi_devicenetworkcards` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `bandwidth` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mac_default` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicenetworkcardmodels_id` int(10) UNSIGNED DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicepcimodels`
--

CREATE TABLE `glpi_devicepcimodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicepcis`
--

CREATE TABLE `glpi_devicepcis` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `devicenetworkcardmodels_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicepcimodels_id` int(10) UNSIGNED DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicepowersupplies`
--

CREATE TABLE `glpi_devicepowersupplies` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `power` varchar(255) DEFAULT NULL,
  `is_atx` tinyint(4) NOT NULL DEFAULT 1,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicepowersupplymodels_id` int(10) UNSIGNED DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicepowersupplymodels`
--

CREATE TABLE `glpi_devicepowersupplymodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_deviceprocessormodels`
--

CREATE TABLE `glpi_deviceprocessormodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_deviceprocessors`
--

CREATE TABLE `glpi_deviceprocessors` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `frequence` int(11) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `frequency_default` int(11) NOT NULL DEFAULT 0,
  `nbcores_default` int(11) DEFAULT NULL,
  `nbthreads_default` int(11) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `deviceprocessormodels_id` int(10) UNSIGNED DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicesensormodels`
--

CREATE TABLE `glpi_devicesensormodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicesensors`
--

CREATE TABLE `glpi_devicesensors` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `devicesensortypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `devicesensormodels_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicesensortypes`
--

CREATE TABLE `glpi_devicesensortypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicesimcards`
--

CREATE TABLE `glpi_devicesimcards` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `voltage` int(11) DEFAULT NULL,
  `devicesimcardtypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `allow_voip` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicesimcardtypes`
--

CREATE TABLE `glpi_devicesimcardtypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_devicesimcardtypes`
--

INSERT INTO `glpi_devicesimcardtypes` (`id`, `name`, `comment`, `date_mod`, `date_creation`) VALUES
(1, 'Full SIM', NULL, NULL, NULL),
(2, 'Mini SIM', NULL, NULL, NULL),
(3, 'Micro SIM', NULL, NULL, NULL),
(4, 'Nano SIM', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicesoundcardmodels`
--

CREATE TABLE `glpi_devicesoundcardmodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_devicesoundcards`
--

CREATE TABLE `glpi_devicesoundcards` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicesoundcardmodels_id` int(10) UNSIGNED DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_displaypreferences`
--

CREATE TABLE `glpi_displaypreferences` (
  `id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(100) NOT NULL,
  `num` int(11) NOT NULL DEFAULT 0,
  `rank` int(11) NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_displaypreferences`
--

INSERT INTO `glpi_displaypreferences` (`id`, `itemtype`, `num`, `rank`, `users_id`) VALUES
(1, 'Computer', 4, 4, 0),
(2, 'Computer', 45, 6, 0),
(3, 'Computer', 40, 5, 0),
(4, 'Computer', 5, 3, 0),
(5, 'Computer', 23, 2, 0),
(6, 'DocumentType', 3, 1, 0),
(7, 'Monitor', 31, 1, 0),
(8, 'Monitor', 23, 2, 0),
(9, 'Monitor', 3, 3, 0),
(10, 'Monitor', 4, 4, 0),
(11, 'Printer', 31, 1, 0),
(12, 'NetworkEquipment', 31, 1, 0),
(13, 'NetworkEquipment', 23, 2, 0),
(14, 'Printer', 23, 2, 0),
(15, 'Printer', 3, 3, 0),
(16, 'Software', 4, 3, 0),
(17, 'Software', 5, 2, 0),
(18, 'Software', 23, 1, 0),
(19, 'CartridgeItem', 4, 2, 0),
(20, 'CartridgeItem', 34, 1, 0),
(21, 'Peripheral', 3, 3, 0),
(22, 'Peripheral', 23, 2, 0),
(23, 'Peripheral', 31, 1, 0),
(24, 'Computer', 31, 1, 0),
(25, 'Computer', 3, 7, 0),
(26, 'Computer', 19, 8, 0),
(27, 'Computer', 17, 9, 0),
(28, 'NetworkEquipment', 3, 3, 0),
(29, 'NetworkEquipment', 4, 4, 0),
(30, 'NetworkEquipment', 11, 6, 0),
(31, 'NetworkEquipment', 19, 7, 0),
(32, 'Printer', 4, 4, 0),
(33, 'Printer', 19, 6, 0),
(34, 'Monitor', 19, 6, 0),
(35, 'Monitor', 7, 7, 0),
(36, 'Peripheral', 4, 4, 0),
(37, 'Peripheral', 19, 6, 0),
(38, 'Peripheral', 7, 7, 0),
(39, 'Contact', 3, 1, 0),
(40, 'Contact', 4, 2, 0),
(41, 'Contact', 5, 3, 0),
(42, 'Contact', 6, 4, 0),
(43, 'Contact', 9, 5, 0),
(44, 'Supplier', 9, 1, 0),
(45, 'Supplier', 3, 2, 0),
(46, 'Supplier', 4, 3, 0),
(47, 'Supplier', 5, 4, 0),
(48, 'Supplier', 10, 5, 0),
(49, 'Supplier', 6, 6, 0),
(50, 'Contract', 4, 1, 0),
(51, 'Contract', 3, 2, 0),
(52, 'Contract', 5, 3, 0),
(53, 'Contract', 6, 4, 0),
(54, 'Contract', 7, 5, 0),
(55, 'Contract', 11, 6, 0),
(56, 'CartridgeItem', 23, 3, 0),
(57, 'CartridgeItem', 3, 4, 0),
(58, 'DocumentType', 6, 2, 0),
(59, 'DocumentType', 4, 3, 0),
(60, 'DocumentType', 5, 4, 0),
(61, 'Document', 3, 1, 0),
(62, 'Document', 4, 2, 0),
(63, 'Document', 7, 3, 0),
(64, 'Document', 5, 4, 0),
(65, 'Document', 16, 5, 0),
(66, 'User', 34, 1, 0),
(67, 'User', 5, 3, 0),
(68, 'User', 6, 4, 0),
(69, 'User', 3, 5, 0),
(70, 'ConsumableItem', 34, 1, 0),
(71, 'ConsumableItem', 4, 2, 0),
(72, 'ConsumableItem', 23, 3, 0),
(73, 'ConsumableItem', 3, 4, 0),
(74, 'NetworkEquipment', 40, 5, 0),
(75, 'Printer', 40, 5, 0),
(76, 'Monitor', 40, 5, 0),
(77, 'Peripheral', 40, 5, 0),
(78, 'User', 8, 6, 0),
(79, 'Phone', 31, 1, 0),
(80, 'Phone', 23, 2, 0),
(81, 'Phone', 3, 3, 0),
(82, 'Phone', 4, 4, 0),
(83, 'Phone', 40, 5, 0),
(84, 'Phone', 19, 6, 0),
(85, 'Phone', 7, 7, 0),
(86, 'Group', 16, 1, 0),
(87, 'AllAssets', 31, 1, 0),
(88, 'ReservationItem', 4, 1, 0),
(89, 'ReservationItem', 3, 2, 0),
(90, 'Budget', 3, 2, 0),
(91, 'Software', 72, 4, 0),
(92, 'Software', 163, 5, 0),
(93, 'Budget', 5, 1, 0),
(94, 'Budget', 4, 3, 0),
(95, 'Budget', 19, 4, 0),
(96, 'CronTask', 8, 1, 0),
(97, 'CronTask', 3, 2, 0),
(98, 'CronTask', 4, 3, 0),
(99, 'CronTask', 7, 4, 0),
(100, 'RequestType', 14, 1, 0),
(101, 'RequestType', 15, 2, 0),
(102, 'NotificationTemplate', 4, 1, 0),
(103, 'NotificationTemplate', 16, 2, 0),
(104, 'Notification', 5, 1, 0),
(105, 'Notification', 6, 2, 0),
(106, 'Notification', 2, 3, 0),
(107, 'Notification', 4, 4, 0),
(108, 'Notification', 80, 5, 0),
(109, 'Notification', 86, 6, 0),
(110, 'MailCollector', 2, 1, 0),
(111, 'MailCollector', 19, 2, 0),
(112, 'AuthLDAP', 3, 1, 0),
(113, 'AuthLDAP', 19, 2, 0),
(114, 'AuthMail', 3, 1, 0),
(115, 'AuthMail', 19, 2, 0),
(116, 'IPNetwork', 18, 1, 0),
(117, 'WifiNetwork', 10, 1, 0),
(118, 'Profile', 2, 1, 0),
(119, 'Profile', 3, 2, 0),
(120, 'Profile', 19, 3, 0),
(121, 'Transfer', 19, 1, 0),
(122, 'TicketValidation', 3, 1, 0),
(123, 'TicketValidation', 2, 2, 0),
(124, 'TicketValidation', 8, 3, 0),
(125, 'TicketValidation', 4, 4, 0),
(126, 'TicketValidation', 9, 5, 0),
(127, 'TicketValidation', 7, 6, 0),
(128, 'NotImportedEmail', 2, 1, 0),
(129, 'NotImportedEmail', 5, 2, 0),
(130, 'NotImportedEmail', 4, 3, 0),
(131, 'NotImportedEmail', 6, 4, 0),
(132, 'NotImportedEmail', 16, 5, 0),
(133, 'NotImportedEmail', 19, 6, 0),
(134, 'RuleRightParameter', 11, 1, 0),
(135, 'Ticket', 12, 1, 0),
(136, 'Ticket', 19, 2, 0),
(137, 'Ticket', 15, 3, 0),
(138, 'Ticket', 3, 4, 0),
(139, 'Ticket', 4, 5, 0),
(140, 'Ticket', 5, 6, 0),
(141, 'Ticket', 7, 7, 0),
(142, 'Calendar', 19, 1, 0),
(143, 'Holiday', 11, 1, 0),
(144, 'Holiday', 12, 2, 0),
(145, 'Holiday', 13, 3, 0),
(146, 'SLA', 4, 1, 0),
(147, 'Ticket', 18, 8, 0),
(148, 'AuthLDAP', 30, 3, 0),
(149, 'AuthMail', 6, 3, 0),
(150, 'FQDN', 11, 1, 0),
(151, 'FieldUnicity', 1, 1, 0),
(152, 'FieldUnicity', 80, 2, 0),
(153, 'FieldUnicity', 4, 3, 0),
(154, 'FieldUnicity', 3, 4, 0),
(155, 'FieldUnicity', 86, 5, 0),
(156, 'FieldUnicity', 30, 6, 0),
(157, 'Problem', 21, 1, 0),
(158, 'Problem', 12, 2, 0),
(159, 'Problem', 19, 3, 0),
(160, 'Problem', 15, 4, 0),
(161, 'Problem', 3, 5, 0),
(162, 'Problem', 7, 6, 0),
(163, 'Problem', 18, 7, 0),
(164, 'Vlan', 11, 1, 0),
(165, 'TicketRecurrent', 11, 1, 0),
(166, 'TicketRecurrent', 12, 2, 0),
(167, 'TicketRecurrent', 13, 3, 0),
(168, 'TicketRecurrent', 15, 4, 0),
(169, 'TicketRecurrent', 14, 5, 0),
(170, 'Reminder', 2, 1, 0),
(171, 'Reminder', 3, 2, 0),
(172, 'Reminder', 4, 3, 0),
(173, 'Reminder', 5, 4, 0),
(174, 'Reminder', 6, 5, 0),
(175, 'Reminder', 7, 6, 0),
(176, 'IPNetwork', 10, 2, 0),
(177, 'IPNetwork', 11, 3, 0),
(178, 'IPNetwork', 12, 4, 0),
(179, 'IPNetwork', 17, 5, 0),
(180, 'NetworkName', 12, 1, 0),
(181, 'NetworkName', 13, 2, 0),
(182, 'RSSFeed', 2, 1, 0),
(183, 'RSSFeed', 4, 2, 0),
(184, 'RSSFeed', 5, 3, 0),
(185, 'RSSFeed', 19, 4, 0),
(186, 'RSSFeed', 6, 5, 0),
(187, 'RSSFeed', 7, 6, 0),
(188, 'Blacklist', 12, 1, 0),
(189, 'Blacklist', 11, 2, 0),
(190, 'ReservationItem', 5, 3, 0),
(191, 'QueuedNotification', 16, 1, 0),
(192, 'QueuedNotification', 7, 2, 0),
(193, 'QueuedNotification', 20, 3, 0),
(194, 'QueuedNotification', 21, 4, 0),
(195, 'QueuedNotification', 22, 5, 0),
(196, 'QueuedNotification', 15, 6, 0),
(197, 'Change', 12, 1, 0),
(198, 'Change', 19, 2, 0),
(199, 'Change', 15, 3, 0),
(200, 'Change', 7, 4, 0),
(201, 'Change', 18, 5, 0),
(202, 'Project', 3, 1, 0),
(203, 'Project', 4, 2, 0),
(204, 'Project', 12, 3, 0),
(205, 'Project', 5, 4, 0),
(206, 'Project', 15, 5, 0),
(207, 'Project', 21, 6, 0),
(208, 'ProjectState', 12, 1, 0),
(209, 'ProjectState', 11, 2, 0),
(210, 'ProjectTask', 2, 1, 0),
(211, 'ProjectTask', 12, 2, 0),
(212, 'ProjectTask', 14, 3, 0),
(213, 'ProjectTask', 5, 4, 0),
(214, 'ProjectTask', 7, 5, 0),
(215, 'ProjectTask', 8, 6, 0),
(216, 'ProjectTask', 13, 7, 0),
(217, 'CartridgeItem', 9, 5, 0),
(218, 'ConsumableItem', 9, 5, 0),
(219, 'ReservationItem', 9, 4, 0),
(220, 'SoftwareLicense', 1, 1, 0),
(221, 'SoftwareLicense', 3, 2, 0),
(222, 'SoftwareLicense', 10, 3, 0),
(223, 'SoftwareLicense', 162, 4, 0),
(224, 'SoftwareLicense', 5, 5, 0),
(225, 'SavedSearch', 8, 1, 0),
(226, 'SavedSearch', 9, 1, 0),
(227, 'SavedSearch', 3, 1, 0),
(228, 'SavedSearch', 10, 1, 0),
(229, 'SavedSearch', 11, 1, 0),
(230, 'Plugin', 2, 1, 0),
(231, 'Plugin', 3, 2, 0),
(232, 'Plugin', 4, 3, 0),
(233, 'Plugin', 5, 4, 0),
(234, 'Plugin', 6, 5, 0),
(235, 'Plugin', 7, 6, 0),
(236, 'Plugin', 8, 7, 0),
(237, 'Cluster', 31, 1, 0),
(238, 'Cluster', 19, 2, 0),
(239, 'Domain', 3, 1, 0),
(240, 'Domain', 4, 2, 0),
(241, 'Domain', 2, 3, 0),
(242, 'Domain', 6, 4, 0),
(243, 'Domain', 7, 5, 0),
(244, 'DomainRecord', 2, 1, 0),
(245, 'DomainRecord', 3, 2, 0),
(246, 'Appliance', 2, 1, 0),
(247, 'Appliance', 3, 2, 0),
(248, 'Appliance', 4, 3, 0),
(249, 'Appliance', 5, 4, 0),
(250, 'Lockedfield', 3, 1, 0),
(251, 'Lockedfield', 13, 2, 0),
(252, 'Lockedfield', 5, 3, 0),
(253, 'Unmanaged', 2, 1, 0),
(254, 'Unmanaged', 4, 2, 0),
(255, 'Unmanaged', 3, 3, 0),
(256, 'Unmanaged', 5, 4, 0),
(257, 'Unmanaged', 7, 5, 0),
(258, 'Unmanaged', 10, 6, 0),
(259, 'Unmanaged', 18, 7, 0),
(260, 'Unmanaged', 14, 8, 0),
(261, 'Unmanaged', 15, 9, 0),
(262, 'Unmanaged', 9, 10, 0),
(263, 'NetworkPortType', 10, 1, 0),
(264, 'NetworkPortType', 11, 2, 0),
(265, 'NetworkPortType', 12, 3, 0),
(266, 'NetworkPort', 3, 1, 0),
(267, 'NetworkPort', 30, 2, 0),
(268, 'NetworkPort', 31, 3, 0),
(269, 'NetworkPort', 32, 4, 0),
(270, 'NetworkPort', 33, 5, 0),
(271, 'NetworkPort', 34, 6, 0),
(272, 'NetworkPort', 35, 7, 0),
(273, 'NetworkPort', 36, 8, 0),
(274, 'NetworkPort', 38, 9, 0),
(275, 'NetworkPort', 39, 10, 0),
(276, 'NetworkPort', 40, 11, 0),
(277, 'NetworkPort', 6, 12, 0),
(278, 'USBVendor', 10, 1, 0),
(279, 'USBVendor', 11, 2, 0),
(280, 'PCIVendor', 10, 1, 0),
(281, 'PCIVendor', 11, 2, 0),
(282, 'Agent', 2, 1, 0),
(283, 'Agent', 4, 2, 0),
(284, 'Agent', 10, 3, 0),
(285, 'Agent', 8, 4, 0),
(286, 'Agent', 11, 5, 0),
(287, 'Agent', 6, 6, 0),
(288, 'Agent', 15, 7, 0),
(289, 'Database', 2, 1, 0),
(290, 'Database', 3, 2, 0),
(291, 'Database', 6, 3, 0),
(292, 'Database', 9, 4, 0),
(293, 'Database', 10, 5, 0),
(294, 'Glpi\\Socket', 5, 1, 0),
(295, 'Glpi\\Socket', 6, 2, 0),
(296, 'Glpi\\Socket', 9, 3, 0),
(297, 'Glpi\\Socket', 8, 4, 0),
(298, 'Glpi\\Socket', 7, 5, 0),
(299, 'Cable', 4, 1, 0),
(300, 'Cable', 31, 2, 0),
(301, 'Cable', 6, 3, 0),
(302, 'Cable', 15, 4, 0),
(303, 'Cable', 24, 5, 0),
(304, 'Cable', 8, 6, 0),
(305, 'Cable', 10, 7, 0),
(306, 'Cable', 13, 8, 0),
(307, 'Cable', 14, 9, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_documentcategories`
--

CREATE TABLE `glpi_documentcategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `documentcategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `completename` text DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `ancestors_cache` longtext DEFAULT NULL,
  `sons_cache` longtext DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_documents`
--

CREATE TABLE `glpi_documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL COMMENT 'for display and transfert',
  `filepath` varchar(255) DEFAULT NULL COMMENT 'file storage path',
  `documentcategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mime` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `link` varchar(255) DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tickets_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sha1sum` char(40) DEFAULT NULL,
  `is_blacklisted` tinyint(4) NOT NULL DEFAULT 0,
  `tag` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_documents`
--

INSERT INTO `glpi_documents` (`id`, `entities_id`, `is_recursive`, `name`, `filename`, `filepath`, `documentcategories_id`, `mime`, `date_mod`, `comment`, `is_deleted`, `link`, `users_id`, `tickets_id`, `sha1sum`, `is_blacklisted`, `tag`, `date_creation`) VALUES
(1, 0, 0, 'Documento do ticket 1', 'incv.png', 'PNG/bf/d6b97cf340b0c8ba931a2bd27d40c7468c237c.PNG', 0, 'image/png', '2026-03-31 10:21:32', NULL, 0, NULL, 9, 1, 'bfd6b97cf340b0c8ba931a2bd27d40c7468c237c', 0, '4de8cd4a-eb35259e-69cba0277d1346.68195914', '2026-03-31 10:21:32'),
(2, 0, 0, 'Documento do ticket 2', 'IMG_3705.png', 'PNG/99/b33199a9be972512f8a68af4794b551e2c7efe.PNG', 0, 'image/png', '2026-03-31 11:54:40', NULL, 0, NULL, 8, 2, '99b33199a9be972512f8a68af4794b551e2c7efe', 0, '4de8cd4a-eb35259e-69cbb5fe18bb93.91621390', '2026-03-31 11:54:40');

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_documents_items`
--

CREATE TABLE `glpi_documents_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `documents_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `users_id` int(10) UNSIGNED DEFAULT 0,
  `timeline_position` tinyint(4) NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_documents_items`
--

INSERT INTO `glpi_documents_items` (`id`, `documents_id`, `items_id`, `itemtype`, `entities_id`, `is_recursive`, `date_mod`, `users_id`, `timeline_position`, `date_creation`, `date`) VALUES
(1, 1, 1, 'Ticket', 0, 0, '2026-03-31 10:21:32', 9, 1, '2026-03-31 10:21:32', '2026-03-31 10:21:32'),
(2, 2, 2, 'Ticket', 0, 0, '2026-03-31 11:54:40', 8, 1, '2026-03-31 11:54:40', '2026-03-31 11:54:40');

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_documenttypes`
--

CREATE TABLE `glpi_documenttypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `mime` varchar(255) DEFAULT NULL,
  `is_uploadable` tinyint(4) NOT NULL DEFAULT 1,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_documenttypes`
--

INSERT INTO `glpi_documenttypes` (`id`, `name`, `ext`, `icon`, `mime`, `is_uploadable`, `date_mod`, `comment`, `date_creation`) VALUES
(1, 'JPEG', 'jpg', 'jpg-dist.png', NULL, 1, NULL, NULL, NULL),
(2, 'PNG', 'png', 'png-dist.png', NULL, 1, NULL, NULL, NULL),
(3, 'GIF', 'gif', 'gif-dist.png', NULL, 1, NULL, NULL, NULL),
(4, 'BMP', 'bmp', 'bmp-dist.png', NULL, 1, NULL, NULL, NULL),
(5, 'Photoshop', 'psd', 'psd-dist.png', NULL, 1, NULL, NULL, NULL),
(6, 'TIFF', 'tif', 'tif-dist.png', NULL, 1, NULL, NULL, NULL),
(7, 'AIFF', 'aiff', 'aiff-dist.png', NULL, 1, NULL, NULL, NULL),
(8, 'Windows Media', 'asf', 'asf-dist.png', NULL, 1, NULL, NULL, NULL),
(9, 'Windows Media', 'avi', 'avi-dist.png', NULL, 1, NULL, NULL, NULL),
(10, 'BZip', 'bz2', 'bz2-dist.png', NULL, 1, NULL, NULL, NULL),
(11, 'Word', 'doc', 'doc-dist.png', NULL, 1, NULL, NULL, NULL),
(12, 'DjVu', 'djvu', '', NULL, 1, NULL, NULL, NULL),
(13, 'PostScript', 'eps', 'ps-dist.png', NULL, 1, NULL, NULL, NULL),
(14, 'GZ', 'gz', 'gz-dist.png', NULL, 1, NULL, NULL, NULL),
(15, 'HTML', 'html', 'html-dist.png', NULL, 1, NULL, NULL, NULL),
(16, 'Midi', 'mid', 'mid-dist.png', NULL, 1, NULL, NULL, NULL),
(17, 'QuickTime', 'mov', 'mov-dist.png', NULL, 1, NULL, NULL, NULL),
(18, 'MP3', 'mp3', 'mp3-dist.png', NULL, 1, NULL, NULL, NULL),
(19, 'MPEG', 'mpg', 'mpg-dist.png', NULL, 1, NULL, NULL, NULL),
(20, 'Ogg Vorbis', 'ogg', 'ogg-dist.png', NULL, 1, NULL, NULL, NULL),
(21, 'PDF', 'pdf', 'pdf-dist.png', NULL, 1, NULL, NULL, NULL),
(22, 'PowerPoint', 'ppt', 'ppt-dist.png', NULL, 1, NULL, NULL, NULL),
(23, 'PostScript', 'ps', 'ps-dist.png', NULL, 1, NULL, NULL, NULL),
(24, 'QuickTime', 'qt', 'qt-dist.png', NULL, 1, NULL, NULL, NULL),
(25, 'RealAudio', 'ra', 'ra-dist.png', NULL, 1, NULL, NULL, NULL),
(26, 'RealAudio', 'ram', 'ram-dist.png', NULL, 1, NULL, NULL, NULL),
(27, 'RealAudio', 'rm', 'rm-dist.png', NULL, 1, NULL, NULL, NULL),
(28, 'RTF', 'rtf', 'rtf-dist.png', NULL, 1, NULL, NULL, NULL),
(29, 'StarOffice', 'sdd', 'sdd-dist.png', NULL, 1, NULL, NULL, NULL),
(30, 'StarOffice', 'sdw', 'sdw-dist.png', NULL, 1, NULL, NULL, NULL),
(31, 'Stuffit', 'sit', 'sit-dist.png', NULL, 1, NULL, NULL, NULL),
(32, 'OpenOffice Impress', 'sxi', 'sxi-dist.png', NULL, 1, NULL, NULL, NULL),
(33, 'OpenOffice', 'sxw', 'sxw-dist.png', NULL, 1, NULL, NULL, NULL),
(34, 'Flash', 'swf', 'swf-dist.png', NULL, 1, NULL, NULL, NULL),
(35, 'TGZ', 'tgz', 'tgz-dist.png', NULL, 1, NULL, NULL, NULL),
(36, 'texte', 'txt', 'txt-dist.png', NULL, 1, NULL, NULL, NULL),
(37, 'WAV', 'wav', 'wav-dist.png', NULL, 1, NULL, NULL, NULL),
(38, 'Excel', 'xls', 'xls-dist.png', NULL, 1, NULL, NULL, NULL),
(39, 'XML', 'xml', 'xml-dist.png', NULL, 1, NULL, NULL, NULL),
(40, 'Windows Media', 'wmv', 'wmv-dist.png', NULL, 1, NULL, NULL, NULL),
(41, 'Zip', 'zip', 'zip-dist.png', NULL, 1, NULL, NULL, NULL),
(42, 'MNG', 'mng', '', NULL, 1, NULL, NULL, NULL),
(43, 'Adobe Illustrator', 'ai', 'ai-dist.png', NULL, 1, NULL, NULL, NULL),
(44, 'C source', 'c', 'c-dist.png', NULL, 1, NULL, NULL, NULL),
(45, 'Debian', 'deb', 'deb-dist.png', NULL, 1, NULL, NULL, NULL),
(46, 'DVI', 'dvi', 'dvi-dist.png', NULL, 1, NULL, NULL, NULL),
(47, 'C header', 'h', 'h-dist.png', NULL, 1, NULL, NULL, NULL),
(48, 'Pascal', 'pas', 'pas-dist.png', NULL, 1, NULL, NULL, NULL),
(49, 'RedHat/Mandrake/SuSE', 'rpm', 'rpm-dist.png', NULL, 1, NULL, NULL, NULL),
(50, 'OpenOffice Calc', 'sxc', 'sxc-dist.png', NULL, 1, NULL, NULL, NULL),
(51, 'LaTeX', 'tex', 'tex-dist.png', NULL, 1, NULL, NULL, NULL),
(52, 'GIMP multi-layer', 'xcf', 'xcf-dist.png', NULL, 1, NULL, NULL, NULL),
(53, 'JPEG', 'jpeg', 'jpg-dist.png', NULL, 1, NULL, NULL, NULL),
(54, 'Oasis Open Office Writer', 'odt', 'odt-dist.png', NULL, 1, NULL, NULL, NULL),
(55, 'Oasis Open Office Calc', 'ods', 'ods-dist.png', NULL, 1, NULL, NULL, NULL),
(56, 'Oasis Open Office Impress', 'odp', 'odp-dist.png', NULL, 1, NULL, NULL, NULL),
(57, 'Oasis Open Office Impress Template', 'otp', 'odp-dist.png', NULL, 1, NULL, NULL, NULL),
(58, 'Oasis Open Office Writer Template', 'ott', 'odt-dist.png', NULL, 1, NULL, NULL, NULL),
(59, 'Oasis Open Office Calc Template', 'ots', 'ods-dist.png', NULL, 1, NULL, NULL, NULL),
(60, 'Oasis Open Office Math', 'odf', 'odf-dist.png', NULL, 1, NULL, NULL, NULL),
(61, 'Oasis Open Office Draw', 'odg', 'odg-dist.png', NULL, 1, NULL, NULL, NULL),
(62, 'Oasis Open Office Draw Template', 'otg', 'odg-dist.png', NULL, 1, NULL, NULL, NULL),
(63, 'Oasis Open Office Base', 'odb', 'odb-dist.png', NULL, 1, NULL, NULL, NULL),
(64, 'Oasis Open Office HTML', 'oth', 'oth-dist.png', NULL, 1, NULL, NULL, NULL),
(65, 'Oasis Open Office Writer Master', 'odm', 'odm-dist.png', NULL, 1, NULL, NULL, NULL),
(66, 'Oasis Open Office Chart', 'odc', '', NULL, 1, NULL, NULL, NULL),
(67, 'Oasis Open Office Image', 'odi', '', NULL, 1, NULL, NULL, NULL),
(68, 'Word XML', 'docx', 'doc-dist.png', NULL, 1, NULL, NULL, NULL),
(69, 'Excel XML', 'xlsx', 'xls-dist.png', NULL, 1, NULL, NULL, NULL),
(70, 'PowerPoint XML', 'pptx', 'ppt-dist.png', NULL, 1, NULL, NULL, NULL),
(71, 'Comma-Separated Values', 'csv', 'csv-dist.png', NULL, 1, NULL, NULL, NULL),
(72, 'Scalable Vector Graphics', 'svg', 'svg-dist.png', NULL, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_domainrecords`
--

CREATE TABLE `glpi_domainrecords` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `data_obj` text DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `domains_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `domainrecordtypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ttl` int(11) NOT NULL,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_domainrecordtypes`
--

CREATE TABLE `glpi_domainrecordtypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `fields` text DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_domainrecordtypes`
--

INSERT INTO `glpi_domainrecordtypes` (`id`, `name`, `fields`, `entities_id`, `is_recursive`, `comment`) VALUES
(1, 'A', '[]', 0, 1, 'Host address'),
(2, 'AAAA', '[]', 0, 1, 'IPv6 host address'),
(3, 'ALIAS', '[]', 0, 1, 'Auto resolved alias'),
(4, 'CNAME', '[{\"key\":\"target\",\"label\":\"Target\",\"placeholder\":\"sip.example.com.\",\"is_fqdn\":true}]', 0, 1, 'Canonical name for an alias'),
(5, 'MX', '[{\"key\":\"priority\",\"label\":\"Priority\",\"placeholder\":\"10\"},{\"key\":\"server\",\"label\":\"Server\",\"placeholder\":\"mail.example.com.\",\"is_fqdn\":true}]', 0, 1, 'Mail eXchange'),
(6, 'NS', '[]', 0, 1, 'Name Server'),
(7, 'PTR', '[]', 0, 1, 'Pointer'),
(8, 'SOA', '[{\"key\":\"primary_name_server\",\"label\":\"Primary name server\",\"placeholder\":\"ns1.example.com.\",\"is_fqdn\":true},{\"key\":\"primary_contact\",\"label\":\"Primary contact\",\"placeholder\":\"admin.example.com.\",\"is_fqdn\":true},{\"key\":\"serial\",\"label\":\"Serial\",\"placeholder\":\"2020010101\"},{\"key\":\"zone_refresh_timer\",\"label\":\"Zone refresh timer\",\"placeholder\":\"86400\"},{\"key\":\"failed_refresh_retry_timer\",\"label\":\"Failed refresh retry timer\",\"placeholder\":\"7200\"},{\"key\":\"zone_expiry_timer\",\"label\":\"Zone expiry timer\",\"placeholder\":\"1209600\"},{\"key\":\"minimum_ttl\",\"label\":\"Minimum TTL\",\"placeholder\":\"300\"}]', 0, 1, 'Start Of Authority'),
(9, 'SRV', '[{\"key\":\"priority\",\"label\":\"Priority\",\"placeholder\":\"0\"},{\"key\":\"weight\",\"label\":\"Weight\",\"placeholder\":\"10\"},{\"key\":\"port\",\"label\":\"Port\",\"placeholder\":\"5060\"},{\"key\":\"target\",\"label\":\"Target\",\"placeholder\":\"sip.example.com.\",\"is_fqdn\":true}]', 0, 1, 'Location of service'),
(10, 'TXT', '[{\"key\":\"data\",\"label\":\"TXT record data\",\"placeholder\":\"Your TXT record data\",\"quote_value\":true}]', 0, 1, 'Descriptive text'),
(11, 'CAA', '[{\"key\":\"flag\",\"label\":\"Flag\",\"placeholder\":\"0\"},{\"key\":\"tag\",\"label\":\"Tag\",\"placeholder\":\"issue\"},{\"key\":\"value\",\"label\":\"Value\",\"placeholder\":\"letsencrypt.org\",\"quote_value\":true}]', 0, 1, 'Certification Authority Authorization');

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_domainrelations`
--

CREATE TABLE `glpi_domainrelations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_domainrelations`
--

INSERT INTO `glpi_domainrelations` (`id`, `name`, `entities_id`, `is_recursive`, `comment`) VALUES
(1, 'Belongs', 0, 1, 'Item belongs to domain'),
(2, 'Manage', 0, 1, 'Item manages domain');

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_domains`
--

CREATE TABLE `glpi_domains` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `domaintypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_expiration` timestamp NULL DEFAULT NULL,
  `date_domaincreation` timestamp NULL DEFAULT NULL,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_domains_items`
--

CREATE TABLE `glpi_domains_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `domains_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `domainrelations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_domaintypes`
--

CREATE TABLE `glpi_domaintypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_dropdowntranslations`
--

CREATE TABLE `glpi_dropdowntranslations` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `field` varchar(100) DEFAULT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_enclosuremodels`
--

CREATE TABLE `glpi_enclosuremodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT 0,
  `required_units` int(11) NOT NULL DEFAULT 1,
  `depth` float NOT NULL DEFAULT 1,
  `power_connections` int(11) NOT NULL DEFAULT 0,
  `power_consumption` int(11) NOT NULL DEFAULT 0,
  `is_half_rack` tinyint(4) NOT NULL DEFAULT 0,
  `picture_front` text DEFAULT NULL,
  `picture_rear` text DEFAULT NULL,
  `pictures` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_enclosures`
--

CREATE TABLE `glpi_enclosures` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `enclosuremodels_id` int(10) UNSIGNED DEFAULT NULL,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `orientation` tinyint(4) DEFAULT NULL,
  `power_supplies` tinyint(4) NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'RELATION to states (id)',
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_entities`
--

CREATE TABLE `glpi_entities` (
  `id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED DEFAULT 0,
  `completename` text DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `sons_cache` longtext DEFAULT NULL,
  `ancestors_cache` longtext DEFAULT NULL,
  `registration_number` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `admin_email` varchar(255) DEFAULT NULL,
  `admin_email_name` varchar(255) DEFAULT NULL,
  `from_email` varchar(255) DEFAULT NULL,
  `from_email_name` varchar(255) DEFAULT NULL,
  `noreply_email` varchar(255) DEFAULT NULL,
  `noreply_email_name` varchar(255) DEFAULT NULL,
  `replyto_email` varchar(255) DEFAULT NULL,
  `replyto_email_name` varchar(255) DEFAULT NULL,
  `notification_subject_tag` varchar(255) DEFAULT NULL,
  `ldap_dn` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `authldaps_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mail_domain` varchar(255) DEFAULT NULL,
  `entity_ldapfilter` text DEFAULT NULL,
  `mailing_signature` text DEFAULT NULL,
  `cartridges_alert_repeat` int(11) NOT NULL DEFAULT -2,
  `consumables_alert_repeat` int(11) NOT NULL DEFAULT -2,
  `use_licenses_alert` int(11) NOT NULL DEFAULT -2,
  `send_licenses_alert_before_delay` int(11) NOT NULL DEFAULT -2,
  `use_certificates_alert` int(11) NOT NULL DEFAULT -2,
  `send_certificates_alert_before_delay` int(11) NOT NULL DEFAULT -2,
  `certificates_alert_repeat_interval` int(11) NOT NULL DEFAULT -2,
  `use_contracts_alert` int(11) NOT NULL DEFAULT -2,
  `send_contracts_alert_before_delay` int(11) NOT NULL DEFAULT -2,
  `use_infocoms_alert` int(11) NOT NULL DEFAULT -2,
  `send_infocoms_alert_before_delay` int(11) NOT NULL DEFAULT -2,
  `use_reservations_alert` int(11) NOT NULL DEFAULT -2,
  `use_domains_alert` int(11) NOT NULL DEFAULT -2,
  `send_domains_alert_close_expiries_delay` int(11) NOT NULL DEFAULT -2,
  `send_domains_alert_expired_delay` int(11) NOT NULL DEFAULT -2,
  `autoclose_delay` int(11) NOT NULL DEFAULT -2,
  `autopurge_delay` int(11) NOT NULL DEFAULT -2,
  `notclosed_delay` int(11) NOT NULL DEFAULT -2,
  `calendars_strategy` tinyint(4) NOT NULL DEFAULT -2,
  `calendars_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `auto_assign_mode` int(11) NOT NULL DEFAULT -2,
  `tickettype` int(11) NOT NULL DEFAULT -2,
  `max_closedate` timestamp NULL DEFAULT NULL,
  `inquest_config` int(11) NOT NULL DEFAULT -2,
  `inquest_rate` int(11) NOT NULL DEFAULT 0,
  `inquest_delay` int(11) NOT NULL DEFAULT -10,
  `inquest_URL` varchar(255) DEFAULT NULL,
  `autofill_warranty_date` varchar(255) NOT NULL DEFAULT '-2',
  `autofill_use_date` varchar(255) NOT NULL DEFAULT '-2',
  `autofill_buy_date` varchar(255) NOT NULL DEFAULT '-2',
  `autofill_delivery_date` varchar(255) NOT NULL DEFAULT '-2',
  `autofill_order_date` varchar(255) NOT NULL DEFAULT '-2',
  `tickettemplates_strategy` tinyint(4) NOT NULL DEFAULT -2,
  `tickettemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `changetemplates_strategy` tinyint(4) NOT NULL DEFAULT -2,
  `changetemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `problemtemplates_strategy` tinyint(4) NOT NULL DEFAULT -2,
  `problemtemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_strategy_software` tinyint(4) NOT NULL DEFAULT -2,
  `entities_id_software` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `default_contract_alert` int(11) NOT NULL DEFAULT -2,
  `default_infocom_alert` int(11) NOT NULL DEFAULT -2,
  `default_cartridges_alarm_threshold` int(11) NOT NULL DEFAULT -2,
  `default_consumables_alarm_threshold` int(11) NOT NULL DEFAULT -2,
  `delay_send_emails` int(11) NOT NULL DEFAULT -2,
  `is_notif_enable_default` int(11) NOT NULL DEFAULT -2,
  `inquest_duration` int(11) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `autofill_decommission_date` varchar(255) NOT NULL DEFAULT '-2',
  `suppliers_as_private` int(11) NOT NULL DEFAULT -2,
  `anonymize_support_agents` int(11) NOT NULL DEFAULT -2,
  `display_users_initials` int(11) NOT NULL DEFAULT -2,
  `contracts_strategy_default` tinyint(4) NOT NULL DEFAULT -2,
  `contracts_id_default` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `enable_custom_css` int(11) NOT NULL DEFAULT -2,
  `custom_css_code` text DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `altitude` varchar(255) DEFAULT NULL,
  `transfers_strategy` tinyint(4) NOT NULL DEFAULT -2,
  `transfers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `agent_base_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_entities`
--

INSERT INTO `glpi_entities` (`id`, `name`, `entities_id`, `completename`, `comment`, `level`, `sons_cache`, `ancestors_cache`, `registration_number`, `address`, `postcode`, `town`, `state`, `country`, `website`, `phonenumber`, `fax`, `email`, `admin_email`, `admin_email_name`, `from_email`, `from_email_name`, `noreply_email`, `noreply_email_name`, `replyto_email`, `replyto_email_name`, `notification_subject_tag`, `ldap_dn`, `tag`, `authldaps_id`, `mail_domain`, `entity_ldapfilter`, `mailing_signature`, `cartridges_alert_repeat`, `consumables_alert_repeat`, `use_licenses_alert`, `send_licenses_alert_before_delay`, `use_certificates_alert`, `send_certificates_alert_before_delay`, `certificates_alert_repeat_interval`, `use_contracts_alert`, `send_contracts_alert_before_delay`, `use_infocoms_alert`, `send_infocoms_alert_before_delay`, `use_reservations_alert`, `use_domains_alert`, `send_domains_alert_close_expiries_delay`, `send_domains_alert_expired_delay`, `autoclose_delay`, `autopurge_delay`, `notclosed_delay`, `calendars_strategy`, `calendars_id`, `auto_assign_mode`, `tickettype`, `max_closedate`, `inquest_config`, `inquest_rate`, `inquest_delay`, `inquest_URL`, `autofill_warranty_date`, `autofill_use_date`, `autofill_buy_date`, `autofill_delivery_date`, `autofill_order_date`, `tickettemplates_strategy`, `tickettemplates_id`, `changetemplates_strategy`, `changetemplates_id`, `problemtemplates_strategy`, `problemtemplates_id`, `entities_strategy_software`, `entities_id_software`, `default_contract_alert`, `default_infocom_alert`, `default_cartridges_alarm_threshold`, `default_consumables_alarm_threshold`, `delay_send_emails`, `is_notif_enable_default`, `inquest_duration`, `date_mod`, `date_creation`, `autofill_decommission_date`, `suppliers_as_private`, `anonymize_support_agents`, `display_users_initials`, `contracts_strategy_default`, `contracts_id_default`, `enable_custom_css`, `custom_css_code`, `latitude`, `longitude`, `altitude`, `transfers_strategy`, `transfers_id`, `agent_base_url`) VALUES
(0, 'Imprensa Nacional de Cabo Verde', NULL, 'Imprensa Nacional de Cabo Verde', NULL, 1, NULL, NULL, NULL, 'Rua Macaronésia', '113', 'Praia ', 'Cabo verde', 'Cabo verde', NULL, '2614520', NULL, 'suporteincv@suporteincv.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 1, -10, -10, 0, 0, 0, -10, 1, NULL, 1, 0, 0, NULL, '0', '0', '0', '0', '0', 0, 1, 0, 1, 0, 1, -10, 0, 0, 0, 10, 10, 0, 1, 0, '2026-03-30 06:51:40', NULL, '0', 0, 0, 1, 0, 0, 0, '', NULL, NULL, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_entities_knowbaseitems`
--

CREATE TABLE `glpi_entities_knowbaseitems` (
  `id` int(10) UNSIGNED NOT NULL,
  `knowbaseitems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_entities_reminders`
--

CREATE TABLE `glpi_entities_reminders` (
  `id` int(10) UNSIGNED NOT NULL,
  `reminders_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_entities_rssfeeds`
--

CREATE TABLE `glpi_entities_rssfeeds` (
  `id` int(10) UNSIGNED NOT NULL,
  `rssfeeds_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_events`
--

CREATE TABLE `glpi_events` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(255) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `service` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_events`
--

INSERT INTO `glpi_events` (`id`, `items_id`, `type`, `date`, `service`, `level`, `message`) VALUES
(1, 0, 'system', '2026-03-01 14:18:43', 'login', 3, 'glpi ligou-se do IP 98.97.72.209'),
(2, 5, 'users', '2026-03-01 14:22:16', 'setup', 5, 'glpi actualizou um item'),
(3, 3, 'users', '2026-03-01 14:22:39', 'setup', 5, 'glpi actualizou um item'),
(4, 3, 'users', '2026-03-01 14:22:48', 'setup', 5, 'glpi actualizou um item'),
(5, 4, 'users', '2026-03-01 14:23:13', 'setup', 5, 'glpi actualizou um item'),
(6, 2, 'users', '2026-03-01 14:26:43', 'setup', 5, 'glpi actualizou um item'),
(7, 0, 'system', '2026-03-01 21:11:02', 'login', 3, 'glpi ligou-se do IP 98.97.72.209'),
(8, 2, 'users', '2026-03-01 21:17:35', 'setup', 5, 'glpi actualizou um item'),
(9, 0, 'system', '2026-03-01 21:18:17', 'login', 3, 'Falhou login para incv do IP 98.97.72.209'),
(10, 0, 'system', '2026-03-01 21:18:41', 'login', 3, 'incv ligou-se do IP 98.97.72.209'),
(11, 0, 'system', '2026-03-01 21:33:25', 'login', 3, 'Falhou login para  do IP 98.97.72.209'),
(12, 0, 'system', '2026-03-01 21:34:38', 'login', 3, 'incv ligou-se do IP 98.97.72.209'),
(13, 0, 'system', '2026-03-01 21:41:56', 'setup', 3, 'incv editou a configuração de notificações de e-mails'),
(14, 0, 'system', '2026-03-03 17:12:41', 'login', 3, 'incv ligou-se do IP 213.150.192.214'),
(15, 1, 'profiles', '2026-03-05 13:01:31', 'setup', 4, 'incv actualizou um item'),
(16, 1, 'profiles', '2026-03-05 13:02:12', 'setup', 4, 'incv actualizou um item'),
(17, 1, 'profiles', '2026-03-05 13:03:17', 'setup', 4, 'incv actualizou um item'),
(18, 1, 'profiles', '2026-03-05 13:05:47', 'setup', 4, 'incv actualizou um item'),
(19, 1, 'profiles', '2026-03-05 13:06:28', 'setup', 4, 'incv actualizou um item'),
(20, 9, 'profiles', '2026-03-05 13:07:56', 'setup', 4, 'incv adiciona o item CCV - Correios de Cabo Verde'),
(21, 10, 'profiles', '2026-03-05 13:08:32', 'setup', 4, 'incv adiciona o item DEF - Direcção de Estrangeiros e Fronteiras'),
(22, 11, 'profiles', '2026-03-05 13:08:58', 'setup', 4, 'incv adiciona o item DGRNI - Direção Geral dos Registos, Notariado e Identificação'),
(23, 12, 'profiles', '2026-03-05 13:10:36', 'setup', 4, 'incv adiciona o item SINIAC'),
(24, 13, 'profiles', '2026-03-05 13:11:05', 'setup', 4, 'incv adiciona o item Nosi - Núcleo Operacional de Sociedade de Informação'),
(25, 7, 'profiles', '2026-03-05 13:11:51', 'setup', 4, 'incv actualizou um item'),
(26, 7, 'users', '2026-03-05 13:14:11', 'setup', 4, 'incv adiciona o item CCV - Correios de Cabo Verde'),
(27, 7, 'users', '2026-03-05 13:15:34', 'setup', 5, 'incv actualizou um item'),
(28, 7, 'users', '2026-03-05 13:17:26', 'setup', 5, 'incv actualizou um item'),
(29, 8, 'users', '2026-03-05 13:18:47', 'setup', 4, 'incv adiciona o item DEF - Direcção de Estrangeiros e Fronteiras'),
(30, 7, 'users', '2026-03-05 13:20:51', 'setup', 5, 'incv actualizou um item'),
(31, 9, 'users', '2026-03-05 13:22:46', 'setup', 4, 'incv adiciona o item Manuel Garcia'),
(32, 10, 'users', '2026-03-05 13:24:10', 'setup', 4, 'incv adiciona o item IMIJ - Instituto de Inovação e Modernização da Justiça'),
(33, 11, 'users', '2026-03-05 13:25:36', 'setup', 4, 'incv adiciona o item Nosi - Núcleo Operacional de Sociedade de Informação'),
(34, 12, 'users', '2026-03-05 13:26:13', 'setup', 4, 'incv adiciona o item SINIAC'),
(35, 0, 'system', '2026-03-06 16:11:38', 'login', 3, 'incv ligou-se do IP 213.150.192.214'),
(36, 0, 'system', '2026-03-07 03:33:03', 'login', 3, 'Failed login for rubie.ernser@bdcimail.com from IP 159.89.216.7'),
(37, 0, 'system', '2026-03-09 12:35:59', 'login', 3, 'Falhou login para admin do IP 41.221.207.37'),
(38, 0, 'system', '2026-03-09 12:36:39', 'login', 3, 'Falhou login para admin do IP 41.221.207.165'),
(39, 0, 'system', '2026-03-09 12:37:10', 'login', 3, 'Falhou login para admin do IP 213.150.192.214'),
(40, 0, 'system', '2026-03-12 10:06:11', 'login', 3, 'Falhou login para admin do IP 213.150.192.214'),
(41, 0, 'system', '2026-03-12 10:06:42', 'login', 3, 'Falhou login para admin do IP 213.150.192.214'),
(42, 0, 'system', '2026-03-12 10:08:26', 'login', 3, 'Falhou login para incv do IP 213.150.192.214'),
(43, 0, 'system', '2026-03-12 10:08:54', 'login', 3, 'incv ligou-se do IP 213.150.192.214'),
(44, 0, 'system', '2026-03-20 16:20:57', 'login', 3, 'Falhou login para incv do IP 41.221.207.52'),
(45, 0, 'system', '2026-03-20 16:21:27', 'login', 3, 'incv ligou-se do IP 41.221.207.52'),
(46, 0, 'system', '2026-03-25 22:19:43', 'login', 3, 'Falhou login para incv do IP 98.97.72.41'),
(47, 0, 'system', '2026-03-25 22:20:03', 'login', 3, 'incv ligou-se do IP 98.97.72.41'),
(48, 0, 'system', '2026-03-26 09:52:35', 'login', 3, 'incv ligou-se do IP 41.79.127.85'),
(49, 0, 'system', '2026-03-27 10:44:46', 'login', 3, 'Failed login for incv from IP 2001:690:22c0:9201::22'),
(50, 0, 'system', '2026-03-27 10:45:11', 'login', 3, 'incv login from IP 2001:690:22c0:9201::22'),
(51, 0, 'system', '2026-03-27 11:05:23', 'login', 3, 'incv ligou-se do IP 213.150.192.214'),
(52, 0, 'system', '2026-03-27 23:40:14', 'login', 3, 'incv ligou-se do IP 98.97.72.38'),
(53, 0, 'system', '2026-03-29 19:55:15', 'login', 3, 'Falhou login para incv do IP 98.97.72.45'),
(54, 0, 'system', '2026-03-29 19:56:03', 'login', 3, 'incv ligou-se do IP 98.97.72.45'),
(55, 0, 'Plugin', '2026-03-29 20:53:22', 'setup', 3, 'Extensão ActualTime foi instalada por incv (2).'),
(56, 0, 'Plugin', '2026-03-29 20:53:33', 'setup', 3, 'Extensão ActualTime foi ativada por incv (2).'),
(57, 3, 'users', '2026-03-30 06:41:08', 'setup', 5, 'incv actualizou um item'),
(58, 0, 'system', '2026-03-30 06:41:54', 'login', 3, 'teste ligou-se do IP 98.97.72.45'),
(59, 0, 'system', '2026-03-30 06:47:06', 'login', 3, 'incv ligou-se do IP 98.97.72.45'),
(60, 0, 'Entity', '2026-03-30 06:49:24', 'setup', 4, 'incv actualizou um item'),
(61, 0, 'Entity', '2026-03-30 06:51:40', 'setup', 4, 'incv actualizou um item'),
(62, 0, 'Entity', '2026-03-30 06:54:14', 'setup', 4, 'incv actualizou um item'),
(63, 1, 'tickettemplate', '2026-03-30 06:58:53', 'maintain', 4, 'incv adiciona campo obrigatório'),
(64, 1, 'tickettemplate', '2026-03-30 06:58:59', 'maintain', 4, 'incv adiciona campo obrigatório'),
(65, 1, 'tickettemplate', '2026-03-30 06:59:07', 'maintain', 4, 'incv adiciona campo obrigatório'),
(66, 1, 'tickettemplate', '2026-03-30 06:59:52', 'maintain', 4, 'incv adiciona campo obrigatório'),
(67, 1, 'tickettemplate', '2026-03-30 07:00:23', 'maintain', 4, 'incv adiciona campo obrigatório'),
(68, 1, 'tickettemplate', '2026-03-30 07:00:54', 'maintain', 4, 'incv adiciona campo obrigatório'),
(69, 1, 'tickettemplate', '2026-03-30 07:02:57', 'maintain', 4, 'incv adiciona campo pré-definido'),
(70, 1, 'tickettemplate', '2026-03-30 07:03:09', 'maintain', 4, 'incv adiciona campo pré-definido'),
(71, 1, 'tickettemplate', '2026-03-30 07:03:26', 'maintain', 4, 'incv adiciona campo pré-definido'),
(72, 1, 'tickettemplate', '2026-03-30 07:04:00', 'maintain', 4, 'incv adiciona campo pré-definido'),
(73, 0, 'system', '2026-03-30 07:06:05', 'login', 3, 'teste ligou-se do IP 98.97.72.45'),
(74, 0, 'system', '2026-03-30 07:08:30', 'login', 3, 'incv ligou-se do IP 98.97.72.45'),
(75, 1, 'ITILCategory', '2026-03-30 07:14:57', 'setup', 4, 'incv adiciona o item Atraso na expedição'),
(76, 2, 'ITILCategory', '2026-03-30 07:15:28', 'setup', 4, 'incv adiciona o item Localização do documento'),
(77, 3, 'ITILCategory', '2026-03-30 07:16:34', 'setup', 4, 'incv adiciona o item Urgência'),
(78, 4, 'ITILCategory', '2026-03-30 07:16:58', 'setup', 4, 'incv adiciona o item Pedido de regeição'),
(79, 5, 'ITILCategory', '2026-03-30 07:18:12', 'setup', 4, 'incv adiciona o item '),
(80, 0, 'system', '2026-03-30 09:44:55', 'login', 3, 'Failed login for Teste from IP 41.221.207.173'),
(81, 0, 'system', '2026-03-30 09:45:40', 'login', 3, 'teste login from IP 41.221.207.173'),
(82, 0, 'system', '2026-03-30 10:39:39', 'login', 3, 'Failed login for  from IP 2001:690:22c0:9201::38'),
(83, 0, 'system', '2026-03-30 10:39:54', 'login', 3, 'Failed login for teste from IP 2001:690:22c0:9201::38'),
(84, 0, 'system', '2026-03-30 10:40:23', 'login', 3, 'teste login from IP 2001:690:22c0:9201::38'),
(85, 0, 'system', '2026-03-30 12:25:46', 'login', 3, 'Falhou login para  do IP 41.221.207.45'),
(86, 0, 'system', '2026-03-30 12:28:09', 'login', 3, 'Falhou login para  do IP 41.221.207.45'),
(87, 0, 'system', '2026-03-30 16:34:09', 'login', 3, 'Falhou login para  do IP 213.150.192.214'),
(88, 0, 'system', '2026-03-30 16:55:25', 'login', 3, 'teste login from IP 213.150.192.214'),
(89, 0, 'system', '2026-03-31 06:18:32', 'login', 3, 'incv ligou-se do IP 98.97.72.49'),
(90, 9, 'users', '2026-03-31 06:25:48', 'setup', 5, 'incv actualizou um item'),
(91, 7, 'users', '2026-03-31 06:28:39', 'setup', 5, 'incv actualizou um item'),
(92, 0, 'system', '2026-03-31 06:29:44', 'login', 3, 'Falhou login para siniac do IP 98.97.72.49'),
(93, 0, 'system', '2026-03-31 06:30:11', 'login', 3, 'Falhou login para def do IP 98.97.72.49'),
(94, 0, 'system', '2026-03-31 06:31:00', 'login', 3, 'teste ligou-se do IP 98.97.72.49'),
(95, 0, 'system', '2026-03-31 10:14:12', 'login', 3, 'incv ligou-se do IP 213.150.192.214'),
(96, 0, 'system', '2026-03-31 10:16:33', 'login', 3, 'Falhou login para Manuel Garcia do IP 213.150.192.214'),
(97, 0, 'system', '2026-03-31 10:17:13', 'login', 3, 'Manuel Garcia ligou-se do IP 213.150.192.214'),
(98, 9, 'users', '2026-03-31 10:17:17', 'setup', 5, 'incv actualizou um item'),
(99, 7, 'profiles', '2026-03-31 10:17:57', 'setup', 4, 'incv actualizou um item'),
(100, 7, 'profiles', '2026-03-31 10:18:12', 'setup', 4, 'incv actualizou um item'),
(101, 0, 'system', '2026-03-31 10:18:32', 'login', 3, 'Manuel Garcia ligou-se do IP 213.150.192.214'),
(102, 1, 'ticket', '2026-03-31 10:21:32', 'tracking', 4, 'Manuel Garcia  adiciona o item 1'),
(103, 1, 'ticket', '2026-03-31 10:23:50', 'tracking', 4, 'incv adiciona um acompanhamento'),
(104, 7, 'users', '2026-03-31 10:30:57', 'setup', 5, 'incv actualizou um item'),
(105, 0, 'system', '2026-03-31 10:31:11', 'login', 3, 'Falhou login para CCV do IP 213.150.192.214'),
(106, 0, 'system', '2026-03-31 10:31:26', 'login', 3, 'Falhou login para ccv do IP 213.150.192.214'),
(107, 7, 'users', '2026-03-31 10:31:52', 'setup', 5, 'incv actualizou um item'),
(108, 0, 'system', '2026-03-31 10:31:52', 'login', 3, 'ccv ligou-se do IP 213.150.192.214'),
(109, 9, 'profiles', '2026-03-31 10:32:30', 'setup', 4, 'incv actualizou um item'),
(110, 9, 'profiles', '2026-03-31 10:32:52', 'setup', 4, 'incv actualizou um item'),
(111, 0, 'system', '2026-03-31 10:33:25', 'login', 3, 'ccv ligou-se do IP 213.150.192.214'),
(112, 1, 'ticket', '2026-03-31 10:36:30', 'tracking', 4, 'incv adiciona um ator'),
(113, 0, 'system', '2026-03-31 10:37:42', 'login', 3, 'Falhou login para cvv do IP 213.150.192.214'),
(114, 0, 'system', '2026-03-31 10:37:56', 'login', 3, 'ccv ligou-se do IP 213.150.192.214'),
(115, 9, 'users', '2026-03-31 10:39:37', 'setup', 5, 'incv actualizou um item'),
(116, 8, 'users', '2026-03-31 10:42:20', 'setup', 5, 'incv actualizou um item'),
(117, 0, 'system', '2026-03-31 10:43:38', 'login', 3, 'incv ligou-se do IP 213.150.192.214'),
(118, 0, 'system', '2026-03-31 10:52:21', 'login', 3, 'ccv ligou-se do IP 213.150.192.214'),
(119, 9, 'profiles', '2026-03-31 10:53:31', 'setup', 4, 'incv actualizou um item'),
(120, 9, 'profiles', '2026-03-31 10:53:32', 'setup', 4, 'incv actualizou um item'),
(121, 0, 'system', '2026-03-31 10:53:56', 'login', 3, 'ccv ligou-se do IP 213.150.192.214'),
(122, 9, 'profiles', '2026-03-31 10:54:04', 'setup', 4, 'incv actualizou um item'),
(123, 0, 'system', '2026-03-31 10:54:41', 'login', 3, 'def ligou-se do IP 213.150.192.214'),
(124, 10, 'profiles', '2026-03-31 10:56:24', 'setup', 4, 'incv actualizou um item'),
(125, 10, 'profiles', '2026-03-31 10:57:11', 'setup', 4, 'incv actualizou um item'),
(126, 0, 'system', '2026-03-31 10:57:49', 'login', 3, 'def ligou-se do IP 213.150.192.214'),
(127, 10, 'profiles', '2026-03-31 10:58:13', 'setup', 4, 'incv actualizou um item'),
(128, 0, 'system', '2026-03-31 10:58:30', 'login', 3, 'def ligou-se do IP 213.150.192.214'),
(129, 10, 'profiles', '2026-03-31 11:00:33', 'setup', 4, 'incv actualizou um item'),
(130, 10, 'profiles', '2026-03-31 11:00:54', 'setup', 4, 'incv actualizou um item'),
(131, 10, 'profiles', '2026-03-31 11:01:11', 'setup', 4, 'incv actualizou um item'),
(132, 10, 'profiles', '2026-03-31 11:01:19', 'setup', 4, 'incv actualizou um item'),
(133, 0, 'system', '2026-03-31 11:01:41', 'login', 3, 'def ligou-se do IP 213.150.192.214'),
(134, 10, 'profiles', '2026-03-31 11:03:00', 'setup', 4, 'incv actualizou um item'),
(135, 0, 'system', '2026-03-31 11:03:38', 'login', 3, 'def ligou-se do IP 213.150.192.214'),
(136, 0, 'system', '2026-03-31 11:47:58', 'login', 3, 'def ligou-se do IP 41.221.207.32'),
(137, 0, 'system', '2026-03-31 11:49:17', 'login', 3, 'ccv fez login no IP 41.221.207.33'),
(138, 2, 'ticket', '2026-03-31 11:54:40', 'tracking', 4, 'DEF  adiciona o item 2'),
(139, 2, 'ticket', '2026-03-31 12:00:22', 'tracking', 4, 'incv adiciona um acompanhamento'),
(140, 0, 'system', '2026-03-31 12:10:49', 'login', 3, 'def ligou-se do IP 213.150.192.214'),
(141, 0, 'system', '2026-03-31 12:11:41', 'login', 3, 'incv ligou-se do IP 213.150.192.214'),
(142, 0, 'system', '2026-03-31 21:46:22', 'login', 3, 'Falhou login para  do IP 41.74.135.47'),
(143, 0, 'system', '2026-04-01 13:09:05', 'login', 3, 'incv ligou-se do IP 102.207.154.116'),
(144, 0, 'system', '2026-04-28 12:39:42', 'login', 3, 'incv ligou-se do IP 213.150.192.214'),
(145, 0, 'system', '2026-04-29 10:59:57', 'login', 3, 'incv ligou-se do IP 38.44.77.118'),
(146, 0, 'system', '2026-05-04 13:07:55', 'login', 3, 'Falhou login para  do IP 213.150.192.214'),
(147, 0, 'system', '2026-05-04 16:14:24', 'login', 3, 'incv ligou-se do IP 213.150.192.214'),
(148, 0, 'system', '2026-05-05 16:22:24', 'login', 3, 'incv ligou-se do IP 213.150.192.214'),
(149, 0, 'system', '2026-05-06 10:42:51', 'login', 3, 'incv ligou-se do IP 213.150.192.214'),
(150, 0, 'system', '2026-05-06 12:11:06', 'login', 3, 'incv ligou-se do IP 213.150.192.214'),
(151, 0, 'system', '2026-05-06 12:15:00', 'login', 3, 'Falhou login para teste do IP 213.150.192.214'),
(152, 3, 'users', '2026-05-06 12:15:31', 'setup', 5, 'incv actualizou um item'),
(153, 0, 'system', '2026-05-06 12:15:52', 'login', 3, 'teste ligou-se do IP 213.150.192.214');

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_fieldblacklists`
--

CREATE TABLE `glpi_fieldblacklists` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `field` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  `itemtype` varchar(255) NOT NULL DEFAULT '',
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_fieldunicities`
--

CREATE TABLE `glpi_fieldunicities` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `itemtype` varchar(255) NOT NULL DEFAULT '',
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `fields` text DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `action_refuse` tinyint(4) NOT NULL DEFAULT 0,
  `action_notify` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Stores field unicity criterias' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_filesystems`
--

CREATE TABLE `glpi_filesystems` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_filesystems`
--

INSERT INTO `glpi_filesystems` (`id`, `name`, `comment`, `date_mod`, `date_creation`) VALUES
(1, 'ext', NULL, NULL, NULL),
(2, 'ext2', NULL, NULL, NULL),
(3, 'ext3', NULL, NULL, NULL),
(4, 'ext4', NULL, NULL, NULL),
(5, 'FAT', NULL, NULL, NULL),
(6, 'FAT32', NULL, NULL, NULL),
(7, 'VFAT', NULL, NULL, NULL),
(8, 'HFS', NULL, NULL, NULL),
(9, 'HPFS', NULL, NULL, NULL),
(10, 'HTFS', NULL, NULL, NULL),
(11, 'JFS', NULL, NULL, NULL),
(12, 'JFS2', NULL, NULL, NULL),
(13, 'NFS', NULL, NULL, NULL),
(14, 'NTFS', NULL, NULL, NULL),
(15, 'ReiserFS', NULL, NULL, NULL),
(16, 'SMBFS', NULL, NULL, NULL),
(17, 'UDF', NULL, NULL, NULL),
(18, 'UFS', NULL, NULL, NULL),
(19, 'XFS', NULL, NULL, NULL),
(20, 'ZFS', NULL, NULL, NULL),
(21, 'APFS', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_fqdns`
--

CREATE TABLE `glpi_fqdns` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `fqdn` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_groups`
--

CREATE TABLE `glpi_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `ldap_field` varchar(255) DEFAULT NULL,
  `ldap_value` text DEFAULT NULL,
  `ldap_group_dn` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `completename` text DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `ancestors_cache` longtext DEFAULT NULL,
  `sons_cache` longtext DEFAULT NULL,
  `is_requester` tinyint(4) NOT NULL DEFAULT 1,
  `is_watcher` tinyint(4) NOT NULL DEFAULT 1,
  `is_assign` tinyint(4) NOT NULL DEFAULT 1,
  `is_task` tinyint(4) NOT NULL DEFAULT 1,
  `is_notify` tinyint(4) NOT NULL DEFAULT 1,
  `is_itemgroup` tinyint(4) NOT NULL DEFAULT 1,
  `is_usergroup` tinyint(4) NOT NULL DEFAULT 1,
  `is_manager` tinyint(4) NOT NULL DEFAULT 1,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_groups_knowbaseitems`
--

CREATE TABLE `glpi_groups_knowbaseitems` (
  `id` int(10) UNSIGNED NOT NULL,
  `knowbaseitems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED DEFAULT NULL,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `no_entity_restriction` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_groups_problems`
--

CREATE TABLE `glpi_groups_problems` (
  `id` int(10) UNSIGNED NOT NULL,
  `problems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_groups_reminders`
--

CREATE TABLE `glpi_groups_reminders` (
  `id` int(10) UNSIGNED NOT NULL,
  `reminders_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED DEFAULT NULL,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `no_entity_restriction` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_groups_rssfeeds`
--

CREATE TABLE `glpi_groups_rssfeeds` (
  `id` int(10) UNSIGNED NOT NULL,
  `rssfeeds_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED DEFAULT NULL,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `no_entity_restriction` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_groups_tickets`
--

CREATE TABLE `glpi_groups_tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `tickets_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_groups_users`
--

CREATE TABLE `glpi_groups_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `is_manager` tinyint(4) NOT NULL DEFAULT 0,
  `is_userdelegate` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_holidays`
--

CREATE TABLE `glpi_holidays` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_perpetual` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_imageformats`
--

CREATE TABLE `glpi_imageformats` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_imageresolutions`
--

CREATE TABLE `glpi_imageresolutions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_video` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_impactcompounds`
--

CREATE TABLE `glpi_impactcompounds` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT '',
  `color` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_impactcontexts`
--

CREATE TABLE `glpi_impactcontexts` (
  `id` int(10) UNSIGNED NOT NULL,
  `positions` mediumtext NOT NULL,
  `zoom` float NOT NULL DEFAULT 0,
  `pan_x` float NOT NULL DEFAULT 0,
  `pan_y` float NOT NULL DEFAULT 0,
  `impact_color` varchar(255) NOT NULL DEFAULT '',
  `depends_color` varchar(255) NOT NULL DEFAULT '',
  `impact_and_depends_color` varchar(255) NOT NULL DEFAULT '',
  `show_depends` tinyint(4) NOT NULL DEFAULT 1,
  `show_impact` tinyint(4) NOT NULL DEFAULT 1,
  `max_depth` int(11) NOT NULL DEFAULT 5
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_impactitems`
--

CREATE TABLE `glpi_impactitems` (
  `id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(255) NOT NULL DEFAULT '',
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `impactcontexts_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_slave` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_impactrelations`
--

CREATE TABLE `glpi_impactrelations` (
  `id` int(10) UNSIGNED NOT NULL,
  `itemtype_source` varchar(255) NOT NULL DEFAULT '',
  `items_id_source` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype_impacted` varchar(255) NOT NULL DEFAULT '',
  `items_id_impacted` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_infocoms`
--

CREATE TABLE `glpi_infocoms` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `buy_date` date DEFAULT NULL,
  `use_date` date DEFAULT NULL,
  `warranty_duration` int(11) NOT NULL DEFAULT 0,
  `warranty_info` varchar(255) DEFAULT NULL,
  `suppliers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `order_number` varchar(255) DEFAULT NULL,
  `delivery_number` varchar(255) DEFAULT NULL,
  `immo_number` varchar(255) DEFAULT NULL,
  `value` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `warranty_value` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `sink_time` int(11) NOT NULL DEFAULT 0,
  `sink_type` int(11) NOT NULL DEFAULT 0,
  `sink_coeff` float NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `bill` varchar(255) DEFAULT NULL,
  `budgets_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `alert` int(11) NOT NULL DEFAULT 0,
  `order_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `inventory_date` date DEFAULT NULL,
  `warranty_date` date DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `decommission_date` timestamp NULL DEFAULT NULL,
  `businesscriticities_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_interfacetypes`
--

CREATE TABLE `glpi_interfacetypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_interfacetypes`
--

INSERT INTO `glpi_interfacetypes` (`id`, `name`, `comment`, `date_mod`, `date_creation`) VALUES
(1, 'IDE', NULL, NULL, NULL),
(2, 'SATA', NULL, NULL, NULL),
(3, 'SCSI', NULL, NULL, NULL),
(4, 'USB', NULL, NULL, NULL),
(5, 'AGP', NULL, NULL, NULL),
(6, 'PCI', NULL, NULL, NULL),
(7, 'PCIe', NULL, NULL, NULL),
(8, 'PCI-X', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_ipaddresses`
--

CREATE TABLE `glpi_ipaddresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `version` tinyint(3) UNSIGNED DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `binary_0` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `binary_1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `binary_2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `binary_3` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `mainitems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mainitemtype` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_ipaddresses_ipnetworks`
--

CREATE TABLE `glpi_ipaddresses_ipnetworks` (
  `id` int(10) UNSIGNED NOT NULL,
  `ipaddresses_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ipnetworks_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_ipnetworks`
--

CREATE TABLE `glpi_ipnetworks` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `ipnetworks_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `completename` text DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `ancestors_cache` longtext DEFAULT NULL,
  `sons_cache` longtext DEFAULT NULL,
  `addressable` tinyint(4) NOT NULL DEFAULT 0,
  `version` tinyint(3) UNSIGNED DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `address_0` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `address_1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `address_2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `address_3` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `netmask` varchar(40) DEFAULT NULL,
  `netmask_0` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `netmask_1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `netmask_2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `netmask_3` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gateway` varchar(40) DEFAULT NULL,
  `gateway_0` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gateway_1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gateway_2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gateway_3` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_ipnetworks_vlans`
--

CREATE TABLE `glpi_ipnetworks_vlans` (
  `id` int(10) UNSIGNED NOT NULL,
  `ipnetworks_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `vlans_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_items_clusters`
--

CREATE TABLE `glpi_items_clusters` (
  `id` int(10) UNSIGNED NOT NULL,
  `clusters_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_items_devicebatteries`
--

CREATE TABLE `glpi_items_devicebatteries` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicebatteries_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `manufacturing_date` date DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `real_capacity` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_items_devicecameras`
--

CREATE TABLE `glpi_items_devicecameras` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicecameras_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_items_devicecameras_imageformats`
--

CREATE TABLE `glpi_items_devicecameras_imageformats` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_devicecameras_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `imageformats_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_items_devicecameras_imageresolutions`
--

CREATE TABLE `glpi_items_devicecameras_imageresolutions` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_devicecameras_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `imageresolutions_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_items_devicecases`
--

CREATE TABLE `glpi_items_devicecases` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicecases_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_items_devicecontrols`
--

CREATE TABLE `glpi_items_devicecontrols` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicecontrols_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `busID` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_items_devicedrives`
--

CREATE TABLE `glpi_items_devicedrives` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicedrives_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `busID` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_items_devicefirmwares`
--

CREATE TABLE `glpi_items_devicefirmwares` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicefirmwares_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_items_devicegenerics`
--

CREATE TABLE `glpi_items_devicegenerics` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicegenerics_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_items_devicegraphiccards`
--

CREATE TABLE `glpi_items_devicegraphiccards` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicegraphiccards_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `memory` int(11) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `busID` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_items_deviceharddrives`
--

CREATE TABLE `glpi_items_deviceharddrives` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `deviceharddrives_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `capacity` int(11) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `busID` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_items_devicememories`
--

CREATE TABLE `glpi_items_devicememories` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicememories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `size` int(11) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `busID` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_items_devicemotherboards`
--

CREATE TABLE `glpi_items_devicemotherboards` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicemotherboards_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_items_devicenetworkcards`
--

CREATE TABLE `glpi_items_devicenetworkcards` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicenetworkcards_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mac` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `busID` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_items_devicepcis`
--

CREATE TABLE `glpi_items_devicepcis` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicepcis_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `busID` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_items_devicepowersupplies`
--

CREATE TABLE `glpi_items_devicepowersupplies` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicepowersupplies_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_items_deviceprocessors`
--

CREATE TABLE `glpi_items_deviceprocessors` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `deviceprocessors_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `frequency` int(11) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `nbcores` int(11) DEFAULT NULL,
  `nbthreads` int(11) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `busID` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_items_devicesensors`
--

CREATE TABLE `glpi_items_devicesensors` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicesensors_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_items_devicesimcards`
--

CREATE TABLE `glpi_items_devicesimcards` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'RELATION to various table, according to itemtype (id)',
  `itemtype` varchar(100) NOT NULL,
  `devicesimcards_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `lines_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pin` varchar(255) NOT NULL DEFAULT '',
  `pin2` varchar(255) NOT NULL DEFAULT '',
  `puk` varchar(255) NOT NULL DEFAULT '',
  `puk2` varchar(255) NOT NULL DEFAULT '',
  `msin` varchar(255) NOT NULL DEFAULT '',
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_items_devicesoundcards`
--

CREATE TABLE `glpi_items_devicesoundcards` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicesoundcards_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `busID` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_items_disks`
--

CREATE TABLE `glpi_items_disks` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `device` varchar(255) DEFAULT NULL,
  `mountpoint` varchar(255) DEFAULT NULL,
  `filesystems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `totalsize` bigint(20) NOT NULL DEFAULT 0,
  `freesize` bigint(20) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `encryption_status` int(11) NOT NULL DEFAULT 0,
  `encryption_tool` varchar(255) DEFAULT NULL,
  `encryption_algorithm` varchar(255) DEFAULT NULL,
  `encryption_type` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_items_enclosures`
--

CREATE TABLE `glpi_items_enclosures` (
  `id` int(10) UNSIGNED NOT NULL,
  `enclosures_id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(255) NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_items_kanbans`
--

CREATE TABLE `glpi_items_kanbans` (
  `id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(100) NOT NULL,
  `items_id` int(10) UNSIGNED DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL,
  `state` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_items_operatingsystems`
--

CREATE TABLE `glpi_items_operatingsystems` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `operatingsystems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `operatingsystemversions_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `operatingsystemservicepacks_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `operatingsystemarchitectures_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `operatingsystemkernelversions_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `license_number` varchar(255) DEFAULT NULL,
  `licenseid` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `hostid` varchar(255) DEFAULT NULL,
  `operatingsystemeditions_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `install_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_items_problems`
--

CREATE TABLE `glpi_items_problems` (
  `id` int(10) UNSIGNED NOT NULL,
  `problems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_items_projects`
--

CREATE TABLE `glpi_items_projects` (
  `id` int(10) UNSIGNED NOT NULL,
  `projects_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_items_racks`
--

CREATE TABLE `glpi_items_racks` (
  `id` int(10) UNSIGNED NOT NULL,
  `racks_id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(255) NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL,
  `position` int(11) NOT NULL,
  `orientation` tinyint(4) DEFAULT NULL,
  `bgcolor` varchar(7) DEFAULT NULL,
  `hpos` tinyint(4) NOT NULL DEFAULT 0,
  `is_reserved` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_items_remotemanagements`
--

CREATE TABLE `glpi_items_remotemanagements` (
  `id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `remoteid` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_items_softwarelicenses`
--

CREATE TABLE `glpi_items_softwarelicenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `softwarelicenses_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_items_softwareversions`
--

CREATE TABLE `glpi_items_softwareversions` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `softwareversions_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted_item` tinyint(4) NOT NULL DEFAULT 0,
  `is_template_item` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `date_install` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_items_tickets`
--

CREATE TABLE `glpi_items_tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(255) DEFAULT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tickets_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_itilcategories`
--

CREATE TABLE `glpi_itilcategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `itilcategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `completename` text DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `knowbaseitemcategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `code` varchar(255) DEFAULT NULL,
  `ancestors_cache` longtext DEFAULT NULL,
  `sons_cache` longtext DEFAULT NULL,
  `is_helpdeskvisible` tinyint(4) NOT NULL DEFAULT 1,
  `tickettemplates_id_incident` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tickettemplates_id_demand` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `changetemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `problemtemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_incident` int(11) NOT NULL DEFAULT 1,
  `is_request` int(11) NOT NULL DEFAULT 1,
  `is_problem` int(11) NOT NULL DEFAULT 1,
  `is_change` tinyint(4) NOT NULL DEFAULT 1,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_itilcategories`
--

INSERT INTO `glpi_itilcategories` (`id`, `entities_id`, `is_recursive`, `itilcategories_id`, `name`, `completename`, `comment`, `level`, `knowbaseitemcategories_id`, `users_id`, `groups_id`, `code`, `ancestors_cache`, `sons_cache`, `is_helpdeskvisible`, `tickettemplates_id_incident`, `tickettemplates_id_demand`, `changetemplates_id`, `problemtemplates_id`, `is_incident`, `is_request`, `is_problem`, `is_change`, `date_mod`, `date_creation`) VALUES
(1, 0, 0, 0, 'Atraso na expedição', 'Atraso na expedição', '', 1, 0, 0, 0, '', '[]', NULL, 1, 0, 0, 0, 0, 1, 1, 1, 1, '2026-03-30 07:14:57', '2026-03-30 07:14:57'),
(2, 0, 0, 0, 'Localização do documento', 'Localização do documento', '', 1, 0, 0, 0, '', '[]', NULL, 1, 0, 0, 0, 0, 1, 1, 1, 1, '2026-03-30 07:15:28', '2026-03-30 07:15:28'),
(3, 0, 0, 0, 'Urgência', 'Urgência', '', 1, 0, 0, 0, '', '[]', NULL, 1, 0, 0, 0, 0, 1, 1, 1, 1, '2026-03-30 07:16:34', '2026-03-30 07:16:34'),
(4, 0, 0, 0, 'Pedido de regeição', 'Pedido de regeição', '', 1, 0, 0, 0, '', '[]', NULL, 1, 0, 0, 0, 0, 1, 1, 1, 1, '2026-03-30 07:16:58', '2026-03-30 07:16:58'),
(5, 0, 0, 0, '', '', '', 1, 0, 0, 0, '', '[]', '{\"5\":5}', 1, 0, 0, 0, 0, 1, 1, 1, 1, '2026-03-30 07:18:12', '2026-03-30 07:18:12');

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_itilfollowups`
--

CREATE TABLE `glpi_itilfollowups` (
  `id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(100) NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date` timestamp NULL DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_editor` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `content` longtext DEFAULT NULL,
  `is_private` tinyint(4) NOT NULL DEFAULT 0,
  `requesttypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `timeline_position` tinyint(4) NOT NULL DEFAULT 0,
  `sourceitems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sourceof_items_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_itilfollowups`
--

INSERT INTO `glpi_itilfollowups` (`id`, `itemtype`, `items_id`, `date`, `users_id`, `users_id_editor`, `content`, `is_private`, `requesttypes_id`, `date_mod`, `date_creation`, `timeline_position`, `sourceitems_id`, `sourceof_items_id`) VALUES
(1, 'Ticket', 1, '2026-03-31 10:23:50', 2, 0, '&#60;p&#62;ok já recebemos o vosso pedido, daremos feeback no momento oportuno.&#60;/p&#62;', 0, 1, '2026-03-31 10:23:50', '2026-03-31 10:23:50', 1, 0, 0),
(2, 'Ticket', 2, '2026-03-31 12:00:22', 2, 0, '&#60;p&#62;ok recebemos o reporte, daremos seguimento a sua resolução&#60;/p&#62;', 0, 1, '2026-03-31 12:00:22', '2026-03-31 12:00:22', 1, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_itilfollowuptemplates`
--

CREATE TABLE `glpi_itilfollowuptemplates` (
  `id` int(10) UNSIGNED NOT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `content` mediumtext DEFAULT NULL,
  `requesttypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_private` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_itilsolutions`
--

CREATE TABLE `glpi_itilsolutions` (
  `id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(100) NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `solutiontypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `solutiontype_name` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_approval` timestamp NULL DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_name` varchar(255) DEFAULT NULL,
  `users_id_editor` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_approval` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_name_approval` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `itilfollowups_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Followup reference on reject or approve a solution'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_itilsolutions`
--

INSERT INTO `glpi_itilsolutions` (`id`, `itemtype`, `items_id`, `solutiontypes_id`, `solutiontype_name`, `content`, `date_creation`, `date_mod`, `date_approval`, `users_id`, `user_name`, `users_id_editor`, `users_id_approval`, `user_name_approval`, `status`, `itilfollowups_id`) VALUES
(1, 'Ticket', 1, 0, NULL, '&#60;p&#62;problema resolvido. &#60;/p&#62;', '2026-03-31 10:38:08', '2026-03-31 10:38:08', NULL, 2, NULL, 0, 0, NULL, 2, NULL),
(2, 'Ticket', 2, 0, NULL, '&#60;p&#62;Problema resolvido&#60;/p&#62;', '2026-03-31 12:06:32', '2026-03-31 12:06:32', NULL, 2, NULL, 0, 0, NULL, 2, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_itils_projects`
--

CREATE TABLE `glpi_itils_projects` (
  `id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(100) NOT NULL DEFAULT '',
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `projects_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_knowbaseitemcategories`
--

CREATE TABLE `glpi_knowbaseitemcategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `knowbaseitemcategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `completename` text DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `sons_cache` longtext DEFAULT NULL,
  `ancestors_cache` longtext DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_knowbaseitems`
--

CREATE TABLE `glpi_knowbaseitems` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text DEFAULT NULL,
  `answer` longtext DEFAULT NULL,
  `is_faq` tinyint(4) NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `view` int(11) NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `begin_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_knowbaseitems_comments`
--

CREATE TABLE `glpi_knowbaseitems_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `knowbaseitems_id` int(10) UNSIGNED NOT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `language` varchar(10) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `parent_comment_id` int(10) UNSIGNED DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_knowbaseitems_items`
--

CREATE TABLE `glpi_knowbaseitems_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `knowbaseitems_id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(100) NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_knowbaseitems_knowbaseitemcategories`
--

CREATE TABLE `glpi_knowbaseitems_knowbaseitemcategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `knowbaseitems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `knowbaseitemcategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_knowbaseitems_profiles`
--

CREATE TABLE `glpi_knowbaseitems_profiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `knowbaseitems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `profiles_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED DEFAULT NULL,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `no_entity_restriction` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_knowbaseitems_revisions`
--

CREATE TABLE `glpi_knowbaseitems_revisions` (
  `id` int(10) UNSIGNED NOT NULL,
  `knowbaseitems_id` int(10) UNSIGNED NOT NULL,
  `revision` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `answer` longtext DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_knowbaseitems_users`
--

CREATE TABLE `glpi_knowbaseitems_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `knowbaseitems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_knowbaseitemtranslations`
--

CREATE TABLE `glpi_knowbaseitemtranslations` (
  `id` int(10) UNSIGNED NOT NULL,
  `knowbaseitems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `language` varchar(10) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `answer` longtext DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_lineoperators`
--

CREATE TABLE `glpi_lineoperators` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `comment` text DEFAULT NULL,
  `mcc` int(11) DEFAULT NULL,
  `mnc` int(11) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_lines`
--

CREATE TABLE `glpi_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `caller_num` varchar(255) NOT NULL DEFAULT '',
  `caller_name` varchar(255) NOT NULL DEFAULT '',
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `lineoperators_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `linetypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_linetypes`
--

CREATE TABLE `glpi_linetypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_links`
--

CREATE TABLE `glpi_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 1,
  `name` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `open_window` tinyint(4) NOT NULL DEFAULT 1,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_links_itemtypes`
--

CREATE TABLE `glpi_links_itemtypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `links_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_locations`
--

CREATE TABLE `glpi_locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `completename` text DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `ancestors_cache` longtext DEFAULT NULL,
  `sons_cache` longtext DEFAULT NULL,
  `address` text DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `building` varchar(255) DEFAULT NULL,
  `room` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `altitude` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_lockedfields`
--

CREATE TABLE `glpi_lockedfields` (
  `id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `field` varchar(50) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_global` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_logs`
--

CREATE TABLE `glpi_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(100) NOT NULL DEFAULT '',
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype_link` varchar(100) NOT NULL DEFAULT '',
  `linked_action` int(11) NOT NULL DEFAULT 0 COMMENT 'see define.php HISTORY_* constant',
  `user_name` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `id_search_option` int(11) NOT NULL DEFAULT 0 COMMENT 'see search.constant.php for value',
  `old_value` varchar(255) DEFAULT NULL,
  `new_value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_logs`
--

INSERT INTO `glpi_logs` (`id`, `itemtype`, `items_id`, `itemtype_link`, `linked_action`, `user_name`, `date_mod`, `id_search_option`, `old_value`, `new_value`) VALUES
(1, 'RuleImportAsset', 1, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(2, 'RuleImportAsset', 1, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'É parcial é Sim (1)'),
(3, 'RuleCriteria', 1, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(4, 'RuleImportAsset', 1, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item não existe Sim (2)'),
(5, 'RuleCriteria', 2, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(6, 'RuleImportAsset', 1, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Recusar importação Atribuir Sim (1)'),
(7, 'RuleAction', 1, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(8, 'RuleImportAsset', 2, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(9, 'RuleImportAsset', 2, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item não existe Sim (3)'),
(10, 'RuleCriteria', 3, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(11, 'RuleImportAsset', 2, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; MAC já existe Sim (4)'),
(12, 'RuleCriteria', 4, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(13, 'RuleImportAsset', 2, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; MAC existe Sim (5)'),
(14, 'RuleCriteria', 5, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(15, 'RuleImportAsset', 2, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; Número de porta já existe Sim (6)'),
(16, 'RuleCriteria', 6, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(17, 'RuleImportAsset', 2, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; Número de porta existe Sim (7)'),
(18, 'RuleCriteria', 7, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(19, 'RuleImportAsset', 2, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Geral &#62; Restringir criterio a mesma porta de rede Sim Sim (8)'),
(20, 'RuleCriteria', 8, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(21, 'RuleImportAsset', 2, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (2)'),
(22, 'RuleAction', 2, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(23, 'RuleImportAsset', 3, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(24, 'RuleImportAsset', 3, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item não existe Sim (9)'),
(25, 'RuleCriteria', 9, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(26, 'RuleImportAsset', 3, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; MAC já existe Sim (10)'),
(27, 'RuleCriteria', 10, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(28, 'RuleImportAsset', 3, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; MAC existe Sim (11)'),
(29, 'RuleCriteria', 11, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(30, 'RuleImportAsset', 3, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; Número de porta já existe Sim (12)'),
(31, 'RuleCriteria', 12, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(32, 'RuleImportAsset', 3, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; Número de porta existe Sim (13)'),
(33, 'RuleCriteria', 13, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(34, 'RuleImportAsset', 3, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (3)'),
(35, 'RuleAction', 3, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(36, 'RuleImportAsset', 4, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(37, 'RuleImportAsset', 4, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item não existe Sim (14)'),
(38, 'RuleCriteria', 14, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(39, 'RuleImportAsset', 4, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; MAC existe Sim (15)'),
(40, 'RuleCriteria', 15, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(41, 'RuleImportAsset', 4, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; Número de porta existe Sim (16)'),
(42, 'RuleCriteria', 16, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(43, 'RuleImportAsset', 4, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (4)'),
(44, 'RuleAction', 4, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(45, 'RuleImportAsset', 5, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(46, 'RuleImportAsset', 5, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item não existe Sim (17)'),
(47, 'RuleCriteria', 17, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(48, 'RuleImportAsset', 5, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; IP já existe Sim (18)'),
(49, 'RuleCriteria', 18, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(50, 'RuleImportAsset', 5, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; IP existe Sim (19)'),
(51, 'RuleCriteria', 19, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(52, 'RuleImportAsset', 5, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; Descrição da porta já existe Sim (20)'),
(53, 'RuleCriteria', 20, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(54, 'RuleImportAsset', 5, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; Descrição da porta existe Sim (21)'),
(55, 'RuleCriteria', 21, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(56, 'RuleImportAsset', 5, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Geral &#62; Restringir criterio a mesma porta de rede Sim Sim (22)'),
(57, 'RuleCriteria', 22, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(58, 'RuleImportAsset', 5, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (5)'),
(59, 'RuleAction', 5, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(60, 'RuleImportAsset', 6, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(61, 'RuleImportAsset', 6, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item não existe Sim (23)'),
(62, 'RuleCriteria', 23, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(63, 'RuleImportAsset', 6, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; IP já existe Sim (24)'),
(64, 'RuleCriteria', 24, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(65, 'RuleImportAsset', 6, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; IP existe Sim (25)'),
(66, 'RuleCriteria', 25, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(67, 'RuleImportAsset', 6, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; Descrição da porta já existe Sim (26)'),
(68, 'RuleCriteria', 26, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(69, 'RuleImportAsset', 6, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; Descrição da porta existe Sim (27)'),
(70, 'RuleCriteria', 27, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(71, 'RuleImportAsset', 6, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (6)'),
(72, 'RuleAction', 6, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(73, 'RuleImportAsset', 7, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(74, 'RuleImportAsset', 7, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item não existe Sim (28)'),
(75, 'RuleCriteria', 28, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(76, 'RuleImportAsset', 7, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; IP existe Sim (29)'),
(77, 'RuleCriteria', 29, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(78, 'RuleImportAsset', 7, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; Descrição da porta existe Sim (30)'),
(79, 'RuleCriteria', 30, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(80, 'RuleImportAsset', 7, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (7)'),
(81, 'RuleAction', 7, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(82, 'RuleImportAsset', 8, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(83, 'RuleImportAsset', 8, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item não existe Sim (31)'),
(84, 'RuleCriteria', 31, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(85, 'RuleImportAsset', 8, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; MAC já existe Sim (32)'),
(86, 'RuleCriteria', 32, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(87, 'RuleImportAsset', 8, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; MAC existe Sim (33)'),
(88, 'RuleCriteria', 33, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(89, 'RuleImportAsset', 8, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Geral &#62; Único critério desta regra nos dados Sim Sim (34)'),
(90, 'RuleCriteria', 34, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(91, 'RuleImportAsset', 8, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (8)'),
(92, 'RuleAction', 8, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(93, 'RuleImportAsset', 9, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(94, 'RuleImportAsset', 9, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item não existe Sim (35)'),
(95, 'RuleCriteria', 35, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(96, 'RuleImportAsset', 9, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; MAC existe Sim (36)'),
(97, 'RuleCriteria', 36, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(98, 'RuleImportAsset', 9, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Geral &#62; Único critério desta regra nos dados Sim Sim (37)'),
(99, 'RuleCriteria', 37, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(100, 'RuleImportAsset', 9, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (9)'),
(101, 'RuleAction', 9, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(102, 'RuleImportAsset', 10, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(103, 'RuleImportAsset', 10, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Computador (38)'),
(104, 'RuleCriteria', 38, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(105, 'RuleImportAsset', 10, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Nome não existe Sim (39)'),
(106, 'RuleCriteria', 39, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(107, 'RuleImportAsset', 10, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Recusar importação Atribuir Sim (10)'),
(108, 'RuleAction', 10, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(109, 'RuleImportAsset', 11, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(110, 'RuleImportAsset', 11, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Computador (40)'),
(111, 'RuleCriteria', 40, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(112, 'RuleImportAsset', 11, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Número de série já existe Sim (41)'),
(113, 'RuleCriteria', 41, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(114, 'RuleImportAsset', 11, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Número de série existe Sim (42)'),
(115, 'RuleCriteria', 42, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(116, 'RuleImportAsset', 11, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; UUID já existe Sim (43)'),
(117, 'RuleCriteria', 43, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(118, 'RuleImportAsset', 11, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; UUID existe Sim (44)'),
(119, 'RuleCriteria', 44, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(120, 'RuleImportAsset', 11, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (11)'),
(121, 'RuleAction', 11, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(122, 'RuleImportAsset', 12, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(123, 'RuleImportAsset', 12, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Computador (45)'),
(124, 'RuleCriteria', 45, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(125, 'RuleImportAsset', 12, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Número de série já existe Sim (46)'),
(126, 'RuleCriteria', 46, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(127, 'RuleImportAsset', 12, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Número de série existe Sim (47)'),
(128, 'RuleCriteria', 47, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(129, 'RuleImportAsset', 12, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; UUID é vazio Sim (48)'),
(130, 'RuleCriteria', 48, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(131, 'RuleImportAsset', 12, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (12)'),
(132, 'RuleAction', 12, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(133, 'RuleImportAsset', 13, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(134, 'RuleImportAsset', 13, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Computador (49)'),
(135, 'RuleCriteria', 49, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(136, 'RuleImportAsset', 13, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; UUID existe Sim (50)'),
(137, 'RuleCriteria', 50, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(138, 'RuleImportAsset', 13, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Número de série existe Sim (51)'),
(139, 'RuleCriteria', 51, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(140, 'RuleImportAsset', 13, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (13)'),
(141, 'RuleAction', 13, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(142, 'RuleImportAsset', 14, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(143, 'RuleImportAsset', 14, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Computador (52)'),
(144, 'RuleCriteria', 52, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(145, 'RuleImportAsset', 14, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Número de série já existe Sim (53)'),
(146, 'RuleCriteria', 53, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(147, 'RuleImportAsset', 14, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Número de série existe Sim (54)'),
(148, 'RuleCriteria', 54, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(149, 'RuleImportAsset', 14, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (14)'),
(150, 'RuleAction', 14, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(151, 'RuleImportAsset', 15, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(152, 'RuleImportAsset', 15, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Computador (55)'),
(153, 'RuleCriteria', 55, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(154, 'RuleImportAsset', 15, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; UUID já existe Sim (56)'),
(155, 'RuleCriteria', 56, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(156, 'RuleImportAsset', 15, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; UUID existe Sim (57)'),
(157, 'RuleCriteria', 57, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(158, 'RuleImportAsset', 15, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (15)'),
(159, 'RuleAction', 15, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(160, 'RuleImportAsset', 16, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(161, 'RuleImportAsset', 16, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Computador (58)'),
(162, 'RuleCriteria', 58, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(163, 'RuleImportAsset', 16, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; MAC já existe Sim (59)'),
(164, 'RuleCriteria', 59, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(165, 'RuleImportAsset', 16, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; MAC existe Sim (60)'),
(166, 'RuleCriteria', 60, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(167, 'RuleImportAsset', 16, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (16)'),
(168, 'RuleAction', 16, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(169, 'RuleImportAsset', 17, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(170, 'RuleImportAsset', 17, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Computador (61)'),
(171, 'RuleCriteria', 61, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(172, 'RuleImportAsset', 17, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Nome já existe Sim (62)'),
(173, 'RuleCriteria', 62, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(174, 'RuleImportAsset', 17, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Nome existe Sim (63)'),
(175, 'RuleCriteria', 63, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(176, 'RuleImportAsset', 17, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (17)'),
(177, 'RuleAction', 17, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(178, 'RuleImportAsset', 18, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(179, 'RuleImportAsset', 18, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Computador (64)'),
(180, 'RuleCriteria', 64, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(181, 'RuleImportAsset', 18, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Número de série existe Sim (65)'),
(182, 'RuleCriteria', 65, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(183, 'RuleImportAsset', 18, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (18)'),
(184, 'RuleAction', 18, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(185, 'RuleImportAsset', 19, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(186, 'RuleImportAsset', 19, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Computador (66)'),
(187, 'RuleCriteria', 66, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(188, 'RuleImportAsset', 19, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; UUID existe Sim (67)'),
(189, 'RuleCriteria', 67, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(190, 'RuleImportAsset', 19, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (19)'),
(191, 'RuleAction', 19, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(192, 'RuleImportAsset', 20, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(193, 'RuleImportAsset', 20, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Computador (68)'),
(194, 'RuleCriteria', 68, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(195, 'RuleImportAsset', 20, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; MAC existe Sim (69)'),
(196, 'RuleCriteria', 69, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(197, 'RuleImportAsset', 20, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (20)'),
(198, 'RuleAction', 20, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(199, 'RuleImportAsset', 21, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(200, 'RuleImportAsset', 21, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Computador (70)'),
(201, 'RuleCriteria', 70, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(202, 'RuleImportAsset', 21, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Nome existe Sim (71)'),
(203, 'RuleCriteria', 71, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(204, 'RuleImportAsset', 21, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (21)'),
(205, 'RuleAction', 21, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(206, 'RuleImportAsset', 22, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(207, 'RuleImportAsset', 22, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Computador (72)'),
(208, 'RuleCriteria', 72, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(209, 'RuleImportAsset', 22, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Recusar importação Atribuir Sim (22)'),
(210, 'RuleAction', 22, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(211, 'RuleImportAsset', 23, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(212, 'RuleImportAsset', 23, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Impressora (73)'),
(213, 'RuleCriteria', 73, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(214, 'RuleImportAsset', 23, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Nome não existe Sim (74)'),
(215, 'RuleCriteria', 74, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(216, 'RuleImportAsset', 23, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Recusar importação Atribuir Sim (23)'),
(217, 'RuleAction', 23, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(218, 'RuleImportAsset', 24, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(219, 'RuleImportAsset', 24, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Impressora (75)'),
(220, 'RuleCriteria', 75, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(221, 'RuleImportAsset', 24, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Número de série existe Sim (76)'),
(222, 'RuleCriteria', 76, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(223, 'RuleImportAsset', 24, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Número de série já existe Sim (77)'),
(224, 'RuleCriteria', 77, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(225, 'RuleImportAsset', 24, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (24)'),
(226, 'RuleAction', 24, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(227, 'RuleImportAsset', 25, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(228, 'RuleImportAsset', 25, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Impressora (78)'),
(229, 'RuleCriteria', 78, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(230, 'RuleImportAsset', 25, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; MAC existe Sim (79)'),
(231, 'RuleCriteria', 79, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(232, 'RuleImportAsset', 25, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; MAC já existe Sim (80)'),
(233, 'RuleCriteria', 80, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(234, 'RuleImportAsset', 25, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (25)'),
(235, 'RuleAction', 25, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(236, 'RuleImportAsset', 26, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(237, 'RuleImportAsset', 26, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Impressora (81)'),
(238, 'RuleCriteria', 81, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(239, 'RuleImportAsset', 26, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Número de série existe Sim (82)'),
(240, 'RuleCriteria', 82, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(241, 'RuleImportAsset', 26, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (26)'),
(242, 'RuleAction', 26, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(243, 'RuleImportAsset', 27, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(244, 'RuleImportAsset', 27, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Impressora (83)'),
(245, 'RuleCriteria', 83, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(246, 'RuleImportAsset', 27, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; MAC existe Sim (84)'),
(247, 'RuleCriteria', 84, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(248, 'RuleImportAsset', 27, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (27)'),
(249, 'RuleAction', 27, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(250, 'RuleImportAsset', 28, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(251, 'RuleImportAsset', 28, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Impressora (85)'),
(252, 'RuleCriteria', 85, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(253, 'RuleImportAsset', 28, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Recusar importação Atribuir Sim (28)'),
(254, 'RuleAction', 28, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(255, 'RuleImportAsset', 29, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(256, 'RuleImportAsset', 29, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Equipamento de rede (86)'),
(257, 'RuleCriteria', 86, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(258, 'RuleImportAsset', 29, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Nome não existe Sim (87)'),
(259, 'RuleCriteria', 87, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(260, 'RuleImportAsset', 29, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Recusar importação Atribuir Sim (29)'),
(261, 'RuleAction', 29, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(262, 'RuleImportAsset', 30, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(263, 'RuleImportAsset', 30, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Equipamento de rede (88)'),
(264, 'RuleCriteria', 88, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(265, 'RuleImportAsset', 30, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Número de série existe Sim (89)'),
(266, 'RuleCriteria', 89, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(267, 'RuleImportAsset', 30, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Número de série já existe Sim (90)'),
(268, 'RuleCriteria', 90, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(269, 'RuleImportAsset', 30, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (30)'),
(270, 'RuleAction', 30, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(271, 'RuleImportAsset', 31, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(272, 'RuleImportAsset', 31, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Equipamento de rede (91)'),
(273, 'RuleCriteria', 91, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(274, 'RuleImportAsset', 31, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; MAC existe Sim (92)'),
(275, 'RuleCriteria', 92, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(276, 'RuleImportAsset', 31, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; MAC já existe Sim (93)'),
(277, 'RuleCriteria', 93, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(278, 'RuleImportAsset', 31, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (31)'),
(279, 'RuleAction', 31, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(280, 'RuleImportAsset', 32, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(281, 'RuleImportAsset', 32, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Equipamento de rede (94)'),
(282, 'RuleCriteria', 94, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(283, 'RuleImportAsset', 32, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Número de série existe Sim (95)'),
(284, 'RuleCriteria', 95, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(285, 'RuleImportAsset', 32, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (32)'),
(286, 'RuleAction', 32, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(287, 'RuleImportAsset', 33, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(288, 'RuleImportAsset', 33, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Equipamento de rede (96)'),
(289, 'RuleCriteria', 96, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(290, 'RuleImportAsset', 33, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; MAC existe Sim (97)'),
(291, 'RuleCriteria', 97, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(292, 'RuleImportAsset', 33, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (33)'),
(293, 'RuleAction', 33, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(294, 'RuleImportAsset', 34, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(295, 'RuleImportAsset', 34, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Equipamento de rede (98)'),
(296, 'RuleCriteria', 98, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(297, 'RuleImportAsset', 34, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Recusar importação Atribuir Sim (34)'),
(298, 'RuleAction', 34, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(299, 'RuleImportAsset', 35, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(300, 'RuleImportAsset', 35, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Periférico (99)'),
(301, 'RuleCriteria', 99, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(302, 'RuleImportAsset', 35, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Número de série existe Sim (100)'),
(303, 'RuleCriteria', 100, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(304, 'RuleImportAsset', 35, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Número de série já existe Sim (101)'),
(305, 'RuleCriteria', 101, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(306, 'RuleImportAsset', 35, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (35)'),
(307, 'RuleAction', 35, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(308, 'RuleImportAsset', 36, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(309, 'RuleImportAsset', 36, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Periférico (102)'),
(310, 'RuleCriteria', 102, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(311, 'RuleImportAsset', 36, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Número de série existe Sim (103)'),
(312, 'RuleCriteria', 103, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(313, 'RuleImportAsset', 36, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (36)'),
(314, 'RuleAction', 36, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(315, 'RuleImportAsset', 37, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(316, 'RuleImportAsset', 37, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Periférico (104)'),
(317, 'RuleCriteria', 104, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(318, 'RuleImportAsset', 37, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Recusar importação Atribuir Sim (37)'),
(319, 'RuleAction', 37, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(320, 'RuleImportAsset', 38, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(321, 'RuleImportAsset', 38, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Monitor (105)'),
(322, 'RuleCriteria', 105, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(323, 'RuleImportAsset', 38, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Número de série existe Sim (106)'),
(324, 'RuleCriteria', 106, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(325, 'RuleImportAsset', 38, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Número de série já existe Sim (107)'),
(326, 'RuleCriteria', 107, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(327, 'RuleImportAsset', 38, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (38)'),
(328, 'RuleAction', 38, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(329, 'RuleImportAsset', 39, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(330, 'RuleImportAsset', 39, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Monitor (108)'),
(331, 'RuleCriteria', 108, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(332, 'RuleImportAsset', 39, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Número de série existe Sim (109)'),
(333, 'RuleCriteria', 109, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(334, 'RuleImportAsset', 39, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (39)'),
(335, 'RuleAction', 39, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(336, 'RuleImportAsset', 40, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(337, 'RuleImportAsset', 40, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Monitor (110)'),
(338, 'RuleCriteria', 110, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(339, 'RuleImportAsset', 40, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Recusar importação Atribuir Sim (40)'),
(340, 'RuleAction', 40, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(341, 'RuleImportAsset', 41, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(342, 'RuleImportAsset', 41, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Telefone (111)'),
(343, 'RuleCriteria', 111, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(344, 'RuleImportAsset', 41, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Nome não existe Sim (112)'),
(345, 'RuleCriteria', 112, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(346, 'RuleImportAsset', 41, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Recusar importação Atribuir Sim (41)'),
(347, 'RuleAction', 41, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(348, 'RuleImportAsset', 42, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(349, 'RuleImportAsset', 42, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Telefone (113)'),
(350, 'RuleCriteria', 113, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(351, 'RuleImportAsset', 42, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Número de série já existe Sim (114)'),
(352, 'RuleCriteria', 114, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(353, 'RuleImportAsset', 42, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Número de série existe Sim (115)'),
(354, 'RuleCriteria', 115, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(355, 'RuleImportAsset', 42, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; UUID já existe Sim (116)'),
(356, 'RuleCriteria', 116, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(357, 'RuleImportAsset', 42, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; UUID existe Sim (117)'),
(358, 'RuleCriteria', 117, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(359, 'RuleImportAsset', 42, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (42)'),
(360, 'RuleAction', 42, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(361, 'RuleImportAsset', 43, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(362, 'RuleImportAsset', 43, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Telefone (118)'),
(363, 'RuleCriteria', 118, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(364, 'RuleImportAsset', 43, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Número de série já existe Sim (119)'),
(365, 'RuleCriteria', 119, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(366, 'RuleImportAsset', 43, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Número de série existe Sim (120)'),
(367, 'RuleCriteria', 120, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(368, 'RuleImportAsset', 43, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; UUID é vazio Sim (121)'),
(369, 'RuleCriteria', 121, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(370, 'RuleImportAsset', 43, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (43)'),
(371, 'RuleAction', 43, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(372, 'RuleImportAsset', 44, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(373, 'RuleImportAsset', 44, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Telefone (122)'),
(374, 'RuleCriteria', 122, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(375, 'RuleImportAsset', 44, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; UUID existe Sim (123)'),
(376, 'RuleCriteria', 123, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(377, 'RuleImportAsset', 44, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Número de série existe Sim (124)'),
(378, 'RuleCriteria', 124, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(379, 'RuleImportAsset', 44, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (44)'),
(380, 'RuleAction', 44, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(381, 'RuleImportAsset', 45, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(382, 'RuleImportAsset', 45, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Telefone (125)'),
(383, 'RuleCriteria', 125, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(384, 'RuleImportAsset', 45, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Número de série já existe Sim (126)'),
(385, 'RuleCriteria', 126, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(386, 'RuleImportAsset', 45, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Número de série existe Sim (127)'),
(387, 'RuleCriteria', 127, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(388, 'RuleImportAsset', 45, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (45)'),
(389, 'RuleAction', 45, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(390, 'RuleImportAsset', 46, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(391, 'RuleImportAsset', 46, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Telefone (128)'),
(392, 'RuleCriteria', 128, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(393, 'RuleImportAsset', 46, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; UUID já existe Sim (129)'),
(394, 'RuleCriteria', 129, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(395, 'RuleImportAsset', 46, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; UUID existe Sim (130)'),
(396, 'RuleCriteria', 130, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(397, 'RuleImportAsset', 46, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (46)'),
(398, 'RuleAction', 46, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(399, 'RuleImportAsset', 47, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(400, 'RuleImportAsset', 47, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Telefone (131)'),
(401, 'RuleCriteria', 131, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(402, 'RuleImportAsset', 47, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; MAC já existe Sim (132)'),
(403, 'RuleCriteria', 132, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(404, 'RuleImportAsset', 47, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; MAC existe Sim (133)'),
(405, 'RuleCriteria', 133, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(406, 'RuleImportAsset', 47, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (47)'),
(407, 'RuleAction', 47, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(408, 'RuleImportAsset', 48, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(409, 'RuleImportAsset', 48, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Telefone (134)'),
(410, 'RuleCriteria', 134, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(411, 'RuleImportAsset', 48, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Nome já existe Sim (135)'),
(412, 'RuleCriteria', 135, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(413, 'RuleImportAsset', 48, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Nome existe Sim (136)'),
(414, 'RuleCriteria', 136, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(415, 'RuleImportAsset', 48, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (48)'),
(416, 'RuleAction', 48, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(417, 'RuleImportAsset', 49, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(418, 'RuleImportAsset', 49, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Telefone (137)'),
(419, 'RuleCriteria', 137, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(420, 'RuleImportAsset', 49, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Número de série existe Sim (138)'),
(421, 'RuleCriteria', 138, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(422, 'RuleImportAsset', 49, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (49)'),
(423, 'RuleAction', 49, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(424, 'RuleImportAsset', 50, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(425, 'RuleImportAsset', 50, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Telefone (139)'),
(426, 'RuleCriteria', 139, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(427, 'RuleImportAsset', 50, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; UUID existe Sim (140)'),
(428, 'RuleCriteria', 140, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(429, 'RuleImportAsset', 50, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (50)'),
(430, 'RuleAction', 50, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(431, 'RuleImportAsset', 51, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(432, 'RuleImportAsset', 51, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Telefone (141)'),
(433, 'RuleCriteria', 141, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(434, 'RuleImportAsset', 51, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; MAC existe Sim (142)'),
(435, 'RuleCriteria', 142, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(436, 'RuleImportAsset', 51, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (51)'),
(437, 'RuleAction', 51, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(438, 'RuleImportAsset', 52, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(439, 'RuleImportAsset', 52, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Telefone (143)'),
(440, 'RuleCriteria', 143, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(441, 'RuleImportAsset', 52, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Nome existe Sim (144)'),
(442, 'RuleCriteria', 144, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(443, 'RuleImportAsset', 52, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (52)'),
(444, 'RuleAction', 52, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(445, 'RuleImportAsset', 53, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(446, 'RuleImportAsset', 53, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Telefone (145)'),
(447, 'RuleCriteria', 145, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(448, 'RuleImportAsset', 53, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Recusar importação Atribuir Sim (53)'),
(449, 'RuleAction', 53, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(450, 'RuleImportAsset', 54, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(451, 'RuleImportAsset', 54, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Cluster (146)'),
(452, 'RuleCriteria', 146, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(453, 'RuleImportAsset', 54, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; UUID existe Sim (147)'),
(454, 'RuleCriteria', 147, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(455, 'RuleImportAsset', 54, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; UUID já existe Sim (148)'),
(456, 'RuleCriteria', 148, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(457, 'RuleImportAsset', 54, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (54)'),
(458, 'RuleAction', 54, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(459, 'RuleImportAsset', 55, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(460, 'RuleImportAsset', 55, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Cluster (149)'),
(461, 'RuleCriteria', 149, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(462, 'RuleImportAsset', 55, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; UUID existe Sim (150)'),
(463, 'RuleCriteria', 150, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(464, 'RuleImportAsset', 55, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (55)'),
(465, 'RuleAction', 55, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(466, 'RuleImportAsset', 56, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(467, 'RuleImportAsset', 56, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Cluster (151)'),
(468, 'RuleCriteria', 151, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(469, 'RuleImportAsset', 56, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Recusar importação Atribuir Sim (56)'),
(470, 'RuleAction', 56, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(471, 'RuleImportAsset', 57, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(472, 'RuleImportAsset', 57, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Armário (152)'),
(473, 'RuleCriteria', 152, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(474, 'RuleImportAsset', 57, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Número de série existe Sim (153)'),
(475, 'RuleCriteria', 153, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(476, 'RuleImportAsset', 57, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Número de série já existe Sim (154)'),
(477, 'RuleCriteria', 154, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(478, 'RuleImportAsset', 57, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (57)'),
(479, 'RuleAction', 57, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(480, 'RuleImportAsset', 58, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(481, 'RuleImportAsset', 58, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Armário (155)'),
(482, 'RuleCriteria', 155, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(483, 'RuleImportAsset', 58, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Número de série existe Sim (156)'),
(484, 'RuleCriteria', 156, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(485, 'RuleImportAsset', 58, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (58)'),
(486, 'RuleAction', 58, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(487, 'RuleImportAsset', 59, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(488, 'RuleImportAsset', 59, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Armário (157)'),
(489, 'RuleCriteria', 157, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(490, 'RuleImportAsset', 59, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Recusar importação Atribuir Sim (59)'),
(491, 'RuleAction', 59, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(492, 'RuleImportAsset', 60, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(493, 'RuleImportAsset', 60, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Nome não existe Sim (158)'),
(494, 'RuleCriteria', 158, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(495, 'RuleImportAsset', 60, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Recusar importação Atribuir Sim (60)'),
(496, 'RuleAction', 60, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(497, 'RuleImportAsset', 61, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(498, 'RuleImportAsset', 61, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Número de série existe Sim (159)'),
(499, 'RuleCriteria', 159, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(500, 'RuleImportAsset', 61, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Número de série já existe Sim (160)'),
(501, 'RuleCriteria', 160, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(502, 'RuleImportAsset', 61, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (61)'),
(503, 'RuleAction', 61, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(504, 'RuleImportAsset', 62, '0', 20, '', '2026-03-01 14:17:02', 0, '', '');
INSERT INTO `glpi_logs` (`id`, `itemtype`, `items_id`, `itemtype_link`, `linked_action`, `user_name`, `date_mod`, `id_search_option`, `old_value`, `new_value`) VALUES
(505, 'RuleImportAsset', 62, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; MAC existe Sim (161)'),
(506, 'RuleCriteria', 161, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(507, 'RuleImportAsset', 62, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; MAC já existe Sim (162)'),
(508, 'RuleCriteria', 162, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(509, 'RuleImportAsset', 62, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (62)'),
(510, 'RuleAction', 62, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(511, 'RuleImportAsset', 63, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(512, 'RuleImportAsset', 63, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Número de série existe Sim (163)'),
(513, 'RuleCriteria', 163, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(514, 'RuleImportAsset', 63, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (63)'),
(515, 'RuleAction', 63, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(516, 'RuleImportAsset', 64, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(517, 'RuleImportAsset', 64, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Porta de rede &#62; MAC existe Sim (164)'),
(518, 'RuleCriteria', 164, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(519, 'RuleImportAsset', 64, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (64)'),
(520, 'RuleAction', 64, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(521, 'RuleImportAsset', 65, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(522, 'RuleImportAsset', 65, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Nenhum tipo de item definido (165)'),
(523, 'RuleCriteria', 165, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(524, 'RuleImportAsset', 65, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Recusar importação Atribuir Sim (65)'),
(525, 'RuleAction', 65, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(526, 'RuleImportAsset', 66, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(527, 'RuleImportAsset', 66, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Instância da base de dados (166)'),
(528, 'RuleCriteria', 166, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(529, 'RuleImportAsset', 66, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Nome existe Sim (167)'),
(530, 'RuleCriteria', 167, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(531, 'RuleImportAsset', 66, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Nome já existe Sim (168)'),
(532, 'RuleCriteria', 168, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(533, 'RuleImportAsset', 66, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso ligado já existe Sim (169)'),
(534, 'RuleCriteria', 169, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(535, 'RuleImportAsset', 66, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (66)'),
(536, 'RuleAction', 66, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(537, 'RuleImportAsset', 67, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(538, 'RuleImportAsset', 67, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Instância da base de dados (170)'),
(539, 'RuleCriteria', 170, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(540, 'RuleImportAsset', 67, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Nome existe Sim (171)'),
(541, 'RuleCriteria', 171, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(542, 'RuleImportAsset', 67, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (67)'),
(543, 'RuleAction', 67, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(544, 'RuleImportAsset', 68, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(545, 'RuleImportAsset', 68, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Instância da base de dados (172)'),
(546, 'RuleCriteria', 172, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(547, 'RuleImportAsset', 68, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Recusar importação Atribuir Sim (68)'),
(548, 'RuleAction', 68, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(549, 'RuleImportAsset', 69, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(550, 'RuleImportAsset', 69, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Recurso não gerido (173)'),
(551, 'RuleCriteria', 173, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(552, 'RuleImportAsset', 69, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Nome existe Sim (174)'),
(553, 'RuleCriteria', 174, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(554, 'RuleImportAsset', 69, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Nome já existe Sim (175)'),
(555, 'RuleCriteria', 175, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(556, 'RuleImportAsset', 69, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (69)'),
(557, 'RuleAction', 69, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(558, 'RuleImportAsset', 70, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(559, 'RuleImportAsset', 70, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Recurso não gerido (176)'),
(560, 'RuleCriteria', 176, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(561, 'RuleImportAsset', 70, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Nome existe Sim (177)'),
(562, 'RuleCriteria', 177, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(563, 'RuleImportAsset', 70, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Ligação com o inventário Atribuir Ligar se possível (70)'),
(564, 'RuleAction', 70, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(565, 'RuleImportAsset', 71, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(566, 'RuleImportAsset', 71, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Recurso &#62; Tipo de item é Recurso não gerido (178)'),
(567, 'RuleCriteria', 178, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(568, 'RuleImportAsset', 71, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Recusar importação Atribuir Sim (71)'),
(569, 'RuleAction', 71, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(570, 'Config', 1, '', 0, '', '2026-03-01 14:17:02', 1, 'initialized_rules_collections []', '[\"RuleImportAssetCollection\"]'),
(571, 'RuleMailCollector', 72, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(572, 'RuleMailCollector', 72, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Assunto do cabeçalho de email expressão regular confere /.*/ (179)'),
(573, 'RuleCriteria', 179, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(574, 'RuleMailCollector', 72, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Entidade Atribuir Entidade de raiz (72)'),
(575, 'RuleAction', 72, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(576, 'RuleMailCollector', 73, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(577, 'RuleMailCollector', 73, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Cabeçalho de email X-Auto-Response-Suppress expressão regular confere /S+/ (180)'),
(578, 'RuleCriteria', 180, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(579, 'RuleMailCollector', 73, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Rejeitar email (sem resposta de email) Atribuir Sim (73)'),
(580, 'RuleAction', 73, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(581, 'RuleMailCollector', 74, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(582, 'RuleMailCollector', 74, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Cabeçalho de email Auto-Submitted expressão regular confere /^(?!.*no).+$/i (181)'),
(583, 'RuleCriteria', 181, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(584, 'RuleMailCollector', 74, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Rejeitar email (sem resposta de email) Atribuir Sim (74)'),
(585, 'RuleAction', 74, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(586, 'Config', 1, '', 0, '', '2026-03-01 14:17:02', 1, 'initialized_rules_collections [\"RuleImportAssetCollection\"]', '[\"RuleImportAssetCollection\",\"RuleMailCollectorCollection\"]'),
(587, 'RuleRight', 75, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(588, 'RuleRight', 75, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Tipo de autenticação é Directório LDAP: (182)'),
(589, 'RuleCriteria', 182, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(590, 'RuleRight', 75, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Tipo de autenticação é Servidor de email: (183)'),
(591, 'RuleCriteria', 183, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(592, 'RuleRight', 75, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Entidade Atribuir Entidade de raiz (75)'),
(593, 'RuleAction', 75, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(594, 'Config', 1, '', 0, '', '2026-03-01 14:17:02', 1, 'initialized_rules_collections [\"RuleImportAssetCollection\",\"RuleMailCollectorCollection\"]', '[\"RuleImportAssetCollection\",\"RuleMailCollectorCollection\",\"RuleRightCollection\"]'),
(595, 'RuleSoftwareCategory', 76, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(596, 'RuleSoftwareCategory', 76, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Software é * (184)'),
(597, 'RuleCriteria', 184, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(598, 'RuleSoftwareCategory', 76, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Importar categoria da ferramenta de inventário Atribuir Sim (76)'),
(599, 'RuleAction', 76, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(600, 'Config', 1, '', 0, '', '2026-03-01 14:17:02', 1, 'initialized_rules_collections [\"RuleImportAssetCollection\",\"RuleMailCollectorCollection\",\"RuleRightCollection\"]', '[\"RuleImportAssetCollection\",\"RuleMailCollectorCollection\",\"RuleRightCollection\",\"RuleSoftwareCategoryCollection\"]'),
(601, 'RuleTicket', 77, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(602, 'RuleTicket', 77, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Localização do ticket não existe Sim (185)'),
(603, 'RuleCriteria', 185, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(604, 'RuleTicket', 77, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Localização do item existe Sim (186)'),
(605, 'RuleCriteria', 186, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(606, 'RuleTicket', 77, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Localização Copiar do item Sim (77)'),
(607, 'RuleAction', 77, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(608, 'RuleTicket', 78, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(609, 'RuleTicket', 78, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Localização do ticket não existe Sim (187)'),
(610, 'RuleCriteria', 187, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(611, 'RuleTicket', 78, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Localização do requerente existe Sim (188)'),
(612, 'RuleCriteria', 188, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(613, 'RuleTicket', 78, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Localização Copiar do utilizador Sim (78)'),
(614, 'RuleAction', 78, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(615, 'Config', 1, '', 0, '', '2026-03-01 14:17:02', 1, 'initialized_rules_collections [\"RuleImportAssetCollection\",\"RuleMailCollectorCollection\",\"RuleRightCollection\",\"RuleSoftwareCategoryCollection\"]', '[\"RuleImportAssetCollection\",\"RuleMailCollectorCollection\",\"RuleRightCollection\",\"RuleSoftwareCategoryCollection\",\"RuleTicketCollection\"]'),
(616, 'RuleAsset', 79, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(617, 'RuleAsset', 79, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Tipo de item é Computador (189)'),
(618, 'RuleCriteria', 189, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(619, 'RuleAsset', 79, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Inventário automático é Sim (190)'),
(620, 'RuleCriteria', 190, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(621, 'RuleAsset', 79, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Nome de utilizador alternativo expressão regular confere /(.*)@/ (191)'),
(622, 'RuleCriteria', 191, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(623, 'RuleAsset', 79, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Utilizador com base em informações de contacto Atribuir valor da expressão regular #0 (79)'),
(624, 'RuleAction', 79, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(625, 'RuleAsset', 80, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(626, 'RuleAsset', 80, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Tipo de item é Computador (192)'),
(627, 'RuleCriteria', 192, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(628, 'RuleAsset', 80, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Inventário automático é Sim (193)'),
(629, 'RuleCriteria', 193, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(630, 'RuleAsset', 80, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Nome de utilizador alternativo expressão regular confere /(.*)[,|/]/ (194)'),
(631, 'RuleCriteria', 194, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(632, 'RuleAsset', 80, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Utilizador com base em informações de contacto Atribuir valor da expressão regular #0 (80)'),
(633, 'RuleAction', 80, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(634, 'RuleAsset', 81, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(635, 'RuleAsset', 81, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Tipo de item é Computador (195)'),
(636, 'RuleCriteria', 195, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(637, 'RuleAsset', 81, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Inventário automático é Sim (196)'),
(638, 'RuleCriteria', 196, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(639, 'RuleAsset', 81, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Nome de utilizador alternativo expressão regular confere /(.*)/ (197)'),
(640, 'RuleCriteria', 197, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(641, 'RuleAsset', 81, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Utilizador com base em informações de contacto Atribuir valor da expressão regular #0 (81)'),
(642, 'RuleAction', 81, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(643, 'Config', 1, '', 0, '', '2026-03-01 14:17:02', 1, 'initialized_rules_collections [\"RuleImportAssetCollection\",\"RuleMailCollectorCollection\",\"RuleRightCollection\",\"RuleSoftwareCategoryCollection\",\"RuleTicketCollection\"]', '[\"RuleImportAssetCollection\",\"RuleMailCollectorCollection\",\"RuleRightCollection\",\"RuleSoftwareCategoryCollection\",\"RuleTicketCollection\",\"RuleAssetCollection\"]'),
(644, 'RuleDictionnaryOperatingSystem', 82, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(645, 'RuleDictionnaryOperatingSystem', 82, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Indisponível expressão regular confere /(SUSE|SunOS|Red Hat|CentOS|Ubuntu|Debian|Fedora|AlmaLinux|Oracle|Amazon Linux)(?:D+|)([d.]*) ?(?:(?([w ]+))?)?/ (198)'),
(646, 'RuleCriteria', 198, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(647, 'RuleDictionnaryOperatingSystem', 82, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Sistema operativo Adicionar o resulta da expressão regular #0 (82)'),
(648, 'RuleAction', 82, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(649, 'RuleDictionnaryOperatingSystem', 83, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(650, 'RuleDictionnaryOperatingSystem', 83, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Indisponível expressão regular confere /(Microsoft)(?&#62;(R)|®)? (Windows) (XP|d.d|d{1,4}|Vista)(™)? ?(.*)/ (199)'),
(651, 'RuleCriteria', 199, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(652, 'RuleDictionnaryOperatingSystem', 83, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Sistema operativo Adicionar o resulta da expressão regular #1 (83)'),
(653, 'RuleAction', 83, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(654, 'RuleDictionnaryOperatingSystem', 84, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(655, 'RuleDictionnaryOperatingSystem', 84, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Indisponível expressão regular confere /(Microsoft)(?&#62;(R)|®)? (?:(Hyper-V|Windows)(?:(R))?) ((?:Server|))(?:(R)|®)? (d{4}(?: R2)?)(?:[,s]++)?([^s]*)(?: Edition(?: x64)?)?$/ (20'),
(656, 'RuleCriteria', 200, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(657, 'RuleDictionnaryOperatingSystem', 84, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Sistema operativo Adicionar o resulta da expressão regular #1 #2 (84)'),
(658, 'RuleAction', 84, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(659, 'Config', 1, '', 0, '', '2026-03-01 14:17:02', 1, 'initialized_rules_collections [\"RuleImportAssetCollection\",\"RuleMailCollectorCollection\",\"RuleRightCollection\",\"RuleSoftwareCategoryCollection\",\"RuleTicketCollection\",\"RuleAssetCol', '[\"RuleImportAssetCollection\",\"RuleMailCollectorCollection\",\"RuleRightCollection\",\"RuleSoftwareCategoryCollection\",\"RuleTicketCollection\",\"RuleAssetCollection\",\"RuleDictionnaryOpera'),
(660, 'RuleDictionnaryOperatingSystemVersion', 85, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(661, 'RuleDictionnaryOperatingSystemVersion', 85, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Sistema operativo expressão regular confere /(SUSE|SunOS|Red Hat|CentOS|Ubuntu|Debian|Fedora|AlmaLinux|Oracle)(?:D+|)([d.]+) ?(?:(?([w ]+))?)?/ (201)'),
(662, 'RuleCriteria', 201, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(663, 'RuleDictionnaryOperatingSystemVersion', 85, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Versão Adicionar o resulta da expressão regular #1 (85)'),
(664, 'RuleAction', 85, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(665, 'RuleDictionnaryOperatingSystemVersion', 86, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(666, 'RuleDictionnaryOperatingSystemVersion', 86, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Sistema operativo expressão regular confere /(Microsoft)(?&#62;(R)|®)? (Windows) (XP|d.d|d{1,4}|Vista)(™)? ?(.*)/ (202)'),
(667, 'RuleCriteria', 202, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(668, 'RuleDictionnaryOperatingSystemVersion', 86, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Versão Adicionar o resulta da expressão regular #2 (86)'),
(669, 'RuleAction', 86, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(670, 'RuleDictionnaryOperatingSystemVersion', 87, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(671, 'RuleDictionnaryOperatingSystemVersion', 87, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Sistema operativo expressão regular confere /(Microsoft)(?&#62;(R)|®)? (?:(Hyper-V|Windows)(?:(R))?) ((?:Server|))(?:(R)|®)? (d{4}(?: R2)?)(?:[,s]++)?([^s]*)(?: Edition(?: x64)?)?$'),
(672, 'RuleCriteria', 203, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(673, 'RuleDictionnaryOperatingSystemVersion', 87, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Versão Adicionar o resulta da expressão regular #3 (87)'),
(674, 'RuleAction', 87, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(675, 'Config', 1, '', 0, '', '2026-03-01 14:17:02', 1, 'initialized_rules_collections [\"RuleImportAssetCollection\",\"RuleMailCollectorCollection\",\"RuleRightCollection\",\"RuleSoftwareCategoryCollection\",\"RuleTicketCollection\",\"RuleAssetCol', '[\"RuleImportAssetCollection\",\"RuleMailCollectorCollection\",\"RuleRightCollection\",\"RuleSoftwareCategoryCollection\",\"RuleTicketCollection\",\"RuleAssetCollection\",\"RuleDictionnaryOpera'),
(676, 'RuleDictionnaryOperatingSystemEdition', 88, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(677, 'RuleDictionnaryOperatingSystemEdition', 88, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Sistema operativo expressão regular confere /(SUSE|SunOS|Red Hat|CentOS|Ubuntu|Debian|Fedora|AlmaLinux|Oracle)(?:D+|)([d.]+) ?(?:(?([w ]+))?)?/ (204)'),
(678, 'RuleCriteria', 204, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(679, 'RuleDictionnaryOperatingSystemEdition', 88, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Edição Adicionar o resulta da expressão regular #2 (88)'),
(680, 'RuleAction', 88, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(681, 'RuleDictionnaryOperatingSystemEdition', 89, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(682, 'RuleDictionnaryOperatingSystemEdition', 89, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Sistema operativo expressão regular confere /(Microsoft)(?&#62;(R)|®)? (Windows) (XP|d.d|d{1,4}|Vista)(™)? ?(.*)/ (205)'),
(683, 'RuleCriteria', 205, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(684, 'RuleDictionnaryOperatingSystemEdition', 89, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Edição Adicionar o resulta da expressão regular #4 (89)'),
(685, 'RuleAction', 89, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(686, 'RuleDictionnaryOperatingSystemEdition', 90, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(687, 'RuleDictionnaryOperatingSystemEdition', 90, 'RuleCriteria', 17, '', '2026-03-01 14:17:02', 0, '', 'Sistema operativo expressão regular confere /(Microsoft)(?&#62;(R)|®)? (?:(Hyper-V|Windows)(?:(R))?) ((?:Server|))(?:(R)|®)? (d{4}(?: R2)?)(?:[,s]++)?([^s]*)(?: Edition(?: x64)?)?$'),
(688, 'RuleCriteria', 206, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(689, 'RuleDictionnaryOperatingSystemEdition', 90, 'RuleAction', 17, '', '2026-03-01 14:17:02', 0, '', 'Edição Adicionar o resulta da expressão regular #4 (90)'),
(690, 'RuleAction', 90, '0', 20, '', '2026-03-01 14:17:02', 0, '', ''),
(691, 'Config', 1, '', 0, '', '2026-03-01 14:17:02', 1, 'initialized_rules_collections [\"RuleImportAssetCollection\",\"RuleMailCollectorCollection\",\"RuleRightCollection\",\"RuleSoftwareCategoryCollection\",\"RuleTicketCollection\",\"RuleAssetCol', '{...}'),
(692, 'Config', 1, '', 0, '', '2026-03-01 14:17:02', 1, 'language en_GB', 'pt_PT'),
(693, 'Config', 1, '', 0, '', '2026-03-01 14:17:02', 1, 'version FILLED AT INSTALL', '10.0.18'),
(694, 'Config', 1, '', 0, '', '2026-03-01 14:17:02', 1, 'dbversion FILLED AT INSTALL', '10.0.18@d64066799f068b16ee973b377bdd13f984fe062a'),
(695, 'Config', 1, '', 0, '', '2026-03-01 14:17:15', 1, 'registration_uuid ', '1UhkEoDaflBYPIoIaqxEfppjaZtXdFQ8dldqgLVu'),
(696, 'User', 5, '', 0, 'glpi (2)', '2026-03-01 14:22:16', 8, '1', '0'),
(697, 'User', 3, '', 0, 'glpi (2)', '2026-03-01 14:22:39', 8, '1', '0'),
(698, 'User', 4, '', 0, 'glpi (2)', '2026-03-01 14:23:13', 8, '1', '0'),
(699, 'User', 2, '', 0, 'incv (2)', '2026-03-01 21:17:35', 1, 'glpi', 'incv'),
(700, 'User', 2, '', 0, 'incv (2)', '2026-03-01 21:17:35', 150, '', '72/2_69a4acef0b072.jpg'),
(701, 'Config', 1, '', 0, 'incv (2)', '2026-03-01 21:40:00', 1, 'use_notifications 0', '1'),
(702, 'Config', 1, '', 0, 'incv (2)', '2026-03-01 21:40:10', 1, 'notifications_mailing 0', '1'),
(703, 'NotificationMailingSetting', 1, '', 0, 'incv (2)', '2026-03-01 21:41:56', 1, 'admin_email admsys@localhost', 'suporteincv@suporteincv.com'),
(704, 'NotificationMailingSetting', 1, '', 0, 'incv (2)', '2026-03-01 21:41:56', 1, 'admin_email_name ', 'incv'),
(705, 'Profile', 1, '', 0, 'incv (2)', '2026-03-05 13:01:31', 1, 'Self-Service', 'DEF - Direção de Estrangeiros e Fronteiras'),
(706, 'Profile', 1, '', 0, 'incv (2)', '2026-03-05 13:02:12', 1, 'DEF - Direção de Estrangeiros e Fronteiras', 'SINIAC '),
(707, 'Profile', 1, '', 0, 'incv (2)', '2026-03-05 13:03:17', 1, 'SINIAC ', 'Nosi - Núcleo Operacional de Sociedade de Informação'),
(708, 'Profile', 1, '', 0, 'incv (2)', '2026-03-05 13:05:47', 1, 'Nosi - Núcleo Operacional de Sociedade de Informação', 'DGRNI - Direção Geral dos Registos, Notariado e Identificação'),
(709, 'Profile', 1, '', 0, 'incv (2)', '2026-03-05 13:06:28', 1, 'DGRNI - Direção Geral dos Registos, Notariado e Identificação', 'IMIJ - Instituto de Inovação e Modernização da Justiça'),
(710, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'agent (754)'),
(711, 'ProfileRight', 754, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(712, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'appliance (755)'),
(713, 'ProfileRight', 755, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(714, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'backup (756)'),
(715, 'ProfileRight', 756, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(716, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'bookmark_public (757)'),
(717, 'ProfileRight', 757, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(718, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'budget (758)'),
(719, 'ProfileRight', 758, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(720, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'cable_management (759)'),
(721, 'ProfileRight', 759, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(722, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'calendar (760)'),
(723, 'ProfileRight', 760, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(724, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'cartridge (761)'),
(725, 'ProfileRight', 761, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(726, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'certificate (762)'),
(727, 'ProfileRight', 762, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(728, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'change (763)'),
(729, 'ProfileRight', 763, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(730, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'changevalidation (764)'),
(731, 'ProfileRight', 764, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(732, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'cluster (765)'),
(733, 'ProfileRight', 765, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(734, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'computer (766)'),
(735, 'ProfileRight', 766, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(736, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'config (767)'),
(737, 'ProfileRight', 767, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(738, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'consumable (768)'),
(739, 'ProfileRight', 768, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(740, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'contact_enterprise (769)'),
(741, 'ProfileRight', 769, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(742, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'contract (770)'),
(743, 'ProfileRight', 770, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(744, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'dashboard (771)'),
(745, 'ProfileRight', 771, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(746, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'database (772)'),
(747, 'ProfileRight', 772, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(748, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'datacenter (773)'),
(749, 'ProfileRight', 773, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(750, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'device (774)'),
(751, 'ProfileRight', 774, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(752, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'devicesimcard_pinpuk (775)'),
(753, 'ProfileRight', 775, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(754, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'document (776)'),
(755, 'ProfileRight', 776, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(756, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'domain (777)'),
(757, 'ProfileRight', 777, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(758, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'dropdown (778)'),
(759, 'ProfileRight', 778, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(760, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'entity (779)'),
(761, 'ProfileRight', 779, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(762, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'externalevent (780)'),
(763, 'ProfileRight', 780, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(764, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'followup (781)'),
(765, 'ProfileRight', 781, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(766, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'global_validation (782)'),
(767, 'ProfileRight', 782, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(768, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'group (783)'),
(769, 'ProfileRight', 783, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(770, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'infocom (784)'),
(771, 'ProfileRight', 784, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(772, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'internet (785)'),
(773, 'ProfileRight', 785, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(774, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'inventory (786)'),
(775, 'ProfileRight', 786, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(776, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'itilcategory (787)'),
(777, 'ProfileRight', 787, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(778, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'itilfollowuptemplate (788)'),
(779, 'ProfileRight', 788, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(780, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'itiltemplate (789)'),
(781, 'ProfileRight', 789, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(782, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'knowbase (790)'),
(783, 'ProfileRight', 790, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(784, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'knowbasecategory (791)'),
(785, 'ProfileRight', 791, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(786, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'license (792)'),
(787, 'ProfileRight', 792, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(788, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'line (793)'),
(789, 'ProfileRight', 793, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(790, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'lineoperator (794)'),
(791, 'ProfileRight', 794, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(792, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'link (795)'),
(793, 'ProfileRight', 795, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(794, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'location (796)'),
(795, 'ProfileRight', 796, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(796, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'locked_field (797)'),
(797, 'ProfileRight', 797, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(798, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'logs (798)'),
(799, 'ProfileRight', 798, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(800, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'monitor (799)'),
(801, 'ProfileRight', 799, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(802, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'networking (800)'),
(803, 'ProfileRight', 800, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(804, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'notification (801)'),
(805, 'ProfileRight', 801, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(806, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'password_update (802)'),
(807, 'ProfileRight', 802, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(808, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'pendingreason (803)'),
(809, 'ProfileRight', 803, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(810, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'peripheral (804)'),
(811, 'ProfileRight', 804, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(812, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'personalization (805)'),
(813, 'ProfileRight', 805, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(814, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'phone (806)'),
(815, 'ProfileRight', 806, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(816, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'planning (807)'),
(817, 'ProfileRight', 807, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(818, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'printer (808)'),
(819, 'ProfileRight', 808, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(820, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'problem (809)'),
(821, 'ProfileRight', 809, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(822, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'profile (810)'),
(823, 'ProfileRight', 810, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(824, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'project (811)'),
(825, 'ProfileRight', 811, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(826, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'projecttask (812)'),
(827, 'ProfileRight', 812, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(828, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'queuednotification (813)'),
(829, 'ProfileRight', 813, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(830, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'recurrentchange (814)'),
(831, 'ProfileRight', 814, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(832, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'refusedequipment (815)'),
(833, 'ProfileRight', 815, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(834, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'reminder_public (816)'),
(835, 'ProfileRight', 816, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(836, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'reports (817)'),
(837, 'ProfileRight', 817, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(838, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'reservation (818)'),
(839, 'ProfileRight', 818, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(840, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'rssfeed_public (819)'),
(841, 'ProfileRight', 819, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(842, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'rule_asset (820)'),
(843, 'ProfileRight', 820, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(844, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'rule_dictionnary_dropdown (821)'),
(845, 'ProfileRight', 821, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(846, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'rule_dictionnary_printer (822)'),
(847, 'ProfileRight', 822, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(848, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'rule_dictionnary_software (823)'),
(849, 'ProfileRight', 823, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(850, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'rule_import (824)'),
(851, 'ProfileRight', 824, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(852, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'rule_ldap (825)'),
(853, 'ProfileRight', 825, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(854, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'rule_location (826)'),
(855, 'ProfileRight', 826, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(856, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'rule_mailcollector (827)'),
(857, 'ProfileRight', 827, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(858, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'rule_softwarecategories (828)'),
(859, 'ProfileRight', 828, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(860, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'rule_ticket (829)'),
(861, 'ProfileRight', 829, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(862, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'search_config (830)'),
(863, 'ProfileRight', 830, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(864, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'show_group_hardware (831)'),
(865, 'ProfileRight', 831, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(866, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'slm (832)'),
(867, 'ProfileRight', 832, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(868, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'snmpcredential (833)'),
(869, 'ProfileRight', 833, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(870, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'software (834)'),
(871, 'ProfileRight', 834, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(872, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'solutiontemplate (835)'),
(873, 'ProfileRight', 835, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(874, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'state (836)'),
(875, 'ProfileRight', 836, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(876, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'statistic (837)'),
(877, 'ProfileRight', 837, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(878, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'system_logs (838)'),
(879, 'ProfileRight', 838, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(880, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'task (839)'),
(881, 'ProfileRight', 839, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(882, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'taskcategory (840)'),
(883, 'ProfileRight', 840, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(884, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'ticket (841)'),
(885, 'ProfileRight', 841, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(886, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'ticketcost (842)'),
(887, 'ProfileRight', 842, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(888, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'ticketrecurrent (843)'),
(889, 'ProfileRight', 843, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(890, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'ticketvalidation (844)'),
(891, 'ProfileRight', 844, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(892, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'transfer (845)'),
(893, 'ProfileRight', 845, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(894, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'typedoc (846)'),
(895, 'ProfileRight', 846, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(896, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'unmanaged (847)'),
(897, 'ProfileRight', 847, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(898, 'Profile', 9, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:07:56', 0, '', 'user (848)'),
(899, 'ProfileRight', 848, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(900, 'Profile', 9, '0', 20, 'incv (2)', '2026-03-05 13:07:56', 0, '', ''),
(901, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'agent (849)'),
(902, 'ProfileRight', 849, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(903, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'appliance (850)'),
(904, 'ProfileRight', 850, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(905, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'backup (851)'),
(906, 'ProfileRight', 851, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(907, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'bookmark_public (852)'),
(908, 'ProfileRight', 852, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(909, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'budget (853)'),
(910, 'ProfileRight', 853, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(911, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'cable_management (854)'),
(912, 'ProfileRight', 854, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(913, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'calendar (855)'),
(914, 'ProfileRight', 855, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(915, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'cartridge (856)'),
(916, 'ProfileRight', 856, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(917, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'certificate (857)'),
(918, 'ProfileRight', 857, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(919, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'change (858)'),
(920, 'ProfileRight', 858, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(921, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'changevalidation (859)'),
(922, 'ProfileRight', 859, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(923, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'cluster (860)'),
(924, 'ProfileRight', 860, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(925, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'computer (861)'),
(926, 'ProfileRight', 861, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(927, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'config (862)'),
(928, 'ProfileRight', 862, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(929, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'consumable (863)'),
(930, 'ProfileRight', 863, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(931, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'contact_enterprise (864)'),
(932, 'ProfileRight', 864, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(933, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'contract (865)'),
(934, 'ProfileRight', 865, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(935, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'dashboard (866)'),
(936, 'ProfileRight', 866, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(937, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'database (867)'),
(938, 'ProfileRight', 867, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(939, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'datacenter (868)'),
(940, 'ProfileRight', 868, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(941, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'device (869)'),
(942, 'ProfileRight', 869, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(943, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'devicesimcard_pinpuk (870)'),
(944, 'ProfileRight', 870, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(945, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'document (871)'),
(946, 'ProfileRight', 871, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(947, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'domain (872)'),
(948, 'ProfileRight', 872, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(949, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'dropdown (873)'),
(950, 'ProfileRight', 873, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(951, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'entity (874)'),
(952, 'ProfileRight', 874, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(953, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'externalevent (875)'),
(954, 'ProfileRight', 875, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(955, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'followup (876)'),
(956, 'ProfileRight', 876, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(957, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'global_validation (877)'),
(958, 'ProfileRight', 877, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(959, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'group (878)'),
(960, 'ProfileRight', 878, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(961, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'infocom (879)'),
(962, 'ProfileRight', 879, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(963, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'internet (880)'),
(964, 'ProfileRight', 880, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(965, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'inventory (881)'),
(966, 'ProfileRight', 881, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(967, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'itilcategory (882)'),
(968, 'ProfileRight', 882, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(969, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'itilfollowuptemplate (883)'),
(970, 'ProfileRight', 883, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(971, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'itiltemplate (884)'),
(972, 'ProfileRight', 884, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(973, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'knowbase (885)'),
(974, 'ProfileRight', 885, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(975, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'knowbasecategory (886)'),
(976, 'ProfileRight', 886, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(977, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'license (887)'),
(978, 'ProfileRight', 887, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(979, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'line (888)'),
(980, 'ProfileRight', 888, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(981, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'lineoperator (889)'),
(982, 'ProfileRight', 889, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(983, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'link (890)'),
(984, 'ProfileRight', 890, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(985, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'location (891)'),
(986, 'ProfileRight', 891, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(987, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'locked_field (892)'),
(988, 'ProfileRight', 892, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(989, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'logs (893)'),
(990, 'ProfileRight', 893, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(991, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'monitor (894)'),
(992, 'ProfileRight', 894, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(993, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'networking (895)');
INSERT INTO `glpi_logs` (`id`, `itemtype`, `items_id`, `itemtype_link`, `linked_action`, `user_name`, `date_mod`, `id_search_option`, `old_value`, `new_value`) VALUES
(994, 'ProfileRight', 895, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(995, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'notification (896)'),
(996, 'ProfileRight', 896, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(997, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'password_update (897)'),
(998, 'ProfileRight', 897, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(999, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'pendingreason (898)'),
(1000, 'ProfileRight', 898, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1001, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'peripheral (899)'),
(1002, 'ProfileRight', 899, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1003, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'personalization (900)'),
(1004, 'ProfileRight', 900, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1005, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'phone (901)'),
(1006, 'ProfileRight', 901, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1007, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'planning (902)'),
(1008, 'ProfileRight', 902, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1009, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'printer (903)'),
(1010, 'ProfileRight', 903, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1011, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'problem (904)'),
(1012, 'ProfileRight', 904, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1013, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'profile (905)'),
(1014, 'ProfileRight', 905, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1015, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'project (906)'),
(1016, 'ProfileRight', 906, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1017, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'projecttask (907)'),
(1018, 'ProfileRight', 907, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1019, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'queuednotification (908)'),
(1020, 'ProfileRight', 908, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1021, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'recurrentchange (909)'),
(1022, 'ProfileRight', 909, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1023, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'refusedequipment (910)'),
(1024, 'ProfileRight', 910, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1025, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'reminder_public (911)'),
(1026, 'ProfileRight', 911, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1027, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'reports (912)'),
(1028, 'ProfileRight', 912, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1029, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'reservation (913)'),
(1030, 'ProfileRight', 913, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1031, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'rssfeed_public (914)'),
(1032, 'ProfileRight', 914, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1033, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'rule_asset (915)'),
(1034, 'ProfileRight', 915, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1035, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'rule_dictionnary_dropdown (916)'),
(1036, 'ProfileRight', 916, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1037, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'rule_dictionnary_printer (917)'),
(1038, 'ProfileRight', 917, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1039, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'rule_dictionnary_software (918)'),
(1040, 'ProfileRight', 918, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1041, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'rule_import (919)'),
(1042, 'ProfileRight', 919, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1043, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'rule_ldap (920)'),
(1044, 'ProfileRight', 920, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1045, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'rule_location (921)'),
(1046, 'ProfileRight', 921, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1047, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'rule_mailcollector (922)'),
(1048, 'ProfileRight', 922, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1049, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'rule_softwarecategories (923)'),
(1050, 'ProfileRight', 923, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1051, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'rule_ticket (924)'),
(1052, 'ProfileRight', 924, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1053, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'search_config (925)'),
(1054, 'ProfileRight', 925, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1055, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'show_group_hardware (926)'),
(1056, 'ProfileRight', 926, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1057, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'slm (927)'),
(1058, 'ProfileRight', 927, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1059, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'snmpcredential (928)'),
(1060, 'ProfileRight', 928, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1061, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'software (929)'),
(1062, 'ProfileRight', 929, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1063, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'solutiontemplate (930)'),
(1064, 'ProfileRight', 930, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1065, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'state (931)'),
(1066, 'ProfileRight', 931, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1067, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'statistic (932)'),
(1068, 'ProfileRight', 932, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1069, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'system_logs (933)'),
(1070, 'ProfileRight', 933, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1071, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'task (934)'),
(1072, 'ProfileRight', 934, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1073, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'taskcategory (935)'),
(1074, 'ProfileRight', 935, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1075, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'ticket (936)'),
(1076, 'ProfileRight', 936, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1077, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'ticketcost (937)'),
(1078, 'ProfileRight', 937, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1079, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'ticketrecurrent (938)'),
(1080, 'ProfileRight', 938, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1081, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'ticketvalidation (939)'),
(1082, 'ProfileRight', 939, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1083, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'transfer (940)'),
(1084, 'ProfileRight', 940, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1085, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'typedoc (941)'),
(1086, 'ProfileRight', 941, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1087, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'unmanaged (942)'),
(1088, 'ProfileRight', 942, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1089, 'Profile', 10, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:32', 0, '', 'user (943)'),
(1090, 'ProfileRight', 943, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1091, 'Profile', 10, '0', 20, 'incv (2)', '2026-03-05 13:08:32', 0, '', ''),
(1092, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'agent (944)'),
(1093, 'ProfileRight', 944, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1094, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'appliance (945)'),
(1095, 'ProfileRight', 945, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1096, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'backup (946)'),
(1097, 'ProfileRight', 946, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1098, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'bookmark_public (947)'),
(1099, 'ProfileRight', 947, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1100, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'budget (948)'),
(1101, 'ProfileRight', 948, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1102, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'cable_management (949)'),
(1103, 'ProfileRight', 949, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1104, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'calendar (950)'),
(1105, 'ProfileRight', 950, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1106, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'cartridge (951)'),
(1107, 'ProfileRight', 951, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1108, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'certificate (952)'),
(1109, 'ProfileRight', 952, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1110, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'change (953)'),
(1111, 'ProfileRight', 953, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1112, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'changevalidation (954)'),
(1113, 'ProfileRight', 954, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1114, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'cluster (955)'),
(1115, 'ProfileRight', 955, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1116, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'computer (956)'),
(1117, 'ProfileRight', 956, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1118, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'config (957)'),
(1119, 'ProfileRight', 957, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1120, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'consumable (958)'),
(1121, 'ProfileRight', 958, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1122, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'contact_enterprise (959)'),
(1123, 'ProfileRight', 959, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1124, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'contract (960)'),
(1125, 'ProfileRight', 960, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1126, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'dashboard (961)'),
(1127, 'ProfileRight', 961, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1128, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'database (962)'),
(1129, 'ProfileRight', 962, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1130, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'datacenter (963)'),
(1131, 'ProfileRight', 963, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1132, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'device (964)'),
(1133, 'ProfileRight', 964, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1134, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'devicesimcard_pinpuk (965)'),
(1135, 'ProfileRight', 965, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1136, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'document (966)'),
(1137, 'ProfileRight', 966, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1138, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'domain (967)'),
(1139, 'ProfileRight', 967, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1140, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'dropdown (968)'),
(1141, 'ProfileRight', 968, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1142, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'entity (969)'),
(1143, 'ProfileRight', 969, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1144, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'externalevent (970)'),
(1145, 'ProfileRight', 970, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1146, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'followup (971)'),
(1147, 'ProfileRight', 971, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1148, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'global_validation (972)'),
(1149, 'ProfileRight', 972, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1150, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'group (973)'),
(1151, 'ProfileRight', 973, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1152, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'infocom (974)'),
(1153, 'ProfileRight', 974, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1154, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'internet (975)'),
(1155, 'ProfileRight', 975, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1156, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'inventory (976)'),
(1157, 'ProfileRight', 976, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1158, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'itilcategory (977)'),
(1159, 'ProfileRight', 977, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1160, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'itilfollowuptemplate (978)'),
(1161, 'ProfileRight', 978, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1162, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'itiltemplate (979)'),
(1163, 'ProfileRight', 979, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1164, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'knowbase (980)'),
(1165, 'ProfileRight', 980, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1166, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'knowbasecategory (981)'),
(1167, 'ProfileRight', 981, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1168, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'license (982)'),
(1169, 'ProfileRight', 982, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1170, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'line (983)'),
(1171, 'ProfileRight', 983, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1172, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'lineoperator (984)'),
(1173, 'ProfileRight', 984, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1174, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'link (985)'),
(1175, 'ProfileRight', 985, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1176, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'location (986)'),
(1177, 'ProfileRight', 986, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1178, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'locked_field (987)'),
(1179, 'ProfileRight', 987, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1180, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'logs (988)'),
(1181, 'ProfileRight', 988, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1182, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'monitor (989)'),
(1183, 'ProfileRight', 989, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1184, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'networking (990)'),
(1185, 'ProfileRight', 990, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1186, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'notification (991)'),
(1187, 'ProfileRight', 991, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1188, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'password_update (992)'),
(1189, 'ProfileRight', 992, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1190, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'pendingreason (993)'),
(1191, 'ProfileRight', 993, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1192, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'peripheral (994)'),
(1193, 'ProfileRight', 994, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1194, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'personalization (995)'),
(1195, 'ProfileRight', 995, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1196, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'phone (996)'),
(1197, 'ProfileRight', 996, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1198, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'planning (997)'),
(1199, 'ProfileRight', 997, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1200, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'printer (998)'),
(1201, 'ProfileRight', 998, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1202, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'problem (999)'),
(1203, 'ProfileRight', 999, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1204, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'profile (1000)'),
(1205, 'ProfileRight', 1000, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1206, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'project (1001)'),
(1207, 'ProfileRight', 1001, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1208, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'projecttask (1002)'),
(1209, 'ProfileRight', 1002, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1210, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'queuednotification (1003)'),
(1211, 'ProfileRight', 1003, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1212, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'recurrentchange (1004)'),
(1213, 'ProfileRight', 1004, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1214, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'refusedequipment (1005)'),
(1215, 'ProfileRight', 1005, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1216, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'reminder_public (1006)'),
(1217, 'ProfileRight', 1006, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1218, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'reports (1007)'),
(1219, 'ProfileRight', 1007, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1220, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'reservation (1008)'),
(1221, 'ProfileRight', 1008, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1222, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'rssfeed_public (1009)'),
(1223, 'ProfileRight', 1009, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1224, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'rule_asset (1010)'),
(1225, 'ProfileRight', 1010, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1226, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'rule_dictionnary_dropdown (1011)'),
(1227, 'ProfileRight', 1011, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1228, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'rule_dictionnary_printer (1012)'),
(1229, 'ProfileRight', 1012, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1230, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'rule_dictionnary_software (1013)'),
(1231, 'ProfileRight', 1013, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1232, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'rule_import (1014)'),
(1233, 'ProfileRight', 1014, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1234, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'rule_ldap (1015)'),
(1235, 'ProfileRight', 1015, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1236, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'rule_location (1016)'),
(1237, 'ProfileRight', 1016, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1238, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'rule_mailcollector (1017)'),
(1239, 'ProfileRight', 1017, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1240, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'rule_softwarecategories (1018)'),
(1241, 'ProfileRight', 1018, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1242, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'rule_ticket (1019)'),
(1243, 'ProfileRight', 1019, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1244, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'search_config (1020)'),
(1245, 'ProfileRight', 1020, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1246, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'show_group_hardware (1021)'),
(1247, 'ProfileRight', 1021, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1248, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'slm (1022)'),
(1249, 'ProfileRight', 1022, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1250, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'snmpcredential (1023)'),
(1251, 'ProfileRight', 1023, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1252, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'software (1024)'),
(1253, 'ProfileRight', 1024, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1254, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'solutiontemplate (1025)'),
(1255, 'ProfileRight', 1025, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1256, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'state (1026)'),
(1257, 'ProfileRight', 1026, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1258, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'statistic (1027)'),
(1259, 'ProfileRight', 1027, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1260, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'system_logs (1028)'),
(1261, 'ProfileRight', 1028, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1262, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'task (1029)'),
(1263, 'ProfileRight', 1029, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1264, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'taskcategory (1030)'),
(1265, 'ProfileRight', 1030, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1266, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'ticket (1031)'),
(1267, 'ProfileRight', 1031, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1268, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'ticketcost (1032)'),
(1269, 'ProfileRight', 1032, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1270, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'ticketrecurrent (1033)'),
(1271, 'ProfileRight', 1033, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1272, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'ticketvalidation (1034)'),
(1273, 'ProfileRight', 1034, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1274, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'transfer (1035)'),
(1275, 'ProfileRight', 1035, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1276, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'typedoc (1036)'),
(1277, 'ProfileRight', 1036, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1278, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'unmanaged (1037)'),
(1279, 'ProfileRight', 1037, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1280, 'Profile', 11, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:08:58', 0, '', 'user (1038)'),
(1281, 'ProfileRight', 1038, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1282, 'Profile', 11, '0', 20, 'incv (2)', '2026-03-05 13:08:58', 0, '', ''),
(1283, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'agent (1039)'),
(1284, 'ProfileRight', 1039, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1285, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'appliance (1040)'),
(1286, 'ProfileRight', 1040, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1287, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'backup (1041)'),
(1288, 'ProfileRight', 1041, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1289, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'bookmark_public (1042)'),
(1290, 'ProfileRight', 1042, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1291, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'budget (1043)'),
(1292, 'ProfileRight', 1043, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1293, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'cable_management (1044)'),
(1294, 'ProfileRight', 1044, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1295, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'calendar (1045)'),
(1296, 'ProfileRight', 1045, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1297, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'cartridge (1046)'),
(1298, 'ProfileRight', 1046, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1299, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'certificate (1047)'),
(1300, 'ProfileRight', 1047, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1301, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'change (1048)'),
(1302, 'ProfileRight', 1048, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1303, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'changevalidation (1049)'),
(1304, 'ProfileRight', 1049, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1305, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'cluster (1050)'),
(1306, 'ProfileRight', 1050, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1307, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'computer (1051)'),
(1308, 'ProfileRight', 1051, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1309, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'config (1052)'),
(1310, 'ProfileRight', 1052, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1311, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'consumable (1053)'),
(1312, 'ProfileRight', 1053, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1313, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'contact_enterprise (1054)'),
(1314, 'ProfileRight', 1054, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1315, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'contract (1055)'),
(1316, 'ProfileRight', 1055, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1317, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'dashboard (1056)'),
(1318, 'ProfileRight', 1056, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1319, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'database (1057)'),
(1320, 'ProfileRight', 1057, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1321, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'datacenter (1058)'),
(1322, 'ProfileRight', 1058, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1323, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'device (1059)'),
(1324, 'ProfileRight', 1059, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1325, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'devicesimcard_pinpuk (1060)'),
(1326, 'ProfileRight', 1060, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1327, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'document (1061)'),
(1328, 'ProfileRight', 1061, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1329, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'domain (1062)'),
(1330, 'ProfileRight', 1062, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1331, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'dropdown (1063)'),
(1332, 'ProfileRight', 1063, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1333, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'entity (1064)'),
(1334, 'ProfileRight', 1064, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1335, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'externalevent (1065)'),
(1336, 'ProfileRight', 1065, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1337, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'followup (1066)'),
(1338, 'ProfileRight', 1066, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1339, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'global_validation (1067)'),
(1340, 'ProfileRight', 1067, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1341, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'group (1068)'),
(1342, 'ProfileRight', 1068, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1343, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'infocom (1069)'),
(1344, 'ProfileRight', 1069, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1345, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'internet (1070)'),
(1346, 'ProfileRight', 1070, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1347, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'inventory (1071)'),
(1348, 'ProfileRight', 1071, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1349, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'itilcategory (1072)'),
(1350, 'ProfileRight', 1072, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1351, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'itilfollowuptemplate (1073)'),
(1352, 'ProfileRight', 1073, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1353, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'itiltemplate (1074)'),
(1354, 'ProfileRight', 1074, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1355, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'knowbase (1075)'),
(1356, 'ProfileRight', 1075, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1357, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'knowbasecategory (1076)'),
(1358, 'ProfileRight', 1076, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1359, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'license (1077)'),
(1360, 'ProfileRight', 1077, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1361, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'line (1078)'),
(1362, 'ProfileRight', 1078, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1363, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'lineoperator (1079)'),
(1364, 'ProfileRight', 1079, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1365, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'link (1080)'),
(1366, 'ProfileRight', 1080, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1367, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'location (1081)'),
(1368, 'ProfileRight', 1081, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1369, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'locked_field (1082)'),
(1370, 'ProfileRight', 1082, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1371, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'logs (1083)'),
(1372, 'ProfileRight', 1083, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1373, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'monitor (1084)'),
(1374, 'ProfileRight', 1084, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1375, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'networking (1085)'),
(1376, 'ProfileRight', 1085, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1377, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'notification (1086)'),
(1378, 'ProfileRight', 1086, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1379, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'password_update (1087)'),
(1380, 'ProfileRight', 1087, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1381, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'pendingreason (1088)'),
(1382, 'ProfileRight', 1088, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1383, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'peripheral (1089)'),
(1384, 'ProfileRight', 1089, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1385, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'personalization (1090)'),
(1386, 'ProfileRight', 1090, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1387, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'phone (1091)'),
(1388, 'ProfileRight', 1091, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1389, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'planning (1092)'),
(1390, 'ProfileRight', 1092, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1391, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'printer (1093)'),
(1392, 'ProfileRight', 1093, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1393, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'problem (1094)'),
(1394, 'ProfileRight', 1094, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1395, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'profile (1095)'),
(1396, 'ProfileRight', 1095, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1397, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'project (1096)'),
(1398, 'ProfileRight', 1096, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1399, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'projecttask (1097)'),
(1400, 'ProfileRight', 1097, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1401, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'queuednotification (1098)'),
(1402, 'ProfileRight', 1098, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1403, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'recurrentchange (1099)'),
(1404, 'ProfileRight', 1099, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1405, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'refusedequipment (1100)'),
(1406, 'ProfileRight', 1100, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1407, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'reminder_public (1101)'),
(1408, 'ProfileRight', 1101, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1409, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'reports (1102)'),
(1410, 'ProfileRight', 1102, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1411, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'reservation (1103)'),
(1412, 'ProfileRight', 1103, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1413, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'rssfeed_public (1104)'),
(1414, 'ProfileRight', 1104, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1415, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'rule_asset (1105)'),
(1416, 'ProfileRight', 1105, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1417, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'rule_dictionnary_dropdown (1106)'),
(1418, 'ProfileRight', 1106, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1419, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'rule_dictionnary_printer (1107)'),
(1420, 'ProfileRight', 1107, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1421, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'rule_dictionnary_software (1108)'),
(1422, 'ProfileRight', 1108, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1423, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'rule_import (1109)'),
(1424, 'ProfileRight', 1109, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1425, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'rule_ldap (1110)'),
(1426, 'ProfileRight', 1110, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1427, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'rule_location (1111)'),
(1428, 'ProfileRight', 1111, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1429, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'rule_mailcollector (1112)'),
(1430, 'ProfileRight', 1112, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1431, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'rule_softwarecategories (1113)'),
(1432, 'ProfileRight', 1113, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1433, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'rule_ticket (1114)'),
(1434, 'ProfileRight', 1114, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1435, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'search_config (1115)'),
(1436, 'ProfileRight', 1115, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1437, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'show_group_hardware (1116)'),
(1438, 'ProfileRight', 1116, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1439, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'slm (1117)'),
(1440, 'ProfileRight', 1117, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1441, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'snmpcredential (1118)'),
(1442, 'ProfileRight', 1118, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1443, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'software (1119)'),
(1444, 'ProfileRight', 1119, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1445, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'solutiontemplate (1120)'),
(1446, 'ProfileRight', 1120, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1447, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'state (1121)'),
(1448, 'ProfileRight', 1121, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1449, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'statistic (1122)'),
(1450, 'ProfileRight', 1122, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1451, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'system_logs (1123)'),
(1452, 'ProfileRight', 1123, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1453, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'task (1124)'),
(1454, 'ProfileRight', 1124, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1455, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'taskcategory (1125)'),
(1456, 'ProfileRight', 1125, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1457, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'ticket (1126)'),
(1458, 'ProfileRight', 1126, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1459, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'ticketcost (1127)'),
(1460, 'ProfileRight', 1127, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1461, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'ticketrecurrent (1128)'),
(1462, 'ProfileRight', 1128, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1463, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'ticketvalidation (1129)'),
(1464, 'ProfileRight', 1129, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1465, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'transfer (1130)'),
(1466, 'ProfileRight', 1130, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1467, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'typedoc (1131)'),
(1468, 'ProfileRight', 1131, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1469, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'unmanaged (1132)'),
(1470, 'ProfileRight', 1132, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1471, 'Profile', 12, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:10:36', 0, '', 'user (1133)'),
(1472, 'ProfileRight', 1133, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1473, 'Profile', 12, '0', 20, 'incv (2)', '2026-03-05 13:10:36', 0, '', ''),
(1474, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'agent (1134)'),
(1475, 'ProfileRight', 1134, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1476, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'appliance (1135)'),
(1477, 'ProfileRight', 1135, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1478, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'backup (1136)'),
(1479, 'ProfileRight', 1136, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1480, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'bookmark_public (1137)'),
(1481, 'ProfileRight', 1137, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1482, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'budget (1138)'),
(1483, 'ProfileRight', 1138, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1484, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'cable_management (1139)'),
(1485, 'ProfileRight', 1139, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1486, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'calendar (1140)'),
(1487, 'ProfileRight', 1140, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1488, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'cartridge (1141)'),
(1489, 'ProfileRight', 1141, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1490, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'certificate (1142)'),
(1491, 'ProfileRight', 1142, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1492, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'change (1143)'),
(1493, 'ProfileRight', 1143, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1494, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'changevalidation (1144)'),
(1495, 'ProfileRight', 1144, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1496, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'cluster (1145)'),
(1497, 'ProfileRight', 1145, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1498, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'computer (1146)'),
(1499, 'ProfileRight', 1146, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1500, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'config (1147)'),
(1501, 'ProfileRight', 1147, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1502, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'consumable (1148)'),
(1503, 'ProfileRight', 1148, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1504, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'contact_enterprise (1149)'),
(1505, 'ProfileRight', 1149, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1506, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'contract (1150)'),
(1507, 'ProfileRight', 1150, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1508, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'dashboard (1151)'),
(1509, 'ProfileRight', 1151, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1510, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'database (1152)'),
(1511, 'ProfileRight', 1152, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1512, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'datacenter (1153)'),
(1513, 'ProfileRight', 1153, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1514, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'device (1154)'),
(1515, 'ProfileRight', 1154, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1516, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'devicesimcard_pinpuk (1155)'),
(1517, 'ProfileRight', 1155, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1518, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'document (1156)'),
(1519, 'ProfileRight', 1156, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1520, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'domain (1157)'),
(1521, 'ProfileRight', 1157, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1522, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'dropdown (1158)'),
(1523, 'ProfileRight', 1158, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1524, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'entity (1159)'),
(1525, 'ProfileRight', 1159, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1526, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'externalevent (1160)');
INSERT INTO `glpi_logs` (`id`, `itemtype`, `items_id`, `itemtype_link`, `linked_action`, `user_name`, `date_mod`, `id_search_option`, `old_value`, `new_value`) VALUES
(1527, 'ProfileRight', 1160, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1528, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'followup (1161)'),
(1529, 'ProfileRight', 1161, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1530, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'global_validation (1162)'),
(1531, 'ProfileRight', 1162, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1532, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'group (1163)'),
(1533, 'ProfileRight', 1163, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1534, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'infocom (1164)'),
(1535, 'ProfileRight', 1164, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1536, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'internet (1165)'),
(1537, 'ProfileRight', 1165, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1538, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'inventory (1166)'),
(1539, 'ProfileRight', 1166, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1540, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'itilcategory (1167)'),
(1541, 'ProfileRight', 1167, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1542, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'itilfollowuptemplate (1168)'),
(1543, 'ProfileRight', 1168, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1544, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'itiltemplate (1169)'),
(1545, 'ProfileRight', 1169, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1546, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'knowbase (1170)'),
(1547, 'ProfileRight', 1170, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1548, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'knowbasecategory (1171)'),
(1549, 'ProfileRight', 1171, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1550, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'license (1172)'),
(1551, 'ProfileRight', 1172, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1552, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'line (1173)'),
(1553, 'ProfileRight', 1173, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1554, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'lineoperator (1174)'),
(1555, 'ProfileRight', 1174, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1556, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'link (1175)'),
(1557, 'ProfileRight', 1175, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1558, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'location (1176)'),
(1559, 'ProfileRight', 1176, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1560, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'locked_field (1177)'),
(1561, 'ProfileRight', 1177, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1562, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'logs (1178)'),
(1563, 'ProfileRight', 1178, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1564, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'monitor (1179)'),
(1565, 'ProfileRight', 1179, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1566, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'networking (1180)'),
(1567, 'ProfileRight', 1180, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1568, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'notification (1181)'),
(1569, 'ProfileRight', 1181, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1570, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'password_update (1182)'),
(1571, 'ProfileRight', 1182, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1572, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'pendingreason (1183)'),
(1573, 'ProfileRight', 1183, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1574, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'peripheral (1184)'),
(1575, 'ProfileRight', 1184, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1576, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'personalization (1185)'),
(1577, 'ProfileRight', 1185, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1578, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'phone (1186)'),
(1579, 'ProfileRight', 1186, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1580, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'planning (1187)'),
(1581, 'ProfileRight', 1187, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1582, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'printer (1188)'),
(1583, 'ProfileRight', 1188, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1584, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'problem (1189)'),
(1585, 'ProfileRight', 1189, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1586, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'profile (1190)'),
(1587, 'ProfileRight', 1190, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1588, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'project (1191)'),
(1589, 'ProfileRight', 1191, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1590, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'projecttask (1192)'),
(1591, 'ProfileRight', 1192, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1592, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'queuednotification (1193)'),
(1593, 'ProfileRight', 1193, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1594, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'recurrentchange (1194)'),
(1595, 'ProfileRight', 1194, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1596, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'refusedequipment (1195)'),
(1597, 'ProfileRight', 1195, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1598, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'reminder_public (1196)'),
(1599, 'ProfileRight', 1196, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1600, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'reports (1197)'),
(1601, 'ProfileRight', 1197, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1602, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'reservation (1198)'),
(1603, 'ProfileRight', 1198, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1604, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'rssfeed_public (1199)'),
(1605, 'ProfileRight', 1199, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1606, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'rule_asset (1200)'),
(1607, 'ProfileRight', 1200, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1608, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'rule_dictionnary_dropdown (1201)'),
(1609, 'ProfileRight', 1201, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1610, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'rule_dictionnary_printer (1202)'),
(1611, 'ProfileRight', 1202, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1612, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'rule_dictionnary_software (1203)'),
(1613, 'ProfileRight', 1203, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1614, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'rule_import (1204)'),
(1615, 'ProfileRight', 1204, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1616, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'rule_ldap (1205)'),
(1617, 'ProfileRight', 1205, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1618, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'rule_location (1206)'),
(1619, 'ProfileRight', 1206, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1620, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'rule_mailcollector (1207)'),
(1621, 'ProfileRight', 1207, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1622, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'rule_softwarecategories (1208)'),
(1623, 'ProfileRight', 1208, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1624, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'rule_ticket (1209)'),
(1625, 'ProfileRight', 1209, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1626, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'search_config (1210)'),
(1627, 'ProfileRight', 1210, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1628, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'show_group_hardware (1211)'),
(1629, 'ProfileRight', 1211, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1630, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'slm (1212)'),
(1631, 'ProfileRight', 1212, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1632, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'snmpcredential (1213)'),
(1633, 'ProfileRight', 1213, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1634, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'software (1214)'),
(1635, 'ProfileRight', 1214, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1636, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'solutiontemplate (1215)'),
(1637, 'ProfileRight', 1215, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1638, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'state (1216)'),
(1639, 'ProfileRight', 1216, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1640, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'statistic (1217)'),
(1641, 'ProfileRight', 1217, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1642, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'system_logs (1218)'),
(1643, 'ProfileRight', 1218, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1644, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'task (1219)'),
(1645, 'ProfileRight', 1219, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1646, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'taskcategory (1220)'),
(1647, 'ProfileRight', 1220, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1648, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'ticket (1221)'),
(1649, 'ProfileRight', 1221, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1650, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'ticketcost (1222)'),
(1651, 'ProfileRight', 1222, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1652, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'ticketrecurrent (1223)'),
(1653, 'ProfileRight', 1223, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1654, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'ticketvalidation (1224)'),
(1655, 'ProfileRight', 1224, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1656, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'transfer (1225)'),
(1657, 'ProfileRight', 1225, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1658, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'typedoc (1226)'),
(1659, 'ProfileRight', 1226, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1660, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'unmanaged (1227)'),
(1661, 'ProfileRight', 1227, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1662, 'Profile', 13, 'ProfileRight', 17, 'incv (2)', '2026-03-05 13:11:05', 0, '', 'user (1228)'),
(1663, 'ProfileRight', 1228, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1664, 'Profile', 13, '0', 20, 'incv (2)', '2026-03-05 13:11:05', 0, '', ''),
(1665, 'Profile', 7, '', 0, 'incv (2)', '2026-03-05 13:11:51', 1, 'Supervisor', 'Manuel Garcia'),
(1666, 'User', 7, 'Profile', 17, 'incv (2)', '2026-03-05 13:14:11', 0, '', 'Entidade de raiz (0), CCV - Correios de Cabo Verde (9)'),
(1667, 'Profile', 9, 'User', 17, 'incv (2)', '2026-03-05 13:14:11', 0, '', 'CCV - Correios de Cabo Verde (7), Entidade de raiz (0)'),
(1668, 'Entity', 0, 'User', 17, 'incv (2)', '2026-03-05 13:14:11', 0, '', 'CCV - Correios de Cabo Verde (7), CCV - Correios de Cabo Verde (9)'),
(1669, 'User', 7, '0', 20, 'incv (2)', '2026-03-05 13:14:11', 0, '', ''),
(1670, 'User', 7, '', 0, 'incv (2)', '2026-03-05 13:15:34', 150, '', 'b7/7_69a981f6d18b7.jpg'),
(1671, 'User', 7, '', 0, 'incv (2)', '2026-03-05 13:17:26', 150, 'b7/7_69a981f6d18b7.jpg', 'db/7_69a982661e4db.jpg'),
(1672, 'User', 8, 'Profile', 17, 'incv (2)', '2026-03-05 13:18:47', 0, '', 'Entidade de raiz (0), DEF - Direcção de Estrangeiros e Fronteiras (10)'),
(1673, 'Profile', 10, 'User', 17, 'incv (2)', '2026-03-05 13:18:47', 0, '', 'DEF - Direcção de Estrangeiros e Fronteiras (8), Entidade de raiz (0)'),
(1674, 'Entity', 0, 'User', 17, 'incv (2)', '2026-03-05 13:18:47', 0, '', 'DEF - Direcção de Estrangeiros e Fronteiras (8), DEF - Direcção de Estrangeiros e Fronteiras (10)'),
(1675, 'User', 8, '0', 20, 'incv (2)', '2026-03-05 13:18:47', 0, '', ''),
(1676, 'User', 7, '', 0, 'incv (2)', '2026-03-05 13:20:51', 20, '&nbsp; (0)', 'CCV - Correios de Cabo Verde (9)'),
(1677, 'User', 9, 'Profile', 17, 'incv (2)', '2026-03-05 13:22:46', 0, '', 'Entidade de raiz (0), Manuel Garcia (7)'),
(1678, 'Profile', 7, 'User', 17, 'incv (2)', '2026-03-05 13:22:46', 0, '', 'Manuel Garcia (9), Entidade de raiz (0)'),
(1679, 'Entity', 0, 'User', 17, 'incv (2)', '2026-03-05 13:22:46', 0, '', 'Manuel Garcia (9), Manuel Garcia (7)'),
(1680, 'User', 9, '0', 20, 'incv (2)', '2026-03-05 13:22:46', 0, '', ''),
(1681, 'User', 10, 'Profile', 17, 'incv (2)', '2026-03-05 13:24:10', 0, '', 'Entidade de raiz (0), IMIJ - Instituto de Inovação e Modernização da Justiça (1)'),
(1682, 'Profile', 1, 'User', 17, 'incv (2)', '2026-03-05 13:24:10', 0, '', 'IMIJ - Instituto de Inovação e Modernização da Justiça (10), Entidade de raiz (0)'),
(1683, 'Entity', 0, 'User', 17, 'incv (2)', '2026-03-05 13:24:10', 0, '', 'IMIJ - Instituto de Inovação e Modernização da Justiça (10), IMIJ - Instituto de Inovação e Modernização da Justiça (1)'),
(1684, 'User', 10, '0', 20, 'incv (2)', '2026-03-05 13:24:10', 0, '', ''),
(1685, 'User', 11, 'Profile', 17, 'incv (2)', '2026-03-05 13:25:36', 0, '', 'Entidade de raiz (0), Nosi - Núcleo Operacional de Sociedade de Informação (13)'),
(1686, 'Profile', 13, 'User', 17, 'incv (2)', '2026-03-05 13:25:36', 0, '', 'Nosi - Núcleo Operacional de Sociedade de Informação (11), Entidade de raiz (0)'),
(1687, 'Entity', 0, 'User', 17, 'incv (2)', '2026-03-05 13:25:36', 0, '', 'Nosi - Núcleo Operacional de Sociedade de Informação (11), Nosi - Núcleo Operacional de Sociedade de Informação (13)'),
(1688, 'User', 11, '0', 20, 'incv (2)', '2026-03-05 13:25:36', 0, '', ''),
(1689, 'User', 12, 'Profile', 17, 'incv (2)', '2026-03-05 13:26:13', 0, '', 'Entidade de raiz (0), SINIAC (12)'),
(1690, 'Profile', 12, 'User', 17, 'incv (2)', '2026-03-05 13:26:13', 0, '', 'SINIAC (12), Entidade de raiz (0)'),
(1691, 'Entity', 0, 'User', 17, 'incv (2)', '2026-03-05 13:26:13', 0, '', 'SINIAC (12), SINIAC (12)'),
(1692, 'User', 12, '0', 20, 'incv (2)', '2026-03-05 13:26:13', 0, '', ''),
(1693, 'Config', 1, '', 0, 'incv (2)', '2026-03-27 23:40:46', 1, 'marketplace_replace_plugins ', '2'),
(1694, 'Config', 1, '', 0, 'incv (2)', '2026-03-29 20:44:19', 1, 'glpinetwork_registration_key ********', '********'),
(1695, 'Config', 1, '', 0, 'incv (2)', '2026-03-29 20:44:19', 1, 'glpi_network_uuid ', 'QYQmFPJ8tFuuoSaIroEwpuNz0D9PiRoOvqTzJnVj'),
(1696, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:26:51', 1, 'text_login ', '&#60;p style=\"padding-left: 120px;\"&#62;&#60;strong&#62;Benvindo ao portal do suporte da INCV&#60;/strong&#62;&#60;/p&#62;rn&#60;p style=\"padding-left: 120px;\"&#62;&#60;strong&#62;'),
(1697, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:29:37', 1, 'text_login &#60;p style=\"padding-left: 120px;\"&#62;&#60;strong&#62;Benvindo ao portal do suporte da INCV&#60;/strong&#62;&#60;/p&#62;\r\n&#60;p style=\"padding-left: 120px;\"&#62;&#60;', '&#60;p&#62;&#60;strong&#62;Benvindo ao portal do suporte da INCV&#60;/strong&#62;&#60;/p&#62;rn&#60;p&#62;&#60;strong&#62;Por favor faça o seu login para solicitação.&#60;/strong&#'),
(1698, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:35:13', 1, 'date_format 0', '1'),
(1699, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:35:13', 1, 'names_format 0', '1'),
(1700, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:35:13', 1, 'number_format 0', '2'),
(1701, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:35:13', 1, 'palette auror', 'lightblue'),
(1702, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, 'planning_begin 08:00:00', '08:00'),
(1703, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, 'planning_end 20:00:00', '20:00'),
(1704, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, 'default_mailcollector_filesize_max 2097152', '14680064'),
(1705, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, 'planning_work_days [0,1,2,3,4,5,6]', '[1,2,3,4,5,6,0]'),
(1706, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, '_matrix ', '1'),
(1707, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, '_impact_5 ', '1'),
(1708, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, '_impact_4 ', '1'),
(1709, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, '_impact_3 ', '1'),
(1710, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, '_impact_2 ', '1'),
(1711, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, '_impact_1 ', '1'),
(1712, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, '_urgency_5 ', '1'),
(1713, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, '_matrix_5_5 ', '5'),
(1714, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, '_matrix_5_4 ', '5'),
(1715, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, '_matrix_5_3 ', '4'),
(1716, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, '_matrix_5_2 ', '3'),
(1717, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, '_matrix_5_1 ', '2'),
(1718, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, '_urgency_4 ', '1'),
(1719, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, '_matrix_4_5 ', '5'),
(1720, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, '_matrix_4_4 ', '4'),
(1721, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, '_matrix_4_3 ', '4'),
(1722, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, '_matrix_4_2 ', '3'),
(1723, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, '_matrix_4_1 ', '2'),
(1724, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, '_urgency_3 ', '1'),
(1725, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, '_matrix_3_5 ', '4'),
(1726, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, '_matrix_3_4 ', '4'),
(1727, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, '_matrix_3_3 ', '3'),
(1728, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, '_matrix_3_2 ', '2'),
(1729, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, '_matrix_3_1 ', '2'),
(1730, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, '_urgency_2 ', '1'),
(1731, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, '_matrix_2_5 ', '3'),
(1732, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, '_matrix_2_4 ', '3'),
(1733, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, '_matrix_2_3 ', '2'),
(1734, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, '_matrix_2_2 ', '2'),
(1735, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, '_matrix_2_1 ', '1'),
(1736, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, '_urgency_1 ', '1'),
(1737, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, '_matrix_1_5 ', '2'),
(1738, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, '_matrix_1_4 ', '2'),
(1739, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, '_matrix_1_3 ', '2'),
(1740, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, '_matrix_1_2 ', '1'),
(1741, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, '_matrix_1_1 ', '1'),
(1742, 'Config', 1, '', 0, 'incv (2)', '2026-03-30 06:37:22', 1, 'priority_matrix {\"1\":{\"1\":1,\"2\":1,\"3\":2,\"4\":2,\"5\":2},\"2\":{\"1\":1,\"2\":2,\"3\":2,\"4\":3,\"5\":3},\"3\":{\"1\":2,\"2\":2,\"3\":3,\"4\":4,\"5\":4},\"4\":{\"1\":2,\"2\":3,\"3\":4,\"4\":4,\"5\":5},\"5\":{\"1\":2,\"2\":3,\"3', '{\"1\":{\"1\":\"1\",\"2\":\"1\",\"3\":\"2\",\"4\":\"2\",\"5\":\"2\"},\"2\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"2\",\"4\":\"3\",\"5\":\"3\"},\"3\":{\"1\":\"2\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"4\"},\"4\":{\"1\":\"2\",\"2\":\"3\",\"3\":\"4\",\"'),
(1743, 'User', 3, '', 0, 'incv (2)', '2026-03-30 06:41:08', 1, 'post-only', 'teste'),
(1744, 'User', 3, '', 0, 'incv (2)', '2026-03-30 06:41:08', 34, '', 'teste'),
(1745, 'User', 3, '', 0, 'incv (2)', '2026-03-30 06:41:08', 9, '', 'teste'),
(1746, 'User', 3, '', 0, 'incv (2)', '2026-03-30 06:41:08', 8, '0', '1'),
(1747, 'User', 3, '', 0, 'teste teste (3)', '2026-03-30 06:42:46', 17, 'en_GB', NULL),
(1748, 'Entity', 0, '', 0, 'incv (2)', '2026-03-30 06:49:24', 14, 'Entidade de raiz', 'Imprensa Nacional de Cabo Verde'),
(1749, 'Entity', 0, '', 0, 'incv (2)', '2026-03-30 06:49:24', 1, 'Entidade de raiz', 'Imprensa Nacional de Cabo Verde'),
(1750, 'Entity', 0, '', 0, 'incv (2)', '2026-03-30 06:51:40', 3, '', 'Rua Macaronésia'),
(1751, 'Entity', 0, '', 0, 'incv (2)', '2026-03-30 06:51:40', 13, '', 'Cabo verde'),
(1752, 'Entity', 0, '', 0, 'incv (2)', '2026-03-30 06:51:40', 6, '', 'suporteincv@suporteincv.com'),
(1753, 'Entity', 0, '', 0, 'incv (2)', '2026-03-30 06:51:40', 5, '', '2614520'),
(1754, 'Entity', 0, '', 0, 'incv (2)', '2026-03-30 06:51:40', 25, '', '113'),
(1755, 'Entity', 0, '', 0, 'incv (2)', '2026-03-30 06:51:40', 12, '', 'Cabo verde'),
(1756, 'Entity', 0, '', 0, 'incv (2)', '2026-03-30 06:51:40', 11, '', 'Praia '),
(1757, 'TicketTemplate', 1, 'TicketTemplateMandatoryField', 17, 'incv (2)', '2026-03-30 06:58:53', 0, '', 'Estado (2)'),
(1758, 'TicketTemplateMandatoryField', 2, '0', 20, 'incv (2)', '2026-03-30 06:58:53', 0, '', ''),
(1759, 'TicketTemplate', 1, 'TicketTemplateMandatoryField', 17, 'incv (2)', '2026-03-30 06:58:59', 0, '', 'Urgência (3)'),
(1760, 'TicketTemplateMandatoryField', 3, '0', 20, 'incv (2)', '2026-03-30 06:58:59', 0, '', ''),
(1761, 'TicketTemplate', 1, 'TicketTemplateMandatoryField', 17, 'incv (2)', '2026-03-30 06:59:07', 0, '', 'Prioridade (4)'),
(1762, 'TicketTemplateMandatoryField', 4, '0', 20, 'incv (2)', '2026-03-30 06:59:07', 0, '', ''),
(1763, 'TicketTemplate', 1, 'TicketTemplateMandatoryField', 17, 'incv (2)', '2026-03-30 06:59:52', 0, '', 'Data de abertura (5)'),
(1764, 'TicketTemplateMandatoryField', 5, '0', 20, 'incv (2)', '2026-03-30 06:59:52', 0, '', ''),
(1765, 'TicketTemplate', 1, 'TicketTemplateMandatoryField', 17, 'incv (2)', '2026-03-30 07:00:23', 0, '', 'Pedido de aprovação (6)'),
(1766, 'TicketTemplateMandatoryField', 6, '0', 20, 'incv (2)', '2026-03-30 07:00:23', 0, '', ''),
(1767, 'TicketTemplate', 1, 'TicketTemplateMandatoryField', 17, 'incv (2)', '2026-03-30 07:00:54', 0, '', 'Documentos (7)'),
(1768, 'TicketTemplateMandatoryField', 7, '0', 20, 'incv (2)', '2026-03-30 07:00:54', 0, '', ''),
(1769, 'TicketTemplate', 1, 'TicketTemplatePredefinedField', 17, 'incv (2)', '2026-03-30 07:02:57', 0, '', 'Estado (1)'),
(1770, 'TicketTemplatePredefinedField', 1, '0', 20, 'incv (2)', '2026-03-30 07:02:57', 0, '', ''),
(1771, 'TicketTemplate', 1, 'TicketTemplatePredefinedField', 17, 'incv (2)', '2026-03-30 07:03:09', 0, '', 'Urgência (2)'),
(1772, 'TicketTemplatePredefinedField', 2, '0', 20, 'incv (2)', '2026-03-30 07:03:09', 0, '', ''),
(1773, 'TicketTemplate', 1, 'TicketTemplatePredefinedField', 17, 'incv (2)', '2026-03-30 07:03:26', 0, '', 'Prioridade (3)'),
(1774, 'TicketTemplatePredefinedField', 3, '0', 20, 'incv (2)', '2026-03-30 07:03:26', 0, '', ''),
(1775, 'TicketTemplate', 1, 'TicketTemplatePredefinedField', 17, 'incv (2)', '2026-03-30 07:04:00', 0, '', 'Data de abertura (4)'),
(1776, 'TicketTemplatePredefinedField', 4, '0', 20, 'incv (2)', '2026-03-30 07:04:00', 0, '', ''),
(1777, 'ITILCategory', 1, '0', 20, 'incv (2)', '2026-03-30 07:14:57', 0, '', ''),
(1778, 'ITILCategory', 2, '0', 20, 'incv (2)', '2026-03-30 07:15:28', 0, '', ''),
(1779, 'ITILCategory', 3, '0', 20, 'incv (2)', '2026-03-30 07:16:34', 0, '', ''),
(1780, 'ITILCategory', 4, '0', 20, 'incv (2)', '2026-03-30 07:16:58', 0, '', ''),
(1781, 'ITILCategory', 5, '0', 20, 'incv (2)', '2026-03-30 07:18:12', 0, '', ''),
(1782, 'User', 9, '', 0, 'incv (2)', '2026-03-31 06:25:48', 1, 'Manuel Garcia', 'Manuel Garcia '),
(1783, 'User', 9, '', 0, 'incv (2)', '2026-03-31 06:25:48', 34, '', '-INCV'),
(1784, 'Profile', 7, '', 0, 'incv (2)', '2026-03-31 10:17:57', 118, '0', '1'),
(1785, 'Profile', 7, '', 0, 'incv (2)', '2026-03-31 10:18:12', 5, 'central', 'helpdesk'),
(1786, 'Profile', 7, '', 0, 'incv (2)', '2026-03-31 10:18:12', 102, '261151', '2053'),
(1787, 'Document', 1, '0', 20, '-INCV (9)', '2026-03-31 10:21:32', 0, '', ''),
(1788, 'Document', 1, 'Ticket', 15, '-INCV (9)', '2026-03-31 10:21:32', 0, '', 'Localização do documento número xpto (1)'),
(1789, 'Ticket', 1, 'Document', 15, '-INCV (9)', '2026-03-31 10:21:32', 0, '', 'Documento do ticket 1 (1)'),
(1790, 'Ticket', 1, 'User', 15, '-INCV (9)', '2026-03-31 10:21:32', 4, '', '-INCV (9)'),
(1791, 'Ticket', 1, 'User', 15, '-INCV (9)', '2026-03-31 10:21:32', 66, '', 'incv (2)'),
(1792, 'Config', 1, '', 0, '-INCV (9)', '2026-03-31 10:21:32', 1, 'notification_uuid ', 'hcpl9F7STwaJcBpLTSLVP0odrznnbBcqIGF9F3tY'),
(1793, 'Ticket', 1, '0', 20, '-INCV (9)', '2026-03-31 10:21:32', 0, '', ''),
(1794, 'Ticket', 1, '', 0, 'incv (2)', '2026-03-31 10:23:50', 150, '0', '293'),
(1795, 'Ticket', 1, '', 0, 'incv (2)', '2026-03-31 10:23:50', 64, 'Manuel Garcia  (9)', 'incv (2)'),
(1796, 'Ticket', 1, 'ITILFollowup', 17, 'incv (2)', '2026-03-31 10:23:50', 0, '', '1'),
(1797, 'Ticket', 1, 'ITILFollowup', 12, 'incv (2)', '2026-03-31 10:23:50', 0, '', 'Helpdesk (1)'),
(1798, 'User', 7, '', 0, 'incv (2)', '2026-03-31 10:30:57', 9, '', 'ccv'),
(1799, 'User', 7, '', 0, 'incv (2)', '2026-03-31 10:31:52', 1, 'CCV - Correios de Cabo Verde', 'CCV '),
(1800, 'User', 7, '', 0, 'incv (2)', '2026-03-31 10:31:52', 34, '', 'Correios de Cabo Verde'),
(1801, 'Profile', 9, '', 0, 'incv (2)', '2026-03-31 10:32:30', 118, '0', '1'),
(1802, 'Ticket', 1, 'User', 15, 'incv (2)', '2026-03-31 10:36:30', 5, '', 'incv (2)'),
(1803, 'Ticket', 1, '', 0, 'incv (2)', '2026-03-31 10:36:30', 12, '1', '2'),
(1804, 'Ticket', 1, '', 0, 'incv (2)', '2026-03-31 10:38:08', 12, '2', '5'),
(1805, 'Ticket', 1, '', 0, 'incv (2)', '2026-03-31 10:38:08', 17, '', '2026-03-31 10:38:08'),
(1806, 'Ticket', 1, 'ITILSolution', 17, 'incv (2)', '2026-03-31 10:38:08', 0, '', '1 (1)'),
(1807, 'ITILSolution', 1, '0', 20, 'incv (2)', '2026-03-31 10:38:08', 0, '', ''),
(1808, 'User', 9, '', 0, 'incv (2)', '2026-03-31 10:39:37', 34, '-INCV', 'INCV'),
(1809, 'User', 8, '', 0, 'incv (2)', '2026-03-31 10:42:20', 1, 'DEF - Direcção de Estrangeiros e Fronteiras', 'DEF '),
(1810, 'User', 8, '', 0, 'incv (2)', '2026-03-31 10:42:20', 34, '', 'Direcção de Estrangeiros e Fronteiras'),
(1811, 'User', 8, '', 0, 'incv (2)', '2026-03-31 10:42:20', 9, '', 'def'),
(1812, 'Profile', 9, '', 0, 'incv (2)', '2026-03-31 10:54:04', 87, '', '[]'),
(1813, 'Profile', 9, '', 0, 'incv (2)', '2026-03-31 10:54:04', 131, '0', '1'),
(1814, 'Profile', 9, '', 0, 'incv (2)', '2026-03-31 10:54:04', 102, '0', '5'),
(1815, 'Profile', 10, '', 0, 'incv (2)', '2026-03-31 10:56:24', 87, '', '[]'),
(1816, 'Profile', 10, '', 0, 'incv (2)', '2026-03-31 10:56:24', 131, '0', '2'),
(1817, 'Profile', 10, '', 0, 'incv (2)', '2026-03-31 10:56:24', 102, '0', '1'),
(1818, 'Profile', 10, '', 0, 'incv (2)', '2026-03-31 10:56:24', 133, '0', '15360'),
(1819, 'Profile', 10, '', 0, 'incv (2)', '2026-03-31 10:57:11', 3, '0', '1'),
(1820, 'Profile', 10, '', 0, 'incv (2)', '2026-03-31 10:57:11', 118, '0', '1'),
(1821, 'Profile', 10, '', 0, 'incv (2)', '2026-03-31 10:58:13', 3, '1', '0'),
(1822, 'Profile', 10, '', 0, 'incv (2)', '2026-03-31 11:00:33', 132, '0', '1'),
(1823, 'Profile', 10, '', 0, 'incv (2)', '2026-03-31 11:00:33', 102, '1', '5'),
(1824, 'Profile', 10, '', 0, 'incv (2)', '2026-03-31 11:00:54', 34, '0', '2048'),
(1825, 'Profile', 10, '', 0, 'incv (2)', '2026-03-31 11:01:11', 109, '0', '1'),
(1826, 'Profile', 10, '', 0, 'incv (2)', '2026-03-31 11:03:00', 34, '2048', '0'),
(1827, 'Document', 2, '0', 20, 'Direcção de Estrangeiros e Fronteiras def (8)', '2026-03-31 11:54:40', 0, '', ''),
(1828, 'Document', 2, 'Ticket', 15, 'Direcção de Estrangeiros e Fronteiras def (8)', '2026-03-31 11:54:40', 0, '', 'Tre (2)'),
(1829, 'Ticket', 2, 'Document', 15, 'Direcção de Estrangeiros e Fronteiras def (8)', '2026-03-31 11:54:40', 0, '', 'Documento do ticket 2 (2)'),
(1830, 'Ticket', 2, 'User', 15, 'Direcção de Estrangeiros e Fronteiras def (8)', '2026-03-31 11:54:40', 4, '', 'def Direcção de Estrangeiros e Fronteiras (8)'),
(1831, 'Ticket', 2, 'User', 15, 'Direcção de Estrangeiros e Fronteiras def (8)', '2026-03-31 11:54:40', 66, '', 'ccv Correios de Cabo Verde (7)'),
(1832, 'Ticket', 2, '0', 20, 'Direcção de Estrangeiros e Fronteiras def (8)', '2026-03-31 11:54:40', 0, '', ''),
(1833, 'Ticket', 2, '', 0, 'incv (2)', '2026-03-31 12:00:22', 150, '0', '564'),
(1834, 'Ticket', 2, '', 0, 'incv (2)', '2026-03-31 12:00:22', 64, 'DEF  (8)', 'incv (2)'),
(1835, 'Ticket', 2, 'ITILFollowup', 17, 'incv (2)', '2026-03-31 12:00:22', 0, '', '2'),
(1836, 'Ticket', 2, 'ITILFollowup', 12, 'incv (2)', '2026-03-31 12:00:22', 0, '', 'Helpdesk (2)'),
(1837, 'Ticket', 2, '', 0, 'incv (2)', '2026-03-31 12:06:32', 12, '1', '5'),
(1838, 'Ticket', 2, '', 0, 'incv (2)', '2026-03-31 12:06:32', 17, '', '2026-03-31 12:06:32'),
(1839, 'Ticket', 2, 'ITILSolution', 17, 'incv (2)', '2026-03-31 12:06:32', 0, '', '2 (2)'),
(1840, 'ITILSolution', 2, '0', 20, 'incv (2)', '2026-03-31 12:06:32', 0, '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_mailcollectors`
--

CREATE TABLE `glpi_mailcollectors` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `filesize_max` int(11) NOT NULL DEFAULT 2097152,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `passwd` varchar(255) DEFAULT NULL,
  `accepted` varchar(255) DEFAULT NULL,
  `refused` varchar(255) DEFAULT NULL,
  `errors` int(11) NOT NULL DEFAULT 0,
  `use_mail_date` tinyint(4) NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `requester_field` int(11) NOT NULL DEFAULT 0,
  `add_cc_to_observer` tinyint(4) NOT NULL DEFAULT 0,
  `collect_only_unread` tinyint(4) NOT NULL DEFAULT 0,
  `last_collect_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_manuallinks`
--

CREATE TABLE `glpi_manuallinks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(8096) NOT NULL,
  `open_window` tinyint(4) NOT NULL DEFAULT 1,
  `icon` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_manufacturers`
--

CREATE TABLE `glpi_manufacturers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_monitormodels`
--

CREATE TABLE `glpi_monitormodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT 0,
  `required_units` int(11) NOT NULL DEFAULT 1,
  `depth` float NOT NULL DEFAULT 1,
  `power_connections` int(11) NOT NULL DEFAULT 0,
  `power_consumption` int(11) NOT NULL DEFAULT 0,
  `is_half_rack` tinyint(4) NOT NULL DEFAULT 0,
  `picture_front` text DEFAULT NULL,
  `picture_rear` text DEFAULT NULL,
  `pictures` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_monitors`
--

CREATE TABLE `glpi_monitors` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `size` decimal(5,2) NOT NULL DEFAULT 0.00,
  `have_micro` tinyint(4) NOT NULL DEFAULT 0,
  `have_speaker` tinyint(4) NOT NULL DEFAULT 0,
  `have_subd` tinyint(4) NOT NULL DEFAULT 0,
  `have_bnc` tinyint(4) NOT NULL DEFAULT 0,
  `have_dvi` tinyint(4) NOT NULL DEFAULT 0,
  `have_pivot` tinyint(4) NOT NULL DEFAULT 0,
  `have_hdmi` tinyint(4) NOT NULL DEFAULT 0,
  `have_displayport` tinyint(4) NOT NULL DEFAULT 0,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `monitortypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `monitormodels_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_global` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ticket_tco` decimal(20,4) DEFAULT 0.0000,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `autoupdatesystems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `uuid` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_monitortypes`
--

CREATE TABLE `glpi_monitortypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_networkaliases`
--

CREATE TABLE `glpi_networkaliases` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `networknames_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `fqdns_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_networkequipmentmodels`
--

CREATE TABLE `glpi_networkequipmentmodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT 0,
  `required_units` int(11) NOT NULL DEFAULT 1,
  `depth` float NOT NULL DEFAULT 1,
  `power_connections` int(11) NOT NULL DEFAULT 0,
  `power_consumption` int(11) NOT NULL DEFAULT 0,
  `is_half_rack` tinyint(4) NOT NULL DEFAULT 0,
  `picture_front` text DEFAULT NULL,
  `picture_rear` text DEFAULT NULL,
  `pictures` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_networkequipments`
--

CREATE TABLE `glpi_networkequipments` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `ram` int(10) UNSIGNED DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `networks_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `networkequipmenttypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `networkequipmentmodels_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ticket_tco` decimal(20,4) DEFAULT 0.0000,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `uuid` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `autoupdatesystems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sysdescr` text DEFAULT NULL,
  `cpu` int(11) NOT NULL DEFAULT 0,
  `uptime` varchar(255) NOT NULL DEFAULT '0',
  `last_inventory_update` timestamp NULL DEFAULT NULL,
  `snmpcredentials_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_networkequipmenttypes`
--

CREATE TABLE `glpi_networkequipmenttypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_networkinterfaces`
--

CREATE TABLE `glpi_networkinterfaces` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_networknames`
--

CREATE TABLE `glpi_networknames` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `fqdns_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ipnetworks_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_networkportaggregates`
--

CREATE TABLE `glpi_networkportaggregates` (
  `id` int(10) UNSIGNED NOT NULL,
  `networkports_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `networkports_id_list` text DEFAULT NULL COMMENT 'array of associated networkports_id',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_networkportaliases`
--

CREATE TABLE `glpi_networkportaliases` (
  `id` int(10) UNSIGNED NOT NULL,
  `networkports_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `networkports_id_alias` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_networkportconnectionlogs`
--

CREATE TABLE `glpi_networkportconnectionlogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `connected` tinyint(4) NOT NULL DEFAULT 0,
  `networkports_id_source` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `networkports_id_destination` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_networkportdialups`
--

CREATE TABLE `glpi_networkportdialups` (
  `id` int(10) UNSIGNED NOT NULL,
  `networkports_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_networkportethernets`
--

CREATE TABLE `glpi_networkportethernets` (
  `id` int(10) UNSIGNED NOT NULL,
  `networkports_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `items_devicenetworkcards_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(10) DEFAULT '' COMMENT 'T, LX, SX',
  `speed` int(11) NOT NULL DEFAULT 10 COMMENT 'Mbit/s: 10, 100, 1000, 10000',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_networkportfiberchannels`
--

CREATE TABLE `glpi_networkportfiberchannels` (
  `id` int(10) UNSIGNED NOT NULL,
  `networkports_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `items_devicenetworkcards_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `networkportfiberchanneltypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `wwn` varchar(50) DEFAULT '',
  `speed` int(11) NOT NULL DEFAULT 10 COMMENT 'Mbit/s: 10, 100, 1000, 10000',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_networkportfiberchanneltypes`
--

CREATE TABLE `glpi_networkportfiberchanneltypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_networkportlocals`
--

CREATE TABLE `glpi_networkportlocals` (
  `id` int(10) UNSIGNED NOT NULL,
  `networkports_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_networkportmetrics`
--

CREATE TABLE `glpi_networkportmetrics` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `ifinbytes` bigint(20) NOT NULL DEFAULT 0,
  `ifinerrors` bigint(20) NOT NULL DEFAULT 0,
  `ifoutbytes` bigint(20) NOT NULL DEFAULT 0,
  `ifouterrors` bigint(20) NOT NULL DEFAULT 0,
  `networkports_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_networkports`
--

CREATE TABLE `glpi_networkports` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `logical_number` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `instantiation_type` varchar(255) DEFAULT NULL,
  `mac` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `ifmtu` int(11) NOT NULL DEFAULT 0,
  `ifspeed` bigint(20) NOT NULL DEFAULT 0,
  `ifinternalstatus` varchar(255) DEFAULT NULL,
  `ifconnectionstatus` int(11) NOT NULL DEFAULT 0,
  `iflastchange` varchar(255) DEFAULT NULL,
  `ifinbytes` bigint(20) NOT NULL DEFAULT 0,
  `ifinerrors` bigint(20) NOT NULL DEFAULT 0,
  `ifoutbytes` bigint(20) NOT NULL DEFAULT 0,
  `ifouterrors` bigint(20) NOT NULL DEFAULT 0,
  `ifstatus` varchar(255) DEFAULT NULL,
  `ifdescr` varchar(255) DEFAULT NULL,
  `ifalias` varchar(255) DEFAULT NULL,
  `portduplex` varchar(255) DEFAULT NULL,
  `trunk` tinyint(4) NOT NULL DEFAULT 0,
  `lastup` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_networkports_networkports`
--

CREATE TABLE `glpi_networkports_networkports` (
  `id` int(10) UNSIGNED NOT NULL,
  `networkports_id_1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `networkports_id_2` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_networkports_vlans`
--

CREATE TABLE `glpi_networkports_vlans` (
  `id` int(10) UNSIGNED NOT NULL,
  `networkports_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `vlans_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tagged` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_networkporttypes`
--

CREATE TABLE `glpi_networkporttypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `value_decimal` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `is_importable` tinyint(4) NOT NULL DEFAULT 0,
  `instantiation_type` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_networkporttypes`
--

INSERT INTO `glpi_networkporttypes` (`id`, `entities_id`, `is_recursive`, `value_decimal`, `name`, `comment`, `is_importable`, `instantiation_type`, `date_creation`, `date_mod`) VALUES
(1, 0, 0, 0, 'Name', 'Description References', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(2, 0, 0, 1, 'other', 'none of the following [RFC1213]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(3, 0, 0, 2, 'regular1822', 'BBN Report 1822 [RFC1213]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(4, 0, 0, 3, 'hdh1822', 'BBN Report 1822 [RFC1213]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(5, 0, 0, 4, 'ddn-x25', 'BBN Report 1822 [RFC1213]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(6, 0, 0, 5, 'x25', 'X.25 [RFC1382]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(7, 0, 0, 6, 'ethernet-csmacd', '[RFC1213]', 1, 'NetworkPortEthernet', '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(8, 0, 0, 7, 'IEEE802.3', 'DEPRECATED [RFC3635]', 1, 'NetworkPortEthernet', '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(9, 0, 0, 8, 'IEEE802.4', 'Token Bus-like Objects [RFC1239]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(10, 0, 0, 9, 'IEEE802.5', 'Token Ring-like Objects [RFC1748]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(11, 0, 0, 10, 'iso88026-man', '[RFC1213]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(12, 0, 0, 11, 'starLan', 'DEPRECATED [RFC3635]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(13, 0, 0, 12, 'proteon-10Mbit', '[RFC1213]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(14, 0, 0, 13, 'proteon-80Mbit', '[RFC1213]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(15, 0, 0, 14, 'hyperchannel', '[RFC1213]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(16, 0, 0, 15, 'FDDI', 'FDDI Objects [RFC1512]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(17, 0, 0, 16, 'lapb', 'LAP B [RFC1381]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(18, 0, 0, 17, 'sdlc', '[RFC1213]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(19, 0, 0, 18, 'ds1', 'T1/E1 Carrier Objects [RFC4805]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(20, 0, 0, 19, 'e1', 'obsolete [RFC4805]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(21, 0, 0, 20, 'basicISDN', '[RFC1213]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(22, 0, 0, 21, 'primaryISDN', '[RFC1213]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(23, 0, 0, 22, 'propPointToPointSerial', '[RFC1213]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(24, 0, 0, 23, 'ppp', 'Point-to-Point Protocol [RFC1213][RFC1471]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(25, 0, 0, 24, 'softwareLoopback', '[RFC1213]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(26, 0, 0, 25, 'eon', '[RFC1213]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(27, 0, 0, 26, 'ethernet-3Mbit', '[RFC1213]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(28, 0, 0, 27, 'nsip', '[RFC1213]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(29, 0, 0, 28, 'slip', '[RFC1213]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(30, 0, 0, 29, 'ultra', '[RFC1213]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(31, 0, 0, 30, 'ds3', 'DS3/E3 Interface Objects [RFC3896]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(32, 0, 0, 31, 'sip', 'SMDS Interface Objects [RFC1694]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(33, 0, 0, 32, 'frame-relay', 'Frame Relay Objects for DTE [RFC2115]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(34, 0, 0, 33, 'RS-232', 'RS-232 Objects [RFC1659]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(35, 0, 0, 34, 'Parallel', 'Parallel Printer Objects [RFC1660]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(36, 0, 0, 35, 'arcnet', 'ARC network', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(37, 0, 0, 36, 'arcnet-plus', 'ARC network plus', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(38, 0, 0, 37, 'atm', 'ATM', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(39, 0, 0, 38, 'MIOX25', 'MIOX25 [RFC1461]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(40, 0, 0, 39, 'SONET', 'SONET or SDH', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(41, 0, 0, 40, 'x25ple', 'X.25 packet level [RFC2127]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(42, 0, 0, 41, 'iso88022llc', '802.2 LLC', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(43, 0, 0, 42, 'localTalk', '', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(44, 0, 0, 43, 'smds-dxi', 'SMDS DXI', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(45, 0, 0, 44, 'frameRelayService', 'Frame Relay DCE [RFC2954]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(46, 0, 0, 45, 'v35', 'V.35', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(47, 0, 0, 46, 'hssi', 'HSSI', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(48, 0, 0, 47, 'hippi', 'HIPPI', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(49, 0, 0, 48, 'modem', 'generic modem', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(50, 0, 0, 49, 'aal5', 'AAL5 over ATM', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(51, 0, 0, 50, 'sonetPath', '', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(52, 0, 0, 51, 'sonetVT', '', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(53, 0, 0, 52, 'smds-icip', 'SMDS Inter-Carrier Interface Protocol', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(54, 0, 0, 53, 'propVirtual', 'proprietary vitural/internal interface [RFC2863]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(55, 0, 0, 54, 'propMultiLink', 'proprietary multi-link multiplexing [RFC2863]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(56, 0, 0, 55, 'ieee80212', '100BaseVG', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(57, 0, 0, 56, 'fibre-channel', 'Fibre Channel', 1, 'NetworkPortFiberchannel', '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(58, 0, 0, 57, 'hippiInterfaces', 'HIPPI interfaces [Philip_Cameron]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(59, 0, 0, 58, 'FrameRelayInterconnect', 'Interconnet over FR [Unknown]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(60, 0, 0, 59, 'aflane8023', 'ATM Emulated LAN for 802.3 [Keith_McCloghrie]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(61, 0, 0, 60, 'aflane8025', 'ATM Emulated LAN for 802.5 [Keith_McCloghrie]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(62, 0, 0, 61, 'cctEmul', 'ATM Emulated circuit [Guy_Fedorkow]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(63, 0, 0, 62, 'fastEther', 'DEPRECATED [RFC3635]', 1, 'NetworkPortEthernet', '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(64, 0, 0, 63, 'isdn', 'ISDN and X.25 [RFC1356]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(65, 0, 0, 64, 'v11', 'CCITT V.11/X.21 [Satish_Popat]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(66, 0, 0, 65, 'v36', 'CCITT V.36 [Satish_Popat]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(67, 0, 0, 66, 'g703-64k', 'CCITT G703 at 64Kbps [Satish_Popat]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(68, 0, 0, 67, 'g703-2mb', 'CCITT G703 at 2Mbps [Satish_Popat]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(69, 0, 0, 68, 'qllc', 'SNA QLLC [Satish_Popat]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(70, 0, 0, 69, 'fastEtherFX', 'DEPRECATED [RFC3635]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(71, 0, 0, 70, 'channel', 'channel [Steven_Schwell]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(72, 0, 0, 71, 'IEEE802.11', 'radio spread spectrum [Dawkoon_Paul_Lee]', 1, 'NetworkPortWifi', '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(73, 0, 0, 72, 'ibm370parChan', 'IBM System 360/370 OEMI Channel [Bill_Kwan]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(74, 0, 0, 73, 'ESCON', 'IBM Enterprise Systems Connection [Bill_Kwan]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(75, 0, 0, 74, 'DLSw', 'Data Link Switching [Bill_Kwan]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(76, 0, 0, 75, 'ISDNs', 'ISDN S/T interface [Ed_Alcoff]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(77, 0, 0, 76, 'ISDNu', 'ISDN U interface [Ed_Alcoff]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(78, 0, 0, 77, 'lapd', 'Link Access Protocol D [Ed_Alcoff]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(79, 0, 0, 78, 'ip-switch', 'IP Switching Objects [Joe_Wei]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(80, 0, 0, 79, 'rsrb', 'Remote Source Route Bridging [Bob_Clouston]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(81, 0, 0, 80, 'atm-logical', 'ATM Logical Port [RFC3606]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(82, 0, 0, 81, 'ds0', 'Digital Signal Level 0 [RFC2494]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(83, 0, 0, 82, 'ds0Bundle', 'group of ds0s on the same ds1 [RFC2494]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(84, 0, 0, 83, 'bsc', 'Bisynchronous Protocol [Bill_Kwan]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(85, 0, 0, 84, 'async', 'Asynchronous Protocol [Bill_Kwan]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(86, 0, 0, 85, 'cnr', 'Combat Net Radio [Herb_Jensen]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(87, 0, 0, 86, 'iso88025Dtr', 'ISO 802.5r DTR [Trevor_Warwick]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(88, 0, 0, 87, 'eplrs', 'Enhanced  Pos Loc Report Sys [Herb_Jensen]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(89, 0, 0, 88, 'arap', 'Appletalk Remote Access Protocol [Jim_Halpin]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(90, 0, 0, 89, 'propCnls', 'Proprietary Connectionless Proto. [Robert_Neill]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(91, 0, 0, 90, 'hostPad', 'CCITT-ITU X.29 PAD Protocol [Robert_Neill]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(92, 0, 0, 91, 'termPad', 'CCITT-ITU X.3 PAD Facility [Robert_Neill]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(93, 0, 0, 92, 'frameRelayMPI', 'Multiproto Interconnect over FR [Robert_Neill]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(94, 0, 0, 93, 'x213', 'CCITT-ITU X213 [Robert_Neill]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(95, 0, 0, 94, 'adsl', 'Asymmetric Digital Subscriber Loop [Gregory_Bathrick]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(96, 0, 0, 95, 'radsl', 'Rate-Adapt. Digital Subscriber Loop [Gregory_Bathrick]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(97, 0, 0, 96, 'sdsl', 'Symmetric Digital Subscriber Loop [Gregory_Bathrick]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(98, 0, 0, 97, 'vdsl', 'Very H-Speed Digital Subscrib. Loop [Gregory_Bathrick]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(99, 0, 0, 98, 'iso88025CRFPInt', 'ISO 802.5 CRFP [Trevor_Warwick]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(100, 0, 0, 99, 'myrinet', 'Myricom Myrinet [Bob_Felderman]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(101, 0, 0, 100, 'voiceEM', 'Voice recEive and transMit (E&#38;M) [Bob_Stewart]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(102, 0, 0, 101, 'voiceFXO', 'Voice Foreign Exchange Office [Bob_Stewart]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(103, 0, 0, 102, 'voiceFXS', 'Voice Foreign Exchange Station [Bob_Stewart]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(104, 0, 0, 103, 'voiceEncap', 'Voice encapsulation [Bob_Stewart]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(105, 0, 0, 104, 'voiceOverIp', 'Voice over IP encapsulation [Bob_Stewart]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(106, 0, 0, 105, 'atmDxi', 'ATM DXI [Gary_Hanson]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(107, 0, 0, 106, 'atmFuni', 'ATM FUNI [Gary_Hanson]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(108, 0, 0, 107, 'atmIma', 'ATM IMA [Chris_Martin]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(109, 0, 0, 108, 'pppMultilinkBundle', 'PPP Multilink Bundle [John_Shriver]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(110, 0, 0, 109, 'ipOverCdlc', 'IBM ipOverCdlc [Ken_White]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(111, 0, 0, 110, 'ipOverClaw', 'IBM Common Link Access to Workstn [Ken_White]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(112, 0, 0, 111, 'stackToStack', 'IBM stackToStack [Ken_White]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(113, 0, 0, 112, 'virtualIpAddress', 'IBM VIPA [Ken_White]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(114, 0, 0, 113, 'mpc', 'IBM multi-protocol channel support [Ken_White]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(115, 0, 0, 114, 'ipOverAtm', 'IBM ipOverAtm [RFC2320]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(116, 0, 0, 115, 'iso88025Fiber', 'ISO 802.5j Fiber Token Ring [Kevin_Lingle]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(117, 0, 0, 116, 'tdlc', 'IBM twinaxial data link control [John_Pechacek]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(118, 0, 0, 117, 'gigabitEthernet', 'DEPRECATED [RFC3635]', 1, 'NetworkPortEthernet', '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(119, 0, 0, 118, 'hdlc', 'HDLC [Sebastien_Rosset]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(120, 0, 0, 119, 'lapf', 'LAP F [Sebastien_Rosset]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(121, 0, 0, 120, 'v37', 'V.37 [Sebastien_Rosset]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(122, 0, 0, 121, 'x25mlp', 'Multi-Link Protocol [Sebastien_Rosset]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(123, 0, 0, 122, 'x25huntGroup', 'X25 Hunt Group [Sebastien_Rosset]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(124, 0, 0, 123, 'transpHdlc', 'Transp HDLC [Sebastien_Rosset]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(125, 0, 0, 124, 'interleave', 'Interleave channel [Karmous_Edwards]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(126, 0, 0, 125, 'fast', 'Fast channel [Karmous_Edwards]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(127, 0, 0, 126, 'ip', 'IP (for APPN HPR in IP networks) [Robert_Moore]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(128, 0, 0, 127, 'docsCableMaclayer', 'CATV Mac Layer [Azlina_Palmer]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(129, 0, 0, 128, 'docsCableDownstream', 'CATV Downstream interface [Azlina_Palmer]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(130, 0, 0, 129, 'docsCableUpstream', 'CATV Upstream interface [Azlina_Palmer]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(131, 0, 0, 130, 'a12MppSwitch', 'Avalon Parallel Processor [Ross_Harvey]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(132, 0, 0, 131, 'tunnel', 'Encapsulation interface [Dave_Thaler]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(133, 0, 0, 132, 'coffee', 'coffee pot [RFC2325]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(134, 0, 0, 133, 'ces', 'Circiut Emulation Service [Ron_Carmona]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(135, 0, 0, 134, 'atmSubInterface', '(x)  ATM Sub Interface [Keith_McCloghrie]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(136, 0, 0, 135, 'l2vlan', 'Layer 2 Virtual LAN using 802.1Q [Mike_MacFaden]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(137, 0, 0, 136, 'l3ipvlan', 'Layer 3 Virtual LAN - IP Protocol [Mike_MacFaden]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(138, 0, 0, 137, 'l3ipxvlan', 'Layer 3 Virtual LAN - IPX Prot. [Mike_MacFaden]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(139, 0, 0, 138, 'digitalPowerLine', 'IP over Power Lines [Hans_Scholtes]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(140, 0, 0, 139, 'mediaMailOverIp', '(xxx)  Multimedia Mail over IP [Hongchi_Shih]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(141, 0, 0, 140, 'dtm', 'Dynamic synchronous Transfer Mode [Jakob_Ellerstedt]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(142, 0, 0, 141, 'dcn', 'Data Communications Network [James_Card]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(143, 0, 0, 142, 'ipForward', 'IP Forwarding Interface [James_Card]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(144, 0, 0, 143, 'msdsl', 'Multi-rate Symmetric DSL [Gopinath_Durairaj]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(145, 0, 0, 144, 'ieee1394     IEEE1394', 'High Performance Serial Bus [Kenji_Fujisawa]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(146, 0, 0, 145, 'if-gsn', 'HIPPI-6400 [Jean_Michel_Pittet]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(147, 0, 0, 146, 'dvbRccMacLayer', 'DVB-RCC MAC Layer [Maarten_Oelering]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(148, 0, 0, 147, 'dvbRccDownstream', 'DVB-RCC Downstream Channel [Maarten_Oelering]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(149, 0, 0, 148, 'dvbRccUpstream', 'DVB-RCC Upstream Channel [Maarten_Oelering]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(150, 0, 0, 149, 'atmVirtual', 'ATM Virtual Interface [Subrahmanya_Hegde]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(151, 0, 0, 150, 'mplsTunnel', 'MPLS Tunnel Virtual Interface [Cheenu_Srinivasan]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(152, 0, 0, 151, 'srp', 'Spatial Reuse Protocol [Bill_Shetti]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(153, 0, 0, 152, 'voiceOverAtm', 'Voice over ATM [Chris_White]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(154, 0, 0, 153, 'voiceOverFrameRelay', 'Voice Over Frame Relay [Chris_White]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(155, 0, 0, 154, 'idsl', 'Digital Subscriber Loop over ISDN [Patrick_Gili]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(156, 0, 0, 155, 'compositeLink', 'Avici Composite Link Interface [Joseph_Dube]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(157, 0, 0, 156, 'ss7SigLink', 'SS7 Signaling Link [Cheenu_Srinivasan]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(158, 0, 0, 157, 'propWirelessP2P', 'Prop. P2P wireless interface [Joseph_Raja]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(159, 0, 0, 158, 'frForward', 'Frame forward Interface [Subrahmanya_Hegde]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(160, 0, 0, 159, 'rfc1483', 'Multiprotocol over ATM AAL5 [RFC1483]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(161, 0, 0, 160, 'USB', 'USB Interface [Bejamin_Dolnik]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(162, 0, 0, 161, 'ieee8023adLag', 'IEEE 802.3ad Link Aggregate [Les_Bell]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(163, 0, 0, 162, 'bgpPolicyAccounting', 'BGP Policy Accounting [Vinod_B_C]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(164, 0, 0, 163, 'frf16MfrBundle', 'FRF.16 Multilik Frame Relay [Pate_Prayson]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(165, 0, 0, 164, 'h323Gatekeeper', 'H323 Gatekeeper [Chris_White]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(166, 0, 0, 165, 'h323Proxy', 'H323 Voice and Video Proxy [Chris_White]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(167, 0, 0, 166, 'mpls', 'MPLS [Cheenu_Srinivasan]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(168, 0, 0, 167, 'mfSigLink', 'Multi-frequency signaling link [Cheenu_Srinivasan]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(169, 0, 0, 168, 'hdsl2', 'High Bit-Rate DSL, 2nd gen. [Bob_Ray]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(170, 0, 0, 169, 'shdsl', 'Multirate HDSL2 [Bob_Ray]', 1, 'NetworkPortEthernet', '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(171, 0, 0, 170, 'ds1FDL', 'Facility Data Link (4Kbps) on a DS1 [Bill_Kwan]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(172, 0, 0, 171, 'POS', 'Packet over SONET/SDH Interface [Ewart_Tempest]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(173, 0, 0, 172, 'dvbAsiIn', 'DVB-ASI Input [Hezi_Oved]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(174, 0, 0, 173, 'dvbAsiOut', 'DVB-ASI Output [Hezi_Oved]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(175, 0, 0, 174, 'plc', 'Power Line Communications [Andrew_Lunn]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(176, 0, 0, 175, 'NFAS', 'Non-Facility Associated Signaling [Sidney_Antommarchi]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(177, 0, 0, 176, 'TR008', 'TROO8 [Sidney_Antommarchi]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(178, 0, 0, 177, 'GR303RDT', 'Remote Digital Terminal [Sidney_Antommarchi]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(179, 0, 0, 178, 'GR303IDT', 'Integrated Digital Terminal [Sidney_Antommarchi]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(180, 0, 0, 179, 'ISUP', 'ISUP [Sidney_Antommarchi]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(181, 0, 0, 180, 'propDocsWirelessMaclayer', 'Cisco proprietary Maclayer [Joseph_Raja]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(182, 0, 0, 181, 'propDocsWirelessDownstream', 'Cisco proprietary Downstream [Joseph_Raja]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(183, 0, 0, 182, 'propDocsWirelessUpstream', 'Cisco proprietary Upstream [Joseph_Raja]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(184, 0, 0, 183, 'hiperlan2', 'HIPERLAN Type 2 Radio Interface [Jamshid_Khun_Jush]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(185, 0, 0, 184, 'propBWAp2Mp', 'PropBroadbandWirelessAccesspt2Multipt\n(use of this type for IEEE 802.16\nWMAN, interfaces as per IEEE 802.16\nis deprecated and iftype 237 should\nbe used instead) [Zvika_Zilberman]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(186, 0, 0, 185, 'sonetOverheadChannel', 'SONET Overhead Channel [ODSI_Coalition_K_Arv]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(187, 0, 0, 186, 'digitalWrapperOverheadChannel', 'Digital Wrapper\nOverhead [ODSI_Coalition_K_Arv]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(188, 0, 0, 187, 'aal2', 'ATM adaptation layer 2 [K_Ashoka]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(189, 0, 0, 188, 'radioMAC', 'MAC layer over radio links [Daniele_Behar]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(190, 0, 0, 189, 'atmRadio', 'ATM over radio links [Daniele_Behar]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(191, 0, 0, 190, 'IMT', 'Inter-Machine Trunks [Sidney_Antommarchi]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(192, 0, 0, 191, 'mvl', 'Multiple Virtual Lines DSL [Kevin_Baughman]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(193, 0, 0, 192, 'reachDSL', 'Long Reach DSL [Kevin_Baughman]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(194, 0, 0, 193, 'frDlciEndPt', 'Frame Relay DLCI End Point [Robert_Steinberger]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(195, 0, 0, 194, 'atmVciEndPt', 'ATM VCI End Point [Robert_Steinberger]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(196, 0, 0, 195, 'opticalChannel', 'Optical Channel [Mark_Stewart]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(197, 0, 0, 196, 'opticalTransport', 'Optical Transport [Mark_Stewart]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(198, 0, 0, 197, 'propAtm', 'Proprietary ATM [Subrahmanya_Hegde]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(199, 0, 0, 198, 'voiceOverCable', 'Voice Over Cable Interface [Eugene_Nechamkin]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(200, 0, 0, 199, 'infiniband', 'Infiniband [Bill_Strahm]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(201, 0, 0, 200, 'teLink', 'TE Link [Martin_Dubuc]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(202, 0, 0, 201, 'q2931', 'Q.2931 [Sidney_Antommarchi_2]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(203, 0, 0, 202, 'virtualTg', 'Virtual Trunk Group [Sidney_Antommarchi_2]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(204, 0, 0, 203, 'sipTg', 'SIP Trunk Group [Sidney_Antommarchi_2]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(205, 0, 0, 204, 'sipSig', 'SIP Signaling [Sidney_Antommarchi_2]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(206, 0, 0, 205, 'docsCableUpstreamChannel', 'CATV Upstream Channel [Greg_Nakanishi]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(207, 0, 0, 206, 'econet', 'Acorn Econet [Ben_Harris]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(208, 0, 0, 207, 'pon155', 'FSAN 155Mb Symetrical PON interface [Graham_Higgins]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(209, 0, 0, 208, 'pon622', 'FSAN 622Mb Symetrical PON interface [Graham_Higgins]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(210, 0, 0, 209, 'bridge', 'Transparent bridge interface [Yuzo_Watanabe]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(211, 0, 0, 210, 'linegroup', 'Interface common to multiple lines [Yuzo_Watanabe]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(212, 0, 0, 211, 'voiceEMFGD', 'voice E&#38;M Feature Group D [Taher_Shaikh]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(213, 0, 0, 212, 'voiceFGDEANA', 'voice FGD Exchange Access North American [Taher_Shaikh]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(214, 0, 0, 213, 'voiceDID', 'voice Direct Inward Dialing [Taher_Shaikh]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(215, 0, 0, 214, 'mpegTransport', 'MPEG transport interface [Gaurav_Aggarwal]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(216, 0, 0, 215, 'sixToFour', '6to4 interface  (DEPRECATED) [RFC4087]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(217, 0, 0, 216, 'gtp', 'GTP (GPRS Tunneling Protocol) [Rajesh_M_L]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(218, 0, 0, 217, 'pdnEtherLoop1', 'Paradyne EtherLoop 1 [Shu_Dong]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(219, 0, 0, 218, 'pdnEtherLoop2', 'Paradyne EtherLoop 2 [Shu_Dong]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(220, 0, 0, 219, 'opticalChannelGroup', 'Optical Channel Group [Hing_Kam_Lam]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(221, 0, 0, 220, 'homepna', 'HomePNA ITU-T G.989 [Stephen_Palm]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(222, 0, 0, 221, 'gfp', 'Generic Framing Procedure (GFP) [Italo_Busi]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(223, 0, 0, 222, 'ciscoISLvlan', 'Layer 2 Virtual LAN using Cisco ISL [Sandeep_Raghavendra]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(224, 0, 0, 223, 'actelisMetaLOOP', 'Acteleis proprietary MetaLOOP\nHigh Speed Link [Edward_Beili]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(225, 0, 0, 224, 'fcipLink', 'FCIP Link [Anil_Rijhsinghani]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(226, 0, 0, 225, 'rpr', 'Resilient Packet Ring Interface Type [IEEE 802.17]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(227, 0, 0, 226, 'qam', 'RF Qam Interface [Jeyachitra_Alagar]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(228, 0, 0, 227, 'lmp', 'Link Management Protocol [RFC4327]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(229, 0, 0, 228, 'cblVectaStar', 'Cambridge Broadband Networks Limited\nVectaStar [John_Naylon]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(230, 0, 0, 229, 'docsCableMCmtsDownstream', 'CATV Modular CMTS Downstream\nInterface [Eduardo_Cardona][\"Data-Over-Cable Service Interface Specifications:\nM-CMTS Operations Support System Interface Specification,\nCM-SP-M-OSSI-I01-050805\", DOCSIS, August 2005.][http://www.cablemodem.com/specifications][https://www.cablelabs.com/specifications/archives/docsis.html]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(231, 0, 0, 230, 'adsl2', 'Asymmetric Digital Subscriber Loop\nVersion 2 (DEPRECATED - REPLACED\nBY 238) [RFC4706]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(232, 0, 0, 231, 'macSecControlledIF', 'MACSecControlled [Paul_Congdon]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(233, 0, 0, 232, 'macSecUncontrolledIF', 'MACSecUncontrolled [Paul_Congdon]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(234, 0, 0, 233, 'aviciOpticalEther', 'Avici Optical Ethernet Aggregate [Somen_Bhattacharya]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(235, 0, 0, 234, 'atmbond', 'atmbond [https://www.itu.int/rec/T-REC-G.998.1-200501-I/en]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(236, 0, 0, 235, 'voiceFGDOS', 'voice FGD Operator Services [Lizzie_Cheung]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(237, 0, 0, 236, 'mocaVersion1', 'MultiMedia over Coax Alliance [Ladd_Wardani]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(238, 0, 0, 237, 'ieee80216WMAN', 'IEEE 802.16 WMAN interface [http://standards.ieee.org/getieee802/802.16.html]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(239, 0, 0, 238, 'adsl2plus', 'Asymmetric Digital Subscriber Loop\nVersion 2 -- Version 2 Plus and all\nvariants [RFC4706]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(240, 0, 0, 239, 'dvbRcsMacLayer', 'DVB-RCS MAC Layer [RFC5728][ETSI EN 301 790][https://web.archive.org/web/20181229131835/http://satlabs.org/pdf/SatLabs_System_Recommendations_v2.0_M&#38;C.pdf]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(241, 0, 0, 240, 'dvbTdm', 'DVB Satellite TDM [RFC5728][ETSI EN 300 421][ETSI EN 302 307][https://web.archive.org/web/20181229131835/http://satlabs.org/pdf/SatLabs_System_Recommendations_v2.0_M&#38;C.pdf]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(242, 0, 0, 241, 'dvbRcsTdma', 'DVB-RCS TDMA [RFC5728][ETSI EN 301 790][ETSI EN 300 421][https://web.archive.org/web/20181229131835/http://satlabs.org/pdf/SatLabs_System_Recommendations_v2.0_M&#38;C.pdf]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(243, 0, 0, 242, 'x86Laps', 'LAPS based on ITU-T X.86/Y.1323 [Orly_Nicklass][http://grouper.ieee.org/groups/802/3/ad_hoc/etholaps/public/docs/opening_report_0301.pdf]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(244, 0, 0, 243, 'wwanPP', '3GPP WWAN [Gabriel_Montenegro][https://www.3gpp.org/ftp/specs/archive/23_series/23.060/23060-740.zip]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(245, 0, 0, 244, 'wwanPP2', '3GPP2 WWAN [Gabriel_Montenegro][http://www.3gpp2.org/Public_html/Specs/C.S0017-005-A_v1.0_040617.pdf]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(246, 0, 0, 245, 'voiceEBS', 'voice P-phone EBS physical interface [Tom_Chou]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(247, 0, 0, 246, 'ifPwType', 'Pseudowire interface type [RFC5601]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(248, 0, 0, 247, 'ILAN', 'Internal LAN on a bridge per IEEE\n802.1ap [Glenn_Parsons][http://www.ieee802.org/1/files/private/ap-drafts/d3/802-1ap-D3-4.pdf]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(249, 0, 0, 248, 'PIP', 'Provider Instance Port on a bridge\nper IEEE 802.1ah PBB [Glenn_Parsons][http://www.ieee802.org/1/files/private/ah-drafts/d4/802-1ah-d4-2.pdf]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(250, 0, 0, 249, 'aluELP', 'Alcatel-Lucent Ethernet Link Protection [Xiaohua_Ma]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(251, 0, 0, 250, 'gpon', 'Gigabit-capable passive optical networks\n(G-PON)  as per ITU-T G.984 [Hyeri_Koh]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(252, 0, 0, 251, 'vdsl2', 'Very high speed digital subscriber\nline Version 2 (as per ITU-T Recommendation\nG.993.2) [Markus_Freudenberger][RFC5650]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(253, 0, 0, 252, 'capwapDot11Profile', 'WLAN Profile Interface [RFC5834]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(254, 0, 0, 253, 'capwapDot11Bss', 'WLAN BSS Interface [RFC5834]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(255, 0, 0, 254, 'capwapWtpVirtualRadio', 'WTP Virtual Radio Interface [RFC5833]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(256, 0, 0, 255, 'bits', 'bitsport [Du_Feng]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(257, 0, 0, 256, 'docsCableUpstreamRfPort', 'DOCSIS CATV Upstream RF\nPort [Michael_Patrick][https://www.cablelabs.com/specifications/CM-SP-EQAM-PMI-I01-081209.pdf]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(258, 0, 0, 257, 'cableDownstreamRfPort', 'CATV downstream RF port [Michael_Patrick]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(259, 0, 0, 258, 'vmwareVirtualNic', 'VMware Virtual Network Interface [Mike_MacFaden]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(260, 0, 0, 259, 'ieee802154', 'IEEE 802.15.4 WPAN interface [Juergen_Schoenwaelde][\"IEEE Std. 802.15.4-2006\", October 2006.]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(261, 0, 0, 260, 'otnOdu', 'OTN Optical Data Unit [Jim_Vance][https://www.itu.int/ITU-T/studygroups/com15/otn/OTNtutorial.pdf]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(262, 0, 0, 261, 'otnOtu', 'OTN Optical channel Transport Unit [Jim_Vance][https://www.itu.int/ITU-T/studygroups/com15/otn/OTNtutorial.pdf]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(263, 0, 0, 262, 'ifVfiType', 'VPLS Forwarding Instance Interface\nType [Manas_Pati]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(264, 0, 0, 263, 'g9981', 'G.998.1 bonded interface [RFC6768][RFC Errata 3591]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(265, 0, 0, 264, 'g9982', 'G.998.2 bonded interface [RFC6767][RFC Errata 3589]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(266, 0, 0, 265, 'g9983', 'G.998.3 bonded interface [RFC6766][RFC Errata 3588]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(267, 0, 0, 266, 'aluEpon (E-PON)', 'Ethernet Passive Optical Networks [Karel_Meijfroidt]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(268, 0, 0, 267, 'aluEponOnu', 'EPON Optical Network Unit [Karel_Meijfroidt]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(269, 0, 0, 268, 'aluEponPhysicalUni', 'EPON physical User to Network\ninterface [Karel_Meijfroidt]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(270, 0, 0, 269, 'aluEponLogicalLink', 'The emulation of a point-to-point\nlink over the EPON layer [Karel_Meijfroidt]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(271, 0, 0, 270, 'aluGponOnu', 'GPON Optical Network Unit [Karel_Meijfroidt][https://www.itu.int/rec/T-REC-G.984.2/en]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(272, 0, 0, 271, 'aluGponPhysicalUni', 'GPON physical User to Network\ninterface [Karel_Meijfroidt][https://www.itu.int/rec/T-REC-G.984.2/en]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(273, 0, 0, 272, 'vmwareNicTeam', 'VMware NIC Team [Michael_MacFaden][https://www.vmware.com/pdf/esx2_NIC_Teaming.pdf]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(274, 0, 0, 273, 'Reserved', 'The corresponding transmission value\nis allocated according to the following\nreference. [RFC6825]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(275, 0, 0, 274, 'Reserved', 'The corresponding transmission value\nis allocated according to the following reference. [RFC7257]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(276, 0, 0, 275, 'Reserved', 'The corresponding transmission value\nis allocated according to the following reference. [RFC7257]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(277, 0, 0, 276, 'Reserved', 'The corresponding transmission value\nis allocated according to the following reference. [RFC7257]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(278, 0, 0, 277, 'docsOfdmDownstream', 'CATV Downstream OFDM interface [https://www.cablelabs.com/specification/cable-modem-operations-support-system-interface-specification][Miguel_O_Alvarez]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(279, 0, 0, 278, 'docsOfdmaUpstream', 'CATV Upstream OFDMA interface [https://www.cablelabs.com/specification/cable-modem-operations-support-system-interface-specification][Miguel_O_Alvarez]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(280, 0, 0, 279, 'gfast', 'G.fast port [ITU-T G.9701]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(281, 0, 0, 280, 'sdci', 'SDCI (IO-Link) [IEC 61131-9 Edition 1.0 2013-09][Markus_Rentschler]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(282, 0, 0, 281, 'xboxWireless', 'Xbox wireless [Brandon_Jiang]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(283, 0, 0, 282, 'fastdsl', 'FastDSL [BBF TR-355][Broadband_Forum]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(284, 0, 0, 283, 'docsCableScte55d1FwdOob', 'Cable SCTE 55-1 OOB Forward Channel [https://www.scte.org/documents/pdf/Standards/ANSI_SCTE-55-1-2009.pdf][Brian_Hedstrom]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(285, 0, 0, 284, 'docsCableScte55d1RetOob', 'Cable SCTE 55-1 OOB Return Channel [https://www.scte.org/documents/pdf/Standards/ANSI_SCTE-55-1-2009.pdf][Brian_Hedstrom]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(286, 0, 0, 285, 'docsCableScte55d2DsOob', 'Cable SCTE 55-2 OOB Downstream Channel [https://web.archive.org/web/20190822104256/http://www.scte.org/documents/pdf/Standards/ANSI_SCTE%2055-2%202008.pdf][Brian_Hedstrom]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(287, 0, 0, 286, 'docsCableScte55d2UsOob', 'Cable SCTE 55-2 OOB Upstream Channel [https://web.archive.org/web/20190822104256/http://www.scte.org/documents/pdf/Standards/ANSI_SCTE%2055-2%202008.pdf][Brian_Hedstrom]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(288, 0, 0, 287, 'docsCableNdf', 'Cable Narrowband Digital Forward [http://www.cablelabs.com/wp-content/uploads/specdocs/CM-SP-R-OOB-I04-160923.pdf][Brian_Hedstrom]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(289, 0, 0, 288, 'docsCableNdr', 'Cable Narrowband Digital Return [http://www.cablelabs.com/wp-content/uploads/specdocs/CM-SP-R-OOB-I04-160923.pdf][Brian_Hedstrom]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(290, 0, 0, 289, 'ptm', 'Packet Transfer Mode [ITU-T G.993.1, Annex H][ITU-T G.993.2][ITU-T G.9701][Broadband_Forum]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(291, 0, 0, 290, 'ghn', 'G.hn port [ITU-T G.9961][Broadband_Forum]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(292, 0, 0, 291, 'otnOtsi', 'Optical Tributary Signal [ITU-T G.959.1][Koteswara_Boyapati]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(293, 0, 0, 292, 'otnOtuc', 'OTN OTUCn [ITU-T G.709/Y.1331][Koteswara_Boyapati]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(294, 0, 0, 293, 'otnOduc', 'OTN ODUC [ITU-T G.709][Koteswara_Boyapati]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(295, 0, 0, 294, 'otnOtsig', 'OTN OTUC Signal [ITU-T G.709][Koteswara_Boyapati]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(296, 0, 0, 295, 'microwaveCarrierTermination', 'air interface of a single microwave carrier [RFC8561]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(297, 0, 0, 296, 'microwaveRadioLinkTerminal', 'radio link interface for one or several aggregated microwave carriers [RFC8561]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(298, 0, 0, 297, 'ieee8021axDrni', 'IEEE 802.1AX Distributed Resilient Network Interface [IEEE 802.1AX-Rev-d2-0][John_Messenger]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(299, 0, 0, 298, 'ax25', 'AX.25 network interfaces [AX.25 Link Access Protocol for Amateur Packet Radio version 2.2][Iain_Learmonth]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(300, 0, 0, 299, 'ieee19061nanocom', 'Nanoscale and Molecular Communication [IEEE 1906.1-2015][Stephen_F_Bush]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(301, 0, 0, 300, 'cpri', 'Common Public Radio Interface [CPRI v7.0][Renwang_Liu]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(302, 0, 0, 301, 'omni', 'Overlay Multilink Network Interface (OMNI) [draft-templin-6man-omni-00][Fred_L_Templin]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(303, 0, 0, 302, 'roe', 'Radio over Ethernet Interface [1914.3-2018 - IEEE Standard for Radio over Ethernet Encapsulations and Mappings][Renwang_Liu]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02'),
(304, 0, 0, 303, 'p2pOverLan', 'Point to Point over LAN interface [RFC9296]', 0, NULL, '2026-03-01 14:17:02', '2026-03-01 14:17:02');

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_networkportwifis`
--

CREATE TABLE `glpi_networkportwifis` (
  `id` int(10) UNSIGNED NOT NULL,
  `networkports_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `items_devicenetworkcards_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `wifinetworks_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `networkportwifis_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'only useful in case of Managed node',
  `version` varchar(20) DEFAULT NULL COMMENT 'a, a/b, a/b/g, a/b/g/n, a/b/g/n/y',
  `mode` varchar(20) DEFAULT NULL COMMENT 'ad-hoc, managed, master, repeater, secondary, monitor, auto',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_networks`
--

CREATE TABLE `glpi_networks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_notepads`
--

CREATE TABLE `glpi_notepads` (
  `id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_lastupdater` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `content` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_notifications`
--

CREATE TABLE `glpi_notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `event` varchar(255) NOT NULL,
  `comment` text DEFAULT NULL,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `allow_response` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_notifications`
--

INSERT INTO `glpi_notifications` (`id`, `name`, `entities_id`, `itemtype`, `event`, `comment`, `is_recursive`, `is_active`, `date_mod`, `date_creation`, `allow_response`) VALUES
(1, 'Alert Tickets not closed', 0, 'Ticket', 'alertnotclosed', NULL, 1, 1, NULL, NULL, 1),
(2, 'New Ticket', 0, 'Ticket', 'new', NULL, 1, 1, NULL, NULL, 1),
(3, 'Update Ticket', 0, 'Ticket', 'update', NULL, 1, 0, NULL, NULL, 1),
(4, 'Close Ticket', 0, 'Ticket', 'closed', NULL, 1, 1, NULL, NULL, 1),
(5, 'Add Followup', 0, 'Ticket', 'add_followup', NULL, 1, 1, NULL, NULL, 1),
(6, 'Add Task', 0, 'Ticket', 'add_task', NULL, 1, 1, NULL, NULL, 1),
(7, 'Update Followup', 0, 'Ticket', 'update_followup', NULL, 1, 1, NULL, NULL, 1),
(8, 'Update Task', 0, 'Ticket', 'update_task', NULL, 1, 1, NULL, NULL, 1),
(9, 'Delete Followup', 0, 'Ticket', 'delete_followup', NULL, 1, 1, NULL, NULL, 1),
(10, 'Delete Task', 0, 'Ticket', 'delete_task', NULL, 1, 1, NULL, NULL, 1),
(11, 'Resolve ticket', 0, 'Ticket', 'solved', NULL, 1, 1, NULL, NULL, 1),
(12, 'Ticket Validation', 0, 'Ticket', 'validation', NULL, 1, 1, NULL, NULL, 1),
(13, 'New Reservation', 0, 'Reservation', 'new', NULL, 1, 1, NULL, NULL, 1),
(14, 'Update Reservation', 0, 'Reservation', 'update', NULL, 1, 1, NULL, NULL, 1),
(15, 'Delete Reservation', 0, 'Reservation', 'delete', NULL, 1, 1, NULL, NULL, 1),
(16, 'Alert Reservation', 0, 'Reservation', 'alert', NULL, 1, 1, NULL, NULL, 1),
(17, 'Contract Notice', 0, 'Contract', 'notice', NULL, 1, 1, NULL, NULL, 1),
(18, 'Contract End', 0, 'Contract', 'end', NULL, 1, 1, NULL, NULL, 1),
(19, 'MySQL Synchronization', 0, 'DBConnection', 'desynchronization', NULL, 1, 1, NULL, NULL, 1),
(20, 'Cartridges', 0, 'CartridgeItem', 'alert', NULL, 1, 1, NULL, NULL, 1),
(21, 'Consumables', 0, 'ConsumableItem', 'alert', NULL, 1, 1, NULL, NULL, 1),
(22, 'Infocoms', 0, 'Infocom', 'alert', NULL, 1, 1, NULL, NULL, 1),
(23, 'Software Licenses', 0, 'SoftwareLicense', 'alert', NULL, 1, 1, NULL, NULL, 1),
(24, 'Ticket Recall', 0, 'Ticket', 'recall', NULL, 1, 1, NULL, NULL, 1),
(25, 'Password Forget', 0, 'User', 'passwordforget', NULL, 1, 1, NULL, NULL, 1),
(26, 'Ticket Satisfaction', 0, 'Ticket', 'satisfaction', NULL, 1, 1, NULL, NULL, 1),
(27, 'Item not unique', 0, 'FieldUnicity', 'refuse', NULL, 1, 1, NULL, NULL, 1),
(28, 'CronTask Watcher', 0, 'CronTask', 'alert', NULL, 1, 1, NULL, NULL, 1),
(29, 'New Problem', 0, 'Problem', 'new', NULL, 1, 1, NULL, NULL, 1),
(30, 'Update Problem', 0, 'Problem', 'update', NULL, 1, 1, NULL, NULL, 1),
(31, 'Resolve Problem', 0, 'Problem', 'solved', NULL, 1, 1, NULL, NULL, 1),
(32, 'Add Task', 0, 'Problem', 'add_task', NULL, 1, 1, NULL, NULL, 1),
(33, 'Update Task', 0, 'Problem', 'update_task', NULL, 1, 1, NULL, NULL, 1),
(34, 'Delete Task', 0, 'Problem', 'delete_task', NULL, 1, 1, NULL, NULL, 1),
(35, 'Close Problem', 0, 'Problem', 'closed', NULL, 1, 1, NULL, NULL, 1),
(36, 'Delete Problem', 0, 'Problem', 'delete', NULL, 1, 1, NULL, NULL, 1),
(37, 'Ticket Validation Answer', 0, 'Ticket', 'validation_answer', NULL, 1, 1, NULL, NULL, 1),
(38, 'Contract End Periodicity', 0, 'Contract', 'periodicity', NULL, 1, 1, NULL, NULL, 1),
(39, 'Contract Notice Periodicity', 0, 'Contract', 'periodicitynotice', NULL, 1, 1, NULL, NULL, 1),
(40, 'Planning recall', 0, 'PlanningRecall', 'planningrecall', NULL, 1, 1, NULL, NULL, 1),
(41, 'Delete Ticket', 0, 'Ticket', 'delete', NULL, 1, 1, NULL, NULL, 1),
(42, 'New Change', 0, 'Change', 'new', NULL, 1, 1, NULL, NULL, 1),
(43, 'Update Change', 0, 'Change', 'update', NULL, 1, 1, NULL, NULL, 1),
(44, 'Resolve Change', 0, 'Change', 'solved', NULL, 1, 1, NULL, NULL, 1),
(45, 'Add Task', 0, 'Change', 'add_task', NULL, 1, 1, NULL, NULL, 1),
(46, 'Update Task', 0, 'Change', 'update_task', NULL, 1, 1, NULL, NULL, 1),
(47, 'Delete Task', 0, 'Change', 'delete_task', NULL, 1, 1, NULL, NULL, 1),
(48, 'Close Change', 0, 'Change', 'closed', NULL, 1, 1, NULL, NULL, 1),
(49, 'Delete Change', 0, 'Change', 'delete', NULL, 1, 1, NULL, NULL, 1),
(50, 'Ticket Satisfaction Answer', 0, 'Ticket', 'replysatisfaction', NULL, 1, 1, NULL, NULL, 1),
(51, 'Receiver errors', 0, 'MailCollector', 'error', NULL, 1, 1, NULL, NULL, 1),
(52, 'New Project', 0, 'Project', 'new', NULL, 1, 1, NULL, NULL, 1),
(53, 'Update Project', 0, 'Project', 'update', NULL, 1, 1, NULL, NULL, 1),
(54, 'Delete Project', 0, 'Project', 'delete', NULL, 1, 1, NULL, NULL, 1),
(55, 'New Project Task', 0, 'ProjectTask', 'new', NULL, 1, 1, NULL, NULL, 1),
(56, 'Update Project Task', 0, 'ProjectTask', 'update', NULL, 1, 1, NULL, NULL, 1),
(57, 'Delete Project Task', 0, 'ProjectTask', 'delete', NULL, 1, 1, NULL, NULL, 1),
(58, 'Request Unlock Items', 0, 'ObjectLock', 'unlock', NULL, 1, 1, NULL, NULL, 1),
(59, 'New user in requesters', 0, 'Ticket', 'requester_user', NULL, 1, 1, NULL, NULL, 1),
(60, 'New group in requesters', 0, 'Ticket', 'requester_group', NULL, 1, 1, NULL, NULL, 1),
(61, 'New user in observers', 0, 'Ticket', 'observer_user', NULL, 1, 1, NULL, NULL, 1),
(62, 'New group in observers', 0, 'Ticket', 'observer_group', NULL, 1, 1, NULL, NULL, 1),
(63, 'New user in assignees', 0, 'Ticket', 'assign_user', NULL, 1, 1, NULL, NULL, 1),
(64, 'New group in assignees', 0, 'Ticket', 'assign_group', NULL, 1, 1, NULL, NULL, 1),
(65, 'New supplier in assignees', 0, 'Ticket', 'assign_supplier', NULL, 1, 1, NULL, NULL, 1),
(66, 'Saved searches', 0, 'SavedSearch_Alert', 'alert', NULL, 1, 1, NULL, NULL, 1),
(67, 'Certificates', 0, 'Certificate', 'alert', NULL, 1, 1, NULL, NULL, 1),
(68, 'Alert expired domains', 0, 'Domain', 'ExpiredDomains', NULL, 1, 1, NULL, NULL, 1),
(69, 'Alert domains close expiries', 0, 'Domain', 'DomainsWhichExpire', NULL, 1, 1, NULL, NULL, 1),
(70, 'Password expires alert', 0, 'User', 'passwordexpires', NULL, 1, 1, NULL, NULL, 1),
(71, 'Check plugin updates', 0, 'Glpi\\Marketplace\\Controller', 'checkpluginsupdate', NULL, 1, 1, NULL, NULL, 1),
(72, 'New user mentioned', 0, 'Ticket', 'user_mention', NULL, 1, 1, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_notifications_notificationtemplates`
--

CREATE TABLE `glpi_notifications_notificationtemplates` (
  `id` int(10) UNSIGNED NOT NULL,
  `notifications_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mode` varchar(20) NOT NULL COMMENT 'See Notification_NotificationTemplate::MODE_* constants',
  `notificationtemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_notifications_notificationtemplates`
--

INSERT INTO `glpi_notifications_notificationtemplates` (`id`, `notifications_id`, `mode`, `notificationtemplates_id`) VALUES
(1, 1, 'mailing', 6),
(2, 2, 'mailing', 4),
(3, 3, 'mailing', 4),
(4, 4, 'mailing', 4),
(5, 5, 'mailing', 4),
(6, 6, 'mailing', 4),
(7, 7, 'mailing', 4),
(8, 8, 'mailing', 4),
(9, 9, 'mailing', 4),
(10, 10, 'mailing', 4),
(11, 11, 'mailing', 4),
(12, 12, 'mailing', 7),
(13, 13, 'mailing', 2),
(14, 14, 'mailing', 2),
(15, 15, 'mailing', 2),
(16, 16, 'mailing', 3),
(17, 17, 'mailing', 12),
(18, 18, 'mailing', 12),
(19, 19, 'mailing', 1),
(20, 20, 'mailing', 8),
(21, 21, 'mailing', 9),
(22, 22, 'mailing', 10),
(23, 23, 'mailing', 11),
(24, 24, 'mailing', 4),
(25, 25, 'mailing', 13),
(26, 26, 'mailing', 14),
(27, 27, 'mailing', 15),
(28, 28, 'mailing', 16),
(29, 29, 'mailing', 17),
(30, 30, 'mailing', 17),
(31, 31, 'mailing', 17),
(32, 32, 'mailing', 17),
(33, 33, 'mailing', 17),
(34, 34, 'mailing', 17),
(35, 35, 'mailing', 17),
(36, 36, 'mailing', 17),
(37, 37, 'mailing', 7),
(38, 38, 'mailing', 12),
(39, 39, 'mailing', 12),
(40, 40, 'mailing', 18),
(41, 41, 'mailing', 4),
(42, 42, 'mailing', 19),
(43, 43, 'mailing', 19),
(44, 44, 'mailing', 19),
(45, 45, 'mailing', 19),
(46, 46, 'mailing', 19),
(47, 47, 'mailing', 19),
(48, 48, 'mailing', 19),
(49, 49, 'mailing', 19),
(50, 50, 'mailing', 14),
(51, 51, 'mailing', 20),
(52, 52, 'mailing', 21),
(53, 53, 'mailing', 21),
(54, 54, 'mailing', 21),
(55, 55, 'mailing', 22),
(56, 56, 'mailing', 22),
(57, 57, 'mailing', 22),
(58, 58, 'mailing', 23),
(59, 59, 'mailing', 4),
(60, 60, 'mailing', 4),
(61, 61, 'mailing', 4),
(62, 62, 'mailing', 4),
(63, 63, 'mailing', 4),
(64, 64, 'mailing', 4),
(65, 65, 'mailing', 4),
(66, 66, 'mailing', 24),
(67, 67, 'mailing', 25),
(68, 68, 'mailing', 26),
(69, 69, 'mailing', 26),
(70, 70, 'mailing', 27),
(71, 71, 'mailing', 28),
(72, 72, 'mailing', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_notificationtargets`
--

CREATE TABLE `glpi_notificationtargets` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0,
  `notifications_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_notificationtargets`
--

INSERT INTO `glpi_notificationtargets` (`id`, `items_id`, `type`, `notifications_id`) VALUES
(1, 3, 1, 13),
(2, 1, 1, 13),
(3, 3, 2, 2),
(4, 1, 1, 2),
(5, 1, 1, 3),
(6, 1, 1, 5),
(7, 1, 1, 4),
(8, 2, 1, 3),
(9, 4, 1, 3),
(10, 3, 1, 2),
(11, 3, 1, 3),
(12, 3, 1, 5),
(13, 3, 1, 4),
(14, 1, 1, 19),
(15, 14, 1, 12),
(16, 3, 1, 14),
(17, 1, 1, 14),
(18, 3, 1, 15),
(19, 1, 1, 15),
(20, 1, 1, 6),
(21, 3, 1, 6),
(22, 1, 1, 7),
(23, 3, 1, 7),
(24, 1, 1, 8),
(25, 3, 1, 8),
(26, 1, 1, 9),
(27, 3, 1, 9),
(28, 1, 1, 10),
(29, 3, 1, 10),
(30, 1, 1, 11),
(31, 3, 1, 11),
(32, 19, 1, 25),
(33, 3, 1, 26),
(34, 21, 1, 2),
(35, 21, 1, 3),
(36, 21, 1, 5),
(37, 21, 1, 4),
(38, 21, 1, 6),
(39, 21, 1, 7),
(40, 21, 1, 8),
(41, 21, 1, 9),
(42, 21, 1, 10),
(43, 21, 1, 11),
(46, 1, 1, 28),
(47, 3, 1, 29),
(48, 1, 1, 29),
(49, 21, 1, 29),
(50, 2, 1, 30),
(51, 4, 1, 30),
(52, 3, 1, 30),
(53, 1, 1, 30),
(54, 21, 1, 30),
(55, 3, 1, 31),
(56, 1, 1, 31),
(57, 21, 1, 31),
(58, 3, 1, 32),
(59, 1, 1, 32),
(60, 21, 1, 32),
(61, 3, 1, 33),
(62, 1, 1, 33),
(63, 21, 1, 33),
(64, 3, 1, 34),
(65, 1, 1, 34),
(66, 21, 1, 34),
(67, 3, 1, 35),
(68, 1, 1, 35),
(69, 21, 1, 35),
(70, 3, 1, 36),
(71, 1, 1, 36),
(72, 21, 1, 36),
(73, 14, 1, 37),
(74, 3, 1, 40),
(75, 1, 1, 41),
(76, 3, 1, 42),
(77, 1, 1, 42),
(78, 21, 1, 42),
(79, 2, 1, 43),
(80, 4, 1, 43),
(81, 3, 1, 43),
(82, 1, 1, 43),
(83, 21, 1, 43),
(84, 3, 1, 44),
(85, 1, 1, 44),
(86, 21, 1, 44),
(87, 3, 1, 45),
(88, 1, 1, 45),
(89, 21, 1, 45),
(90, 3, 1, 46),
(91, 1, 1, 46),
(92, 21, 1, 46),
(93, 3, 1, 47),
(94, 1, 1, 47),
(95, 21, 1, 47),
(96, 3, 1, 48),
(97, 1, 1, 48),
(98, 21, 1, 48),
(99, 3, 1, 49),
(100, 1, 1, 49),
(101, 21, 1, 49),
(102, 3, 1, 50),
(103, 2, 1, 50),
(104, 1, 1, 51),
(105, 27, 1, 52),
(106, 1, 1, 52),
(107, 28, 1, 52),
(108, 27, 1, 53),
(109, 1, 1, 53),
(110, 28, 1, 53),
(111, 27, 1, 54),
(112, 1, 1, 54),
(113, 28, 1, 54),
(114, 31, 1, 55),
(115, 1, 1, 55),
(116, 32, 1, 55),
(117, 31, 1, 56),
(118, 1, 1, 56),
(119, 32, 1, 56),
(120, 31, 1, 57),
(121, 1, 1, 57),
(122, 32, 1, 57),
(123, 19, 1, 58),
(124, 3, 1, 59),
(125, 13, 1, 60),
(126, 21, 1, 61),
(127, 20, 1, 62),
(128, 2, 1, 63),
(129, 9, 1, 64),
(130, 8, 1, 65),
(131, 19, 1, 66),
(132, 5, 1, 67),
(133, 23, 1, 67),
(134, 5, 1, 68),
(135, 23, 1, 68),
(136, 5, 1, 69),
(137, 23, 1, 69),
(138, 19, 1, 70),
(139, 1, 1, 71),
(140, 39, 1, 72);

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_notificationtemplates`
--

CREATE TABLE `glpi_notificationtemplates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `itemtype` varchar(100) NOT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `css` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_notificationtemplates`
--

INSERT INTO `glpi_notificationtemplates` (`id`, `name`, `itemtype`, `date_mod`, `comment`, `css`, `date_creation`) VALUES
(1, 'MySQL Synchronization', 'DBConnection', NULL, NULL, NULL, NULL),
(2, 'Reservations', 'Reservation', NULL, NULL, NULL, NULL),
(3, 'Alert Reservation', 'Reservation', NULL, NULL, NULL, NULL),
(4, 'Tickets', 'Ticket', NULL, NULL, NULL, NULL),
(5, 'Tickets (Simple)', 'Ticket', NULL, NULL, NULL, NULL),
(6, 'Alert Tickets not closed', 'Ticket', NULL, NULL, NULL, NULL),
(7, 'Tickets Validation', 'Ticket', NULL, NULL, NULL, NULL),
(8, 'Cartridges', 'CartridgeItem', NULL, NULL, NULL, NULL),
(9, 'Consumables', 'ConsumableItem', NULL, NULL, NULL, NULL),
(10, 'Infocoms', 'Infocom', NULL, NULL, NULL, NULL),
(11, 'Licenses', 'SoftwareLicense', NULL, NULL, NULL, NULL),
(12, 'Contracts', 'Contract', NULL, NULL, NULL, NULL),
(13, 'Password Forget', 'User', NULL, NULL, NULL, NULL),
(14, 'Ticket Satisfaction', 'Ticket', NULL, NULL, NULL, NULL),
(15, 'Item not unique', 'FieldUnicity', NULL, NULL, NULL, NULL),
(16, 'CronTask', 'CronTask', NULL, NULL, NULL, NULL),
(17, 'Problems', 'Problem', NULL, NULL, NULL, NULL),
(18, 'Planning recall', 'PlanningRecall', NULL, NULL, NULL, NULL),
(19, 'Changes', 'Change', NULL, NULL, NULL, NULL),
(20, 'Receiver errors', 'MailCollector', NULL, NULL, NULL, NULL),
(21, 'Projects', 'Project', NULL, NULL, NULL, NULL),
(22, 'Project Tasks', 'ProjectTask', NULL, NULL, NULL, NULL),
(23, 'Unlock Item request', 'ObjectLock', NULL, NULL, NULL, NULL),
(24, 'Saved searches alerts', 'SavedSearch_Alert', NULL, NULL, NULL, NULL),
(25, 'Certificates', 'Certificate', NULL, NULL, NULL, NULL),
(26, 'Alert domains', 'Domain', NULL, NULL, NULL, NULL),
(27, 'Password expires alert', 'User', NULL, NULL, NULL, NULL),
(28, 'Plugin updates', 'Glpi\\Marketplace\\Controller', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_notificationtemplatetranslations`
--

CREATE TABLE `glpi_notificationtemplatetranslations` (
  `id` int(10) UNSIGNED NOT NULL,
  `notificationtemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `language` varchar(10) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL,
  `content_text` text DEFAULT NULL,
  `content_html` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_notificationtemplatetranslations`
--

INSERT INTO `glpi_notificationtemplatetranslations` (`id`, `notificationtemplates_id`, `language`, `subject`, `content_text`, `content_html`) VALUES
(1, 1, '', '##lang.dbconnection.title##', '##lang.dbconnection.delay## : ##dbconnection.delay##', '&lt;p&gt;##lang.dbconnection.delay## : ##dbconnection.delay##&lt;/p&gt;'),
(2, 2, '', '##reservation.action##', '======================================================================\n##lang.reservation.user##: ##reservation.user##\n##lang.reservation.item.name##: ##reservation.itemtype## - ##reservation.item.name##\n##IFreservation.tech## ##lang.reservation.tech## ##reservation.tech## ##ENDIFreservation.tech##\n##lang.reservation.begin##: ##reservation.begin##\n##lang.reservation.end##: ##reservation.end##\n##lang.reservation.comment##: ##reservation.comment##\n======================================================================', '&lt;!-- description{ color: inherit; background: #ebebeb;border-style: solid;border-color: #8d8d8d; border-width: 0px 1px 1px 0px; } --&gt;\n&lt;p&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.reservation.user##:&lt;/span&gt;##reservation.user##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.reservation.item.name##:&lt;/span&gt;##reservation.itemtype## - ##reservation.item.name##&lt;br /&gt;##IFreservation.tech## ##lang.reservation.tech## ##reservation.tech####ENDIFreservation.tech##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.reservation.begin##:&lt;/span&gt; ##reservation.begin##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.reservation.end##:&lt;/span&gt;##reservation.end##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.reservation.comment##:&lt;/span&gt; ##reservation.comment##&lt;/p&gt;'),
(3, 3, '', '##reservation.action##  ##reservation.entity##', '##lang.reservation.entity## : ##reservation.entity##\n\n\n##FOREACHreservations##\n##lang.reservation.itemtype## : ##reservation.itemtype##\n\n ##lang.reservation.item## : ##reservation.item##\n\n ##reservation.url##\n\n ##ENDFOREACHreservations##', '&lt;p&gt;##lang.reservation.entity## : ##reservation.entity## &lt;br /&gt; &lt;br /&gt;\n##FOREACHreservations## &lt;br /&gt;##lang.reservation.itemtype## :  ##reservation.itemtype##&lt;br /&gt;\n ##lang.reservation.item## :  ##reservation.item##&lt;br /&gt; &lt;br /&gt;\n &lt;a href=\"##reservation.url##\"&gt; ##reservation.url##&lt;/a&gt;&lt;br /&gt;\n ##ENDFOREACHreservations##&lt;/p&gt;'),
(4, 4, '', '##ticket.action## ##ticket.title##', ' ##IFticket.storestatus=5##\n ##lang.ticket.url## : ##ticket.urlapprove##\n ##lang.ticket.autoclosewarning##\n ##lang.ticket.solvedate## : ##ticket.solvedate##\n ##lang.ticket.solution.type## : ##ticket.solution.type##\n ##lang.ticket.solution.description## : ##ticket.solution.description## ##ENDIFticket.storestatus##\n ##ELSEticket.storestatus## ##lang.ticket.url## : ##ticket.url## ##ENDELSEticket.storestatus##\n\n ##lang.ticket.description##\n\n ##lang.ticket.title## : ##ticket.title##\n ##lang.ticket.authors## : ##IFticket.authors## ##ticket.authors## ##ENDIFticket.authors## ##ELSEticket.authors##--##ENDELSEticket.authors##\n ##lang.ticket.creationdate## : ##ticket.creationdate##\n ##lang.ticket.closedate## : ##ticket.closedate##\n ##lang.ticket.requesttype## : ##ticket.requesttype##\n##lang.ticket.item.name## :\n\n##FOREACHitems##\n\n ##IFticket.itemtype##\n  ##ticket.itemtype## - ##ticket.item.name##\n  ##IFticket.item.model## ##lang.ticket.item.model## : ##ticket.item.model## ##ENDIFticket.item.model##\n  ##IFticket.item.serial## ##lang.ticket.item.serial## : ##ticket.item.serial## ##ENDIFticket.item.serial##\n  ##IFticket.item.otherserial## ##lang.ticket.item.otherserial## : ##ticket.item.otherserial## ##ENDIFticket.item.otherserial##\n ##ENDIFticket.itemtype##\n\n##ENDFOREACHitems##\n##IFticket.assigntousers## ##lang.ticket.assigntousers## : ##ticket.assigntousers## ##ENDIFticket.assigntousers##\n ##lang.ticket.status## : ##ticket.status##\n##IFticket.assigntogroups## ##lang.ticket.assigntogroups## : ##ticket.assigntogroups## ##ENDIFticket.assigntogroups##\n ##lang.ticket.urgency## : ##ticket.urgency##\n ##lang.ticket.impact## : ##ticket.impact##\n ##lang.ticket.priority## : ##ticket.priority##\n##IFticket.user.email## ##lang.ticket.user.email## : ##ticket.user.email ##ENDIFticket.user.email##\n##IFticket.category## ##lang.ticket.category## : ##ticket.category## ##ENDIFticket.category## ##ELSEticket.category## ##lang.ticket.nocategoryassigned## ##ENDELSEticket.category##\n ##lang.ticket.content## : ##ticket.content##\n ##IFticket.storestatus=6##\n\n ##lang.ticket.solvedate## : ##ticket.solvedate##\n ##lang.ticket.solution.type## : ##ticket.solution.type##\n ##lang.ticket.solution.description## : ##ticket.solution.description##\n ##ENDIFticket.storestatus##\n\n##FOREACHtimelineitems##\n[##timelineitems.date##]\n##lang.timelineitems.author## ##timelineitems.author##\n##lang.timelineitems.description## ##timelineitems.description##\n##lang.timelineitems.date## ##timelineitems.date##\n##lang.timelineitems.position## ##timelineitems.position##\n##lang.timelineitems.type## ##timelineitems.type##\n##lang.timelineitems.typename## ##timelineitems.typename##\n##ENDFOREACHtimelineitems##\n\n##lang.ticket.numberoffollowups## : ##ticket.numberoffollowups##\n##lang.ticket.numberoftasks## : ##ticket.numberoftasks##', '&lt;!-- description{ color: inherit; background: #ebebeb; border-style: solid;border-color: #8d8d8d; border-width: 0px 1px 1px 0px; }    --&gt;\n&lt;div&gt;##IFticket.storestatus=5##&lt;/div&gt;\n&lt;div&gt;##lang.ticket.url## : &lt;a href=\"##ticket.urlapprove##\"&gt;##ticket.urlapprove##&lt;/a&gt; &lt;strong&gt;&#160;&lt;/strong&gt;&lt;/div&gt;\n&lt;div&gt;&lt;strong&gt;##lang.ticket.autoclosewarning##&lt;/strong&gt;&lt;/div&gt;\n&lt;div&gt;&lt;span style=\"color: #888888;\"&gt;&lt;strong&gt;&lt;span style=\"text-decoration: underline;\"&gt;##lang.ticket.solvedate##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##ticket.solvedate##&lt;br /&gt;&lt;span style=\"text-decoration: underline; color: #888888;\"&gt;&lt;strong&gt;##lang.ticket.solution.type##&lt;/strong&gt;&lt;/span&gt; : ##ticket.solution.type##&lt;br /&gt;&lt;span style=\"text-decoration: underline; color: #888888;\"&gt;&lt;strong&gt;##lang.ticket.solution.description##&lt;/strong&gt;&lt;/span&gt; : ##ticket.solution.description## ##ENDIFticket.storestatus##&lt;/div&gt;\n&lt;div&gt;##ELSEticket.storestatus## ##lang.ticket.url## : &lt;a href=\"##ticket.url##\"&gt;##ticket.url##&lt;/a&gt; ##ENDELSEticket.storestatus##&lt;/div&gt;\n&lt;p class=\"description b\"&gt;&lt;strong&gt;##lang.ticket.description##&lt;/strong&gt;&lt;/p&gt;\n&lt;p&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.title##&lt;/span&gt;&#160;:##ticket.title## &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.authors##&lt;/span&gt;&#160;:##IFticket.authors## ##ticket.authors## ##ENDIFticket.authors##    ##ELSEticket.authors##--##ENDELSEticket.authors## &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.creationdate##&lt;/span&gt;&#160;:##ticket.creationdate## &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.closedate##&lt;/span&gt;&#160;:##ticket.closedate## &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.requesttype##&lt;/span&gt;&#160;:##ticket.requesttype##&lt;br /&gt;\n&lt;br /&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.item.name##&lt;/span&gt;&#160;:\n&lt;p&gt;##FOREACHitems##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;##IFticket.itemtype## ##ticket.itemtype##&#160;- ##ticket.item.name## ##IFticket.item.model## ##lang.ticket.item.model## : ##ticket.item.model## ##ENDIFticket.item.model## ##IFticket.item.serial## ##lang.ticket.item.serial## : ##ticket.item.serial## ##ENDIFticket.item.serial## ##IFticket.item.otherserial## ##lang.ticket.item.otherserial## : ##ticket.item.otherserial## ##ENDIFticket.item.otherserial## ##ENDIFticket.itemtype## &lt;/div&gt;&lt;br /&gt;\n&lt;p&gt;##ENDFOREACHitems##&lt;/p&gt;\n##IFticket.assigntousers## &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.assigntousers##&lt;/span&gt;&#160;: ##ticket.assigntousers## ##ENDIFticket.assigntousers##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.ticket.status## &lt;/span&gt;&#160;: ##ticket.status##&lt;br /&gt; ##IFticket.assigntogroups## &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.assigntogroups##&lt;/span&gt;&#160;: ##ticket.assigntogroups## ##ENDIFticket.assigntogroups##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.urgency##&lt;/span&gt;&#160;: ##ticket.urgency##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.impact##&lt;/span&gt;&#160;: ##ticket.impact##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.priority##&lt;/span&gt;&#160;: ##ticket.priority## &lt;br /&gt; ##IFticket.user.email##&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.user.email##&lt;/span&gt;&#160;: ##ticket.user.email ##ENDIFticket.user.email##    &lt;br /&gt; ##IFticket.category##&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.ticket.category## &lt;/span&gt;&#160;:##ticket.category## ##ENDIFticket.category## ##ELSEticket.category## ##lang.ticket.nocategoryassigned## ##ENDELSEticket.category##    &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.content##&lt;/span&gt;&#160;: ##ticket.content##&lt;/p&gt;\n&lt;br /&gt;##IFticket.storestatus=6##&lt;br /&gt;&lt;span style=\"text-decoration: underline;\"&gt;&lt;strong&gt;&lt;span style=\"color: #888888;\"&gt;##lang.ticket.solvedate##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##ticket.solvedate##&lt;br /&gt;&lt;span style=\"color: #888888;\"&gt;&lt;strong&gt;&lt;span style=\"text-decoration: underline;\"&gt;##lang.ticket.solution.type##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##ticket.solution.type##&lt;br /&gt;&lt;span style=\"text-decoration: underline; color: #888888;\"&gt;&lt;strong&gt;##lang.ticket.solution.description##&lt;/strong&gt;&lt;/span&gt; : ##ticket.solution.description##&lt;br /&gt;##ENDIFticket.storestatus##&lt;/p&gt;\n&lt;p&gt;##FOREACHtimelineitems##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;&lt;br /&gt;&lt;strong&gt; [##timelineitems.date##]&lt;/strong&gt;&lt;br /&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.timelineitems.author## &lt;/span&gt; &lt;span style=\"color: #000000; font-weight: bold; text-decoration: underline;\"&gt;##timelineitems.author##&lt;/span&gt;&lt;br /&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.timelineitems.description## &lt;/span&gt; &lt;span style=\"color: #000000; font-weight: bold; text-decoration: underline;\"&gt;##timelineitems.description##&lt;/span&gt;&lt;br /&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.timelineitems.date## &lt;/span&gt; &lt;span style=\"color: #000000; font-weight: bold; text-decoration: underline;\"&gt;##timelineitems.date##&lt;/span&gt;&lt;br /&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.timelineitems.position## &lt;/span&gt;&lt;span style=\"color: #000000; font-weight: bold; text-decoration: underline;\"&gt; ##timelineitems.position##&lt;/span&gt;&lt;/div&gt;\n&lt;div class=\"description b\"&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.timelineitems.type## &lt;/span&gt;&lt;span style=\"color: #000000; font-weight: bold; text-decoration: underline;\"&gt; ##timelineitems.type##&lt;/span&gt;&lt;/div&gt;\n&lt;div class=\"description b\"&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.timelineitems.typename## &lt;/span&gt; &lt;span style=\"color: #000000; font-weight: bold; text-decoration: underline;\"&gt;##timelineitems.typename##&lt;/span&gt;&lt;/div&gt;\n&lt;p&gt;##ENDFOREACHtimelineitems##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;##lang.ticket.numberoffollowups##&#160;: ##ticket.numberoffollowups##&lt;/div&gt;\n&lt;div class=\"description b\"&gt;##lang.ticket.numberoftasks##&#160;: ##ticket.numberoftasks##&lt;/div&gt;'),
(5, 12, '', '##contract.action##  ##contract.entity##', '##lang.contract.entity## : ##contract.entity##\n\n##FOREACHcontracts##\n##lang.contract.name## : ##contract.name##\n##lang.contract.number## : ##contract.number##\n##lang.contract.time## : ##contract.time##\n##IFcontract.type####lang.contract.type## : ##contract.type####ENDIFcontract.type##\n##contract.url##\n##ENDFOREACHcontracts##', '&lt;p&gt;##lang.contract.entity## : ##contract.entity##&lt;br /&gt;\n&lt;br /&gt;##FOREACHcontracts##&lt;br /&gt;##lang.contract.name## :\n##contract.name##&lt;br /&gt;\n##lang.contract.number## : ##contract.number##&lt;br /&gt;\n##lang.contract.time## : ##contract.time##&lt;br /&gt;\n##IFcontract.type####lang.contract.type## : ##contract.type##\n##ENDIFcontract.type##&lt;br /&gt;\n&lt;a href=\"##contract.url##\"&gt;\n##contract.url##&lt;/a&gt;&lt;br /&gt;\n##ENDFOREACHcontracts##&lt;/p&gt;'),
(6, 5, '', '##ticket.action## ##ticket.title##', '##lang.ticket.url## : ##ticket.url##\n\n##lang.ticket.description##\n\n\n##lang.ticket.title##  :##ticket.title##\n\n##lang.ticket.authors##  :##IFticket.authors##\n##ticket.authors## ##ENDIFticket.authors##\n##ELSEticket.authors##--##ENDELSEticket.authors##\n\n##IFticket.category## ##lang.ticket.category##  :##ticket.category##\n##ENDIFticket.category## ##ELSEticket.category##\n##lang.ticket.nocategoryassigned## ##ENDELSEticket.category##\n\n##lang.ticket.content##  : ##ticket.content##\n##IFticket.itemtype##\n##lang.ticket.item.name##  : ##ticket.itemtype## - ##ticket.item.name##\n##ENDIFticket.itemtype##', '&lt;div&gt;##lang.ticket.url## : &lt;a href=\"##ticket.url##\"&gt;\n##ticket.url##&lt;/a&gt;&lt;/div&gt;\n&lt;div class=\"description b\"&gt;\n##lang.ticket.description##&lt;/div&gt;\n&lt;p&gt;&lt;span\nstyle=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;\n##lang.ticket.title##&lt;/span&gt;&#160;:##ticket.title##\n&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;\n##lang.ticket.authors##&lt;/span&gt;\n##IFticket.authors## ##ticket.authors##\n##ENDIFticket.authors##\n##ELSEticket.authors##--##ENDELSEticket.authors##\n&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;\n&lt;/span&gt;&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; &lt;/span&gt;\n##IFticket.category##&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;\n##lang.ticket.category## &lt;/span&gt;&#160;:##ticket.category##\n##ENDIFticket.category## ##ELSEticket.category##\n##lang.ticket.nocategoryassigned## ##ENDELSEticket.category##\n&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;\n##lang.ticket.content##&lt;/span&gt;&#160;:\n##ticket.content##&lt;br /&gt;##IFticket.itemtype##\n&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;\n##lang.ticket.item.name##&lt;/span&gt;&#160;:\n##ticket.itemtype## - ##ticket.item.name##\n##ENDIFticket.itemtype##&lt;/p&gt;'),
(7, 7, '', '##ticket.action## ##ticket.title##', '##FOREACHvalidations##\n\n##IFvalidation.storestatus=2##\n##validation.submission.title##\n##lang.validation.commentsubmission## : ##validation.commentsubmission##\n##ENDIFvalidation.storestatus##\n##ELSEvalidation.storestatus## ##validation.answer.title## ##ENDELSEvalidation.storestatus##\n\n##lang.ticket.url## : ##ticket.urlvalidation##\n\n##IFvalidation.status## ##lang.validation.status## : ##validation.status## ##ENDIFvalidation.status##\n##IFvalidation.commentvalidation##\n##lang.validation.commentvalidation## : ##validation.commentvalidation##\n##ENDIFvalidation.commentvalidation##\n##ENDFOREACHvalidations##', '&lt;div&gt;##FOREACHvalidations##&lt;/div&gt;\n&lt;p&gt;##IFvalidation.storestatus=2##&lt;/p&gt;\n&lt;div&gt;##validation.submission.title##&lt;/div&gt;\n&lt;div&gt;##lang.validation.commentsubmission## : ##validation.commentsubmission##&lt;/div&gt;\n&lt;div&gt;##ENDIFvalidation.storestatus##&lt;/div&gt;\n&lt;div&gt;##ELSEvalidation.storestatus## ##validation.answer.title## ##ENDELSEvalidation.storestatus##&lt;/div&gt;\n&lt;div&gt;&lt;/div&gt;\n&lt;div&gt;\n&lt;div&gt;##lang.ticket.url## : &lt;a href=\"##ticket.urlvalidation##\"&gt; ##ticket.urlvalidation## &lt;/a&gt;&lt;/div&gt;\n&lt;/div&gt;\n&lt;p&gt;##IFvalidation.status## ##lang.validation.status## : ##validation.status## ##ENDIFvalidation.status##\n&lt;br /&gt; ##IFvalidation.commentvalidation##&lt;br /&gt; ##lang.validation.commentvalidation## :\n&#160; ##validation.commentvalidation##&lt;br /&gt; ##ENDIFvalidation.commentvalidation##\n&lt;br /&gt;##ENDFOREACHvalidations##&lt;/p&gt;'),
(8, 6, '', '##ticket.action## ##ticket.entity##', '##FOREACHtickets##\n##lang.ticket.authors##: ##ticket.authors##\n##lang.ticket.title##: ##ticket.title##\n##lang.ticket.priority##: ##ticket.priority##\n##lang.ticket.status##: ##ticket.status##\n##lang.ticket.attribution##: ##IFticket.assigntousers####ticket.assigntousers##\n##ENDIFticket.assigntousers####IFticket.assigntogroups##\n##ticket.assigntogroups## ##ENDIFticket.assigntogroups####IFticket.assigntosupplier##\n##ticket.assigntosupplier## ##ENDIFticket.assigntosupplier##\n##lang.ticket.creationdate##: ##ticket.creationdate##\n##lang.ticket.content##: ##ticket.content## ##ENDFOREACHtickets##', '&lt;table class=\"tab_cadre\" border=\"1\" cellspacing=\"2\" cellpadding=\"3\"&gt;\n&lt;tbody&gt;\n&lt;tr&gt;\n&lt;td style=\"text-align: left;\" width=\"auto\" bgcolor=\"#cccccc\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##lang.ticket.authors##&lt;/span&gt;&lt;/td&gt;\n&lt;td style=\"text-align: left;\" width=\"auto\" bgcolor=\"#cccccc\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##lang.ticket.title##&lt;/span&gt;&lt;/td&gt;\n&lt;td style=\"text-align: left;\" width=\"auto\" bgcolor=\"#cccccc\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##lang.ticket.priority##&lt;/span&gt;&lt;/td&gt;\n&lt;td style=\"text-align: left;\" width=\"auto\" bgcolor=\"#cccccc\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##lang.ticket.status##&lt;/span&gt;&lt;/td&gt;\n&lt;td style=\"text-align: left;\" width=\"auto\" bgcolor=\"#cccccc\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##lang.ticket.attribution##&lt;/span&gt;&lt;/td&gt;\n&lt;td style=\"text-align: left;\" width=\"auto\" bgcolor=\"#cccccc\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##lang.ticket.creationdate##&lt;/span&gt;&lt;/td&gt;\n&lt;td style=\"text-align: left;\" width=\"auto\" bgcolor=\"#cccccc\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##lang.ticket.content##&lt;/span&gt;##FOREACHtickets##&lt;/td&gt;\n&lt;/tr&gt;\n&lt;tr&gt;\n&lt;td width=\"auto\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##ticket.authors##&lt;/span&gt;&lt;/td&gt;\n&lt;td width=\"auto\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;&lt;a href=\"##ticket.url##\"&gt;##ticket.title##&lt;/a&gt;&lt;/span&gt;&lt;/td&gt;\n&lt;td width=\"auto\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##ticket.priority##&lt;/span&gt;&lt;/td&gt;\n&lt;td width=\"auto\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##ticket.status##&lt;/span&gt;&lt;/td&gt;\n&lt;td width=\"auto\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##IFticket.assigntousers####ticket.assigntousers##&lt;br /&gt;##ENDIFticket.assigntousers####IFticket.assigntogroups##&lt;br /&gt;##ticket.assigntogroups## ##ENDIFticket.assigntogroups####IFticket.assigntosupplier##&lt;br /&gt;##ticket.assigntosupplier## ##ENDIFticket.assigntosupplier##&lt;/span&gt;&lt;/td&gt;\n&lt;td width=\"auto\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##ticket.creationdate##&lt;/span&gt;&lt;/td&gt;\n&lt;td width=\"auto\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##ticket.content##&lt;/span&gt;##ENDFOREACHtickets##&lt;/td&gt;\n&lt;/tr&gt;\n&lt;/tbody&gt;\n&lt;/table&gt;'),
(9, 9, '', '##consumable.action##  ##consumable.entity##', '##lang.consumable.entity## : ##consumable.entity##\n\n\n##FOREACHconsumables##\n##lang.consumable.item## : ##consumable.item##\n\n\n##lang.consumable.reference## : ##consumable.reference##\n\n##lang.consumable.remaining## : ##consumable.remaining##\n##lang.consumable.stock_target## : ##consumable.stock_target##\n##lang.consumable.to_order## : ##consumable.to_order##\n\n##consumable.url##\n\n##ENDFOREACHconsumables##', '&lt;p&gt;\n##lang.consumable.entity## : ##consumable.entity##\n&lt;br /&gt; &lt;br /&gt;##FOREACHconsumables##\n&lt;br /&gt;##lang.consumable.item## : ##consumable.item##&lt;br /&gt;\n&lt;br /&gt;##lang.consumable.reference## : ##consumable.reference##&lt;br /&gt;\n##lang.consumable.remaining## : ##consumable.remaining##&lt;br /&gt;\n##lang.consumable.stock_target## : ##consumable.stock_target##&lt;br /&gt;\n##lang.consumable.to_order## : ##consumable.to_order##&lt;br /&gt;\n&lt;a href=\"##consumable.url##\"&gt; ##consumable.url##&lt;/a&gt;&lt;br /&gt;\n   ##ENDFOREACHconsumables##&lt;/p&gt;'),
(10, 8, '', '##cartridge.action##  ##cartridge.entity##', '##lang.cartridge.entity## : ##cartridge.entity##\n\n\n##FOREACHcartridges##\n##lang.cartridge.item## : ##cartridge.item##\n\n\n##lang.cartridge.reference## : ##cartridge.reference##\n\n##lang.cartridge.remaining## : ##cartridge.remaining##\n##lang.cartridge.stock_target## : ##cartridge.stock_target##\n##lang.cartridge.to_order## : ##cartridge.to_order##\n\n##cartridge.url##\n ##ENDFOREACHcartridges##', '&lt;p&gt;##lang.cartridge.entity## : ##cartridge.entity##\n&lt;br /&gt; &lt;br /&gt;##FOREACHcartridges##\n&lt;br /&gt;##lang.cartridge.item## :\n##cartridge.item##&lt;br /&gt; &lt;br /&gt;\n##lang.cartridge.reference## :\n##cartridge.reference##&lt;br /&gt;\n##lang.cartridge.remaining## :\n##cartridge.remaining##&lt;br /&gt;\n##lang.cartridge.stock_target## :\n##cartridge.stock_target##&lt;br /&gt;\n##lang.cartridge.to_order## :\n##cartridge.to_order##&lt;br /&gt;\n&lt;a href=\"##cartridge.url##\"&gt;\n##cartridge.url##&lt;/a&gt;&lt;br /&gt;\n##ENDFOREACHcartridges##&lt;/p&gt;'),
(11, 10, '', '##infocom.action##  ##infocom.entity##', '##lang.infocom.entity## : ##infocom.entity##\n\n\n##FOREACHinfocoms##\n\n##lang.infocom.itemtype## : ##infocom.itemtype##\n\n##lang.infocom.item## : ##infocom.item##\n\n\n##lang.infocom.expirationdate## : ##infocom.expirationdate##\n\n##infocom.url##\n ##ENDFOREACHinfocoms##', '&lt;p&gt;##lang.infocom.entity## : ##infocom.entity##\n&lt;br /&gt; &lt;br /&gt;##FOREACHinfocoms##\n&lt;br /&gt;##lang.infocom.itemtype## : ##infocom.itemtype##&lt;br /&gt;\n##lang.infocom.item## : ##infocom.item##&lt;br /&gt; &lt;br /&gt;\n##lang.infocom.expirationdate## : ##infocom.expirationdate##\n&lt;br /&gt; &lt;a href=\"##infocom.url##\"&gt;\n##infocom.url##&lt;/a&gt;&lt;br /&gt;\n##ENDFOREACHinfocoms##&lt;/p&gt;'),
(12, 11, '', '##license.action##  ##license.entity##', '##lang.license.entity## : ##license.entity##\n\n##FOREACHlicenses##\n\n##lang.license.item## : ##license.item##\n\n##lang.license.serial## : ##license.serial##\n\n##lang.license.expirationdate## : ##license.expirationdate##\n\n##license.url##\n ##ENDFOREACHlicenses##', '&lt;p&gt;\n##lang.license.entity## : ##license.entity##&lt;br /&gt;\n##FOREACHlicenses##\n&lt;br /&gt;##lang.license.item## : ##license.item##&lt;br /&gt;\n##lang.license.serial## : ##license.serial##&lt;br /&gt;\n##lang.license.expirationdate## : ##license.expirationdate##\n&lt;br /&gt; &lt;a href=\"##license.url##\"&gt; ##license.url##\n&lt;/a&gt;&lt;br /&gt; ##ENDFOREACHlicenses##&lt;/p&gt;'),
(13, 13, '', '##user.action##', '##user.realname## ##user.firstname##\n\n##lang.passwordforget.information##\n\n##lang.passwordforget.link## ##user.passwordforgeturl##', '&lt;p&gt;&lt;strong&gt;##user.realname## ##user.firstname##&lt;/strong&gt;&lt;/p&gt;\n&lt;p&gt;##lang.passwordforget.information##&lt;/p&gt;\n&lt;p&gt;##lang.passwordforget.link## &lt;a title=\"##user.passwordforgeturl##\" href=\"##user.passwordforgeturl##\"&gt;##user.passwordforgeturl##&lt;/a&gt;&lt;/p&gt;'),
(14, 14, '', '##ticket.action## ##ticket.title##', '##lang.ticket.title## : ##ticket.title##\n\n##lang.ticket.closedate## : ##ticket.closedate##\n\n##lang.satisfaction.text## ##ticket.urlsatisfaction##', '&lt;p&gt;##lang.ticket.title## : ##ticket.title##&lt;/p&gt;\n&lt;p&gt;##lang.ticket.closedate## : ##ticket.closedate##&lt;/p&gt;\n&lt;p&gt;##lang.satisfaction.text## &lt;a href=\"##ticket.urlsatisfaction##\"&gt;##ticket.urlsatisfaction##&lt;/a&gt;&lt;/p&gt;'),
(15, 15, '', '##lang.unicity.action##', '##lang.unicity.entity## : ##unicity.entity##\n\n##lang.unicity.itemtype## : ##unicity.itemtype##\n\n##lang.unicity.message## : ##unicity.message##\n\n##lang.unicity.action_user## : ##unicity.action_user##\n\n##lang.unicity.action_type## : ##unicity.action_type##\n\n##lang.unicity.date## : ##unicity.date##', '&lt;p&gt;##lang.unicity.entity## : ##unicity.entity##&lt;/p&gt;\n&lt;p&gt;##lang.unicity.itemtype## : ##unicity.itemtype##&lt;/p&gt;\n&lt;p&gt;##lang.unicity.message## : ##unicity.message##&lt;/p&gt;\n&lt;p&gt;##lang.unicity.action_user## : ##unicity.action_user##&lt;/p&gt;\n&lt;p&gt;##lang.unicity.action_type## : ##unicity.action_type##&lt;/p&gt;\n&lt;p&gt;##lang.unicity.date## : ##unicity.date##&lt;/p&gt;'),
(16, 16, '', '##crontask.action##', '##lang.crontask.warning##\n\n##FOREACHcrontasks##\n ##crontask.name## : ##crontask.description##\n\n##ENDFOREACHcrontasks##', '&lt;p&gt;##lang.crontask.warning##&lt;/p&gt;\n&lt;p&gt;##FOREACHcrontasks## &lt;br /&gt;&lt;a href=\"##crontask.url##\"&gt;##crontask.name##&lt;/a&gt; : ##crontask.description##&lt;br /&gt; &lt;br /&gt;##ENDFOREACHcrontasks##&lt;/p&gt;'),
(17, 17, '', '##problem.action## ##problem.title##', '##IFproblem.storestatus=5##\n ##lang.problem.url## : ##problem.urlapprove##\n ##lang.problem.solvedate## : ##problem.solvedate##\n ##lang.problem.solution.type## : ##problem.solution.type##\n ##lang.problem.solution.description## : ##problem.solution.description## ##ENDIFproblem.storestatus##\n ##ELSEproblem.storestatus## ##lang.problem.url## : ##problem.url## ##ENDELSEproblem.storestatus##\n\n ##lang.problem.description##\n\n ##lang.problem.title##  :##problem.title##\n ##lang.problem.authors##  :##IFproblem.authors## ##problem.authors## ##ENDIFproblem.authors## ##ELSEproblem.authors##--##ENDELSEproblem.authors##\n ##lang.problem.creationdate##  :##problem.creationdate##\n ##IFproblem.assigntousers## ##lang.problem.assigntousers##  : ##problem.assigntousers## ##ENDIFproblem.assigntousers##\n ##lang.problem.status##  : ##problem.status##\n ##IFproblem.assigntogroups## ##lang.problem.assigntogroups##  : ##problem.assigntogroups## ##ENDIFproblem.assigntogroups##\n ##lang.problem.urgency##  : ##problem.urgency##\n ##lang.problem.impact##  : ##problem.impact##\n ##lang.problem.priority## : ##problem.priority##\n##IFproblem.category## ##lang.problem.category##  :##problem.category## ##ENDIFproblem.category## ##ELSEproblem.category## ##lang.problem.nocategoryassigned## ##ENDELSEproblem.category##\n ##lang.problem.content##  : ##problem.content##\n\n##IFproblem.storestatus=6##\n ##lang.problem.solvedate## : ##problem.solvedate##\n ##lang.problem.solution.type## : ##problem.solution.type##\n ##lang.problem.solution.description## : ##problem.solution.description##\n##ENDIFproblem.storestatus##\n ##lang.problem.numberoffollowups## : ##problem.numberoffollowups##\n\n##FOREACHfollowups##\n\n [##followup.date##] ##lang.followup.isprivate## : ##followup.isprivate##\n ##lang.followup.author## ##followup.author##\n ##lang.followup.description## ##followup.description##\n ##lang.followup.date## ##followup.date##\n ##lang.followup.requesttype## ##followup.requesttype##\n\n##ENDFOREACHfollowups##\n ##lang.problem.numberoftickets## : ##problem.numberoftickets##\n\n##FOREACHtickets##\n [##ticket.date##] ##lang.problem.title## : ##ticket.title##\n ##lang.problem.content## ##ticket.content##\n\n##ENDFOREACHtickets##\n ##lang.problem.numberoftasks## : ##problem.numberoftasks##\n\n##FOREACHtasks##\n [##task.date##]\n ##lang.task.author## ##task.author##\n ##lang.task.description## ##task.description##\n ##lang.task.time## ##task.time##\n ##lang.task.category## ##task.category##\n\n##ENDFOREACHtasks##\n', '&lt;p&gt;##IFproblem.storestatus=5##&lt;/p&gt;\n&lt;div&gt;##lang.problem.url## : &lt;a href=\"##problem.urlapprove##\"&gt;##problem.urlapprove##&lt;/a&gt;&lt;/div&gt;\n&lt;div&gt;&lt;span style=\"color: #888888;\"&gt;&lt;strong&gt;&lt;span style=\"text-decoration: underline;\"&gt;##lang.problem.solvedate##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##problem.solvedate##&lt;br /&gt;&lt;span style=\"text-decoration: underline; color: #888888;\"&gt;&lt;strong&gt;##lang.problem.solution.type##&lt;/strong&gt;&lt;/span&gt; : ##problem.solution.type##&lt;br /&gt;&lt;span style=\"text-decoration: underline; color: #888888;\"&gt;&lt;strong&gt;##lang.problem.solution.description##&lt;/strong&gt;&lt;/span&gt; : ##problem.solution.description## ##ENDIFproblem.storestatus##&lt;/div&gt;\n&lt;div&gt;##ELSEproblem.storestatus## ##lang.problem.url## : &lt;a href=\"##problem.url##\"&gt;##problem.url##&lt;/a&gt; ##ENDELSEproblem.storestatus##&lt;/div&gt;\n&lt;p class=\"description b\"&gt;&lt;strong&gt;##lang.problem.description##&lt;/strong&gt;&lt;/p&gt;\n&lt;p&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.title##&lt;/span&gt;&#160;:##problem.title## &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.authors##&lt;/span&gt;&#160;:##IFproblem.authors## ##problem.authors## ##ENDIFproblem.authors##    ##ELSEproblem.authors##--##ENDELSEproblem.authors## &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.creationdate##&lt;/span&gt;&#160;:##problem.creationdate## &lt;br /&gt; ##IFproblem.assigntousers## &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.assigntousers##&lt;/span&gt;&#160;: ##problem.assigntousers## ##ENDIFproblem.assigntousers##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.problem.status## &lt;/span&gt;&#160;: ##problem.status##&lt;br /&gt; ##IFproblem.assigntogroups## &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.assigntogroups##&lt;/span&gt;&#160;: ##problem.assigntogroups## ##ENDIFproblem.assigntogroups##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.urgency##&lt;/span&gt;&#160;: ##problem.urgency##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.impact##&lt;/span&gt;&#160;: ##problem.impact##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.priority##&lt;/span&gt; : ##problem.priority## &lt;br /&gt;##IFproblem.category##&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.problem.category## &lt;/span&gt;&#160;:##problem.category##  ##ENDIFproblem.category## ##ELSEproblem.category##  ##lang.problem.nocategoryassigned## ##ENDELSEproblem.category##    &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.content##&lt;/span&gt;&#160;: ##problem.content##&lt;/p&gt;\n&lt;p&gt;##IFproblem.storestatus=6##&lt;br /&gt;&lt;span style=\"text-decoration: underline;\"&gt;&lt;strong&gt;&lt;span style=\"color: #888888;\"&gt;##lang.problem.solvedate##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##problem.solvedate##&lt;br /&gt;&lt;span style=\"color: #888888;\"&gt;&lt;strong&gt;&lt;span style=\"text-decoration: underline;\"&gt;##lang.problem.solution.type##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##problem.solution.type##&lt;br /&gt;&lt;span style=\"text-decoration: underline; color: #888888;\"&gt;&lt;strong&gt;##lang.problem.solution.description##&lt;/strong&gt;&lt;/span&gt; : ##problem.solution.description##&lt;br /&gt;##ENDIFproblem.storestatus##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;##lang.problem.numberoffollowups##&#160;: ##problem.numberoffollowups##&lt;/div&gt;\n&lt;p&gt;##FOREACHfollowups##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;&lt;br /&gt; &lt;strong&gt; [##followup.date##] &lt;em&gt;##lang.followup.isprivate## : ##followup.isprivate## &lt;/em&gt;&lt;/strong&gt;&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.followup.author## &lt;/span&gt; ##followup.author##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.followup.description## &lt;/span&gt; ##followup.description##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.followup.date## &lt;/span&gt; ##followup.date##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.followup.requesttype## &lt;/span&gt; ##followup.requesttype##&lt;/div&gt;\n&lt;p&gt;##ENDFOREACHfollowups##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;##lang.problem.numberoftickets##&#160;: ##problem.numberoftickets##&lt;/div&gt;\n&lt;p&gt;##FOREACHtickets##&lt;/p&gt;\n&lt;div&gt;&lt;strong&gt; [##ticket.date##] &lt;em&gt;##lang.problem.title## : &lt;a href=\"##ticket.url##\"&gt;##ticket.title## &lt;/a&gt;&lt;/em&gt;&lt;/strong&gt;&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; &lt;/span&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.problem.content## &lt;/span&gt; ##ticket.content##\n&lt;p&gt;##ENDFOREACHtickets##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;##lang.problem.numberoftasks##&#160;: ##problem.numberoftasks##&lt;/div&gt;\n&lt;p&gt;##FOREACHtasks##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;&lt;strong&gt;[##task.date##] &lt;/strong&gt;&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.task.author##&lt;/span&gt; ##task.author##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.task.description##&lt;/span&gt; ##task.description##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.task.time##&lt;/span&gt; ##task.time##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.task.category##&lt;/span&gt; ##task.category##&lt;/div&gt;\n&lt;p&gt;##ENDFOREACHtasks##&lt;/p&gt;\n&lt;/div&gt;'),
(18, 18, '', '##recall.action##: ##recall.item.name##', '##recall.action##: ##recall.item.name##\n\n##recall.item.content##\n\n##lang.recall.planning.begin##: ##recall.planning.begin##\n##lang.recall.planning.end##: ##recall.planning.end##\n##lang.recall.planning.state##: ##recall.planning.state##\n##lang.recall.item.private##: ##recall.item.private##', '&lt;p&gt;##recall.action##: &lt;a href=\"##recall.item.url##\"&gt;##recall.item.name##&lt;/a&gt;&lt;/p&gt;\n&lt;p&gt;##recall.item.content##&lt;/p&gt;\n&lt;p&gt;##lang.recall.planning.begin##: ##recall.planning.begin##&lt;br /&gt;##lang.recall.planning.end##: ##recall.planning.end##&lt;br /&gt;##lang.recall.planning.state##: ##recall.planning.state##&lt;br /&gt;##lang.recall.item.private##: ##recall.item.private##&lt;br /&gt;&lt;br /&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br /&gt;&lt;br /&gt;&lt;/p&gt;'),
(19, 19, '', '##change.action## ##change.title##', '##IFchange.storestatus=5##\n ##lang.change.url## : ##change.urlapprove##\n ##lang.change.solvedate## : ##change.solvedate##\n ##lang.change.solution.type## : ##change.solution.type##\n ##lang.change.solution.description## : ##change.solution.description## ##ENDIFchange.storestatus##\n ##ELSEchange.storestatus## ##lang.change.url## : ##change.url## ##ENDELSEchange.storestatus##\n\n ##lang.change.description##\n\n ##lang.change.title##  :##change.title##\n ##lang.change.authors##  :##IFchange.authors## ##change.authors## ##ENDIFchange.authors## ##ELSEchange.authors##--##ENDELSEchange.authors##\n ##lang.change.creationdate##  :##change.creationdate##\n ##IFchange.assigntousers## ##lang.change.assigntousers##  : ##change.assigntousers## ##ENDIFchange.assigntousers##\n ##lang.change.status##  : ##change.status##\n ##IFchange.assigntogroups## ##lang.change.assigntogroups##  : ##change.assigntogroups## ##ENDIFchange.assigntogroups##\n ##lang.change.urgency##  : ##change.urgency##\n ##lang.change.impact##  : ##change.impact##\n ##lang.change.priority## : ##change.priority##\n##IFchange.category## ##lang.change.category##  :##change.category## ##ENDIFchange.category## ##ELSEchange.category## ##lang.change.nocategoryassigned## ##ENDELSEchange.category##\n ##lang.change.content##  : ##change.content##\n\n##IFchange.storestatus=6##\n ##lang.change.solvedate## : ##change.solvedate##\n ##lang.change.solution.type## : ##change.solution.type##\n ##lang.change.solution.description## : ##change.solution.description##\n##ENDIFchange.storestatus##\n ##lang.change.numberoffollowups## : ##change.numberoffollowups##\n\n##FOREACHfollowups##\n\n [##followup.date##] ##lang.followup.isprivate## : ##followup.isprivate##\n ##lang.followup.author## ##followup.author##\n ##lang.followup.description## ##followup.description##\n ##lang.followup.date## ##followup.date##\n ##lang.followup.requesttype## ##followup.requesttype##\n\n##ENDFOREACHfollowups##\n ##lang.change.numberofproblems## : ##change.numberofproblems##\n\n##FOREACHproblems##\n [##problem.date##] ##lang.change.title## : ##problem.title##\n ##lang.change.content## ##problem.content##\n\n##ENDFOREACHproblems##\n ##lang.change.numberoftasks## : ##change.numberoftasks##\n\n##FOREACHtasks##\n [##task.date##]\n ##lang.task.author## ##task.author##\n ##lang.task.description## ##task.description##\n ##lang.task.time## ##task.time##\n ##lang.task.category## ##task.category##\n\n##ENDFOREACHtasks##\n', '&lt;p&gt;##IFchange.storestatus=5##&lt;/p&gt;\n&lt;div&gt;##lang.change.url## : &lt;a href=\"##change.urlapprove##\"&gt;##change.urlapprove##&lt;/a&gt;&lt;/div&gt;\n&lt;div&gt;&lt;span style=\"color: #888888;\"&gt;&lt;strong&gt;&lt;span style=\"text-decoration: underline;\"&gt;##lang.change.solvedate##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##change.solvedate##&lt;br /&gt;&lt;span style=\"text-decoration: underline; color: #888888;\"&gt;&lt;strong&gt;##lang.change.solution.type##&lt;/strong&gt;&lt;/span&gt; : ##change.solution.type##&lt;br /&gt;&lt;span style=\"text-decoration: underline; color: #888888;\"&gt;&lt;strong&gt;##lang.change.solution.description##&lt;/strong&gt;&lt;/span&gt; : ##change.solution.description## ##ENDIFchange.storestatus##&lt;/div&gt;\n&lt;div&gt;##ELSEchange.storestatus## ##lang.change.url## : &lt;a href=\"##change.url##\"&gt;##change.url##&lt;/a&gt; ##ENDELSEchange.storestatus##&lt;/div&gt;\n&lt;p class=\"description b\"&gt;&lt;strong&gt;##lang.change.description##&lt;/strong&gt;&lt;/p&gt;\n&lt;p&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.change.title##&lt;/span&gt;&#160;:##change.title## &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.change.authors##&lt;/span&gt;&#160;:##IFchange.authors## ##change.authors## ##ENDIFchange.authors##    ##ELSEchange.authors##--##ENDELSEchange.authors## &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.change.creationdate##&lt;/span&gt;&#160;:##change.creationdate## &lt;br /&gt; ##IFchange.assigntousers## &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.change.assigntousers##&lt;/span&gt;&#160;: ##change.assigntousers## ##ENDIFchange.assigntousers##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.change.status## &lt;/span&gt;&#160;: ##change.status##&lt;br /&gt; ##IFchange.assigntogroups## &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.change.assigntogroups##&lt;/span&gt;&#160;: ##change.assigntogroups## ##ENDIFchange.assigntogroups##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.change.urgency##&lt;/span&gt;&#160;: ##change.urgency##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.change.impact##&lt;/span&gt;&#160;: ##change.impact##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.change.priority##&lt;/span&gt; : ##change.priority## &lt;br /&gt;##IFchange.category##&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.change.category## &lt;/span&gt;&#160;:##change.category##  ##ENDIFchange.category## ##ELSEchange.category##  ##lang.change.nocategoryassigned## ##ENDELSEchange.category##    &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.change.content##&lt;/span&gt;&#160;: ##change.content##&lt;/p&gt;\n&lt;p&gt;##IFchange.storestatus=6##&lt;br /&gt;&lt;span style=\"text-decoration: underline;\"&gt;&lt;strong&gt;&lt;span style=\"color: #888888;\"&gt;##lang.change.solvedate##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##change.solvedate##&lt;br /&gt;&lt;span style=\"color: #888888;\"&gt;&lt;strong&gt;&lt;span style=\"text-decoration: underline;\"&gt;##lang.change.solution.type##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##change.solution.type##&lt;br /&gt;&lt;span style=\"text-decoration: underline; color: #888888;\"&gt;&lt;strong&gt;##lang.change.solution.description##&lt;/strong&gt;&lt;/span&gt; : ##change.solution.description##&lt;br /&gt;##ENDIFchange.storestatus##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;##lang.change.numberoffollowups##&#160;: ##change.numberoffollowups##&lt;/div&gt;\n&lt;p&gt;##FOREACHfollowups##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;&lt;br /&gt; &lt;strong&gt; [##followup.date##] &lt;em&gt;##lang.followup.isprivate## : ##followup.isprivate## &lt;/em&gt;&lt;/strong&gt;&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.followup.author## &lt;/span&gt; ##followup.author##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.followup.description## &lt;/span&gt; ##followup.description##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.followup.date## &lt;/span&gt; ##followup.date##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.followup.requesttype## &lt;/span&gt; ##followup.requesttype##&lt;/div&gt;\n&lt;p&gt;##ENDFOREACHfollowups##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;##lang.change.numberofproblems##&#160;: ##change.numberofproblems##&lt;/div&gt;\n&lt;p&gt;##FOREACHproblems##&lt;/p&gt;\n&lt;div&gt;&lt;strong&gt; [##problem.date##] &lt;em&gt;##lang.change.title## : &lt;a href=\"##problem.url##\"&gt;##problem.title## &lt;/a&gt;&lt;/em&gt;&lt;/strong&gt;&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; &lt;/span&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.change.content## &lt;/span&gt; ##problem.content##\n&lt;p&gt;##ENDFOREACHproblems##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;##lang.change.numberoftasks##&#160;: ##change.numberoftasks##&lt;/div&gt;\n&lt;p&gt;##FOREACHtasks##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;&lt;strong&gt;[##task.date##] &lt;/strong&gt;&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.task.author##&lt;/span&gt; ##task.author##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.task.description##&lt;/span&gt; ##task.description##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.task.time##&lt;/span&gt; ##task.time##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.task.category##&lt;/span&gt; ##task.category##&lt;/div&gt;\n&lt;p&gt;##ENDFOREACHtasks##&lt;/p&gt;\n&lt;/div&gt;'),
(20, 20, '', '##mailcollector.action##', '##FOREACHmailcollectors##\n##lang.mailcollector.name## : ##mailcollector.name##\n##lang.mailcollector.errors## : ##mailcollector.errors##\n##mailcollector.url##\n##ENDFOREACHmailcollectors##', '&lt;p&gt;##FOREACHmailcollectors##&lt;br /&gt;##lang.mailcollector.name## : ##mailcollector.name##&lt;br /&gt; ##lang.mailcollector.errors## : ##mailcollector.errors##&lt;br /&gt;&lt;a href=\"##mailcollector.url##\"&gt;##mailcollector.url##&lt;/a&gt;&lt;br /&gt; ##ENDFOREACHmailcollectors##&lt;/p&gt;\n&lt;p&gt;&lt;/p&gt;'),
(21, 21, '', '##project.action## ##project.name## ##project.code##', '##lang.project.url## : ##project.url##\n\n##lang.project.description##\n\n##lang.project.name## : ##project.name##\n##lang.project.code## : ##project.code##\n##lang.project.manager## : ##project.manager##\n##lang.project.managergroup## : ##project.managergroup##\n##lang.project.creationdate## : ##project.creationdate##\n##lang.project.priority## : ##project.priority##\n##lang.project.state## : ##project.state##\n##lang.project.type## : ##project.type##\n##lang.project.description## : ##project.description##\n\n##lang.project.numberoftasks## : ##project.numberoftasks##\n\n\n\n##FOREACHtasks##\n\n[##task.creationdate##]\n##lang.task.name## : ##task.name##\n##lang.task.state## : ##task.state##\n##lang.task.type## : ##task.type##\n##lang.task.percent## : ##task.percent##\n##lang.task.description## : ##task.description##\n\n##ENDFOREACHtasks##', '&lt;p&gt;##lang.project.url## : &lt;a href=\"##project.url##\"&gt;##project.url##&lt;/a&gt;&lt;/p&gt;\n&lt;p&gt;&lt;strong&gt;##lang.project.description##&lt;/strong&gt;&lt;/p&gt;\n&lt;p&gt;##lang.project.name## : ##project.name##&lt;br /&gt;##lang.project.code## : ##project.code##&lt;br /&gt; ##lang.project.manager## : ##project.manager##&lt;br /&gt;##lang.project.managergroup## : ##project.managergroup##&lt;br /&gt; ##lang.project.creationdate## : ##project.creationdate##&lt;br /&gt;##lang.project.priority## : ##project.priority## &lt;br /&gt;##lang.project.state## : ##project.state##&lt;br /&gt;##lang.project.type## : ##project.type##&lt;br /&gt;##lang.project.description## : ##project.description##&lt;/p&gt;\n&lt;p&gt;##lang.project.numberoftasks## : ##project.numberoftasks##&lt;/p&gt;\n&lt;div&gt;\n&lt;p&gt;##FOREACHtasks##&lt;/p&gt;\n&lt;div&gt;&lt;strong&gt;[##task.creationdate##] &lt;/strong&gt;&lt;br /&gt; ##lang.task.name## : ##task.name##&lt;br /&gt;##lang.task.state## : ##task.state##&lt;br /&gt;##lang.task.type## : ##task.type##&lt;br /&gt;##lang.task.percent## : ##task.percent##&lt;br /&gt;##lang.task.description## : ##task.description##&lt;/div&gt;\n&lt;p&gt;##ENDFOREACHtasks##&lt;/p&gt;\n&lt;/div&gt;');
INSERT INTO `glpi_notificationtemplatetranslations` (`id`, `notificationtemplates_id`, `language`, `subject`, `content_text`, `content_html`) VALUES
(22, 22, '', '##projecttask.action## ##projecttask.name##', '##lang.projecttask.url## : ##projecttask.url##\n\n##lang.projecttask.description##\n\n##lang.projecttask.name## : ##projecttask.name##\n##lang.projecttask.project## : ##projecttask.project##\n##lang.projecttask.creationdate## : ##projecttask.creationdate##\n##lang.projecttask.state## : ##projecttask.state##\n##lang.projecttask.type## : ##projecttask.type##\n##lang.projecttask.description## : ##projecttask.description##\n\n##lang.projecttask.numberoftasks## : ##projecttask.numberoftasks##\n\n\n\n##FOREACHtasks##\n\n[##task.creationdate##]\n##lang.task.name## : ##task.name##\n##lang.task.state## : ##task.state##\n##lang.task.type## : ##task.type##\n##lang.task.percent## : ##task.percent##\n##lang.task.description## : ##task.description##\n\n##ENDFOREACHtasks##', '&lt;p&gt;##lang.projecttask.url## : &lt;a href=\"##projecttask.url##\"&gt;##projecttask.url##&lt;/a&gt;&lt;/p&gt;\n&lt;p&gt;&lt;strong&gt;##lang.projecttask.description##&lt;/strong&gt;&lt;/p&gt;\n&lt;p&gt;##lang.projecttask.name## : ##projecttask.name##&lt;br /&gt;##lang.projecttask.project## : &lt;a href=\"##projecttask.projecturl##\"&gt;##projecttask.project##&lt;/a&gt;&lt;br /&gt;##lang.projecttask.creationdate## : ##projecttask.creationdate##&lt;br /&gt;##lang.projecttask.state## : ##projecttask.state##&lt;br /&gt;##lang.projecttask.type## : ##projecttask.type##&lt;br /&gt;##lang.projecttask.description## : ##projecttask.description##&lt;/p&gt;\n&lt;p&gt;##lang.projecttask.numberoftasks## : ##projecttask.numberoftasks##&lt;/p&gt;\n&lt;div&gt;\n&lt;p&gt;##FOREACHtasks##&lt;/p&gt;\n&lt;div&gt;&lt;strong&gt;[##task.creationdate##] &lt;/strong&gt;&lt;br /&gt;##lang.task.name## : ##task.name##&lt;br /&gt;##lang.task.state## : ##task.state##&lt;br /&gt;##lang.task.type## : ##task.type##&lt;br /&gt;##lang.task.percent## : ##task.percent##&lt;br /&gt;##lang.task.description## : ##task.description##&lt;/div&gt;\n&lt;p&gt;##ENDFOREACHtasks##&lt;/p&gt;\n&lt;/div&gt;'),
(23, 23, '', '##objectlock.action##', '##objectlock.type## ###objectlock.id## - ##objectlock.name##\n\n      ##lang.objectlock.url##\n      ##objectlock.url##\n\n      ##lang.objectlock.date_mod##\n      ##objectlock.date_mod##\n\n      Hello ##objectlock.lockedby.firstname##,\n      Could go to this item and unlock it for me?\n      Thank you,\n      Regards,\n      ##objectlock.requester.firstname##', '&lt;table&gt;\n      &lt;tbody&gt;\n      &lt;tr&gt;&lt;th colspan=\"2\"&gt;&lt;a href=\"##objectlock.url##\"&gt;##objectlock.type## ###objectlock.id## - ##objectlock.name##&lt;/a&gt;&lt;/th&gt;&lt;/tr&gt;\n      &lt;tr&gt;\n      &lt;td&gt;##lang.objectlock.url##&lt;/td&gt;\n      &lt;td&gt;##objectlock.url##&lt;/td&gt;\n      &lt;/tr&gt;\n      &lt;tr&gt;\n      &lt;td&gt;##lang.objectlock.date_mod##&lt;/td&gt;\n      &lt;td&gt;##objectlock.date_mod##&lt;/td&gt;\n      &lt;/tr&gt;\n      &lt;/tbody&gt;\n      &lt;/table&gt;\n      &lt;p&gt;&lt;span style=\"font-size: small;\"&gt;Hello ##objectlock.lockedby.firstname##,&lt;br /&gt;Could go to this item and unlock it for me?&lt;br /&gt;Thank you,&lt;br /&gt;Regards,&lt;br /&gt;##objectlock.requester.firstname## ##objectlock.requester.lastname##&lt;/span&gt;&lt;/p&gt;'),
(24, 24, '', '##savedsearch.action## ##savedsearch.name##', '##savedsearch.type## ###savedsearch.id## - ##savedsearch.name##\n\n      ##savedsearch.message##\n\n      ##lang.savedsearch.url##\n      ##savedsearch.url##\n\n      Regards,', '&lt;table&gt;\n      &lt;tbody&gt;\n      &lt;tr&gt;&lt;th colspan=\"2\"&gt;&lt;a href=\"##savedsearch.url##\"&gt;##savedsearch.type## ###savedsearch.id## - ##savedsearch.name##&lt;/a&gt;&lt;/th&gt;&lt;/tr&gt;\n      &lt;tr&gt;&lt;td colspan=\"2\"&gt;&lt;a href=\"##savedsearch.url##\"&gt;##savedsearch.message##&lt;/a&gt;&lt;/td&gt;&lt;/tr&gt;\n      &lt;tr&gt;\n      &lt;td&gt;##lang.savedsearch.url##&lt;/td&gt;\n      &lt;td&gt;##savedsearch.url##&lt;/td&gt;\n      &lt;/tr&gt;\n      &lt;/tbody&gt;\n      &lt;/table&gt;\n      &lt;p&gt;&lt;span style=\"font-size: small;\"&gt;Hello &lt;br /&gt;Regards,&lt;/span&gt;&lt;/p&gt;'),
(25, 25, '', '##certificate.action##  ##certificate.name##', '##lang.certificate.entity## : ##certificate.entity##\n\n##lang.certificate.serial## : ##certificate.serial##\n\n##lang.certificate.expirationdate## : ##certificate.expirationdate##\n\n##certificate.url##', '&lt;p&gt;\n##lang.certificate.entity## : ##certificate.entity##&lt;br /&gt;\n&lt;br /&gt;##lang.certificate.name## : ##certificate.name##&lt;br /&gt;\n##lang.certificate.serial## : ##certificate.serial##&lt;br /&gt;\n##lang.certificate.expirationdate## : ##certificate.expirationdate##\n&lt;br /&gt; &lt;a href=\"##certificate.url##\"&gt; ##certificate.url##\n&lt;/a&gt;&lt;br /&gt;\n&lt;/p&gt;'),
(26, 26, '', '##domain.action## : ##domain.name##', '##lang.domain.entity## :##domain.entity##\n   ##lang.domain.name## : ##domain.name## - ##lang.domain.dateexpiration## : ##domain.dateexpiration##', '&lt;p&gt;##lang.domain.entity## :##domain.entity##&lt;br /&gt; &lt;br /&gt;\n                        ##lang.domain.name##  : ##domain.name## - ##lang.domain.dateexpiration## :  ##domain.dateexpiration##&lt;br /&gt;\n                        &lt;/p&gt;'),
(27, 27, '', '##user.action##', '##user.realname## ##user.firstname##,\n\n##IFuser.password.has_expired=1##\n##lang.password.has_expired.information##\n##ENDIFuser.password.has_expired##\n##ELSEuser.password.has_expired##\n##lang.password.expires_soon.information##\n##ENDELSEuser.password.has_expired##\n##lang.user.password.expiration.date##: ##user.password.expiration.date##\n##IFuser.account.lock.date##\n##lang.user.account.lock.date##: ##user.account.lock.date##\n##ENDIFuser.account.lock.date##\n\n##password.update.link## ##user.password.update.url##', '&lt;p&gt;&lt;strong&gt;##user.realname## ##user.firstname##&lt;/strong&gt;&lt;/p&gt;\n\n##IFuser.password.has_expired=1##\n&lt;p&gt;##lang.password.has_expired.information##&lt;/p&gt;\n##ENDIFuser.password.has_expired##\n##ELSEuser.password.has_expired##\n&lt;p&gt;##lang.password.expires_soon.information##&lt;/p&gt;\n##ENDELSEuser.password.has_expired##\n&lt;p&gt;##lang.user.password.expiration.date##: ##user.password.expiration.date##&lt;/p&gt;\n##IFuser.account.lock.date##\n&lt;p&gt;##lang.user.account.lock.date##: ##user.account.lock.date##&lt;/p&gt;\n##ENDIFuser.account.lock.date##\n\n&lt;p&gt;##lang.password.update.link## &lt;a href=\"##user.password.update.url##\"&gt;##user.password.update.url##&lt;/a&gt;&lt;/p&gt;'),
(28, 28, '', '##lang.plugins_updates_available##', '##lang.plugins_updates_available##\n\n##FOREACHplugins##\n##plugin.name## :##plugin.old_version## -&gt; ##plugin.version##\n##ENDFOREACHplugins##\n\n##lang.marketplace.url## : ##marketplace.url##', '&lt;p&gt;##lang.plugins_updates_available##&lt;/p&gt;\n&lt;ul&gt;##FOREACHplugins##\n&lt;li&gt;##plugin.name## :##plugin.old_version## -&gt; ##plugin.version##&lt;/li&gt;\n##ENDFOREACHplugins##&lt;/ul&gt;\n&lt;p&gt;##lang.marketplace.url## : &lt;a title=\"##lang.marketplace.url##\" href=\"##marketplace.url##\" target=\"_blank\" rel=\"noopener\"&gt;##marketplace.url##&lt;/a&gt;&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_notimportedemails`
--

CREATE TABLE `glpi_notimportedemails` (
  `id` int(10) UNSIGNED NOT NULL,
  `from` varchar(255) NOT NULL,
  `to` varchar(255) NOT NULL,
  `mailcollectors_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `subject` text DEFAULT NULL,
  `messageid` varchar(255) NOT NULL,
  `reason` int(11) NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_objectlocks`
--

CREATE TABLE `glpi_objectlocks` (
  `id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(100) NOT NULL COMMENT 'Type of locked object',
  `items_id` int(10) UNSIGNED NOT NULL COMMENT 'RELATION to various tables, according to itemtype (ID)',
  `users_id` int(10) UNSIGNED NOT NULL COMMENT 'id of the locker',
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_olalevelactions`
--

CREATE TABLE `glpi_olalevelactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `olalevels_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `action_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_olalevelcriterias`
--

CREATE TABLE `glpi_olalevelcriterias` (
  `id` int(10) UNSIGNED NOT NULL,
  `olalevels_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `criteria` varchar(255) DEFAULT NULL,
  `condition` int(11) NOT NULL DEFAULT 0 COMMENT 'see define.php PATTERN_* and REGEX_* constant',
  `pattern` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_olalevels`
--

CREATE TABLE `glpi_olalevels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `olas_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `execution_time` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `match` char(10) DEFAULT NULL COMMENT 'see define.php *_MATCHING constant',
  `uuid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_olalevels_tickets`
--

CREATE TABLE `glpi_olalevels_tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `tickets_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `olalevels_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_olas`
--

CREATE TABLE `glpi_olas` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `number_time` int(11) NOT NULL,
  `use_ticket_calendar` tinyint(4) NOT NULL DEFAULT 0,
  `calendars_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `definition_time` varchar(255) DEFAULT NULL,
  `end_of_working_day` tinyint(4) NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `slms_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_operatingsystemarchitectures`
--

CREATE TABLE `glpi_operatingsystemarchitectures` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_operatingsystemeditions`
--

CREATE TABLE `glpi_operatingsystemeditions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_operatingsystemkernels`
--

CREATE TABLE `glpi_operatingsystemkernels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_operatingsystemkernelversions`
--

CREATE TABLE `glpi_operatingsystemkernelversions` (
  `id` int(10) UNSIGNED NOT NULL,
  `operatingsystemkernels_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_operatingsystems`
--

CREATE TABLE `glpi_operatingsystems` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_operatingsystemservicepacks`
--

CREATE TABLE `glpi_operatingsystemservicepacks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_operatingsystemversions`
--

CREATE TABLE `glpi_operatingsystemversions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_passivedcequipmentmodels`
--

CREATE TABLE `glpi_passivedcequipmentmodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT 0,
  `required_units` int(11) NOT NULL DEFAULT 1,
  `depth` float NOT NULL DEFAULT 1,
  `power_connections` int(11) NOT NULL DEFAULT 0,
  `power_consumption` int(11) NOT NULL DEFAULT 0,
  `is_half_rack` tinyint(4) NOT NULL DEFAULT 0,
  `picture_front` text DEFAULT NULL,
  `picture_rear` text DEFAULT NULL,
  `pictures` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_passivedcequipments`
--

CREATE TABLE `glpi_passivedcequipments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `passivedcequipmentmodels_id` int(10) UNSIGNED DEFAULT NULL,
  `passivedcequipmenttypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'RELATION to states (id)',
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_passivedcequipmenttypes`
--

CREATE TABLE `glpi_passivedcequipmenttypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_pcivendors`
--

CREATE TABLE `glpi_pcivendors` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `vendorid` varchar(4) NOT NULL,
  `deviceid` varchar(4) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_pdumodels`
--

CREATE TABLE `glpi_pdumodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT 0,
  `required_units` int(11) NOT NULL DEFAULT 1,
  `depth` float NOT NULL DEFAULT 1,
  `power_connections` int(11) NOT NULL DEFAULT 0,
  `max_power` int(11) NOT NULL DEFAULT 0,
  `is_half_rack` tinyint(4) NOT NULL DEFAULT 0,
  `picture_front` text DEFAULT NULL,
  `picture_rear` text DEFAULT NULL,
  `pictures` text DEFAULT NULL,
  `is_rackable` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_pdus`
--

CREATE TABLE `glpi_pdus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `pdumodels_id` int(10) UNSIGNED DEFAULT NULL,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'RELATION to states (id)',
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pdutypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_pdus_plugs`
--

CREATE TABLE `glpi_pdus_plugs` (
  `id` int(10) UNSIGNED NOT NULL,
  `plugs_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pdus_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `number_plugs` int(11) DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_pdus_racks`
--

CREATE TABLE `glpi_pdus_racks` (
  `id` int(10) UNSIGNED NOT NULL,
  `racks_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pdus_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `side` int(11) DEFAULT 0,
  `position` int(11) NOT NULL,
  `bgcolor` varchar(7) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_pdutypes`
--

CREATE TABLE `glpi_pdutypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_pendingreasons`
--

CREATE TABLE `glpi_pendingreasons` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `followup_frequency` int(11) NOT NULL DEFAULT 0,
  `followups_before_resolution` int(11) NOT NULL DEFAULT 0,
  `itilfollowuptemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `solutiontemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_pendingreasons_items`
--

CREATE TABLE `glpi_pendingreasons_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `pendingreasons_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL DEFAULT '',
  `followup_frequency` int(11) NOT NULL DEFAULT 0,
  `followups_before_resolution` int(11) NOT NULL DEFAULT 0,
  `bump_count` int(11) NOT NULL DEFAULT 0,
  `last_bump_date` timestamp NULL DEFAULT NULL,
  `previous_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_peripheralmodels`
--

CREATE TABLE `glpi_peripheralmodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT 0,
  `required_units` int(11) NOT NULL DEFAULT 1,
  `depth` float NOT NULL DEFAULT 1,
  `power_connections` int(11) NOT NULL DEFAULT 0,
  `power_consumption` int(11) NOT NULL DEFAULT 0,
  `is_half_rack` tinyint(4) NOT NULL DEFAULT 0,
  `picture_front` text DEFAULT NULL,
  `picture_rear` text DEFAULT NULL,
  `pictures` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_peripherals`
--

CREATE TABLE `glpi_peripherals` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `peripheraltypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `peripheralmodels_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `brand` varchar(255) DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_global` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ticket_tco` decimal(20,4) DEFAULT 0.0000,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `autoupdatesystems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `uuid` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_peripheraltypes`
--

CREATE TABLE `glpi_peripheraltypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_phonemodels`
--

CREATE TABLE `glpi_phonemodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `picture_front` text DEFAULT NULL,
  `picture_rear` text DEFAULT NULL,
  `pictures` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_phonepowersupplies`
--

CREATE TABLE `glpi_phonepowersupplies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_phones`
--

CREATE TABLE `glpi_phones` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `phonetypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `phonemodels_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `brand` varchar(255) DEFAULT NULL,
  `phonepowersupplies_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `number_line` varchar(255) DEFAULT NULL,
  `have_headset` tinyint(4) NOT NULL DEFAULT 0,
  `have_hp` tinyint(4) NOT NULL DEFAULT 0,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_global` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ticket_tco` decimal(20,4) DEFAULT 0.0000,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `autoupdatesystems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `uuid` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `last_inventory_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_phonetypes`
--

CREATE TABLE `glpi_phonetypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_planningeventcategories`
--

CREATE TABLE `glpi_planningeventcategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_planningexternalevents`
--

CREATE TABLE `glpi_planningexternalevents` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `planningexternaleventtemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 1,
  `date` timestamp NULL DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_guests` text DEFAULT NULL,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `begin` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `rrule` text DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT 0,
  `planningeventcategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `background` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_planningexternaleventtemplates`
--

CREATE TABLE `glpi_planningexternaleventtemplates` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `text` mediumtext DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `duration` int(11) NOT NULL DEFAULT 0,
  `before_time` int(11) NOT NULL DEFAULT 0,
  `rrule` text DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT 0,
  `planningeventcategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `background` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_planningrecalls`
--

CREATE TABLE `glpi_planningrecalls` (
  `id` int(10) UNSIGNED NOT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `before_time` int(11) NOT NULL DEFAULT -10,
  `when` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_plugins`
--

CREATE TABLE `glpi_plugins` (
  `id` int(10) UNSIGNED NOT NULL,
  `directory` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `state` int(11) NOT NULL DEFAULT 0 COMMENT 'see define.php PLUGIN_* constant',
  `author` varchar(255) DEFAULT NULL,
  `homepage` varchar(255) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_plugins`
--

INSERT INTO `glpi_plugins` (`id`, `directory`, `name`, `version`, `state`, `author`, `homepage`, `license`) VALUES
(1, 'actualtime', 'ActualTime', '3.2.0', 1, '<a href=\"https://tic.gal\">TICgal</a>', 'https://tic.gal/en/project/actualtime-plugin-glpi/', 'AGPLv3+');

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_plugs`
--

CREATE TABLE `glpi_plugs` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_printerlogs`
--

CREATE TABLE `glpi_printerlogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `printers_id` int(10) UNSIGNED NOT NULL,
  `total_pages` int(11) NOT NULL DEFAULT 0,
  `bw_pages` int(11) NOT NULL DEFAULT 0,
  `color_pages` int(11) NOT NULL DEFAULT 0,
  `rv_pages` int(11) NOT NULL DEFAULT 0,
  `prints` int(11) NOT NULL DEFAULT 0,
  `bw_prints` int(11) NOT NULL DEFAULT 0,
  `color_prints` int(11) NOT NULL DEFAULT 0,
  `copies` int(11) NOT NULL DEFAULT 0,
  `bw_copies` int(11) NOT NULL DEFAULT 0,
  `color_copies` int(11) NOT NULL DEFAULT 0,
  `scanned` int(11) NOT NULL DEFAULT 0,
  `date` date DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `faxed` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_printermodels`
--

CREATE TABLE `glpi_printermodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `picture_front` text DEFAULT NULL,
  `picture_rear` text DEFAULT NULL,
  `pictures` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_printers`
--

CREATE TABLE `glpi_printers` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `have_serial` tinyint(4) NOT NULL DEFAULT 0,
  `have_parallel` tinyint(4) NOT NULL DEFAULT 0,
  `have_usb` tinyint(4) NOT NULL DEFAULT 0,
  `have_wifi` tinyint(4) NOT NULL DEFAULT 0,
  `have_ethernet` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `memory_size` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `networks_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `printertypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `printermodels_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_global` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `init_pages_counter` int(11) NOT NULL DEFAULT 0,
  `last_pages_counter` int(11) NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ticket_tco` decimal(20,4) DEFAULT 0.0000,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `uuid` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `sysdescr` text DEFAULT NULL,
  `last_inventory_update` timestamp NULL DEFAULT NULL,
  `snmpcredentials_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `autoupdatesystems_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_printers_cartridgeinfos`
--

CREATE TABLE `glpi_printers_cartridgeinfos` (
  `id` int(10) UNSIGNED NOT NULL,
  `printers_id` int(10) UNSIGNED NOT NULL,
  `property` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_printertypes`
--

CREATE TABLE `glpi_printertypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_problemcosts`
--

CREATE TABLE `glpi_problemcosts` (
  `id` int(10) UNSIGNED NOT NULL,
  `problems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `actiontime` int(11) NOT NULL DEFAULT 0,
  `cost_time` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `cost_fixed` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `cost_material` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `budgets_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_problems`
--

CREATE TABLE `glpi_problems` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `content` longtext DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `solvedate` timestamp NULL DEFAULT NULL,
  `closedate` timestamp NULL DEFAULT NULL,
  `time_to_resolve` timestamp NULL DEFAULT NULL,
  `users_id_recipient` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_lastupdater` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `urgency` int(11) NOT NULL DEFAULT 1,
  `impact` int(11) NOT NULL DEFAULT 1,
  `priority` int(11) NOT NULL DEFAULT 1,
  `itilcategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `impactcontent` longtext DEFAULT NULL,
  `causecontent` longtext DEFAULT NULL,
  `symptomcontent` longtext DEFAULT NULL,
  `actiontime` int(11) NOT NULL DEFAULT 0,
  `begin_waiting_date` timestamp NULL DEFAULT NULL,
  `waiting_duration` int(11) NOT NULL DEFAULT 0,
  `close_delay_stat` int(11) NOT NULL DEFAULT 0,
  `solve_delay_stat` int(11) NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_problems_suppliers`
--

CREATE TABLE `glpi_problems_suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `problems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `suppliers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1,
  `use_notification` tinyint(4) NOT NULL DEFAULT 0,
  `alternative_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_problems_tickets`
--

CREATE TABLE `glpi_problems_tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `problems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tickets_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_problems_users`
--

CREATE TABLE `glpi_problems_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `problems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1,
  `use_notification` tinyint(4) NOT NULL DEFAULT 0,
  `alternative_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_problemtasks`
--

CREATE TABLE `glpi_problemtasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `problems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `taskcategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date` timestamp NULL DEFAULT NULL,
  `begin` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_editor` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `content` longtext DEFAULT NULL,
  `actiontime` int(11) NOT NULL DEFAULT 0,
  `state` int(11) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `tasktemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `timeline_position` tinyint(4) NOT NULL DEFAULT 0,
  `is_private` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_problemtemplatehiddenfields`
--

CREATE TABLE `glpi_problemtemplatehiddenfields` (
  `id` int(10) UNSIGNED NOT NULL,
  `problemtemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `num` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_problemtemplatemandatoryfields`
--

CREATE TABLE `glpi_problemtemplatemandatoryfields` (
  `id` int(10) UNSIGNED NOT NULL,
  `problemtemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `num` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_problemtemplatemandatoryfields`
--

INSERT INTO `glpi_problemtemplatemandatoryfields` (`id`, `problemtemplates_id`, `num`) VALUES
(1, 1, 21);

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_problemtemplatepredefinedfields`
--

CREATE TABLE `glpi_problemtemplatepredefinedfields` (
  `id` int(10) UNSIGNED NOT NULL,
  `problemtemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `num` int(11) NOT NULL DEFAULT 0,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_problemtemplates`
--

CREATE TABLE `glpi_problemtemplates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_problemtemplates`
--

INSERT INTO `glpi_problemtemplates` (`id`, `name`, `entities_id`, `is_recursive`, `comment`) VALUES
(1, 'Default', 0, 1, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_profilerights`
--

CREATE TABLE `glpi_profilerights` (
  `id` int(10) UNSIGNED NOT NULL,
  `profiles_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `rights` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_profilerights`
--

INSERT INTO `glpi_profilerights` (`id`, `profiles_id`, `name`, `rights`) VALUES
(1, 1, 'computer', 0),
(2, 1, 'monitor', 0),
(3, 1, 'software', 0),
(4, 1, 'networking', 0),
(5, 1, 'internet', 0),
(6, 1, 'printer', 0),
(7, 1, 'peripheral', 0),
(8, 1, 'cartridge', 0),
(9, 1, 'consumable', 0),
(10, 1, 'phone', 0),
(11, 6, 'queuednotification', 0),
(12, 1, 'contact_enterprise', 0),
(13, 1, 'document', 0),
(14, 1, 'contract', 0),
(15, 1, 'infocom', 0),
(16, 1, 'knowbase', 2048),
(17, 1, 'reservation', 1024),
(18, 1, 'reports', 0),
(19, 1, 'dropdown', 0),
(20, 1, 'device', 0),
(21, 1, 'typedoc', 0),
(22, 1, 'link', 0),
(23, 1, 'config', 0),
(24, 1, 'rule_ticket', 0),
(25, 1, 'rule_import', 0),
(26, 1, 'rule_location', 0),
(27, 1, 'rule_ldap', 0),
(28, 1, 'rule_softwarecategories', 0),
(29, 1, 'search_config', 0),
(30, 5, 'location', 0),
(31, 7, 'domain', 31),
(32, 1, 'profile', 0),
(33, 1, 'user', 0),
(34, 1, 'group', 0),
(35, 1, 'entity', 0),
(36, 1, 'transfer', 0),
(37, 1, 'logs', 0),
(38, 1, 'reminder_public', 1),
(39, 1, 'rssfeed_public', 1),
(40, 1, 'bookmark_public', 0),
(41, 1, 'backup', 0),
(42, 1, 'ticket', 5),
(43, 1, 'followup', 5),
(44, 1, 'task', 1),
(45, 1, 'planning', 0),
(46, 2, 'state', 0),
(47, 2, 'taskcategory', 0),
(48, 1, 'statistic', 0),
(49, 1, 'password_update', 1),
(50, 1, 'show_group_hardware', 0),
(51, 1, 'rule_dictionnary_software', 0),
(52, 1, 'rule_dictionnary_dropdown', 0),
(53, 1, 'budget', 0),
(54, 1, 'notification', 0),
(55, 1, 'rule_mailcollector', 0),
(56, 7, 'solutiontemplate', 23),
(57, 7, 'itilfollowuptemplate', 23),
(58, 1, 'calendar', 0),
(59, 1, 'slm', 0),
(60, 1, 'rule_dictionnary_printer', 0),
(61, 1, 'problem', 0),
(62, 2, 'cable_management', 0),
(63, 4, 'knowbasecategory', 23),
(64, 5, 'itilcategory', 0),
(65, 1, 'itiltemplate', 0),
(66, 1, 'ticketrecurrent', 0),
(67, 1, 'ticketcost', 0),
(68, 6, 'changevalidation', 20),
(69, 1, 'ticketvalidation', 0),
(70, 2, 'computer', 33),
(71, 2, 'monitor', 33),
(72, 2, 'software', 33),
(73, 2, 'networking', 33),
(74, 2, 'internet', 1),
(75, 2, 'printer', 33),
(76, 2, 'peripheral', 33),
(77, 2, 'cartridge', 33),
(78, 2, 'consumable', 33),
(79, 2, 'phone', 33),
(80, 5, 'queuednotification', 0),
(81, 2, 'contact_enterprise', 33),
(82, 2, 'document', 33),
(83, 2, 'contract', 33),
(84, 2, 'infocom', 1),
(85, 2, 'knowbase', 10241),
(86, 2, 'reservation', 1025),
(87, 2, 'reports', 1),
(88, 2, 'dropdown', 0),
(89, 2, 'device', 0),
(90, 2, 'typedoc', 1),
(91, 2, 'link', 1),
(92, 2, 'config', 0),
(93, 2, 'rule_ticket', 0),
(94, 2, 'rule_import', 0),
(95, 2, 'rule_location', 0),
(96, 2, 'rule_ldap', 0),
(97, 2, 'rule_softwarecategories', 0),
(98, 2, 'search_config', 1024),
(99, 4, 'location', 23),
(100, 6, 'domain', 0),
(101, 2, 'profile', 0),
(102, 2, 'user', 2049),
(103, 2, 'group', 33),
(104, 2, 'entity', 0),
(105, 2, 'transfer', 0),
(106, 2, 'logs', 0),
(107, 2, 'reminder_public', 129),
(108, 2, 'rssfeed_public', 129),
(109, 2, 'bookmark_public', 0),
(110, 2, 'backup', 0),
(111, 2, 'ticket', 168989),
(112, 2, 'followup', 5),
(113, 2, 'task', 1),
(114, 6, 'projecttask', 1025),
(115, 7, 'projecttask', 1025),
(116, 2, 'planning', 1),
(117, 1, 'state', 0),
(118, 1, 'taskcategory', 0),
(119, 2, 'statistic', 1),
(120, 2, 'password_update', 1),
(121, 2, 'show_group_hardware', 0),
(122, 2, 'rule_dictionnary_software', 0),
(123, 2, 'rule_dictionnary_dropdown', 0),
(124, 2, 'budget', 33),
(125, 2, 'notification', 0),
(126, 2, 'rule_mailcollector', 0),
(127, 5, 'solutiontemplate', 0),
(128, 5, 'itilfollowuptemplate', 0),
(129, 6, 'solutiontemplate', 0),
(130, 6, 'itilfollowuptemplate', 0),
(131, 2, 'calendar', 0),
(132, 2, 'slm', 0),
(133, 2, 'rule_dictionnary_printer', 0),
(134, 2, 'problem', 1057),
(135, 1, 'cable_management', 0),
(136, 3, 'knowbasecategory', 23),
(137, 4, 'itilcategory', 23),
(138, 2, 'itiltemplate', 0),
(139, 2, 'ticketrecurrent', 0),
(140, 2, 'ticketcost', 1),
(141, 4, 'changevalidation', 1044),
(142, 5, 'changevalidation', 20),
(143, 2, 'ticketvalidation', 15376),
(144, 3, 'computer', 127),
(145, 3, 'monitor', 127),
(146, 3, 'software', 127),
(147, 3, 'networking', 127),
(148, 3, 'internet', 31),
(149, 3, 'printer', 127),
(150, 3, 'peripheral', 127),
(151, 3, 'cartridge', 127),
(152, 3, 'consumable', 127),
(153, 3, 'phone', 127),
(154, 4, 'queuednotification', 31),
(155, 3, 'contact_enterprise', 127),
(156, 3, 'document', 127),
(157, 3, 'contract', 127),
(158, 3, 'infocom', 23),
(159, 3, 'knowbase', 14359),
(160, 3, 'reservation', 1055),
(161, 3, 'reports', 1),
(162, 3, 'dropdown', 23),
(163, 3, 'device', 23),
(164, 3, 'typedoc', 23),
(165, 3, 'link', 23),
(166, 3, 'config', 0),
(167, 3, 'rule_ticket', 1047),
(168, 3, 'rule_import', 0),
(169, 3, 'rule_location', 0),
(170, 3, 'rule_ldap', 0),
(171, 3, 'rule_softwarecategories', 0),
(172, 3, 'search_config', 3072),
(173, 3, 'location', 23),
(174, 5, 'domain', 0),
(175, 3, 'profile', 1),
(176, 3, 'user', 7199),
(177, 3, 'group', 119),
(178, 3, 'entity', 33),
(179, 3, 'transfer', 1),
(180, 3, 'logs', 1),
(181, 3, 'reminder_public', 151),
(182, 3, 'rssfeed_public', 151),
(183, 3, 'bookmark_public', 23),
(184, 3, 'backup', 1024),
(185, 3, 'ticket', 261151),
(186, 3, 'followup', 31767),
(187, 3, 'task', 13329),
(188, 3, 'projecttask', 1121),
(189, 4, 'projecttask', 1121),
(190, 5, 'projecttask', 0),
(191, 3, 'planning', 3073),
(192, 7, 'taskcategory', 23),
(193, 7, 'cable_management', 31),
(194, 3, 'statistic', 1),
(195, 3, 'password_update', 1),
(196, 3, 'show_group_hardware', 0),
(197, 3, 'rule_dictionnary_software', 0),
(198, 3, 'rule_dictionnary_dropdown', 0),
(199, 3, 'budget', 127),
(200, 3, 'notification', 0),
(201, 3, 'rule_mailcollector', 23),
(202, 3, 'solutiontemplate', 23),
(203, 3, 'itilfollowuptemplate', 23),
(204, 4, 'solutiontemplate', 23),
(205, 4, 'itilfollowuptemplate', 23),
(206, 3, 'calendar', 23),
(207, 3, 'slm', 23),
(208, 3, 'rule_dictionnary_printer', 0),
(209, 3, 'problem', 1151),
(210, 2, 'knowbasecategory', 0),
(211, 3, 'itilcategory', 23),
(212, 3, 'itiltemplate', 23),
(213, 3, 'ticketrecurrent', 1),
(214, 3, 'ticketcost', 23),
(215, 2, 'changevalidation', 1044),
(216, 3, 'changevalidation', 1044),
(217, 3, 'ticketvalidation', 15376),
(218, 4, 'computer', 255),
(219, 4, 'monitor', 255),
(220, 4, 'software', 255),
(221, 4, 'networking', 255),
(222, 4, 'internet', 159),
(223, 4, 'printer', 255),
(224, 4, 'peripheral', 255),
(225, 4, 'cartridge', 255),
(226, 4, 'consumable', 255),
(227, 4, 'phone', 255),
(228, 4, 'contact_enterprise', 255),
(229, 4, 'document', 255),
(230, 4, 'contract', 255),
(231, 4, 'infocom', 23),
(232, 4, 'knowbase', 15383),
(233, 4, 'reservation', 1055),
(234, 4, 'reports', 1),
(235, 4, 'dropdown', 23),
(236, 4, 'device', 23),
(237, 4, 'typedoc', 23),
(238, 4, 'link', 159),
(239, 4, 'config', 3),
(240, 4, 'rule_ticket', 1047),
(241, 4, 'rule_import', 23),
(242, 4, 'rule_location', 23),
(243, 4, 'rule_ldap', 23),
(244, 4, 'rule_softwarecategories', 23),
(245, 4, 'search_config', 3072),
(246, 2, 'location', 0),
(247, 4, 'domain', 31),
(248, 4, 'profile', 23),
(249, 4, 'user', 7327),
(250, 4, 'group', 119),
(251, 4, 'entity', 3327),
(252, 4, 'transfer', 23),
(253, 4, 'logs', 1),
(254, 4, 'reminder_public', 159),
(255, 4, 'rssfeed_public', 159),
(256, 4, 'bookmark_public', 23),
(257, 4, 'backup', 1045),
(258, 4, 'ticket', 261151),
(259, 4, 'followup', 31767),
(260, 4, 'task', 13329),
(261, 7, 'project', 1151),
(262, 1, 'projecttask', 0),
(263, 2, 'projecttask', 1025),
(264, 4, 'planning', 3073),
(265, 6, 'taskcategory', 0),
(266, 6, 'cable_management', 0),
(267, 4, 'statistic', 1),
(268, 4, 'password_update', 1),
(269, 4, 'show_group_hardware', 1),
(270, 4, 'rule_dictionnary_software', 23),
(271, 4, 'rule_dictionnary_dropdown', 23),
(272, 4, 'budget', 127),
(273, 4, 'notification', 23),
(274, 4, 'rule_mailcollector', 23),
(275, 1, 'solutiontemplate', 0),
(276, 1, 'itilfollowuptemplate', 0),
(277, 2, 'solutiontemplate', 0),
(278, 2, 'itilfollowuptemplate', 0),
(279, 4, 'calendar', 23),
(280, 4, 'slm', 23),
(281, 4, 'rule_dictionnary_printer', 23),
(282, 4, 'problem', 1151),
(283, 1, 'knowbasecategory', 0),
(284, 2, 'itilcategory', 0),
(285, 4, 'itiltemplate', 23),
(286, 4, 'ticketrecurrent', 23),
(287, 4, 'ticketcost', 23),
(288, 7, 'change', 1151),
(289, 1, 'changevalidation', 0),
(290, 4, 'ticketvalidation', 15376),
(291, 5, 'computer', 0),
(292, 5, 'monitor', 0),
(293, 5, 'software', 0),
(294, 5, 'networking', 0),
(295, 5, 'internet', 0),
(296, 5, 'printer', 0),
(297, 5, 'peripheral', 0),
(298, 5, 'cartridge', 0),
(299, 5, 'consumable', 0),
(300, 5, 'phone', 0),
(301, 3, 'queuednotification', 0),
(302, 5, 'contact_enterprise', 0),
(303, 5, 'document', 0),
(304, 5, 'contract', 0),
(305, 5, 'infocom', 0),
(306, 5, 'knowbase', 10240),
(307, 5, 'reservation', 0),
(308, 5, 'reports', 0),
(309, 5, 'dropdown', 0),
(310, 5, 'device', 0),
(311, 5, 'typedoc', 0),
(312, 5, 'link', 0),
(313, 5, 'config', 0),
(314, 5, 'rule_ticket', 0),
(315, 5, 'rule_import', 0),
(316, 5, 'rule_location', 0),
(317, 5, 'rule_ldap', 0),
(318, 5, 'rule_softwarecategories', 0),
(319, 5, 'search_config', 0),
(320, 1, 'location', 0),
(321, 3, 'domain', 31),
(322, 5, 'profile', 0),
(323, 5, 'user', 1025),
(324, 5, 'group', 0),
(325, 5, 'entity', 0),
(326, 5, 'transfer', 0),
(327, 5, 'logs', 0),
(328, 5, 'reminder_public', 128),
(329, 5, 'rssfeed_public', 128),
(330, 5, 'bookmark_public', 0),
(331, 5, 'backup', 0),
(332, 5, 'ticket', 140295),
(333, 5, 'followup', 12295),
(334, 5, 'task', 8193),
(335, 4, 'project', 1151),
(336, 5, 'project', 1151),
(337, 6, 'project', 1151),
(338, 5, 'planning', 1),
(339, 5, 'taskcategory', 0),
(340, 5, 'cable_management', 0),
(341, 5, 'statistic', 1),
(342, 5, 'password_update', 1),
(343, 5, 'show_group_hardware', 0),
(344, 5, 'rule_dictionnary_software', 0),
(345, 5, 'rule_dictionnary_dropdown', 0),
(346, 5, 'budget', 0),
(347, 5, 'notification', 0),
(348, 5, 'rule_mailcollector', 0),
(349, 6, 'state', 0),
(350, 7, 'state', 23),
(351, 5, 'calendar', 0),
(352, 5, 'slm', 0),
(353, 5, 'rule_dictionnary_printer', 0),
(354, 5, 'problem', 1024),
(355, 7, 'knowbasecategory', 23),
(356, 1, 'itilcategory', 0),
(357, 5, 'itiltemplate', 0),
(358, 5, 'ticketrecurrent', 0),
(359, 5, 'ticketcost', 23),
(360, 5, 'change', 1054),
(361, 6, 'change', 1151),
(362, 5, 'ticketvalidation', 3088),
(363, 6, 'computer', 127),
(364, 6, 'monitor', 127),
(365, 6, 'software', 127),
(366, 6, 'networking', 127),
(367, 6, 'internet', 31),
(368, 6, 'printer', 127),
(369, 6, 'peripheral', 127),
(370, 6, 'cartridge', 127),
(371, 6, 'consumable', 127),
(372, 6, 'phone', 127),
(373, 2, 'queuednotification', 0),
(374, 6, 'contact_enterprise', 96),
(375, 6, 'document', 127),
(376, 6, 'contract', 96),
(377, 6, 'infocom', 0),
(378, 6, 'knowbase', 14359),
(379, 6, 'reservation', 1055),
(380, 6, 'reports', 1),
(381, 6, 'dropdown', 0),
(382, 6, 'device', 0),
(383, 6, 'typedoc', 0),
(384, 6, 'link', 0),
(385, 6, 'config', 0),
(386, 6, 'rule_ticket', 0),
(387, 6, 'rule_import', 0),
(388, 6, 'rule_location', 0),
(389, 6, 'rule_ldap', 0),
(390, 6, 'rule_softwarecategories', 0),
(391, 6, 'search_config', 0),
(392, 2, 'domain', 0),
(393, 6, 'profile', 0),
(394, 6, 'user', 1055),
(395, 6, 'group', 1),
(396, 6, 'entity', 33),
(397, 6, 'transfer', 1),
(398, 6, 'logs', 0),
(399, 6, 'reminder_public', 151),
(400, 6, 'rssfeed_public', 151),
(401, 6, 'bookmark_public', 0),
(402, 6, 'backup', 0),
(403, 6, 'ticket', 166919),
(404, 6, 'followup', 13319),
(405, 6, 'task', 13329),
(406, 1, 'project', 0),
(407, 2, 'project', 1025),
(408, 3, 'project', 1151),
(409, 6, 'planning', 1),
(410, 4, 'taskcategory', 23),
(411, 4, 'cable_management', 31),
(412, 6, 'statistic', 1),
(413, 6, 'password_update', 1),
(414, 6, 'show_group_hardware', 0),
(415, 6, 'rule_dictionnary_software', 0),
(416, 6, 'rule_dictionnary_dropdown', 0),
(417, 6, 'budget', 96),
(418, 6, 'notification', 0),
(419, 6, 'rule_mailcollector', 0),
(420, 4, 'state', 23),
(421, 5, 'state', 0),
(422, 6, 'calendar', 0),
(423, 6, 'slm', 1),
(424, 6, 'rule_dictionnary_printer', 0),
(425, 6, 'problem', 1121),
(426, 6, 'knowbasecategory', 0),
(427, 7, 'itilcategory', 23),
(428, 7, 'location', 23),
(429, 6, 'itiltemplate', 1),
(430, 6, 'ticketrecurrent', 1),
(431, 6, 'ticketcost', 23),
(432, 3, 'change', 1151),
(433, 4, 'change', 1151),
(434, 6, 'ticketvalidation', 3088),
(435, 7, 'computer', 127),
(436, 7, 'monitor', 127),
(437, 7, 'software', 127),
(438, 7, 'networking', 127),
(439, 7, 'internet', 31),
(440, 7, 'printer', 127),
(441, 7, 'peripheral', 127),
(442, 7, 'cartridge', 127),
(443, 7, 'consumable', 127),
(444, 7, 'phone', 127),
(445, 1, 'queuednotification', 0),
(446, 7, 'contact_enterprise', 96),
(447, 7, 'document', 127),
(448, 7, 'contract', 96),
(449, 7, 'infocom', 0),
(450, 7, 'knowbase', 14359),
(451, 7, 'reservation', 1055),
(452, 7, 'reports', 1),
(453, 7, 'dropdown', 0),
(454, 7, 'device', 0),
(455, 7, 'typedoc', 0),
(456, 7, 'link', 0),
(457, 7, 'config', 0),
(458, 7, 'rule_ticket', 1047),
(459, 7, 'rule_import', 0),
(460, 7, 'rule_location', 0),
(461, 7, 'rule_ldap', 0),
(462, 7, 'rule_softwarecategories', 0),
(463, 7, 'search_config', 0),
(464, 1, 'domain', 0),
(465, 7, 'profile', 0),
(466, 7, 'user', 1055),
(467, 7, 'group', 1),
(468, 7, 'entity', 33),
(469, 7, 'transfer', 1),
(470, 7, 'logs', 1),
(471, 7, 'reminder_public', 151),
(472, 7, 'rssfeed_public', 151),
(473, 7, 'bookmark_public', 0),
(474, 7, 'backup', 0),
(475, 7, 'ticket', 2053),
(476, 7, 'followup', 31767),
(477, 7, 'task', 13329),
(478, 7, 'queuednotification', 0),
(479, 7, 'planning', 3073),
(480, 3, 'taskcategory', 23),
(481, 3, 'cable_management', 31),
(482, 7, 'statistic', 1),
(483, 7, 'password_update', 1),
(484, 7, 'show_group_hardware', 0),
(485, 7, 'rule_dictionnary_software', 0),
(486, 7, 'rule_dictionnary_dropdown', 0),
(487, 7, 'budget', 96),
(488, 7, 'notification', 0),
(489, 7, 'rule_mailcollector', 23),
(490, 7, 'changevalidation', 1044),
(491, 3, 'state', 23),
(492, 7, 'calendar', 23),
(493, 7, 'slm', 23),
(494, 7, 'rule_dictionnary_printer', 0),
(495, 7, 'problem', 1151),
(496, 5, 'knowbasecategory', 0),
(497, 6, 'itilcategory', 0),
(498, 6, 'location', 0),
(499, 7, 'itiltemplate', 23),
(500, 7, 'ticketrecurrent', 1),
(501, 7, 'ticketcost', 23),
(502, 1, 'change', 0),
(503, 2, 'change', 1057),
(504, 7, 'ticketvalidation', 15376),
(505, 8, 'backup', 1),
(506, 8, 'bookmark_public', 1),
(507, 8, 'budget', 33),
(508, 8, 'calendar', 1),
(509, 8, 'cartridge', 33),
(510, 8, 'change', 1057),
(511, 8, 'changevalidation', 0),
(512, 8, 'computer', 33),
(513, 8, 'config', 1),
(514, 8, 'consumable', 33),
(515, 8, 'contact_enterprise', 33),
(516, 8, 'contract', 33),
(517, 8, 'device', 1),
(518, 8, 'document', 33),
(519, 8, 'domain', 1),
(520, 8, 'dropdown', 1),
(521, 8, 'entity', 33),
(522, 8, 'followup', 8193),
(523, 8, 'global_validation', 0),
(524, 8, 'group', 33),
(525, 8, 'infocom', 1),
(526, 8, 'internet', 1),
(527, 8, 'itilcategory', 1),
(528, 8, 'knowbase', 10241),
(529, 8, 'knowbasecategory', 1),
(530, 8, 'link', 1),
(531, 8, 'location', 1),
(532, 8, 'logs', 1),
(533, 8, 'monitor', 33),
(534, 8, 'cable_management', 1),
(535, 8, 'networking', 33),
(536, 8, 'notification', 1),
(537, 8, 'password_update', 0),
(538, 8, 'peripheral', 33),
(539, 8, 'phone', 33),
(540, 8, 'planning', 3073),
(541, 8, 'printer', 33),
(542, 8, 'problem', 1057),
(543, 8, 'profile', 1),
(544, 8, 'project', 1057),
(545, 8, 'projecttask', 33),
(546, 8, 'queuednotification', 1),
(547, 8, 'reminder_public', 1),
(548, 8, 'reports', 1),
(549, 8, 'reservation', 129),
(550, 8, 'rssfeed_public', 129),
(551, 8, 'rule_dictionnary_dropdown', 1),
(552, 8, 'rule_dictionnary_printer', 1),
(553, 8, 'rule_dictionnary_software', 1),
(554, 8, 'rule_import', 1),
(555, 8, 'rule_location', 1),
(556, 8, 'rule_ldap', 1),
(557, 8, 'rule_mailcollector', 1),
(558, 8, 'rule_softwarecategories', 1),
(559, 8, 'rule_ticket', 1),
(560, 8, 'search_config', 0),
(561, 8, 'show_group_hardware', 1),
(562, 8, 'slm', 1),
(563, 8, 'software', 33),
(564, 8, 'solutiontemplate', 1),
(565, 8, 'itilfollowuptemplate', 1),
(566, 8, 'state', 1),
(567, 8, 'statistic', 1),
(568, 8, 'task', 8193),
(569, 8, 'taskcategory', 1),
(570, 8, 'ticket', 138241),
(571, 8, 'ticketcost', 1),
(572, 8, 'ticketrecurrent', 1),
(573, 8, 'itiltemplate', 1),
(574, 8, 'ticketvalidation', 0),
(575, 8, 'transfer', 1),
(576, 8, 'typedoc', 1),
(577, 8, 'user', 1),
(578, 1, 'license', 0),
(579, 2, 'license', 33),
(580, 3, 'license', 127),
(581, 4, 'license', 255),
(582, 5, 'license', 0),
(583, 6, 'license', 127),
(584, 7, 'license', 127),
(585, 8, 'license', 33),
(586, 1, 'line', 0),
(587, 2, 'line', 33),
(588, 3, 'line', 127),
(589, 4, 'line', 255),
(590, 5, 'line', 0),
(591, 6, 'line', 127),
(592, 7, 'line', 127),
(593, 8, 'line', 33),
(594, 1, 'lineoperator', 0),
(595, 2, 'lineoperator', 33),
(596, 3, 'lineoperator', 23),
(597, 4, 'lineoperator', 23),
(598, 5, 'lineoperator', 0),
(599, 6, 'lineoperator', 0),
(600, 7, 'lineoperator', 23),
(601, 8, 'lineoperator', 1),
(602, 1, 'devicesimcard_pinpuk', 0),
(603, 2, 'devicesimcard_pinpuk', 1),
(604, 3, 'devicesimcard_pinpuk', 3),
(605, 4, 'devicesimcard_pinpuk', 3),
(606, 5, 'devicesimcard_pinpuk', 0),
(607, 6, 'devicesimcard_pinpuk', 3),
(608, 7, 'devicesimcard_pinpuk', 3),
(609, 8, 'devicesimcard_pinpuk', 1),
(610, 1, 'certificate', 0),
(611, 2, 'certificate', 33),
(612, 3, 'certificate', 127),
(613, 4, 'certificate', 255),
(614, 5, 'certificate', 0),
(615, 6, 'certificate', 127),
(616, 7, 'certificate', 127),
(617, 8, 'certificate', 33),
(618, 1, 'datacenter', 0),
(619, 2, 'datacenter', 1),
(620, 3, 'datacenter', 31),
(621, 4, 'datacenter', 31),
(622, 5, 'datacenter', 0),
(623, 6, 'datacenter', 31),
(624, 7, 'datacenter', 31),
(625, 8, 'datacenter', 1),
(626, 4, 'rule_asset', 1047),
(627, 1, 'personalization', 3),
(628, 2, 'personalization', 3),
(629, 3, 'personalization', 3),
(630, 4, 'personalization', 3),
(631, 5, 'personalization', 3),
(632, 6, 'personalization', 3),
(633, 7, 'personalization', 3),
(634, 8, 'personalization', 3),
(635, 1, 'rule_asset', 0),
(636, 2, 'rule_asset', 0),
(637, 3, 'rule_asset', 0),
(638, 5, 'rule_asset', 0),
(639, 6, 'rule_asset', 0),
(640, 7, 'rule_asset', 0),
(641, 8, 'rule_asset', 0),
(642, 1, 'global_validation', 0),
(643, 2, 'global_validation', 0),
(644, 3, 'global_validation', 0),
(645, 4, 'global_validation', 0),
(646, 5, 'global_validation', 0),
(647, 6, 'global_validation', 0),
(648, 7, 'global_validation', 0),
(649, 1, 'cluster', 0),
(650, 2, 'cluster', 1),
(651, 3, 'cluster', 31),
(652, 4, 'cluster', 31),
(653, 5, 'cluster', 0),
(654, 6, 'cluster', 31),
(655, 7, 'cluster', 31),
(656, 8, 'cluster', 1),
(657, 1, 'externalevent', 0),
(658, 2, 'externalevent', 1),
(659, 3, 'externalevent', 1055),
(660, 4, 'externalevent', 1055),
(661, 5, 'externalevent', 0),
(662, 6, 'externalevent', 1),
(663, 7, 'externalevent', 31),
(664, 8, 'externalevent', 1),
(665, 1, 'dashboard', 0),
(666, 2, 'dashboard', 0),
(667, 3, 'dashboard', 0),
(668, 4, 'dashboard', 23),
(669, 5, 'dashboard', 0),
(670, 6, 'dashboard', 0),
(671, 7, 'dashboard', 0),
(672, 8, 'dashboard', 0),
(673, 1, 'appliance', 0),
(674, 2, 'appliance', 1),
(675, 3, 'appliance', 31),
(676, 4, 'appliance', 31),
(677, 5, 'appliance', 0),
(678, 6, 'appliance', 31),
(679, 7, 'appliance', 31),
(680, 8, 'appliance', 1),
(681, 1, 'inventory', 0),
(682, 2, 'inventory', 0),
(683, 3, 'inventory', 3073),
(684, 4, 'inventory', 3073),
(685, 5, 'inventory', 0),
(686, 6, 'inventory', 0),
(687, 7, 'inventory', 0),
(688, 8, 'inventory', 0),
(689, 1, 'pendingreason', 0),
(690, 2, 'pendingreason', 0),
(691, 3, 'pendingreason', 31),
(692, 4, 'pendingreason', 31),
(693, 5, 'pendingreason', 1),
(694, 6, 'pendingreason', 1),
(695, 7, 'pendingreason', 1),
(696, 8, 'pendingreason', 1),
(697, 1, 'database', 0),
(698, 2, 'database', 1),
(699, 3, 'database', 31),
(700, 4, 'database', 31),
(701, 5, 'database', 0),
(702, 6, 'database', 31),
(703, 7, 'database', 31),
(704, 8, 'database', 1),
(705, 1, 'recurrentchange', 0),
(706, 2, 'recurrentchange', 0),
(707, 3, 'recurrentchange', 1),
(708, 4, 'recurrentchange', 31),
(709, 5, 'recurrentchange', 0),
(710, 6, 'recurrentchange', 1),
(711, 7, 'recurrentchange', 1),
(712, 8, 'recurrentchange', 1),
(713, 1, 'locked_field', 0),
(714, 2, 'locked_field', 0),
(715, 3, 'locked_field', 0),
(716, 4, 'locked_field', 6),
(717, 5, 'locked_field', 0),
(718, 6, 'locked_field', 0),
(719, 7, 'locked_field', 0),
(720, 8, 'locked_field', 0),
(721, 1, 'snmpcredential', 0),
(722, 2, 'snmpcredential', 0),
(723, 3, 'snmpcredential', 0),
(724, 4, 'snmpcredential', 31),
(725, 5, 'snmpcredential', 0),
(726, 6, 'snmpcredential', 0),
(727, 7, 'snmpcredential', 0),
(728, 8, 'snmpcredential', 0),
(729, 1, 'refusedequipment', 0),
(730, 2, 'refusedequipment', 0),
(731, 3, 'refusedequipment', 0),
(732, 4, 'refusedequipment', 19),
(733, 5, 'refusedequipment', 0),
(734, 6, 'refusedequipment', 0),
(735, 7, 'refusedequipment', 0),
(736, 8, 'refusedequipment', 0),
(737, 1, 'agent', 0),
(738, 2, 'agent', 0),
(739, 3, 'agent', 0),
(740, 4, 'agent', 19),
(741, 5, 'agent', 0),
(742, 6, 'agent', 0),
(743, 7, 'agent', 0),
(744, 8, 'agent', 0),
(745, 1, 'unmanaged', 0),
(746, 2, 'unmanaged', 0),
(747, 3, 'unmanaged', 0),
(748, 4, 'unmanaged', 27),
(749, 5, 'unmanaged', 0),
(750, 6, 'unmanaged', 0),
(751, 7, 'unmanaged', 0),
(752, 8, 'unmanaged', 0),
(753, 4, 'system_logs', 1),
(754, 9, 'agent', 0),
(755, 9, 'appliance', 0),
(756, 9, 'backup', 0),
(757, 9, 'bookmark_public', 0),
(758, 9, 'budget', 0),
(759, 9, 'cable_management', 0),
(760, 9, 'calendar', 0),
(761, 9, 'cartridge', 0),
(762, 9, 'certificate', 0),
(763, 9, 'change', 0),
(764, 9, 'changevalidation', 0),
(765, 9, 'cluster', 0),
(766, 9, 'computer', 0),
(767, 9, 'config', 0),
(768, 9, 'consumable', 0),
(769, 9, 'contact_enterprise', 0),
(770, 9, 'contract', 0),
(771, 9, 'dashboard', 0),
(772, 9, 'database', 0),
(773, 9, 'datacenter', 0),
(774, 9, 'device', 0),
(775, 9, 'devicesimcard_pinpuk', 0),
(776, 9, 'document', 0),
(777, 9, 'domain', 0),
(778, 9, 'dropdown', 0),
(779, 9, 'entity', 0),
(780, 9, 'externalevent', 0),
(781, 9, 'followup', 1),
(782, 9, 'global_validation', 0),
(783, 9, 'group', 0),
(784, 9, 'infocom', 0),
(785, 9, 'internet', 0),
(786, 9, 'inventory', 0),
(787, 9, 'itilcategory', 0),
(788, 9, 'itilfollowuptemplate', 0),
(789, 9, 'itiltemplate', 0),
(790, 9, 'knowbase', 0),
(791, 9, 'knowbasecategory', 0),
(792, 9, 'license', 0),
(793, 9, 'line', 0),
(794, 9, 'lineoperator', 0),
(795, 9, 'link', 0),
(796, 9, 'location', 0),
(797, 9, 'locked_field', 0),
(798, 9, 'logs', 0),
(799, 9, 'monitor', 0),
(800, 9, 'networking', 0),
(801, 9, 'notification', 0),
(802, 9, 'password_update', 1),
(803, 9, 'pendingreason', 0),
(804, 9, 'peripheral', 0),
(805, 9, 'personalization', 0),
(806, 9, 'phone', 0),
(807, 9, 'planning', 0),
(808, 9, 'printer', 0),
(809, 9, 'problem', 0),
(810, 9, 'profile', 0),
(811, 9, 'project', 0),
(812, 9, 'projecttask', 0),
(813, 9, 'queuednotification', 0),
(814, 9, 'recurrentchange', 0),
(815, 9, 'refusedequipment', 0),
(816, 9, 'reminder_public', 0),
(817, 9, 'reports', 0),
(818, 9, 'reservation', 0),
(819, 9, 'rssfeed_public', 0),
(820, 9, 'rule_asset', 0),
(821, 9, 'rule_dictionnary_dropdown', 0),
(822, 9, 'rule_dictionnary_printer', 0),
(823, 9, 'rule_dictionnary_software', 0),
(824, 9, 'rule_import', 0),
(825, 9, 'rule_ldap', 0),
(826, 9, 'rule_location', 0),
(827, 9, 'rule_mailcollector', 0),
(828, 9, 'rule_softwarecategories', 0),
(829, 9, 'rule_ticket', 0),
(830, 9, 'search_config', 0),
(831, 9, 'show_group_hardware', 0),
(832, 9, 'slm', 0),
(833, 9, 'snmpcredential', 0),
(834, 9, 'software', 0),
(835, 9, 'solutiontemplate', 0),
(836, 9, 'state', 0),
(837, 9, 'statistic', 0),
(838, 9, 'system_logs', 0),
(839, 9, 'task', 0),
(840, 9, 'taskcategory', 0),
(841, 9, 'ticket', 5),
(842, 9, 'ticketcost', 0),
(843, 9, 'ticketrecurrent', 0),
(844, 9, 'ticketvalidation', 0),
(845, 9, 'transfer', 0),
(846, 9, 'typedoc', 0),
(847, 9, 'unmanaged', 0),
(848, 9, 'user', 0),
(849, 10, 'agent', 0),
(850, 10, 'appliance', 0),
(851, 10, 'backup', 0),
(852, 10, 'bookmark_public', 0),
(853, 10, 'budget', 0),
(854, 10, 'cable_management', 0),
(855, 10, 'calendar', 0),
(856, 10, 'cartridge', 0),
(857, 10, 'certificate', 0),
(858, 10, 'change', 0),
(859, 10, 'changevalidation', 0),
(860, 10, 'cluster', 0),
(861, 10, 'computer', 0),
(862, 10, 'config', 0),
(863, 10, 'consumable', 0),
(864, 10, 'contact_enterprise', 0),
(865, 10, 'contract', 0),
(866, 10, 'dashboard', 0),
(867, 10, 'database', 0),
(868, 10, 'datacenter', 0),
(869, 10, 'device', 0),
(870, 10, 'devicesimcard_pinpuk', 0),
(871, 10, 'document', 0),
(872, 10, 'domain', 0),
(873, 10, 'dropdown', 0),
(874, 10, 'entity', 0),
(875, 10, 'externalevent', 0),
(876, 10, 'followup', 2),
(877, 10, 'global_validation', 0),
(878, 10, 'group', 0),
(879, 10, 'infocom', 0),
(880, 10, 'internet', 0),
(881, 10, 'inventory', 0),
(882, 10, 'itilcategory', 0),
(883, 10, 'itilfollowuptemplate', 0),
(884, 10, 'itiltemplate', 0),
(885, 10, 'knowbase', 0),
(886, 10, 'knowbasecategory', 0),
(887, 10, 'license', 0),
(888, 10, 'line', 0),
(889, 10, 'lineoperator', 0),
(890, 10, 'link', 0),
(891, 10, 'location', 0),
(892, 10, 'locked_field', 0),
(893, 10, 'logs', 0),
(894, 10, 'monitor', 0),
(895, 10, 'networking', 0),
(896, 10, 'notification', 0),
(897, 10, 'password_update', 1),
(898, 10, 'pendingreason', 0),
(899, 10, 'peripheral', 0),
(900, 10, 'personalization', 1),
(901, 10, 'phone', 0),
(902, 10, 'planning', 0),
(903, 10, 'printer', 0),
(904, 10, 'problem', 0),
(905, 10, 'profile', 0),
(906, 10, 'project', 0),
(907, 10, 'projecttask', 0),
(908, 10, 'queuednotification', 0),
(909, 10, 'recurrentchange', 0),
(910, 10, 'refusedequipment', 0),
(911, 10, 'reminder_public', 0),
(912, 10, 'reports', 0),
(913, 10, 'reservation', 0),
(914, 10, 'rssfeed_public', 0),
(915, 10, 'rule_asset', 0),
(916, 10, 'rule_dictionnary_dropdown', 0),
(917, 10, 'rule_dictionnary_printer', 0),
(918, 10, 'rule_dictionnary_software', 0),
(919, 10, 'rule_import', 0),
(920, 10, 'rule_ldap', 0),
(921, 10, 'rule_location', 0),
(922, 10, 'rule_mailcollector', 0),
(923, 10, 'rule_softwarecategories', 0),
(924, 10, 'rule_ticket', 0),
(925, 10, 'search_config', 0),
(926, 10, 'show_group_hardware', 0),
(927, 10, 'slm', 0),
(928, 10, 'snmpcredential', 0),
(929, 10, 'software', 0),
(930, 10, 'solutiontemplate', 0),
(931, 10, 'state', 0),
(932, 10, 'statistic', 0),
(933, 10, 'system_logs', 0),
(934, 10, 'task', 1),
(935, 10, 'taskcategory', 0),
(936, 10, 'ticket', 5),
(937, 10, 'ticketcost', 0),
(938, 10, 'ticketrecurrent', 0),
(939, 10, 'ticketvalidation', 15360),
(940, 10, 'transfer', 0),
(941, 10, 'typedoc', 0),
(942, 10, 'unmanaged', 0),
(943, 10, 'user', 0),
(944, 11, 'agent', 0),
(945, 11, 'appliance', 0),
(946, 11, 'backup', 0),
(947, 11, 'bookmark_public', 0),
(948, 11, 'budget', 0),
(949, 11, 'cable_management', 0),
(950, 11, 'calendar', 0),
(951, 11, 'cartridge', 0),
(952, 11, 'certificate', 0),
(953, 11, 'change', 0),
(954, 11, 'changevalidation', 0),
(955, 11, 'cluster', 0),
(956, 11, 'computer', 0),
(957, 11, 'config', 0),
(958, 11, 'consumable', 0),
(959, 11, 'contact_enterprise', 0),
(960, 11, 'contract', 0),
(961, 11, 'dashboard', 0),
(962, 11, 'database', 0),
(963, 11, 'datacenter', 0),
(964, 11, 'device', 0),
(965, 11, 'devicesimcard_pinpuk', 0),
(966, 11, 'document', 0),
(967, 11, 'domain', 0),
(968, 11, 'dropdown', 0),
(969, 11, 'entity', 0),
(970, 11, 'externalevent', 0),
(971, 11, 'followup', 0),
(972, 11, 'global_validation', 0),
(973, 11, 'group', 0),
(974, 11, 'infocom', 0),
(975, 11, 'internet', 0),
(976, 11, 'inventory', 0),
(977, 11, 'itilcategory', 0),
(978, 11, 'itilfollowuptemplate', 0),
(979, 11, 'itiltemplate', 0),
(980, 11, 'knowbase', 0),
(981, 11, 'knowbasecategory', 0),
(982, 11, 'license', 0),
(983, 11, 'line', 0),
(984, 11, 'lineoperator', 0),
(985, 11, 'link', 0),
(986, 11, 'location', 0),
(987, 11, 'locked_field', 0),
(988, 11, 'logs', 0),
(989, 11, 'monitor', 0),
(990, 11, 'networking', 0),
(991, 11, 'notification', 0),
(992, 11, 'password_update', 0),
(993, 11, 'pendingreason', 0),
(994, 11, 'peripheral', 0),
(995, 11, 'personalization', 0),
(996, 11, 'phone', 0),
(997, 11, 'planning', 0),
(998, 11, 'printer', 0),
(999, 11, 'problem', 0),
(1000, 11, 'profile', 0),
(1001, 11, 'project', 0),
(1002, 11, 'projecttask', 0),
(1003, 11, 'queuednotification', 0),
(1004, 11, 'recurrentchange', 0),
(1005, 11, 'refusedequipment', 0),
(1006, 11, 'reminder_public', 0),
(1007, 11, 'reports', 0),
(1008, 11, 'reservation', 0),
(1009, 11, 'rssfeed_public', 0),
(1010, 11, 'rule_asset', 0),
(1011, 11, 'rule_dictionnary_dropdown', 0),
(1012, 11, 'rule_dictionnary_printer', 0),
(1013, 11, 'rule_dictionnary_software', 0),
(1014, 11, 'rule_import', 0),
(1015, 11, 'rule_ldap', 0),
(1016, 11, 'rule_location', 0),
(1017, 11, 'rule_mailcollector', 0),
(1018, 11, 'rule_softwarecategories', 0),
(1019, 11, 'rule_ticket', 0),
(1020, 11, 'search_config', 0),
(1021, 11, 'show_group_hardware', 0),
(1022, 11, 'slm', 0),
(1023, 11, 'snmpcredential', 0),
(1024, 11, 'software', 0),
(1025, 11, 'solutiontemplate', 0),
(1026, 11, 'state', 0),
(1027, 11, 'statistic', 0),
(1028, 11, 'system_logs', 0),
(1029, 11, 'task', 0),
(1030, 11, 'taskcategory', 0),
(1031, 11, 'ticket', 0),
(1032, 11, 'ticketcost', 0),
(1033, 11, 'ticketrecurrent', 0),
(1034, 11, 'ticketvalidation', 0),
(1035, 11, 'transfer', 0),
(1036, 11, 'typedoc', 0),
(1037, 11, 'unmanaged', 0),
(1038, 11, 'user', 0),
(1039, 12, 'agent', 0),
(1040, 12, 'appliance', 0),
(1041, 12, 'backup', 0),
(1042, 12, 'bookmark_public', 0),
(1043, 12, 'budget', 0),
(1044, 12, 'cable_management', 0),
(1045, 12, 'calendar', 0),
(1046, 12, 'cartridge', 0),
(1047, 12, 'certificate', 0),
(1048, 12, 'change', 0),
(1049, 12, 'changevalidation', 0),
(1050, 12, 'cluster', 0),
(1051, 12, 'computer', 0),
(1052, 12, 'config', 0),
(1053, 12, 'consumable', 0),
(1054, 12, 'contact_enterprise', 0),
(1055, 12, 'contract', 0),
(1056, 12, 'dashboard', 0),
(1057, 12, 'database', 0),
(1058, 12, 'datacenter', 0),
(1059, 12, 'device', 0),
(1060, 12, 'devicesimcard_pinpuk', 0),
(1061, 12, 'document', 0),
(1062, 12, 'domain', 0),
(1063, 12, 'dropdown', 0),
(1064, 12, 'entity', 0),
(1065, 12, 'externalevent', 0),
(1066, 12, 'followup', 0),
(1067, 12, 'global_validation', 0),
(1068, 12, 'group', 0),
(1069, 12, 'infocom', 0),
(1070, 12, 'internet', 0),
(1071, 12, 'inventory', 0),
(1072, 12, 'itilcategory', 0),
(1073, 12, 'itilfollowuptemplate', 0),
(1074, 12, 'itiltemplate', 0),
(1075, 12, 'knowbase', 0),
(1076, 12, 'knowbasecategory', 0),
(1077, 12, 'license', 0),
(1078, 12, 'line', 0),
(1079, 12, 'lineoperator', 0),
(1080, 12, 'link', 0),
(1081, 12, 'location', 0),
(1082, 12, 'locked_field', 0),
(1083, 12, 'logs', 0),
(1084, 12, 'monitor', 0),
(1085, 12, 'networking', 0),
(1086, 12, 'notification', 0),
(1087, 12, 'password_update', 0),
(1088, 12, 'pendingreason', 0),
(1089, 12, 'peripheral', 0),
(1090, 12, 'personalization', 0),
(1091, 12, 'phone', 0),
(1092, 12, 'planning', 0),
(1093, 12, 'printer', 0),
(1094, 12, 'problem', 0),
(1095, 12, 'profile', 0),
(1096, 12, 'project', 0),
(1097, 12, 'projecttask', 0),
(1098, 12, 'queuednotification', 0),
(1099, 12, 'recurrentchange', 0),
(1100, 12, 'refusedequipment', 0),
(1101, 12, 'reminder_public', 0),
(1102, 12, 'reports', 0),
(1103, 12, 'reservation', 0),
(1104, 12, 'rssfeed_public', 0),
(1105, 12, 'rule_asset', 0),
(1106, 12, 'rule_dictionnary_dropdown', 0),
(1107, 12, 'rule_dictionnary_printer', 0),
(1108, 12, 'rule_dictionnary_software', 0),
(1109, 12, 'rule_import', 0),
(1110, 12, 'rule_ldap', 0),
(1111, 12, 'rule_location', 0),
(1112, 12, 'rule_mailcollector', 0),
(1113, 12, 'rule_softwarecategories', 0),
(1114, 12, 'rule_ticket', 0),
(1115, 12, 'search_config', 0),
(1116, 12, 'show_group_hardware', 0),
(1117, 12, 'slm', 0),
(1118, 12, 'snmpcredential', 0),
(1119, 12, 'software', 0),
(1120, 12, 'solutiontemplate', 0),
(1121, 12, 'state', 0),
(1122, 12, 'statistic', 0),
(1123, 12, 'system_logs', 0),
(1124, 12, 'task', 0),
(1125, 12, 'taskcategory', 0),
(1126, 12, 'ticket', 0),
(1127, 12, 'ticketcost', 0),
(1128, 12, 'ticketrecurrent', 0),
(1129, 12, 'ticketvalidation', 0),
(1130, 12, 'transfer', 0),
(1131, 12, 'typedoc', 0),
(1132, 12, 'unmanaged', 0),
(1133, 12, 'user', 0),
(1134, 13, 'agent', 0),
(1135, 13, 'appliance', 0),
(1136, 13, 'backup', 0),
(1137, 13, 'bookmark_public', 0),
(1138, 13, 'budget', 0),
(1139, 13, 'cable_management', 0),
(1140, 13, 'calendar', 0),
(1141, 13, 'cartridge', 0),
(1142, 13, 'certificate', 0),
(1143, 13, 'change', 0),
(1144, 13, 'changevalidation', 0),
(1145, 13, 'cluster', 0),
(1146, 13, 'computer', 0),
(1147, 13, 'config', 0),
(1148, 13, 'consumable', 0),
(1149, 13, 'contact_enterprise', 0),
(1150, 13, 'contract', 0),
(1151, 13, 'dashboard', 0),
(1152, 13, 'database', 0),
(1153, 13, 'datacenter', 0),
(1154, 13, 'device', 0),
(1155, 13, 'devicesimcard_pinpuk', 0),
(1156, 13, 'document', 0),
(1157, 13, 'domain', 0),
(1158, 13, 'dropdown', 0),
(1159, 13, 'entity', 0),
(1160, 13, 'externalevent', 0),
(1161, 13, 'followup', 0),
(1162, 13, 'global_validation', 0),
(1163, 13, 'group', 0),
(1164, 13, 'infocom', 0),
(1165, 13, 'internet', 0),
(1166, 13, 'inventory', 0),
(1167, 13, 'itilcategory', 0),
(1168, 13, 'itilfollowuptemplate', 0),
(1169, 13, 'itiltemplate', 0),
(1170, 13, 'knowbase', 0),
(1171, 13, 'knowbasecategory', 0),
(1172, 13, 'license', 0),
(1173, 13, 'line', 0),
(1174, 13, 'lineoperator', 0),
(1175, 13, 'link', 0),
(1176, 13, 'location', 0),
(1177, 13, 'locked_field', 0),
(1178, 13, 'logs', 0),
(1179, 13, 'monitor', 0),
(1180, 13, 'networking', 0),
(1181, 13, 'notification', 0),
(1182, 13, 'password_update', 0),
(1183, 13, 'pendingreason', 0),
(1184, 13, 'peripheral', 0),
(1185, 13, 'personalization', 0),
(1186, 13, 'phone', 0),
(1187, 13, 'planning', 0),
(1188, 13, 'printer', 0),
(1189, 13, 'problem', 0),
(1190, 13, 'profile', 0),
(1191, 13, 'project', 0),
(1192, 13, 'projecttask', 0),
(1193, 13, 'queuednotification', 0),
(1194, 13, 'recurrentchange', 0),
(1195, 13, 'refusedequipment', 0),
(1196, 13, 'reminder_public', 0),
(1197, 13, 'reports', 0),
(1198, 13, 'reservation', 0),
(1199, 13, 'rssfeed_public', 0),
(1200, 13, 'rule_asset', 0),
(1201, 13, 'rule_dictionnary_dropdown', 0),
(1202, 13, 'rule_dictionnary_printer', 0),
(1203, 13, 'rule_dictionnary_software', 0),
(1204, 13, 'rule_import', 0),
(1205, 13, 'rule_ldap', 0),
(1206, 13, 'rule_location', 0),
(1207, 13, 'rule_mailcollector', 0),
(1208, 13, 'rule_softwarecategories', 0),
(1209, 13, 'rule_ticket', 0),
(1210, 13, 'search_config', 0),
(1211, 13, 'show_group_hardware', 0),
(1212, 13, 'slm', 0),
(1213, 13, 'snmpcredential', 0),
(1214, 13, 'software', 0),
(1215, 13, 'solutiontemplate', 0),
(1216, 13, 'state', 0),
(1217, 13, 'statistic', 0),
(1218, 13, 'system_logs', 0),
(1219, 13, 'task', 0),
(1220, 13, 'taskcategory', 0),
(1221, 13, 'ticket', 0),
(1222, 13, 'ticketcost', 0),
(1223, 13, 'ticketrecurrent', 0),
(1224, 13, 'ticketvalidation', 0),
(1225, 13, 'transfer', 0),
(1226, 13, 'typedoc', 0),
(1227, 13, 'unmanaged', 0),
(1228, 13, 'user', 0),
(1229, 7, 'system_logs', 0),
(1230, 1, 'plugin_actualtime_running', 0),
(1231, 2, 'plugin_actualtime_running', 0),
(1232, 3, 'plugin_actualtime_running', 0),
(1233, 4, 'plugin_actualtime_running', 0),
(1234, 5, 'plugin_actualtime_running', 0),
(1235, 6, 'plugin_actualtime_running', 0),
(1236, 7, 'plugin_actualtime_running', 0),
(1237, 8, 'plugin_actualtime_running', 0),
(1238, 10, 'plugin_actualtime_running', 0),
(1239, 11, 'plugin_actualtime_running', 0),
(1240, 12, 'plugin_actualtime_running', 0),
(1241, 13, 'plugin_actualtime_running', 0),
(1242, 9, 'plugin_actualtime_running', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_profiles`
--

CREATE TABLE `glpi_profiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `interface` varchar(255) DEFAULT 'helpdesk',
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `helpdesk_hardware` int(11) NOT NULL DEFAULT 0,
  `helpdesk_item_type` text DEFAULT NULL,
  `ticket_status` text DEFAULT NULL COMMENT 'json encoded array of from/dest allowed status change',
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `problem_status` text DEFAULT NULL COMMENT 'json encoded array of from/dest allowed status change',
  `create_ticket_on_login` tinyint(4) NOT NULL DEFAULT 0,
  `tickettemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `changetemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `problemtemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `change_status` text DEFAULT NULL COMMENT 'json encoded array of from/dest allowed status change',
  `managed_domainrecordtypes` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_profiles`
--

INSERT INTO `glpi_profiles` (`id`, `name`, `interface`, `is_default`, `helpdesk_hardware`, `helpdesk_item_type`, `ticket_status`, `date_mod`, `comment`, `problem_status`, `create_ticket_on_login`, `tickettemplates_id`, `changetemplates_id`, `problemtemplates_id`, `change_status`, `managed_domainrecordtypes`, `date_creation`) VALUES
(1, 'IMIJ - Instituto de Inovação e Modernização da Justiça', 'helpdesk', 0, 1, '[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\", \"DCRoom\", \"Rack\", \"Enclosure\", \"Database\"]', '{\"1\":{\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0},\"2\":{\"1\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0},\"3\":{\"1\":0,\"2\":0,\"4\":0,\"5\":0,\"6\":0},\"4\":{\"1\":0,\"2\":0,\"3\":0,\"5\":0,\"6\":0},\"5\":{\"1\":0,\"2\":0,\"3\":0,\"4\":0},\"6\":{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}}', '2026-03-05 13:06:28', '', '[]', 0, 0, 0, 0, NULL, '[]', NULL),
(2, 'Observer', 'central', 0, 1, '[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\", \"DCRoom\", \"Rack\", \"Enclosure\", \"Database\"]', '[]', NULL, '', '[]', 0, 0, 0, 0, NULL, '[]', NULL),
(3, 'Admin', 'central', 0, 3, '[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\", \"DCRoom\", \"Rack\", \"Enclosure\", \"Database\"]', '[]', NULL, '', '[]', 0, 0, 0, 0, NULL, '[-1]', NULL),
(4, 'Super-Admin', 'central', 0, 3, '[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\", \"DCRoom\", \"Rack\", \"Enclosure\", \"Database\"]', '[]', NULL, '', '[]', 0, 0, 0, 0, NULL, '[-1]', NULL),
(5, 'Hotliner', 'central', 0, 3, '[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\", \"DCRoom\", \"Rack\", \"Enclosure\", \"Database\"]', '[]', NULL, '', '[]', 1, 0, 0, 0, NULL, '[]', NULL),
(6, 'Technician', 'central', 0, 3, '[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\", \"DCRoom\", \"Rack\", \"Enclosure\", \"Database\"]', '[]', NULL, '', '[]', 0, 0, 0, 0, NULL, '[]', NULL),
(7, 'Manuel Garcia', 'helpdesk', 0, 3, '[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\", \"DCRoom\", \"Rack\", \"Enclosure\", \"Database\"]', '[]', '2026-03-31 10:18:12', '', '[]', 1, 0, 0, 0, NULL, '[]', NULL),
(8, 'Read-Only', 'central', 0, 0, '[]', '{\"1\":{\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0},\"2\":{\"1\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0},\"3\":{\"1\":0,\"2\":0,\"4\":0,\"5\":0,\"6\":0},\"4\":{\"1\":0,\"2\":0,\"3\":0,\"5\":0,\"6\":0},\"5\":{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"6\":0},\"6\":{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}}', NULL, 'This profile defines read-only access. It is used when objects are locked. It can also be used to give to users rights to unlock objects.', '{\"1\":{\"7\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"8\":0,\"6\":0},\"7\":{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"8\":0,\"6\":0},\"2\":{\"1\":0,\"7\":0,\"3\":0,\"4\":0,\"5\":0,\"8\":0,\"6\":0},\"3\":{\"1\":0,\"7\":0,\"2\":0,\"4\":0,\"5\":0,\"8\":0,\"6\":0},\"4\":{\"1\":0,\"7\":0,\"2\":0,\"3\":0,\"5\":0,\"8\":0,\"6\":0},\"5\":{\"1\":0,\"7\":0,\"2\":0,\"3\":0,\"4\":0,\"8\":0,\"6\":0},\"8\":{\"1\":0,\"7\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0},\"6\":{\"1\":0,\"7\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"8\":0}}', 0, 0, 0, 0, '{\"1\":{\"9\":0,\"10\":0,\"7\":0,\"4\":0,\"11\":0,\"12\":0,\"5\":0,\"8\":0,\"6\":0},\"9\":{\"1\":0,\"10\":0,\"7\":0,\"4\":0,\"11\":0,\"12\":0,\"5\":0,\"8\":0,\"6\":0},\"10\":{\"1\":0,\"9\":0,\"7\":0,\"4\":0,\"11\":0,\"12\":0,\"5\":0,\"8\":0,\"6\":0},\"7\":{\"1\":0,\"9\":0,\"10\":0,\"4\":0,\"11\":0,\"12\":0,\"5\":0,\"8\":0,\"6\":0},\"4\":{\"1\":0,\"9\":0,\"10\":0,\"7\":0,\"11\":0,\"12\":0,\"5\":0,\"8\":0,\"6\":0},\"11\":{\"1\":0,\"9\":0,\"10\":0,\"7\":0,\"4\":0,\"12\":0,\"5\":0,\"8\":0,\"6\":0},\"12\":{\"1\":0,\"9\":0,\"10\":0,\"7\":0,\"4\":0,\"11\":0,\"5\":0,\"8\":0,\"6\":0},\"5\":{\"1\":0,\"9\":0,\"10\":0,\"7\":0,\"4\":0,\"11\":0,\"12\":0,\"8\":0,\"6\":0},\"8\":{\"1\":0,\"9\":0,\"10\":0,\"7\":0,\"4\":0,\"11\":0,\"12\":0,\"5\":0,\"6\":0},\"6\":{\"1\":0,\"9\":0,\"10\":0,\"7\":0,\"4\":0,\"11\":0,\"12\":0,\"5\":0,\"8\":0}}', '[]', NULL),
(9, 'CCV - Correios de Cabo Verde', 'helpdesk', 0, 0, '[]', '{\"1\":{\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0},\"2\":{\"1\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0},\"3\":{\"1\":0,\"2\":0,\"4\":0,\"5\":0,\"6\":0},\"4\":{\"1\":0,\"2\":0,\"3\":0,\"5\":0,\"6\":0},\"5\":{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"6\":0},\"6\":{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}}', '2026-03-31 10:54:04', '', NULL, 1, 0, 0, 0, NULL, NULL, '2026-03-05 13:07:56'),
(10, 'DEF - Direcção de Estrangeiros e Fronteiras', 'helpdesk', 0, 0, '[]', '{\"1\":{\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0},\"2\":{\"1\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0},\"3\":{\"1\":0,\"2\":0,\"4\":0,\"5\":0,\"6\":0},\"4\":{\"1\":0,\"2\":0,\"3\":0,\"5\":0,\"6\":0},\"5\":{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"6\":0},\"6\":{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}}', '2026-03-31 10:58:13', '', NULL, 1, 0, 0, 0, NULL, NULL, '2026-03-05 13:08:32'),
(11, 'DGRNI - Direção Geral dos Registos, Notariado e Identificação', 'helpdesk', 0, 0, NULL, '{\"1\":{\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0},\"2\":{\"1\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0},\"3\":{\"1\":0,\"2\":0,\"4\":0,\"5\":0,\"6\":0},\"4\":{\"1\":0,\"2\":0,\"3\":0,\"5\":0,\"6\":0},\"5\":{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"6\":0},\"6\":{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}}', '2026-03-05 13:08:58', '', NULL, 0, 0, 0, 0, NULL, NULL, '2026-03-05 13:08:58'),
(12, 'SINIAC', 'helpdesk', 0, 0, NULL, '{\"1\":{\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0},\"2\":{\"1\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0},\"3\":{\"1\":0,\"2\":0,\"4\":0,\"5\":0,\"6\":0},\"4\":{\"1\":0,\"2\":0,\"3\":0,\"5\":0,\"6\":0},\"5\":{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"6\":0},\"6\":{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}}', '2026-03-05 13:10:36', '', NULL, 0, 0, 0, 0, NULL, NULL, '2026-03-05 13:10:36'),
(13, 'Nosi - Núcleo Operacional de Sociedade de Informação', 'helpdesk', 0, 0, NULL, '{\"1\":{\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0},\"2\":{\"1\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0},\"3\":{\"1\":0,\"2\":0,\"4\":0,\"5\":0,\"6\":0},\"4\":{\"1\":0,\"2\":0,\"3\":0,\"5\":0,\"6\":0},\"5\":{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"6\":0},\"6\":{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}}', '2026-03-05 13:11:05', '', NULL, 0, 0, 0, 0, NULL, NULL, '2026-03-05 13:11:05');

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_profiles_reminders`
--

CREATE TABLE `glpi_profiles_reminders` (
  `id` int(10) UNSIGNED NOT NULL,
  `reminders_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `profiles_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED DEFAULT NULL,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `no_entity_restriction` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_profiles_rssfeeds`
--

CREATE TABLE `glpi_profiles_rssfeeds` (
  `id` int(10) UNSIGNED NOT NULL,
  `rssfeeds_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `profiles_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED DEFAULT NULL,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `no_entity_restriction` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_profiles_users`
--

CREATE TABLE `glpi_profiles_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `profiles_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 1,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `is_default_profile` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_profiles_users`
--

INSERT INTO `glpi_profiles_users` (`id`, `users_id`, `profiles_id`, `entities_id`, `is_recursive`, `is_dynamic`, `is_default_profile`) VALUES
(2, 2, 4, 0, 1, 0, 0),
(3, 3, 1, 0, 1, 0, 0),
(4, 4, 6, 0, 1, 0, 0),
(5, 5, 2, 0, 1, 0, 0),
(6, 7, 9, 0, 0, 0, 0),
(7, 8, 10, 0, 0, 0, 0),
(8, 9, 7, 0, 0, 0, 0),
(9, 10, 1, 0, 0, 0, 0),
(10, 11, 13, 0, 0, 0, 0),
(11, 12, 12, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_projectcosts`
--

CREATE TABLE `glpi_projectcosts` (
  `id` int(10) UNSIGNED NOT NULL,
  `projects_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `cost` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `budgets_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_projects`
--

CREATE TABLE `glpi_projects` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT 1,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `projects_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `projectstates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `projecttypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `plan_start_date` timestamp NULL DEFAULT NULL,
  `plan_end_date` timestamp NULL DEFAULT NULL,
  `real_start_date` timestamp NULL DEFAULT NULL,
  `real_end_date` timestamp NULL DEFAULT NULL,
  `percent_done` int(11) NOT NULL DEFAULT 0,
  `auto_percent_done` tinyint(4) NOT NULL DEFAULT 0,
  `show_on_global_gantt` tinyint(4) NOT NULL DEFAULT 0,
  `content` longtext DEFAULT NULL,
  `comment` longtext DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `projecttemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_projectstates`
--

CREATE TABLE `glpi_projectstates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `is_finished` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_projectstates`
--

INSERT INTO `glpi_projectstates` (`id`, `name`, `comment`, `color`, `is_finished`, `date_mod`, `date_creation`) VALUES
(1, 'New', NULL, '#06ff00', 0, NULL, NULL),
(2, 'Processing', NULL, '#ffb800', 0, NULL, NULL),
(3, 'Closed', NULL, '#ff0000', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_projecttasklinks`
--

CREATE TABLE `glpi_projecttasklinks` (
  `id` int(10) UNSIGNED NOT NULL,
  `projecttasks_id_source` int(10) UNSIGNED NOT NULL,
  `source_uuid` varchar(255) NOT NULL,
  `projecttasks_id_target` int(10) UNSIGNED NOT NULL,
  `target_uuid` varchar(255) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 0,
  `lag` smallint(6) DEFAULT 0,
  `lead` smallint(6) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_projecttasks`
--

CREATE TABLE `glpi_projecttasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `comment` longtext DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `projects_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `projecttasks_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `plan_start_date` timestamp NULL DEFAULT NULL,
  `plan_end_date` timestamp NULL DEFAULT NULL,
  `real_start_date` timestamp NULL DEFAULT NULL,
  `real_end_date` timestamp NULL DEFAULT NULL,
  `planned_duration` int(11) NOT NULL DEFAULT 0,
  `effective_duration` int(11) NOT NULL DEFAULT 0,
  `projectstates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `projecttasktypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `percent_done` int(11) NOT NULL DEFAULT 0,
  `auto_percent_done` tinyint(4) NOT NULL DEFAULT 0,
  `is_milestone` tinyint(4) NOT NULL DEFAULT 0,
  `projecttasktemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_projecttasks_tickets`
--

CREATE TABLE `glpi_projecttasks_tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `tickets_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `projecttasks_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_projecttaskteams`
--

CREATE TABLE `glpi_projecttaskteams` (
  `id` int(10) UNSIGNED NOT NULL,
  `projecttasks_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_projecttasktemplates`
--

CREATE TABLE `glpi_projecttasktemplates` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `comment` longtext DEFAULT NULL,
  `projects_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `projecttasks_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `plan_start_date` timestamp NULL DEFAULT NULL,
  `plan_end_date` timestamp NULL DEFAULT NULL,
  `real_start_date` timestamp NULL DEFAULT NULL,
  `real_end_date` timestamp NULL DEFAULT NULL,
  `planned_duration` int(11) NOT NULL DEFAULT 0,
  `effective_duration` int(11) NOT NULL DEFAULT 0,
  `projectstates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `projecttasktypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `percent_done` int(11) NOT NULL DEFAULT 0,
  `is_milestone` tinyint(4) NOT NULL DEFAULT 0,
  `comments` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_projecttasktypes`
--

CREATE TABLE `glpi_projecttasktypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_projectteams`
--

CREATE TABLE `glpi_projectteams` (
  `id` int(10) UNSIGNED NOT NULL,
  `projects_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_projecttypes`
--

CREATE TABLE `glpi_projecttypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_queuednotifications`
--

CREATE TABLE `glpi_queuednotifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `notificationtemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `sent_try` int(11) NOT NULL DEFAULT 0,
  `create_time` timestamp NULL DEFAULT NULL,
  `send_time` timestamp NULL DEFAULT NULL,
  `sent_time` timestamp NULL DEFAULT NULL,
  `name` text DEFAULT NULL,
  `sender` text DEFAULT NULL,
  `sendername` text DEFAULT NULL,
  `recipient` text DEFAULT NULL,
  `recipientname` text DEFAULT NULL,
  `replyto` text DEFAULT NULL,
  `replytoname` text DEFAULT NULL,
  `headers` text DEFAULT NULL,
  `body_html` longtext DEFAULT NULL,
  `body_text` longtext DEFAULT NULL,
  `messageid` text DEFAULT NULL,
  `documents` text DEFAULT NULL,
  `mode` varchar(20) NOT NULL COMMENT 'See Notification_NotificationTemplate::MODE_* constants',
  `event` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_rackmodels`
--

CREATE TABLE `glpi_rackmodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `pictures` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_racks`
--

CREATE TABLE `glpi_racks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `rackmodels_id` int(10) UNSIGNED DEFAULT NULL,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `racktypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `number_units` int(11) DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `dcrooms_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `room_orientation` int(11) NOT NULL DEFAULT 0,
  `position` varchar(50) DEFAULT NULL,
  `bgcolor` varchar(7) DEFAULT NULL,
  `max_power` int(11) NOT NULL DEFAULT 0,
  `mesured_power` int(11) NOT NULL DEFAULT 0,
  `max_weight` int(11) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_racktypes`
--

CREATE TABLE `glpi_racktypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_recurrentchanges`
--

CREATE TABLE `glpi_recurrentchanges` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `changetemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `begin_date` timestamp NULL DEFAULT NULL,
  `periodicity` varchar(255) DEFAULT NULL,
  `create_before` int(11) NOT NULL DEFAULT 0,
  `next_creation_date` timestamp NULL DEFAULT NULL,
  `calendars_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `end_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_refusedequipments`
--

CREATE TABLE `glpi_refusedequipments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `itemtype` varchar(100) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ip` text DEFAULT NULL,
  `mac` text DEFAULT NULL,
  `rules_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `method` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `agents_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `autoupdatesystems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_registeredids`
--

CREATE TABLE `glpi_registeredids` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `device_type` varchar(100) NOT NULL COMMENT 'USB, PCI ...'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_reminders`
--

CREATE TABLE `glpi_reminders` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `begin` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `is_planned` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT 0,
  `begin_view_date` timestamp NULL DEFAULT NULL,
  `end_view_date` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_reminders_users`
--

CREATE TABLE `glpi_reminders_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `reminders_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_remindertranslations`
--

CREATE TABLE `glpi_remindertranslations` (
  `id` int(10) UNSIGNED NOT NULL,
  `reminders_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `language` varchar(5) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `text` longtext DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_requesttypes`
--

CREATE TABLE `glpi_requesttypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_helpdesk_default` tinyint(4) NOT NULL DEFAULT 0,
  `is_followup_default` tinyint(4) NOT NULL DEFAULT 0,
  `is_mail_default` tinyint(4) NOT NULL DEFAULT 0,
  `is_mailfollowup_default` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `is_ticketheader` tinyint(4) NOT NULL DEFAULT 1,
  `is_itilfollowup` tinyint(4) NOT NULL DEFAULT 1,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_requesttypes`
--

INSERT INTO `glpi_requesttypes` (`id`, `name`, `is_helpdesk_default`, `is_followup_default`, `is_mail_default`, `is_mailfollowup_default`, `is_active`, `is_ticketheader`, `is_itilfollowup`, `comment`, `date_mod`, `date_creation`) VALUES
(1, 'Helpdesk', 1, 1, 0, 0, 1, 1, 1, NULL, NULL, NULL),
(2, 'E-Mail', 0, 0, 1, 1, 1, 1, 1, NULL, NULL, NULL),
(3, 'Phone', 0, 0, 0, 0, 1, 1, 1, NULL, NULL, NULL),
(4, 'Direct', 0, 0, 0, 0, 1, 1, 1, NULL, NULL, NULL),
(5, 'Written', 0, 0, 0, 0, 1, 1, 1, NULL, NULL, NULL),
(6, 'Other', 0, 0, 0, 0, 1, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_reservationitems`
--

CREATE TABLE `glpi_reservationitems` (
  `id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(100) NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_reservations`
--

CREATE TABLE `glpi_reservations` (
  `id` int(10) UNSIGNED NOT NULL,
  `reservationitems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `begin` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `group` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_rssfeeds`
--

CREATE TABLE `glpi_rssfeeds` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `refresh_rate` int(11) NOT NULL DEFAULT 86400,
  `max_items` int(11) NOT NULL DEFAULT 20,
  `have_error` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_rssfeeds_users`
--

CREATE TABLE `glpi_rssfeeds_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `rssfeeds_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_ruleactions`
--

CREATE TABLE `glpi_ruleactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `rules_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `action_type` varchar(255) DEFAULT NULL COMMENT 'VALUE IN (assign, regex_result, append_regex_result, affectbyip, affectbyfqdn, affectbymac)',
  `field` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_ruleactions`
--

INSERT INTO `glpi_ruleactions` (`id`, `rules_id`, `action_type`, `field`, `value`) VALUES
(1, 1, 'assign', '_ignore_import', '1'),
(2, 2, 'assign', '_inventory', '0'),
(3, 3, 'assign', '_inventory', '0'),
(4, 4, 'assign', '_inventory', '0'),
(5, 5, 'assign', '_inventory', '0'),
(6, 6, 'assign', '_inventory', '0'),
(7, 7, 'assign', '_inventory', '0'),
(8, 8, 'assign', '_inventory', '0'),
(9, 9, 'assign', '_inventory', '0'),
(10, 10, 'assign', '_ignore_import', '1'),
(11, 11, 'assign', '_inventory', '0'),
(12, 12, 'assign', '_inventory', '0'),
(13, 13, 'assign', '_inventory', '0'),
(14, 14, 'assign', '_inventory', '0'),
(15, 15, 'assign', '_inventory', '0'),
(16, 16, 'assign', '_inventory', '0'),
(17, 17, 'assign', '_inventory', '0'),
(18, 18, 'assign', '_inventory', '0'),
(19, 19, 'assign', '_inventory', '0'),
(20, 20, 'assign', '_inventory', '0'),
(21, 21, 'assign', '_inventory', '0'),
(22, 22, 'assign', '_ignore_import', '1'),
(23, 23, 'assign', '_ignore_import', '1'),
(24, 24, 'assign', '_inventory', '0'),
(25, 25, 'assign', '_inventory', '0'),
(26, 26, 'assign', '_inventory', '0'),
(27, 27, 'assign', '_inventory', '0'),
(28, 28, 'assign', '_ignore_import', '1'),
(29, 29, 'assign', '_ignore_import', '1'),
(30, 30, 'assign', '_inventory', '0'),
(31, 31, 'assign', '_inventory', '0'),
(32, 32, 'assign', '_inventory', '0'),
(33, 33, 'assign', '_inventory', '0'),
(34, 34, 'assign', '_ignore_import', '1'),
(35, 35, 'assign', '_inventory', '0'),
(36, 36, 'assign', '_inventory', '0'),
(37, 37, 'assign', '_ignore_import', '1'),
(38, 38, 'assign', '_inventory', '0'),
(39, 39, 'assign', '_inventory', '0'),
(40, 40, 'assign', '_ignore_import', '1'),
(41, 41, 'assign', '_ignore_import', '1'),
(42, 42, 'assign', '_inventory', '0'),
(43, 43, 'assign', '_inventory', '0'),
(44, 44, 'assign', '_inventory', '0'),
(45, 45, 'assign', '_inventory', '0'),
(46, 46, 'assign', '_inventory', '0'),
(47, 47, 'assign', '_inventory', '0'),
(48, 48, 'assign', '_inventory', '0'),
(49, 49, 'assign', '_inventory', '0'),
(50, 50, 'assign', '_inventory', '0'),
(51, 51, 'assign', '_inventory', '0'),
(52, 52, 'assign', '_inventory', '0'),
(53, 53, 'assign', '_ignore_import', '1'),
(54, 54, 'assign', '_inventory', '0'),
(55, 55, 'assign', '_inventory', '0'),
(56, 56, 'assign', '_ignore_import', '1'),
(57, 57, 'assign', '_inventory', '0'),
(58, 58, 'assign', '_inventory', '0'),
(59, 59, 'assign', '_ignore_import', '1'),
(60, 60, 'assign', '_ignore_import', '1'),
(61, 61, 'assign', '_inventory', '0'),
(62, 62, 'assign', '_inventory', '0'),
(63, 63, 'assign', '_inventory', '0'),
(64, 64, 'assign', '_inventory', '0'),
(65, 65, 'assign', '_ignore_import', '1'),
(66, 66, 'assign', '_inventory', '0'),
(67, 67, 'assign', '_inventory', '0'),
(68, 68, 'assign', '_ignore_import', '1'),
(69, 69, 'assign', '_inventory', '0'),
(70, 70, 'assign', '_inventory', '0'),
(71, 71, 'assign', '_ignore_import', '1'),
(72, 72, 'assign', 'entities_id', '0'),
(73, 73, 'assign', '_refuse_email_no_response', '1'),
(74, 74, 'assign', '_refuse_email_no_response', '1'),
(75, 75, 'assign', 'entities_id', '0'),
(76, 76, 'assign', '_import_category', '1'),
(77, 77, 'fromitem', 'locations_id', '1'),
(78, 78, 'fromuser', 'locations_id', '1'),
(79, 79, 'regex_result', '_affect_user_by_regex', '#0'),
(80, 80, 'regex_result', '_affect_user_by_regex', '#0'),
(81, 81, 'regex_result', '_affect_user_by_regex', '#0'),
(82, 82, 'append_regex_result', 'name', '#0'),
(83, 83, 'append_regex_result', 'name', '#1'),
(84, 84, 'append_regex_result', 'name', '#1 #2'),
(85, 85, 'append_regex_result', 'name', '#1'),
(86, 86, 'append_regex_result', 'name', '#2'),
(87, 87, 'append_regex_result', 'name', '#3'),
(88, 88, 'append_regex_result', 'name', '#2'),
(89, 89, 'append_regex_result', 'name', '#4'),
(90, 90, 'append_regex_result', 'name', '#4');

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_rulecriterias`
--

CREATE TABLE `glpi_rulecriterias` (
  `id` int(10) UNSIGNED NOT NULL,
  `rules_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `criteria` varchar(255) DEFAULT NULL,
  `condition` int(11) NOT NULL DEFAULT 0 COMMENT 'see define.php PATTERN_* and REGEX_* constant',
  `pattern` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_rulecriterias`
--

INSERT INTO `glpi_rulecriterias` (`id`, `rules_id`, `criteria`, `condition`, `pattern`) VALUES
(1, 1, 'partial', 0, '1'),
(2, 1, 'itemtype', 9, '1'),
(3, 2, 'itemtype', 9, '1'),
(4, 2, 'mac', 10, '1'),
(5, 2, 'mac', 8, '1'),
(6, 2, 'ifnumber', 10, '1'),
(7, 2, 'ifnumber', 8, '1'),
(8, 2, 'link_criteria_port', 203, '1'),
(9, 3, 'itemtype', 9, '1'),
(10, 3, 'mac', 10, '1'),
(11, 3, 'mac', 8, '1'),
(12, 3, 'ifnumber', 10, '1'),
(13, 3, 'ifnumber', 8, '1'),
(14, 4, 'itemtype', 9, '1'),
(15, 4, 'mac', 8, '1'),
(16, 4, 'ifnumber', 8, '1'),
(17, 5, 'itemtype', 9, '1'),
(18, 5, 'ip', 10, '1'),
(19, 5, 'ip', 8, '1'),
(20, 5, 'ifdescr', 10, '1'),
(21, 5, 'ifdescr', 8, '1'),
(22, 5, 'link_criteria_port', 203, '1'),
(23, 6, 'itemtype', 9, '1'),
(24, 6, 'ip', 10, '1'),
(25, 6, 'ip', 8, '1'),
(26, 6, 'ifdescr', 10, '1'),
(27, 6, 'ifdescr', 8, '1'),
(28, 7, 'itemtype', 9, '1'),
(29, 7, 'ip', 8, '1'),
(30, 7, 'ifdescr', 8, '1'),
(31, 8, 'itemtype', 9, '1'),
(32, 8, 'mac', 10, '1'),
(33, 8, 'mac', 8, '1'),
(34, 8, 'only_these_criteria', 204, '1'),
(35, 9, 'itemtype', 9, '1'),
(36, 9, 'mac', 8, '1'),
(37, 9, 'only_these_criteria', 204, '1'),
(38, 10, 'itemtype', 0, 'Computer'),
(39, 10, 'name', 9, '1'),
(40, 11, 'itemtype', 0, 'Computer'),
(41, 11, 'serial', 10, '1'),
(42, 11, 'serial', 8, '1'),
(43, 11, 'uuid', 10, '1'),
(44, 11, 'uuid', 8, '1'),
(45, 12, 'itemtype', 0, 'Computer'),
(46, 12, 'serial', 10, '1'),
(47, 12, 'serial', 8, '1'),
(48, 12, 'uuid', 30, '1'),
(49, 13, 'itemtype', 0, 'Computer'),
(50, 13, 'uuid', 8, '1'),
(51, 13, 'serial', 8, '1'),
(52, 14, 'itemtype', 0, 'Computer'),
(53, 14, 'serial', 10, '1'),
(54, 14, 'serial', 8, '1'),
(55, 15, 'itemtype', 0, 'Computer'),
(56, 15, 'uuid', 10, '1'),
(57, 15, 'uuid', 8, '1'),
(58, 16, 'itemtype', 0, 'Computer'),
(59, 16, 'mac', 10, '1'),
(60, 16, 'mac', 8, '1'),
(61, 17, 'itemtype', 0, 'Computer'),
(62, 17, 'name', 10, '1'),
(63, 17, 'name', 8, '1'),
(64, 18, 'itemtype', 0, 'Computer'),
(65, 18, 'serial', 8, '1'),
(66, 19, 'itemtype', 0, 'Computer'),
(67, 19, 'uuid', 8, '1'),
(68, 20, 'itemtype', 0, 'Computer'),
(69, 20, 'mac', 8, '1'),
(70, 21, 'itemtype', 0, 'Computer'),
(71, 21, 'name', 8, '1'),
(72, 22, 'itemtype', 0, 'Computer'),
(73, 23, 'itemtype', 0, 'Printer'),
(74, 23, 'name', 9, '1'),
(75, 24, 'itemtype', 0, 'Printer'),
(76, 24, 'serial', 8, '1'),
(77, 24, 'serial', 10, '1'),
(78, 25, 'itemtype', 0, 'Printer'),
(79, 25, 'mac', 8, '1'),
(80, 25, 'mac', 10, '1'),
(81, 26, 'itemtype', 0, 'Printer'),
(82, 26, 'serial', 8, '1'),
(83, 27, 'itemtype', 0, 'Printer'),
(84, 27, 'mac', 8, '1'),
(85, 28, 'itemtype', 0, 'Printer'),
(86, 29, 'itemtype', 0, 'NetworkEquipment'),
(87, 29, 'name', 9, '1'),
(88, 30, 'itemtype', 0, 'NetworkEquipment'),
(89, 30, 'serial', 8, '1'),
(90, 30, 'serial', 10, '1'),
(91, 31, 'itemtype', 0, 'NetworkEquipment'),
(92, 31, 'mac', 8, '1'),
(93, 31, 'mac', 10, '1'),
(94, 32, 'itemtype', 0, 'NetworkEquipment'),
(95, 32, 'serial', 8, '1'),
(96, 33, 'itemtype', 0, 'NetworkEquipment'),
(97, 33, 'mac', 8, '1'),
(98, 34, 'itemtype', 0, 'NetworkEquipment'),
(99, 35, 'itemtype', 0, 'Peripheral'),
(100, 35, 'serial', 8, '1'),
(101, 35, 'serial', 10, '1'),
(102, 36, 'itemtype', 0, 'Peripheral'),
(103, 36, 'serial', 8, '1'),
(104, 37, 'itemtype', 0, 'Peripheral'),
(105, 38, 'itemtype', 0, 'Monitor'),
(106, 38, 'serial', 8, '1'),
(107, 38, 'serial', 10, '1'),
(108, 39, 'itemtype', 0, 'Monitor'),
(109, 39, 'serial', 8, '1'),
(110, 40, 'itemtype', 0, 'Monitor'),
(111, 41, 'itemtype', 0, 'Phone'),
(112, 41, 'name', 9, '1'),
(113, 42, 'itemtype', 0, 'Phone'),
(114, 42, 'serial', 10, '1'),
(115, 42, 'serial', 8, '1'),
(116, 42, 'uuid', 10, '1'),
(117, 42, 'uuid', 8, '1'),
(118, 43, 'itemtype', 0, 'Phone'),
(119, 43, 'serial', 10, '1'),
(120, 43, 'serial', 8, '1'),
(121, 43, 'uuid', 30, '1'),
(122, 44, 'itemtype', 0, 'Phone'),
(123, 44, 'uuid', 8, '1'),
(124, 44, 'serial', 8, '1'),
(125, 45, 'itemtype', 0, 'Phone'),
(126, 45, 'serial', 10, '1'),
(127, 45, 'serial', 8, '1'),
(128, 46, 'itemtype', 0, 'Phone'),
(129, 46, 'uuid', 10, '1'),
(130, 46, 'uuid', 8, '1'),
(131, 47, 'itemtype', 0, 'Phone'),
(132, 47, 'mac', 10, '1'),
(133, 47, 'mac', 8, '1'),
(134, 48, 'itemtype', 0, 'Phone'),
(135, 48, 'name', 10, '1'),
(136, 48, 'name', 8, '1'),
(137, 49, 'itemtype', 0, 'Phone'),
(138, 49, 'serial', 8, '1'),
(139, 50, 'itemtype', 0, 'Phone'),
(140, 50, 'uuid', 8, '1'),
(141, 51, 'itemtype', 0, 'Phone'),
(142, 51, 'mac', 8, '1'),
(143, 52, 'itemtype', 0, 'Phone'),
(144, 52, 'name', 8, '1'),
(145, 53, 'itemtype', 0, 'Phone'),
(146, 54, 'itemtype', 0, 'Cluster'),
(147, 54, 'uuid', 8, '1'),
(148, 54, 'uuid', 10, '1'),
(149, 55, 'itemtype', 0, 'Cluster'),
(150, 55, 'uuid', 8, '1'),
(151, 56, 'itemtype', 0, 'Cluster'),
(152, 57, 'itemtype', 0, 'Enclosure'),
(153, 57, 'serial', 8, '1'),
(154, 57, 'serial', 10, '1'),
(155, 58, 'itemtype', 0, 'Enclosure'),
(156, 58, 'serial', 8, '1'),
(157, 59, 'itemtype', 0, 'Enclosure'),
(158, 60, 'name', 9, '1'),
(159, 61, 'serial', 8, '1'),
(160, 61, 'serial', 10, '1'),
(161, 62, 'mac', 8, '1'),
(162, 62, 'mac', 10, '1'),
(163, 63, 'serial', 8, '1'),
(164, 64, 'mac', 8, '1'),
(165, 65, 'itemtype', 0, ''),
(166, 66, 'itemtype', 0, 'DatabaseInstance'),
(167, 66, 'name', 8, '1'),
(168, 66, 'name', 10, '1'),
(169, 66, 'linked_item', 10, '1'),
(170, 67, 'itemtype', 0, 'DatabaseInstance'),
(171, 67, 'name', 8, '1'),
(172, 68, 'itemtype', 0, 'DatabaseInstance'),
(173, 69, 'itemtype', 0, 'Unmanaged'),
(174, 69, 'name', 8, '1'),
(175, 69, 'name', 10, '1'),
(176, 70, 'itemtype', 0, 'Unmanaged'),
(177, 70, 'name', 8, '1'),
(178, 71, 'itemtype', 0, 'Unmanaged'),
(179, 72, 'subject', 6, '/.*/'),
(180, 73, 'x-auto-response-suppress', 6, '/\\S+/'),
(181, 74, 'auto-submitted', 6, '/^(?!.*no).+$/i'),
(182, 75, 'TYPE', 0, '3'),
(183, 75, 'TYPE', 0, '2'),
(184, 76, 'name', 0, '*'),
(185, 77, 'locations_id', 9, '1'),
(186, 77, '_locations_id_of_item', 8, '1'),
(187, 78, 'locations_id', 9, '1'),
(188, 78, '_locations_id_of_requester', 8, '1'),
(189, 79, '_itemtype', 0, 'Computer'),
(190, 79, '_auto', 0, '1'),
(191, 79, 'contact', 6, '/(.*)@/'),
(192, 80, '_itemtype', 0, 'Computer'),
(193, 80, '_auto', 0, '1'),
(194, 80, 'contact', 6, '/(.*)[,|\\/]/'),
(195, 81, '_itemtype', 0, 'Computer'),
(196, 81, '_auto', 0, '1'),
(197, 81, 'contact', 6, '/(.*)/'),
(198, 82, 'os_name', 6, '/(SUSE|SunOS|Red Hat|CentOS|Ubuntu|Debian|Fedora|AlmaLinux|Oracle|Amazon Linux)(?:\\D+|)([\\d.]*) ?(?:\\(?([\\w ]+)\\)?)?/'),
(199, 83, 'os_name', 6, '/(Microsoft)(?&#62;\\(R\\)|®)? (Windows) (XP|\\d\\.\\d|\\d{1,4}|Vista)(™)? ?(.*)/'),
(200, 84, 'os_name', 6, '/(Microsoft)(?&#62;\\(R\\)|®)? (?:(Hyper-V|Windows)(?:\\(R\\))?) ((?:Server|))(?:\\(R\\)|®)? (\\d{4}(?: R2)?)(?:[,\\s]++)?([^\\s]*)(?: Edition(?: x64)?)?$/'),
(201, 85, 'os_name', 6, '/(SUSE|SunOS|Red Hat|CentOS|Ubuntu|Debian|Fedora|AlmaLinux|Oracle)(?:\\D+|)([\\d.]+) ?(?:\\(?([\\w ]+)\\)?)?/'),
(202, 86, 'os_name', 6, '/(Microsoft)(?&#62;\\(R\\)|®)? (Windows) (XP|\\d\\.\\d|\\d{1,4}|Vista)(™)? ?(.*)/'),
(203, 87, 'os_name', 6, '/(Microsoft)(?&#62;\\(R\\)|®)? (?:(Hyper-V|Windows)(?:\\(R\\))?) ((?:Server|))(?:\\(R\\)|®)? (\\d{4}(?: R2)?)(?:[,\\s]++)?([^\\s]*)(?: Edition(?: x64)?)?$/'),
(204, 88, 'os_name', 6, '/(SUSE|SunOS|Red Hat|CentOS|Ubuntu|Debian|Fedora|AlmaLinux|Oracle)(?:\\D+|)([\\d.]+) ?(?:\\(?([\\w ]+)\\)?)?/'),
(205, 89, 'os_name', 6, '/(Microsoft)(?&#62;\\(R\\)|®)? (Windows) (XP|\\d\\.\\d|\\d{1,4}|Vista)(™)? ?(.*)/'),
(206, 90, 'os_name', 6, '/(Microsoft)(?&#62;\\(R\\)|®)? (?:(Hyper-V|Windows)(?:\\(R\\))?) ((?:Server|))(?:\\(R\\)|®)? (\\d{4}(?: R2)?)(?:[,\\s]++)?([^\\s]*)(?: Edition(?: x64)?)?$/');

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_rulematchedlogs`
--

CREATE TABLE `glpi_rulematchedlogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) DEFAULT NULL,
  `rules_id` int(10) UNSIGNED DEFAULT NULL,
  `agents_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `method` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_rulerightparameters`
--

CREATE TABLE `glpi_rulerightparameters` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_rulerightparameters`
--

INSERT INTO `glpi_rulerightparameters` (`id`, `name`, `value`, `comment`, `date_mod`, `date_creation`) VALUES
(1, '(LDAP)Organization', 'o', NULL, NULL, NULL),
(2, '(LDAP)Common Name', 'cn', NULL, NULL, NULL),
(3, '(LDAP)Department Number', 'departmentnumber', NULL, NULL, NULL),
(4, '(LDAP)Email', 'mail', NULL, NULL, NULL),
(5, 'Object Class', 'objectclass', NULL, NULL, NULL),
(6, '(LDAP)User ID', 'uid', NULL, NULL, NULL),
(7, '(LDAP)Telephone Number', 'phone', NULL, NULL, NULL),
(8, '(LDAP)Employee Number', 'employeenumber', NULL, NULL, NULL),
(9, '(LDAP)Manager', 'manager', NULL, NULL, NULL),
(10, '(LDAP)DistinguishedName', 'dn', NULL, NULL, NULL),
(12, '(AD)User ID', 'samaccountname', NULL, NULL, NULL),
(13, '(LDAP) Title', 'title', NULL, NULL, NULL),
(14, '(LDAP) MemberOf', 'memberof', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_rules`
--

CREATE TABLE `glpi_rules` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sub_type` varchar(255) NOT NULL DEFAULT '',
  `ranking` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `match` char(10) DEFAULT NULL COMMENT 'see define.php *_MATCHING constant',
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `uuid` varchar(255) DEFAULT NULL,
  `condition` int(11) NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_rules`
--

INSERT INTO `glpi_rules` (`id`, `entities_id`, `sub_type`, `ranking`, `name`, `description`, `match`, `is_active`, `comment`, `date_mod`, `is_recursive`, `uuid`, `condition`, `date_creation`) VALUES
(1, 0, 'RuleImportAsset', 1, 'No creation on partial import', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_no_creation_on_partial_import', 0, '2026-03-01 14:17:02'),
(2, 0, 'RuleImportAsset', 2, 'Global update (by mac+ifnumber restricted port)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_global_update_mac_ifnumber_restricted_port', 0, '2026-03-01 14:17:02'),
(3, 0, 'RuleImportAsset', 3, 'Global update (by mac+ifnumber not restricted port)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_global_update_mac_ifnumber_no_restricted_port', 0, '2026-03-01 14:17:02'),
(4, 0, 'RuleImportAsset', 4, 'Global import (by mac+ifnumber)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_global_import_mac_ifnumber', 0, '2026-03-01 14:17:02'),
(5, 0, 'RuleImportAsset', 5, 'Global update (by ip+ifdescr restricted port)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_global_update_mac_ifdescr_restricted_port', 0, '2026-03-01 14:17:02'),
(6, 0, 'RuleImportAsset', 6, 'Global update (by ip+ifdescr not restricted port)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_global_update_ip_ifdescr_no_restricted_port', 0, '2026-03-01 14:17:02'),
(7, 0, 'RuleImportAsset', 7, 'Global import (by ip+ifdescr)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_global_import_ip_ifdescr', 0, '2026-03-01 14:17:02'),
(8, 0, 'RuleImportAsset', 8, 'Update only mac address (mac on switch port)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_update_only_mac_adress', 0, '2026-03-01 14:17:02'),
(9, 0, 'RuleImportAsset', 9, 'Import only mac address (mac on switch port)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_import_only_mac_adress', 0, '2026-03-01 14:17:02'),
(10, 0, 'RuleImportAsset', 10, 'Computer constraint (name)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_computer_constraint_name', 0, '2026-03-01 14:17:02'),
(11, 0, 'RuleImportAsset', 11, 'Computer update (by serial + uuid)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_computer_update_serial_uuid', 0, '2026-03-01 14:17:02'),
(12, 0, 'RuleImportAsset', 12, 'Computer update (by serial + uuid is empty in GLPI)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_computer_update_serial_uuid_empty', 0, '2026-03-01 14:17:02'),
(13, 0, 'RuleImportAsset', 13, 'Computer import (by serial + uuid)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_computer_import_serial_uuid', 0, '2026-03-01 14:17:02'),
(14, 0, 'RuleImportAsset', 14, 'Computer update (by serial)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_computer_update_serial', 0, '2026-03-01 14:17:02'),
(15, 0, 'RuleImportAsset', 15, 'Computer update (by uuid)', '', 'AND', 0, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_computer_update_uuid', 0, '2026-03-01 14:17:02'),
(16, 0, 'RuleImportAsset', 16, 'Computer update (by mac)', '', 'AND', 0, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_computer_update_mac', 0, '2026-03-01 14:17:02'),
(17, 0, 'RuleImportAsset', 17, 'Computer update (by name)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_computer_update_name', 0, '2026-03-01 14:17:02'),
(18, 0, 'RuleImportAsset', 18, 'Computer import (by serial)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_computer_import_serial', 0, '2026-03-01 14:17:02'),
(19, 0, 'RuleImportAsset', 19, 'Computer import (by uuid)', '', 'AND', 0, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_computer_import_uuid', 0, '2026-03-01 14:17:02'),
(20, 0, 'RuleImportAsset', 20, 'Computer import (by mac)', '', 'AND', 0, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_computer_import_mac', 0, '2026-03-01 14:17:02'),
(21, 0, 'RuleImportAsset', 21, 'Computer import (by name)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_computer_import_name', 0, '2026-03-01 14:17:02'),
(22, 0, 'RuleImportAsset', 22, 'Computer import denied', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_computer_import_denied', 0, '2026-03-01 14:17:02'),
(23, 0, 'RuleImportAsset', 23, 'Printer constraint (name)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_printer_constraint_name', 0, '2026-03-01 14:17:02'),
(24, 0, 'RuleImportAsset', 24, 'Printer update (by serial)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_printer_update_serial', 0, '2026-03-01 14:17:02'),
(25, 0, 'RuleImportAsset', 25, 'Printer update (by mac)', '', 'AND', 0, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_printer_update_mac', 0, '2026-03-01 14:17:02'),
(26, 0, 'RuleImportAsset', 26, 'Printer import (by serial)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_printer_import_serial', 0, '2026-03-01 14:17:02'),
(27, 0, 'RuleImportAsset', 27, 'Printer import (by mac)', '', 'AND', 0, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_printer_import_mac', 0, '2026-03-01 14:17:02'),
(28, 0, 'RuleImportAsset', 28, 'Printer import denied', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_printer_import_denied', 0, '2026-03-01 14:17:02'),
(29, 0, 'RuleImportAsset', 29, 'NetworkEquipment constraint (name)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_networkequipment_constraint_name', 0, '2026-03-01 14:17:02'),
(30, 0, 'RuleImportAsset', 30, 'NetworkEquipment update (by serial)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_networkequipment_update_serial', 0, '2026-03-01 14:17:02'),
(31, 0, 'RuleImportAsset', 31, 'NetworkEquipment update (by mac)', '', 'AND', 0, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_networkequipment_update_mac', 0, '2026-03-01 14:17:02'),
(32, 0, 'RuleImportAsset', 32, 'NetworkEquipment import (by serial)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_networkequipment_import_serial', 0, '2026-03-01 14:17:02'),
(33, 0, 'RuleImportAsset', 33, 'NetworkEquipment import (by mac)', '', 'AND', 0, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_networkequipment_import_mac', 0, '2026-03-01 14:17:02'),
(34, 0, 'RuleImportAsset', 34, 'NetworkEquipment import denied', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_networkequipment_import_denied', 0, '2026-03-01 14:17:02'),
(35, 0, 'RuleImportAsset', 35, 'Device update (by serial)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_device_update_serial', 0, '2026-03-01 14:17:02'),
(36, 0, 'RuleImportAsset', 36, 'Device import (by serial)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_device_importe_serial', 0, '2026-03-01 14:17:02'),
(37, 0, 'RuleImportAsset', 37, 'Device import denied', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_device_import_denied', 0, '2026-03-01 14:17:02'),
(38, 0, 'RuleImportAsset', 38, 'Monitor update (by serial)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_monitor_update_serial', 0, '2026-03-01 14:17:02'),
(39, 0, 'RuleImportAsset', 39, 'Monitor import (by serial)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_monitor_import_serial', 0, '2026-03-01 14:17:02'),
(40, 0, 'RuleImportAsset', 40, 'Monitor import denied', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_monitor_import_denied', 0, '2026-03-01 14:17:02'),
(41, 0, 'RuleImportAsset', 41, 'Phone constraint (name)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_phone_constraint_name', 0, '2026-03-01 14:17:02'),
(42, 0, 'RuleImportAsset', 42, 'Phone update (by serial + uuid)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_phone_update_serial_uuid', 0, '2026-03-01 14:17:02'),
(43, 0, 'RuleImportAsset', 43, 'Phone update (by serial + uuid is empty in GLPI)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_phone_update_serial_uuid_empty', 0, '2026-03-01 14:17:02'),
(44, 0, 'RuleImportAsset', 44, 'Phone import (by serial + uuid)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_phone_import_serial_uuid', 0, '2026-03-01 14:17:02'),
(45, 0, 'RuleImportAsset', 45, 'Phone update (by serial)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_phone_update_serial', 0, '2026-03-01 14:17:02'),
(46, 0, 'RuleImportAsset', 46, 'Phone update (by uuid)', '', 'AND', 0, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_phone_update_uuid', 0, '2026-03-01 14:17:02'),
(47, 0, 'RuleImportAsset', 47, 'Phone update (by mac)', '', 'AND', 0, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_phone_update_mac', 0, '2026-03-01 14:17:02'),
(48, 0, 'RuleImportAsset', 48, 'Phone update (by name)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_phone_update_name', 0, '2026-03-01 14:17:02'),
(49, 0, 'RuleImportAsset', 49, 'Phone import (by serial)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_phone_import_serial', 0, '2026-03-01 14:17:02'),
(50, 0, 'RuleImportAsset', 50, 'Phone import (by uuid)', '', 'AND', 0, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_phone_import_uuid', 0, '2026-03-01 14:17:02'),
(51, 0, 'RuleImportAsset', 51, 'Phone import (by mac)', '', 'AND', 0, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_phone_import_mac', 0, '2026-03-01 14:17:02'),
(52, 0, 'RuleImportAsset', 52, 'Phone import (by name)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_phone_import_name', 0, '2026-03-01 14:17:02'),
(53, 0, 'RuleImportAsset', 53, 'Phone import denied', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_phone_import_denied', 0, '2026-03-01 14:17:02'),
(54, 0, 'RuleImportAsset', 54, 'Cluster update (by uuid)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_cluster_update_uuid', 0, '2026-03-01 14:17:02'),
(55, 0, 'RuleImportAsset', 55, 'Cluster import (by uuid)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_cluster_import_uuid', 0, '2026-03-01 14:17:02'),
(56, 0, 'RuleImportAsset', 56, 'Cluster import denied', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_cluster_import_denied', 0, '2026-03-01 14:17:02'),
(57, 0, 'RuleImportAsset', 57, 'Enclosure update (by serial)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_enclosure_update_serial', 0, '2026-03-01 14:17:02'),
(58, 0, 'RuleImportAsset', 58, 'Enclosure import (by serial)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_enclosure_import_serial', 0, '2026-03-01 14:17:02'),
(59, 0, 'RuleImportAsset', 59, 'Enclosure import denied', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_enclosure_import_denied', 0, '2026-03-01 14:17:02'),
(60, 0, 'RuleImportAsset', 60, 'Global constraint (name)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_global_constraint_name', 0, '2026-03-01 14:17:02'),
(61, 0, 'RuleImportAsset', 61, 'Global update (by serial)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_global_update_serial', 0, '2026-03-01 14:17:02'),
(62, 0, 'RuleImportAsset', 62, 'Global update (by mac)', '', 'AND', 0, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_global_update_mac', 0, '2026-03-01 14:17:02'),
(63, 0, 'RuleImportAsset', 63, 'Global import (by serial)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_global_import_serial', 0, '2026-03-01 14:17:02'),
(64, 0, 'RuleImportAsset', 64, 'Global import (by mac)', '', 'AND', 0, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_global_import_mac', 0, '2026-03-01 14:17:02'),
(65, 0, 'RuleImportAsset', 65, 'Global import denied', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_global_import_denied', 0, '2026-03-01 14:17:02'),
(66, 0, 'RuleImportAsset', 66, 'Database update (by name)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_database_update_name', 0, '2026-03-01 14:17:02'),
(67, 0, 'RuleImportAsset', 67, 'Database import (by name)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_database_import_name', 0, '2026-03-01 14:17:02'),
(68, 0, 'RuleImportAsset', 68, 'Database import denied', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_database_import_denied', 0, '2026-03-01 14:17:02'),
(69, 0, 'RuleImportAsset', 69, 'Unmanaged update (by name)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_unmanaged_update_name', 0, '2026-03-01 14:17:02'),
(70, 0, 'RuleImportAsset', 70, 'Unmanaged import (by name)', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_unmanaged_import_name', 0, '2026-03-01 14:17:02'),
(71, 0, 'RuleImportAsset', 71, 'Unmanaged import denied', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_import_asset_unmanaged_import_denied', 0, '2026-03-01 14:17:02'),
(72, 0, 'RuleMailCollector', 3, 'Root', '', 'OR', 1, '', '2026-03-01 14:17:02', 0, 'glpi_rule_mail_collector_root', 0, '2026-03-01 14:17:02'),
(73, 0, 'RuleMailCollector', 1, 'X-Auto-Response-Suppress', 'Exclude Auto-Reply emails using X-Auto-Response-Suppress header', 'AND', 0, '', '2026-03-01 14:17:02', 1, 'glpi_rule_mail_collector_x_auto_response_suppress', 0, '2026-03-01 14:17:02'),
(74, 0, 'RuleMailCollector', 2, 'Auto-Reply Auto-Submitted', 'Exclude Auto-Reply emails using Auto-Submitted header', 'OR', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_mail_collector_auto_reply_auto_submitted', 0, '2026-03-01 14:17:02'),
(75, 0, 'RuleRight', 1, 'Root', '', 'OR', 1, '', '2026-03-01 14:17:02', 0, 'glpi_rule_right_root', 0, '2026-03-01 14:17:02'),
(76, 0, 'RuleSoftwareCategory', 1, 'Import category from inventory tool', '', 'AND', 0, '', '2026-03-01 14:17:02', 1, 'glpi_rule_rule_software_category_import_category_from_inventory_tool', 1, '2026-03-01 14:17:02'),
(77, 0, 'RuleTicket', 1, 'Ticket location from item', '', 'AND', 0, '', '2026-03-01 14:17:02', 1, 'glpi_rule_rule_ticket_location_from_item', 1, '2026-03-01 14:17:02'),
(78, 0, 'RuleTicket', 2, 'Ticket location from user', '', 'AND', 0, '', '2026-03-01 14:17:02', 1, 'glpi_rule_rule_ticket_location_from_user', 1, '2026-03-01 14:17:02'),
(79, 0, 'RuleAsset', 1, 'Domain user assignation', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_rule_asset_domain_user_assignation', 3, '2026-03-01 14:17:02'),
(80, 0, 'RuleAsset', 2, 'Multiple users: assign to the first', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_rule_asset_multiple_user_assign_to_first', 3, '2026-03-01 14:17:02'),
(81, 0, 'RuleAsset', 3, 'One user assignation', '', 'AND', 1, '', '2026-03-01 14:17:02', 1, 'glpi_rule_rule_asset_one_user_assignation', 3, '2026-03-01 14:17:02'),
(82, 0, 'RuleDictionnaryOperatingSystem', 1, 'Clean Linux OS Name', '', 'AND', 0, '/(SUSE|SunOS|Red Hat|CentOS|Ubuntu|Debian|Fedora|AlmaLinux|Oracle|Amazon Linux)(?:\\D+|)([\\d.]*) ?(?:\\(?([\\w ]+)\\)?)?/\n\n            Example :\n            Ubuntu 22.04.1 LTS -&#62; #0 = Ubuntu\n            SUSE Linux Enterprise Server 11 (x86_64)  -&#62;#0 = SUSE\n            SunOS -&#62; #0 = SunOS\n            Red Hat Enterprise Linux Server release 7.9 (Maipo) -&#62; #0 = Red Hat\n            Oracle Linux Server release 7.3 -&#62; #0 = Oracle\n            Fedora release 36 (Thirty Six) -&#62; #0 = Fedora\n            Debian GNU/Linux 9.5 (stretch) -&#62; #0 = Debian\n            CentOS Stream release 8 -&#62; #0 = CentOS\n            AlmaLinux 9.0 (Emerald Puma) -&#62; #0 = AlmaLinux\n            Amazon Linux 2023 -&#62; #0 = Amazon Linux', '2026-03-01 14:17:02', 1, 'clean_linux_os_name', 0, '2026-03-01 14:17:02'),
(83, 0, 'RuleDictionnaryOperatingSystem', 2, 'Clean Windows OS Name', '', 'AND', 0, '/(Microsoft)(?&#62;\\(R\\)|®)? (Windows) (XP|\\d\\.\\d|\\d{1,4}|Vista)(™)? ?(.*)/\n\n            Example :\n            Microsoft Windows XP Professionnel -&#62; #1 : Windows\n            Microsoft Windows 7 Enterprise  -&#62; #1 : Windows\n            Microsoft® Windows Vista Professionnel  -&#62; #1 : Windows\n            Microsoft Windows XP Édition familiale  -&#62; #1 : Windows\n            Microsoft Windows 10 Entreprise  -&#62; #1 : Windows\n            Microsoft Windows 10 Professionnel  -&#62; #1 : Windows\n            Microsoft Windows 11 Professionnel  -&#62; #1 : Windows', '2026-03-01 14:17:02', 1, 'clean_windows_os_name', 0, '2026-03-01 14:17:02'),
(84, 0, 'RuleDictionnaryOperatingSystem', 3, 'Clean Windows Server OS Name', '', 'AND', 0, '/(Microsoft)(?&#62;\\(R\\)|®)? (?:(Hyper-V|Windows)(?:\\(R\\))?) ((?:Server|))(?:\\(R\\)|®)? (\\d{4}(?: R2)?)(?:[,\\s]++)?([^\\s]*)(?: Edition(?: x64)?)?$/\n\n            Example :\n            Microsoft Windows Server 2012 R2 Datacenter -&#62; #1 #2 : Windows Server\n            Microsoft(R) Windows(R) Server 2003, Standard Edition x64 -&#62; #1 #2 : Windows Server\n            Microsoft Hyper-V Server 2012 R2 -&#62; #1 #2 : Hyper-V Server\n            Microsoft® Windows Server® 2008 Standard -&#62; #1 #2 : Windows Server', '2026-03-01 14:17:02', 1, 'clean_windows_server_os_name', 0, '2026-03-01 14:17:02'),
(85, 0, 'RuleDictionnaryOperatingSystemVersion', 1, 'Clean Linux OS Version', '', 'AND', 0, '/(SUSE|SunOS|Red Hat|CentOS|Ubuntu|Debian|Fedora|AlmaLinux|Oracle)(?:\\D+|)([\\d.]+) ?(?:\\(?([\\w ]+)\\)?)?/\n\n            Example :\n            Ubuntu 22.04.1 LTS -&#62; #1 = 22.04.1\n            SUSE Linux Enterprise Server 11 (x86_64) -&#62; #1 =  11\n            SunOS 5.10 -&#62; #1 = 5.10\n            Red Hat Enterprise Linux Server release 7.9 (Maipo) -&#62; #1 = 7.9\n            Oracle Linux Server release 7.3 -&#62; #1 = 7.3\n            Fedora release 36 (Thirty Six) -&#62; #1 =  36\n            Debian GNU/Linux 9.5 (stretch) -&#62; #1 = 9.5\n            CentOS release 6.9 (Final) -&#62; #1 = 6.9\n            AlmaLinux 9.0 (Emerald Puma) -&#62; #1 = 9.0', '2026-03-01 14:17:02', 1, 'clean_linux_os_version', 0, '2026-03-01 14:17:02'),
(86, 0, 'RuleDictionnaryOperatingSystemVersion', 2, 'Clean Windows OS Version', '', 'AND', 0, '/(Microsoft)(?&#62;\\(R\\)|®)? (Windows) (XP|\\d\\.\\d|\\d{1,4}|Vista)(™)? ?(.*)/\n\n            Example :\n            Microsoft Windows XP Professionnel -&#62; #2 : XP\n            Microsoft Windows 7 Enterprise  -&#62; #2 : 7\n            Microsoft® Windows Vista Professionnel  -&#62; #2 : Vista\n            Microsoft Windows XP Édition familiale  -&#62; #2 : XP\n            Microsoft Windows 10 Entreprise  -&#62; #2 : 10\n            Microsoft Windows 10 Professionnel  -&#62; #2 : 10\n            Microsoft Windows 11 Professionnel  -&#62; #2 : 11', '2026-03-01 14:17:02', 1, 'clean_windows_os_version', 0, '2026-03-01 14:17:02'),
(87, 0, 'RuleDictionnaryOperatingSystemVersion', 3, 'Clean Windows Server OS Version', '', 'AND', 0, '/(Microsoft)(?&#62;\\(R\\)|®)? (?:(Hyper-V|Windows)(?:\\(R\\))?) ((?:Server|))(?:\\(R\\)|®)? (\\d{4}(?: R2)?)(?:[,\\s]++)?([^\\s]*)(?: Edition(?: x64)?)?$/\n\n            Example :\n            Microsoft Windows Server 2012 R2 Datacenter -&#62; #3 : 2012 R2\n            Microsoft(R) Windows(R) Server 2003, Standard Edition x64 -&#62; #3 : 2003\n            Microsoft Hyper-V Server 2012 R2 -&#62; #3 : 2012 R2\n            Microsoft® Windows Server® 2008 Standard -&#62; #3 : 2008', '2026-03-01 14:17:02', 1, 'clean_windows_server_os_version', 0, '2026-03-01 14:17:02'),
(88, 0, 'RuleDictionnaryOperatingSystemEdition', 1, 'Clean Linux OS Edition', '', 'AND', 0, '/(SUSE|SunOS|Red Hat|CentOS|Ubuntu|Debian|Fedora|AlmaLinux|Oracle)(?:\\D+|)([\\d.]+) ?(?:\\(?([\\w ]+)\\)?)?/\n\n        Example :\n        Ubuntu 22.04.1 LTS -&#62; #2 = LTS\n        SUSE Linux Enterprise Server 11 (x86_64) -&#62; #2 = x86_64\n        Red Hat Enterprise Linux Server release 7.9 (Maipo) -&#62; #2 = Maipo\n        Red Hat Enterprise Linux Server release 6.10 (Santiago) -&#62; #2 = Santiago\n        Fedora release 36 (Thirty Six) -&#62; #2 = Thirty Six\n        Debian GNU/Linux 9.5 (stretch) -&#62; #2 = stretch\n        Debian GNU/Linux 8.9 (jessie) -&#62; #2 = jessie\n        CentOS Linux release 7.2.1511 (Core) -&#62; #2 = Core\n        AlmaLinux 9.0 (Emerald Puma) -&#62; #2 = Emerald Puma\n        AlmaLinux 8.6 (Sky Tiger) -&#62; #2 = Sky Tiger', '2026-03-01 14:17:02', 1, 'clean_linux_os_edition', 0, '2026-03-01 14:17:02'),
(89, 0, 'RuleDictionnaryOperatingSystemEdition', 2, 'Clean Windows OS Edition', '', 'AND', 0, '/(Microsoft)(?&#62;\\(R\\)|®)? (Windows) (XP|\\d\\.\\d|\\d{1,4}|Vista)(™)? ?(.*)/\n\n        Example :\n        Microsoft Windows XP Professionnel -&#62; #4 : Professionnel\n        Microsoft Windows 7 Enterprise  -&#62; #4 : Enterprise\n        Microsoft® Windows Vista Professionnel  -&#62; #4 : Professionnel\n        Microsoft Windows XP Édition familiale  -&#62; #4 : Édition familiale\n        Microsoft Windows 10 Entreprise  -&#62; #4 : Entreprise\n        Microsoft Windows 10 Professionnel  -&#62; #4 : Professionnel\n        Microsoft Windows 11 Professionnel  -&#62; #4 : Professionnel', '2026-03-01 14:17:02', 1, 'clean_windows_os_edition', 0, '2026-03-01 14:17:02'),
(90, 0, 'RuleDictionnaryOperatingSystemEdition', 3, 'Clean Windows Server OS Edition', '', 'AND', 0, '/(Microsoft)(?&#62;\\(R\\)|®)? (?:(Hyper-V|Windows)(?:\\(R\\))?) ((?:Server|))(?:\\(R\\)|®)? (\\d{4}(?: R2)?)(?:[,\\s]++)?([^\\s]*)(?: Edition(?: x64)?)?$/\n\n        Example :\n        Microsoft Windows Server 2012 R2 Datacenter -&#62; #4 : Datacenter\n        Microsoft(R) Windows(R) Server 2003, Standard Edition x64 -&#62; #4 : Standard\n        Microsoft Hyper-V Server 2012 R2 -&#62; #4 :\n        Microsoft® Windows Server® 2008 Standard -&#62; #4: Standard', '2026-03-01 14:17:02', 1, 'clean_windows_server_os_edition', 0, '2026-03-01 14:17:02');

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_savedsearches`
--

CREATE TABLE `glpi_savedsearches` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT 0 COMMENT 'see SavedSearch:: constants',
  `itemtype` varchar(100) NOT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_private` tinyint(4) NOT NULL DEFAULT 1,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `query` text DEFAULT NULL,
  `last_execution_time` int(11) DEFAULT NULL,
  `do_count` tinyint(4) NOT NULL DEFAULT 2 COMMENT 'Do or do not count results on list display see SavedSearch::COUNT_* constants',
  `last_execution_date` timestamp NULL DEFAULT NULL,
  `counter` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_savedsearches_alerts`
--

CREATE TABLE `glpi_savedsearches_alerts` (
  `id` int(10) UNSIGNED NOT NULL,
  `savedsearches_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `operator` tinyint(4) NOT NULL,
  `value` int(11) NOT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `frequency` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_savedsearches_users`
--

CREATE TABLE `glpi_savedsearches_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `savedsearches_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_slalevelactions`
--

CREATE TABLE `glpi_slalevelactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `slalevels_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `action_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_slalevelcriterias`
--

CREATE TABLE `glpi_slalevelcriterias` (
  `id` int(10) UNSIGNED NOT NULL,
  `slalevels_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `criteria` varchar(255) DEFAULT NULL,
  `condition` int(11) NOT NULL DEFAULT 0 COMMENT 'see define.php PATTERN_* and REGEX_* constant',
  `pattern` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_slalevels`
--

CREATE TABLE `glpi_slalevels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slas_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `execution_time` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `match` char(10) DEFAULT NULL COMMENT 'see define.php *_MATCHING constant',
  `uuid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_slalevels_tickets`
--

CREATE TABLE `glpi_slalevels_tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `tickets_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `slalevels_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_slas`
--

CREATE TABLE `glpi_slas` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `number_time` int(11) NOT NULL,
  `use_ticket_calendar` tinyint(4) NOT NULL DEFAULT 0,
  `calendars_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `definition_time` varchar(255) DEFAULT NULL,
  `end_of_working_day` tinyint(4) NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `slms_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_slms`
--

CREATE TABLE `glpi_slms` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `use_ticket_calendar` tinyint(4) NOT NULL DEFAULT 0,
  `calendars_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_snmpcredentials`
--

CREATE TABLE `glpi_snmpcredentials` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `snmpversion` varchar(8) NOT NULL DEFAULT '1',
  `community` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `authentication` varchar(255) DEFAULT NULL,
  `auth_passphrase` varchar(255) DEFAULT NULL,
  `encryption` varchar(255) DEFAULT NULL,
  `priv_passphrase` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_snmpcredentials`
--

INSERT INTO `glpi_snmpcredentials` (`id`, `name`, `snmpversion`, `community`, `username`, `authentication`, `auth_passphrase`, `encryption`, `priv_passphrase`, `is_deleted`) VALUES
(1, 'Public community v1', '1', 'public', NULL, NULL, NULL, NULL, NULL, 0),
(2, 'Public community v2c', '2', 'public', NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_socketmodels`
--

CREATE TABLE `glpi_socketmodels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_sockets`
--

CREATE TABLE `glpi_sockets` (
  `id` int(10) UNSIGNED NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `socketmodels_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `wiring_side` tinyint(4) DEFAULT 1,
  `itemtype` varchar(255) DEFAULT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `networkports_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_softwarecategories`
--

CREATE TABLE `glpi_softwarecategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `softwarecategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `completename` text DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `ancestors_cache` longtext DEFAULT NULL,
  `sons_cache` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_softwarecategories`
--

INSERT INTO `glpi_softwarecategories` (`id`, `name`, `comment`, `softwarecategories_id`, `completename`, `level`, `ancestors_cache`, `sons_cache`) VALUES
(1, 'Inventoried', NULL, 0, 'Software from inventories', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_softwarelicenses`
--

CREATE TABLE `glpi_softwarelicenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `softwares_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `softwarelicenses_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `completename` text DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `ancestors_cache` longtext DEFAULT NULL,
  `sons_cache` longtext DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `number` int(11) NOT NULL DEFAULT 0,
  `softwarelicensetypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `softwareversions_id_buy` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `softwareversions_id_use` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `expire` date DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `is_valid` tinyint(4) NOT NULL DEFAULT 1,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_helpdesk_visible` tinyint(4) NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `allow_overquota` tinyint(4) NOT NULL DEFAULT 0,
  `pictures` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_softwarelicensetypes`
--

CREATE TABLE `glpi_softwarelicensetypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `softwarelicensetypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 0,
  `ancestors_cache` longtext DEFAULT NULL,
  `sons_cache` longtext DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `completename` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_softwarelicensetypes`
--

INSERT INTO `glpi_softwarelicensetypes` (`id`, `name`, `comment`, `date_mod`, `date_creation`, `softwarelicensetypes_id`, `level`, `ancestors_cache`, `sons_cache`, `entities_id`, `is_recursive`, `completename`) VALUES
(1, 'OEM', NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 1, 'OEM');

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_softwares`
--

CREATE TABLE `glpi_softwares` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_update` tinyint(4) NOT NULL DEFAULT 0,
  `softwares_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ticket_tco` decimal(20,4) DEFAULT 0.0000,
  `is_helpdesk_visible` tinyint(4) NOT NULL DEFAULT 1,
  `softwarecategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_valid` tinyint(4) NOT NULL DEFAULT 1,
  `date_creation` timestamp NULL DEFAULT NULL,
  `pictures` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_softwareversions`
--

CREATE TABLE `glpi_softwareversions` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `softwares_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `arch` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `operatingsystems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_solutiontemplates`
--

CREATE TABLE `glpi_solutiontemplates` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `content` mediumtext DEFAULT NULL,
  `solutiontypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_solutiontypes`
--

CREATE TABLE `glpi_solutiontypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 1,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_ssovariables`
--

CREATE TABLE `glpi_ssovariables` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_ssovariables`
--

INSERT INTO `glpi_ssovariables` (`id`, `name`, `comment`, `date_mod`, `date_creation`) VALUES
(1, 'HTTP_AUTH_USER', NULL, NULL, NULL),
(2, 'REMOTE_USER', NULL, NULL, NULL),
(3, 'PHP_AUTH_USER', NULL, NULL, NULL),
(4, 'USERNAME', NULL, NULL, NULL),
(5, 'REDIRECT_REMOTE_USER', NULL, NULL, NULL),
(6, 'HTTP_REMOTE_USER', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_states`
--

CREATE TABLE `glpi_states` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `completename` text DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `ancestors_cache` longtext DEFAULT NULL,
  `sons_cache` longtext DEFAULT NULL,
  `is_visible_computer` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_monitor` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_networkequipment` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_peripheral` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_phone` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_printer` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_softwareversion` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_softwarelicense` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_line` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_certificate` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_rack` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_passivedcequipment` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_enclosure` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_pdu` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_cluster` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_contract` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_appliance` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_databaseinstance` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_cable` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_unmanaged` tinyint(4) NOT NULL DEFAULT 1,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_suppliers`
--

CREATE TABLE `glpi_suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `suppliertypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `registration_number` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `fax` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `pictures` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_suppliers_tickets`
--

CREATE TABLE `glpi_suppliers_tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `tickets_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `suppliers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1,
  `use_notification` tinyint(4) NOT NULL DEFAULT 1,
  `alternative_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_suppliertypes`
--

CREATE TABLE `glpi_suppliertypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_taskcategories`
--

CREATE TABLE `glpi_taskcategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `taskcategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `completename` text DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `ancestors_cache` longtext DEFAULT NULL,
  `sons_cache` longtext DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `is_helpdeskvisible` tinyint(4) NOT NULL DEFAULT 1,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `knowbaseitemcategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_tasktemplates`
--

CREATE TABLE `glpi_tasktemplates` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `content` mediumtext DEFAULT NULL,
  `taskcategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `actiontime` int(11) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT 0,
  `is_private` tinyint(4) NOT NULL DEFAULT 0,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_ticketcosts`
--

CREATE TABLE `glpi_ticketcosts` (
  `id` int(10) UNSIGNED NOT NULL,
  `tickets_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `actiontime` int(11) NOT NULL DEFAULT 0,
  `cost_time` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `cost_fixed` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `cost_material` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `budgets_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_ticketrecurrents`
--

CREATE TABLE `glpi_ticketrecurrents` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `tickettemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `begin_date` timestamp NULL DEFAULT NULL,
  `periodicity` varchar(255) DEFAULT NULL,
  `create_before` int(11) NOT NULL DEFAULT 0,
  `next_creation_date` timestamp NULL DEFAULT NULL,
  `calendars_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `end_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_tickets`
--

CREATE TABLE `glpi_tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `closedate` timestamp NULL DEFAULT NULL,
  `solvedate` timestamp NULL DEFAULT NULL,
  `takeintoaccountdate` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `users_id_lastupdater` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `users_id_recipient` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `requesttypes_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `content` longtext DEFAULT NULL,
  `urgency` int(11) NOT NULL DEFAULT 1,
  `impact` int(11) NOT NULL DEFAULT 1,
  `priority` int(11) NOT NULL DEFAULT 1,
  `itilcategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1,
  `global_validation` int(11) NOT NULL DEFAULT 1,
  `slas_id_ttr` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `slas_id_tto` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `slalevels_id_ttr` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `time_to_resolve` timestamp NULL DEFAULT NULL,
  `time_to_own` timestamp NULL DEFAULT NULL,
  `begin_waiting_date` timestamp NULL DEFAULT NULL,
  `sla_waiting_duration` int(11) NOT NULL DEFAULT 0,
  `ola_waiting_duration` int(11) NOT NULL DEFAULT 0,
  `olas_id_tto` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `olas_id_ttr` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `olalevels_id_ttr` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ola_tto_begin_date` timestamp NULL DEFAULT NULL,
  `ola_ttr_begin_date` timestamp NULL DEFAULT NULL,
  `internal_time_to_resolve` timestamp NULL DEFAULT NULL,
  `internal_time_to_own` timestamp NULL DEFAULT NULL,
  `waiting_duration` int(11) NOT NULL DEFAULT 0,
  `close_delay_stat` int(11) NOT NULL DEFAULT 0,
  `solve_delay_stat` int(11) NOT NULL DEFAULT 0,
  `takeintoaccount_delay_stat` int(11) NOT NULL DEFAULT 0,
  `actiontime` int(11) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `validation_percent` int(11) NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_tickets`
--

INSERT INTO `glpi_tickets` (`id`, `entities_id`, `name`, `date`, `closedate`, `solvedate`, `takeintoaccountdate`, `date_mod`, `users_id_lastupdater`, `status`, `users_id_recipient`, `requesttypes_id`, `content`, `urgency`, `impact`, `priority`, `itilcategories_id`, `type`, `global_validation`, `slas_id_ttr`, `slas_id_tto`, `slalevels_id_ttr`, `time_to_resolve`, `time_to_own`, `begin_waiting_date`, `sla_waiting_duration`, `ola_waiting_duration`, `olas_id_tto`, `olas_id_ttr`, `olalevels_id_ttr`, `ola_tto_begin_date`, `ola_ttr_begin_date`, `internal_time_to_resolve`, `internal_time_to_own`, `waiting_duration`, `close_delay_stat`, `solve_delay_stat`, `takeintoaccount_delay_stat`, `actiontime`, `is_deleted`, `locations_id`, `validation_percent`, `date_creation`) VALUES
(1, 0, 'Localização do documento número xpto', '2026-03-31 10:18:57', NULL, '2026-03-31 10:38:08', '2026-03-31 10:23:50', '2026-03-31 10:38:08', 2, 5, 9, 1, '&#60;p&#62;Prezado,&#60;/p&#62;\n&#60;p&#62;Bom dia&#60;/p&#62;\n&#60;p&#62; &#60;/p&#62;', 3, 3, 3, 2, 2, 1, 0, 0, 0, NULL, NULL, '2026-03-31 10:38:08', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 1151, 293, 0, 0, 0, 0, '2026-03-31 10:21:32'),
(2, 0, 'Tre', '2026-03-31 11:50:58', NULL, '2026-03-31 12:06:32', '2026-03-31 12:00:22', '2026-03-31 12:06:32', 2, 5, 8, 1, '&#60;p&#62;Xtop vb&#60;/p&#62;', 3, 3, 3, 1, 1, 1, 0, 0, 0, NULL, NULL, '2026-03-31 12:06:32', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 934, 564, 0, 0, 0, 0, '2026-03-31 11:54:40');

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_ticketsatisfactions`
--

CREATE TABLE `glpi_ticketsatisfactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `tickets_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1,
  `date_begin` timestamp NULL DEFAULT NULL,
  `date_answered` timestamp NULL DEFAULT NULL,
  `satisfaction` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_tickets_contracts`
--

CREATE TABLE `glpi_tickets_contracts` (
  `id` int(10) UNSIGNED NOT NULL,
  `tickets_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `contracts_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_tickets_tickets`
--

CREATE TABLE `glpi_tickets_tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `tickets_id_1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tickets_id_2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `link` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_tickets_users`
--

CREATE TABLE `glpi_tickets_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `tickets_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1,
  `use_notification` tinyint(4) NOT NULL DEFAULT 1,
  `alternative_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_tickets_users`
--

INSERT INTO `glpi_tickets_users` (`id`, `tickets_id`, `users_id`, `type`, `use_notification`, `alternative_email`) VALUES
(1, 1, 9, 1, 1, ''),
(2, 1, 2, 3, 0, ''),
(3, 1, 2, 2, 1, ''),
(4, 2, 8, 1, 1, ''),
(5, 2, 7, 3, 0, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_tickettasks`
--

CREATE TABLE `glpi_tickettasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `tickets_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `taskcategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date` timestamp NULL DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_editor` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `content` longtext DEFAULT NULL,
  `is_private` tinyint(4) NOT NULL DEFAULT 0,
  `actiontime` int(11) NOT NULL DEFAULT 0,
  `begin` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT 1,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `tasktemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `timeline_position` tinyint(4) NOT NULL DEFAULT 0,
  `sourceitems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sourceof_items_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_tickettemplatehiddenfields`
--

CREATE TABLE `glpi_tickettemplatehiddenfields` (
  `id` int(10) UNSIGNED NOT NULL,
  `tickettemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `num` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_tickettemplatemandatoryfields`
--

CREATE TABLE `glpi_tickettemplatemandatoryfields` (
  `id` int(10) UNSIGNED NOT NULL,
  `tickettemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `num` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_tickettemplatemandatoryfields`
--

INSERT INTO `glpi_tickettemplatemandatoryfields` (`id`, `tickettemplates_id`, `num`) VALUES
(6, 1, -2),
(4, 1, 3),
(3, 1, 10),
(2, 1, 12),
(5, 1, 15),
(1, 1, 21),
(7, 1, 142);

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_tickettemplatepredefinedfields`
--

CREATE TABLE `glpi_tickettemplatepredefinedfields` (
  `id` int(10) UNSIGNED NOT NULL,
  `tickettemplates_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `num` int(11) NOT NULL DEFAULT 0,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_tickettemplatepredefinedfields`
--

INSERT INTO `glpi_tickettemplatepredefinedfields` (`id`, `tickettemplates_id`, `num`, `value`) VALUES
(1, 1, 12, '1'),
(2, 1, 10, '2'),
(3, 1, 3, '2'),
(4, 1, 15, 'NOW');

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_tickettemplates`
--

CREATE TABLE `glpi_tickettemplates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_tickettemplates`
--

INSERT INTO `glpi_tickettemplates` (`id`, `name`, `entities_id`, `is_recursive`, `comment`) VALUES
(1, 'Default', 0, 1, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_ticketvalidations`
--

CREATE TABLE `glpi_ticketvalidations` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tickets_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_validate` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment_submission` text DEFAULT NULL,
  `comment_validation` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 2,
  `submission_date` timestamp NULL DEFAULT NULL,
  `validation_date` timestamp NULL DEFAULT NULL,
  `timeline_position` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_transfers`
--

CREATE TABLE `glpi_transfers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `keep_ticket` int(11) NOT NULL DEFAULT 0,
  `keep_networklink` int(11) NOT NULL DEFAULT 0,
  `keep_reservation` int(11) NOT NULL DEFAULT 0,
  `keep_history` int(11) NOT NULL DEFAULT 0,
  `keep_device` int(11) NOT NULL DEFAULT 0,
  `keep_infocom` int(11) NOT NULL DEFAULT 0,
  `keep_dc_monitor` int(11) NOT NULL DEFAULT 0,
  `clean_dc_monitor` int(11) NOT NULL DEFAULT 0,
  `keep_dc_phone` int(11) NOT NULL DEFAULT 0,
  `clean_dc_phone` int(11) NOT NULL DEFAULT 0,
  `keep_dc_peripheral` int(11) NOT NULL DEFAULT 0,
  `clean_dc_peripheral` int(11) NOT NULL DEFAULT 0,
  `keep_dc_printer` int(11) NOT NULL DEFAULT 0,
  `clean_dc_printer` int(11) NOT NULL DEFAULT 0,
  `keep_supplier` int(11) NOT NULL DEFAULT 0,
  `clean_supplier` int(11) NOT NULL DEFAULT 0,
  `keep_contact` int(11) NOT NULL DEFAULT 0,
  `clean_contact` int(11) NOT NULL DEFAULT 0,
  `keep_contract` int(11) NOT NULL DEFAULT 0,
  `clean_contract` int(11) NOT NULL DEFAULT 0,
  `keep_software` int(11) NOT NULL DEFAULT 0,
  `clean_software` int(11) NOT NULL DEFAULT 0,
  `keep_document` int(11) NOT NULL DEFAULT 0,
  `clean_document` int(11) NOT NULL DEFAULT 0,
  `keep_cartridgeitem` int(11) NOT NULL DEFAULT 0,
  `clean_cartridgeitem` int(11) NOT NULL DEFAULT 0,
  `keep_cartridge` int(11) NOT NULL DEFAULT 0,
  `keep_consumable` int(11) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `keep_disk` int(11) NOT NULL DEFAULT 0,
  `keep_certificate` int(11) NOT NULL DEFAULT 0,
  `clean_certificate` int(11) NOT NULL DEFAULT 0,
  `lock_updated_fields` int(11) NOT NULL DEFAULT 0,
  `keep_location` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_transfers`
--

INSERT INTO `glpi_transfers` (`id`, `name`, `keep_ticket`, `keep_networklink`, `keep_reservation`, `keep_history`, `keep_device`, `keep_infocom`, `keep_dc_monitor`, `clean_dc_monitor`, `keep_dc_phone`, `clean_dc_phone`, `keep_dc_peripheral`, `clean_dc_peripheral`, `keep_dc_printer`, `clean_dc_printer`, `keep_supplier`, `clean_supplier`, `keep_contact`, `clean_contact`, `keep_contract`, `clean_contract`, `keep_software`, `clean_software`, `keep_document`, `clean_document`, `keep_cartridgeitem`, `clean_cartridgeitem`, `keep_cartridge`, `keep_consumable`, `date_mod`, `date_creation`, `comment`, `keep_disk`, `keep_certificate`, `clean_certificate`, `lock_updated_fields`, `keep_location`) VALUES
(1, 'complete', 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, 1, 1, 0, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_unmanageds`
--

CREATE TABLE `glpi_unmanageds` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `networks_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `manufacturers_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `states_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `autoupdatesystems_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sysdescr` text DEFAULT NULL,
  `agents_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemtype` varchar(100) DEFAULT NULL,
  `accepted` tinyint(4) NOT NULL DEFAULT 0,
  `hub` tinyint(4) NOT NULL DEFAULT 0,
  `ip` varchar(255) DEFAULT NULL,
  `snmpcredentials_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_inventory_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_usbvendors`
--

CREATE TABLE `glpi_usbvendors` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `vendorid` varchar(4) NOT NULL,
  `deviceid` varchar(4) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_usercategories`
--

CREATE TABLE `glpi_usercategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_useremails`
--

CREATE TABLE `glpi_useremails` (
  `id` int(10) UNSIGNED NOT NULL,
  `users_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_users`
--

CREATE TABLE `glpi_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `password_last_update` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `phone2` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `locations_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `language` char(10) DEFAULT NULL COMMENT 'see define.php CFG_GLPI[language] array',
  `use_mode` int(11) NOT NULL DEFAULT 0,
  `list_limit` int(11) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `comment` text DEFAULT NULL,
  `auths_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `authtype` int(11) NOT NULL DEFAULT 0,
  `last_login` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_sync` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `profiles_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entities_id` int(10) UNSIGNED DEFAULT 0,
  `usertitles_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `usercategories_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_format` int(11) DEFAULT NULL,
  `number_format` int(11) DEFAULT NULL,
  `names_format` int(11) DEFAULT NULL,
  `csv_delimiter` char(1) DEFAULT NULL,
  `is_ids_visible` tinyint(4) DEFAULT NULL,
  `use_flat_dropdowntree` tinyint(4) DEFAULT NULL,
  `use_flat_dropdowntree_on_search_result` tinyint(4) DEFAULT NULL,
  `show_jobs_at_login` tinyint(4) DEFAULT NULL,
  `priority_1` char(20) DEFAULT NULL,
  `priority_2` char(20) DEFAULT NULL,
  `priority_3` char(20) DEFAULT NULL,
  `priority_4` char(20) DEFAULT NULL,
  `priority_5` char(20) DEFAULT NULL,
  `priority_6` char(20) DEFAULT NULL,
  `followup_private` tinyint(4) DEFAULT NULL,
  `task_private` tinyint(4) DEFAULT NULL,
  `default_requesttypes_id` int(10) UNSIGNED DEFAULT NULL,
  `password_forget_token` char(40) DEFAULT NULL,
  `password_forget_token_date` timestamp NULL DEFAULT NULL,
  `user_dn` text DEFAULT NULL,
  `user_dn_hash` varchar(32) DEFAULT NULL,
  `registration_number` varchar(255) DEFAULT NULL,
  `show_count_on_tabs` tinyint(4) DEFAULT NULL,
  `refresh_views` int(11) DEFAULT NULL,
  `set_default_tech` tinyint(4) DEFAULT NULL,
  `personal_token` varchar(255) DEFAULT NULL,
  `personal_token_date` timestamp NULL DEFAULT NULL,
  `api_token` varchar(255) DEFAULT NULL,
  `api_token_date` timestamp NULL DEFAULT NULL,
  `cookie_token` varchar(255) DEFAULT NULL,
  `cookie_token_date` timestamp NULL DEFAULT NULL,
  `display_count_on_home` int(11) DEFAULT NULL,
  `notification_to_myself` tinyint(4) DEFAULT NULL,
  `duedateok_color` varchar(255) DEFAULT NULL,
  `duedatewarning_color` varchar(255) DEFAULT NULL,
  `duedatecritical_color` varchar(255) DEFAULT NULL,
  `duedatewarning_less` int(11) DEFAULT NULL,
  `duedatecritical_less` int(11) DEFAULT NULL,
  `duedatewarning_unit` varchar(255) DEFAULT NULL,
  `duedatecritical_unit` varchar(255) DEFAULT NULL,
  `display_options` text DEFAULT NULL,
  `is_deleted_ldap` tinyint(4) NOT NULL DEFAULT 0,
  `pdffont` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `begin_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `keep_devices_when_purging_item` tinyint(4) DEFAULT NULL,
  `privatebookmarkorder` longtext DEFAULT NULL,
  `backcreated` tinyint(4) DEFAULT NULL,
  `task_state` int(11) DEFAULT NULL,
  `palette` char(20) DEFAULT NULL,
  `page_layout` char(20) DEFAULT NULL,
  `fold_menu` tinyint(4) DEFAULT NULL,
  `fold_search` tinyint(4) DEFAULT NULL,
  `savedsearches_pinned` text DEFAULT NULL,
  `timeline_order` char(20) DEFAULT NULL,
  `itil_layout` text DEFAULT NULL,
  `richtext_layout` char(20) DEFAULT NULL,
  `set_default_requester` tinyint(4) DEFAULT NULL,
  `lock_autolock_mode` tinyint(4) DEFAULT NULL,
  `lock_directunlock_notification` tinyint(4) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `highcontrast_css` tinyint(4) DEFAULT 0,
  `plannings` text DEFAULT NULL,
  `sync_field` varchar(255) DEFAULT NULL,
  `groups_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `users_id_supervisor` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `timezone` varchar(50) DEFAULT NULL,
  `default_dashboard_central` varchar(100) DEFAULT NULL,
  `default_dashboard_assets` varchar(100) DEFAULT NULL,
  `default_dashboard_helpdesk` varchar(100) DEFAULT NULL,
  `default_dashboard_mini_ticket` varchar(100) DEFAULT NULL,
  `default_central_tab` tinyint(4) DEFAULT 0,
  `nickname` varchar(255) DEFAULT NULL,
  `timeline_action_btn_layout` tinyint(4) DEFAULT NULL,
  `timeline_date_format` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `glpi_users`
--

INSERT INTO `glpi_users` (`id`, `name`, `password`, `password_last_update`, `phone`, `phone2`, `mobile`, `realname`, `firstname`, `locations_id`, `language`, `use_mode`, `list_limit`, `is_active`, `comment`, `auths_id`, `authtype`, `last_login`, `date_mod`, `date_sync`, `is_deleted`, `profiles_id`, `entities_id`, `usertitles_id`, `usercategories_id`, `date_format`, `number_format`, `names_format`, `csv_delimiter`, `is_ids_visible`, `use_flat_dropdowntree`, `use_flat_dropdowntree_on_search_result`, `show_jobs_at_login`, `priority_1`, `priority_2`, `priority_3`, `priority_4`, `priority_5`, `priority_6`, `followup_private`, `task_private`, `default_requesttypes_id`, `password_forget_token`, `password_forget_token_date`, `user_dn`, `user_dn_hash`, `registration_number`, `show_count_on_tabs`, `refresh_views`, `set_default_tech`, `personal_token`, `personal_token_date`, `api_token`, `api_token_date`, `cookie_token`, `cookie_token_date`, `display_count_on_home`, `notification_to_myself`, `duedateok_color`, `duedatewarning_color`, `duedatecritical_color`, `duedatewarning_less`, `duedatecritical_less`, `duedatewarning_unit`, `duedatecritical_unit`, `display_options`, `is_deleted_ldap`, `pdffont`, `picture`, `begin_date`, `end_date`, `keep_devices_when_purging_item`, `privatebookmarkorder`, `backcreated`, `task_state`, `palette`, `page_layout`, `fold_menu`, `fold_search`, `savedsearches_pinned`, `timeline_order`, `itil_layout`, `richtext_layout`, `set_default_requester`, `lock_autolock_mode`, `lock_directunlock_notification`, `date_creation`, `highcontrast_css`, `plannings`, `sync_field`, `groups_id`, `users_id_supervisor`, `timezone`, `default_dashboard_central`, `default_dashboard_assets`, `default_dashboard_helpdesk`, `default_dashboard_mini_ticket`, `default_central_tab`, `nickname`, `timeline_action_btn_layout`, `timeline_date_format`) VALUES
(2, 'incv', '$2y$10$lgJ/pv9tNvGAvBfEnUjhGujb/degZrVEMEAnJ2UzCCVkOeHGBrehS', '2026-03-01 21:17:35', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 20, 1, NULL, 0, 1, '2026-05-06 12:11:06', '2026-05-06 13:09:15', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JEeFyOSwzw97Z8QCYiRqy3mRbfaOW3e2SqI8si8R', '2026-05-06 13:09:15', NULL, NULL, '$2y$10$F/dadnwoa/Zm62v.uPTrhO3A.VVdohQLC3953vLq1WpuKTtpFDE5i', '2026-05-06 12:11:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '72/2_69a4acef0b072.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"collapsed\":\"false\",\"expanded\":\"false\",\"items\":{\"item-main\":\"true\",\"actors\":\"true\",\"items\":\"true\",\"service-levels\":\"false\",\"linked_tickets\":\"true\"}}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'teste', '$2y$10$YCsnVjP/guP0V2ixkPoXGeOY2iH2QkkaLvFMCQ9SWgaI/XmHb8vVq', '2026-05-06 12:15:31', NULL, NULL, NULL, 'teste', 'teste', 0, NULL, 0, 20, 1, NULL, 0, 1, '2026-05-06 12:15:52', '2026-05-06 12:16:03', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$9ijqYh1nUMk6oTnSUlzmTegaVykIsX7gAMtt0avdhJVo3y7UNN1vm', '2026-05-06 12:15:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'tech', '$2y$10$/qmpUd4JzY4MoJYrJn8UNeGd87YzXi5lKEeYRrmG6Vax7sXmIQXLW', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'en_GB', 0, 20, 0, NULL, 0, 1, NULL, '2026-03-01 14:23:13', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(5, 'normal', '$2y$10$iqlVqYtYME4WjoAcbUIuSeIth13G.ojsBP.cVI3WLYkQUCEiPh.m2', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'en_GB', 0, 20, 0, NULL, 0, 1, NULL, '2026-03-01 14:22:16', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(6, 'glpi-system', '', NULL, NULL, NULL, NULL, 'Support', NULL, 0, NULL, 0, NULL, 1, NULL, 0, 1, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(7, 'CCV ', '$2y$10$u6idYAeWdYZKCjt2rKHkf.9SwPiG604C3lGuN0g9nrbW2yEMLX4hy', '2026-03-31 10:30:57', '', '', '', 'Correios de Cabo Verde', 'ccv', 0, NULL, 0, NULL, 1, '', 0, 1, '2026-03-31 11:49:17', '2026-03-31 11:49:18', NULL, 0, 9, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$tOwHai88dgekCImxjgNAJOafMUSJHSsKvX9a/KI80FAIXAwqf2xlO', '2026-03-31 11:49:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'db/7_69a982661e4db.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-05 13:14:11', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'DEF ', '$2y$10$3iyyYC79imFsdTrqzo2ZvuR/PPEZLdYUX8SYw2izifEx7dyY6xrF.', '2026-03-31 10:42:20', '', '', '', 'Direcção de Estrangeiros e Fronteiras', 'def', 0, NULL, 0, NULL, 1, '', 0, 1, '2026-03-31 12:10:49', '2026-03-31 12:10:49', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$cAQyPq40njbTuBOl3ILXTOqZR/r3.2T1uifByjzMAlF4Q4OnpIfBe', '2026-03-31 12:10:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"collapsed\":\"false\",\"expanded\":\"false\",\"items\":{\"item-main\":\"false\",\"actors\":\"false\",\"service-levels\":\"true\",\"linked_tickets\":\"false\"}}', NULL, NULL, NULL, NULL, '2026-03-05 13:18:47', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'Manuel Garcia ', '$2y$10$rA2vd3W3FdqOH/Xbjc3QSeIjD5cYwA3OmUD8gDpKaqefts/akk6e2', '2026-03-31 06:25:48', '', '', '', 'INCV', '', 0, NULL, 0, NULL, 1, '', 0, 1, '2026-03-31 10:18:32', '2026-03-31 10:39:37', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$o6RGamwFsGFjFBcYSYjwBO44ZdHq1/vcKG52xNXi9Wggc7O.m1Tgq', '2026-03-31 10:18:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-05 13:22:46', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'IMIJ - Instituto de Inovação e Modernização da Justiça', NULL, NULL, '', '', '', '', '', 0, NULL, 0, NULL, 1, '', 0, 1, NULL, '2026-03-05 13:24:10', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-05 13:24:10', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(11, 'Nosi - Núcleo Operacional de Sociedade de Informação', NULL, NULL, '', '', '', '', '', 0, NULL, 0, NULL, 1, '', 0, 1, NULL, '2026-03-05 13:25:36', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-05 13:25:36', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(12, 'SINIAC', NULL, NULL, '', '', '', '', '', 0, NULL, 0, NULL, 1, '', 0, 1, NULL, '2026-03-05 13:26:13', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-05 13:26:13', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_usertitles`
--

CREATE TABLE `glpi_usertitles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_virtualmachinestates`
--

CREATE TABLE `glpi_virtualmachinestates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_virtualmachinesystems`
--

CREATE TABLE `glpi_virtualmachinesystems` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_virtualmachinetypes`
--

CREATE TABLE `glpi_virtualmachinetypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_vlans`
--

CREATE TABLE `glpi_vlans` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `tag` int(11) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_vobjects`
--

CREATE TABLE `glpi_vobjects` (
  `id` int(10) UNSIGNED NOT NULL,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `glpi_wifinetworks`
--

CREATE TABLE `glpi_wifinetworks` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `essid` varchar(255) DEFAULT NULL,
  `mode` varchar(255) DEFAULT NULL COMMENT 'ad-hoc, access_point',
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `glpi_agents`
--
ALTER TABLE `glpi_agents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `deviceid` (`deviceid`),
  ADD KEY `name` (`name`),
  ADD KEY `agenttypes_id` (`agenttypes_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `item` (`itemtype`,`items_id`);

--
-- Índices para tabela `glpi_agenttypes`
--
ALTER TABLE `glpi_agenttypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Índices para tabela `glpi_alerts`
--
ALTER TABLE `glpi_alerts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`itemtype`,`items_id`,`type`),
  ADD KEY `type` (`type`),
  ADD KEY `date` (`date`);

--
-- Índices para tabela `glpi_apiclients`
--
ALTER TABLE `glpi_apiclients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Índices para tabela `glpi_applianceenvironments`
--
ALTER TABLE `glpi_applianceenvironments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Índices para tabela `glpi_appliances`
--
ALTER TABLE `glpi_appliances`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`externalidentifier`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `name` (`name`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `appliancetypes_id` (`appliancetypes_id`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `applianceenvironments_id` (`applianceenvironments_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `serial` (`serial`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `is_helpdesk_visible` (`is_helpdesk_visible`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_appliances_items`
--
ALTER TABLE `glpi_appliances_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`appliances_id`,`items_id`,`itemtype`),
  ADD KEY `item` (`itemtype`,`items_id`);

--
-- Índices para tabela `glpi_appliances_items_relations`
--
ALTER TABLE `glpi_appliances_items_relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appliances_items_id` (`appliances_items_id`),
  ADD KEY `item` (`itemtype`,`items_id`);

--
-- Índices para tabela `glpi_appliancetypes`
--
ALTER TABLE `glpi_appliancetypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `externalidentifier` (`externalidentifier`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Índices para tabela `glpi_authldapreplicates`
--
ALTER TABLE `glpi_authldapreplicates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `authldaps_id` (`authldaps_id`);

--
-- Índices para tabela `glpi_authldaps`
--
ALTER TABLE `glpi_authldaps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `is_default` (`is_default`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `sync_field` (`sync_field`);

--
-- Índices para tabela `glpi_authmails`
--
ALTER TABLE `glpi_authmails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `is_active` (`is_active`);

--
-- Índices para tabela `glpi_autoupdatesystems`
--
ALTER TABLE `glpi_autoupdatesystems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Índices para tabela `glpi_blacklistedmailcontents`
--
ALTER TABLE `glpi_blacklistedmailcontents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_blacklists`
--
ALTER TABLE `glpi_blacklists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_budgets`
--
ALTER TABLE `glpi_budgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `begin_date` (`begin_date`),
  ADD KEY `end_date` (`end_date`),
  ADD KEY `is_template` (`is_template`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `budgettypes_id` (`budgettypes_id`);

--
-- Índices para tabela `glpi_budgettypes`
--
ALTER TABLE `glpi_budgettypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_businesscriticities`
--
ALTER TABLE `glpi_businesscriticities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`businesscriticities_id`,`name`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `level` (`level`);

--
-- Índices para tabela `glpi_cables`
--
ALTER TABLE `glpi_cables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `item_endpoint_a` (`itemtype_endpoint_a`,`items_id_endpoint_a`),
  ADD KEY `item_endpoint_b` (`itemtype_endpoint_b`,`items_id_endpoint_b`),
  ADD KEY `items_id_endpoint_b` (`items_id_endpoint_b`),
  ADD KEY `items_id_endpoint_a` (`items_id_endpoint_a`),
  ADD KEY `socketmodels_id_endpoint_a` (`socketmodels_id_endpoint_a`),
  ADD KEY `socketmodels_id_endpoint_b` (`socketmodels_id_endpoint_b`),
  ADD KEY `sockets_id_endpoint_a` (`sockets_id_endpoint_a`),
  ADD KEY `sockets_id_endpoint_b` (`sockets_id_endpoint_b`),
  ADD KEY `cablestrands_id` (`cablestrands_id`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `complete` (`entities_id`,`name`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `cabletypes_id` (`cabletypes_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `is_deleted` (`is_deleted`);

--
-- Índices para tabela `glpi_cablestrands`
--
ALTER TABLE `glpi_cablestrands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_cabletypes`
--
ALTER TABLE `glpi_cabletypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_calendars`
--
ALTER TABLE `glpi_calendars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_calendarsegments`
--
ALTER TABLE `glpi_calendarsegments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `calendars_id` (`calendars_id`),
  ADD KEY `day` (`day`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Índices para tabela `glpi_calendars_holidays`
--
ALTER TABLE `glpi_calendars_holidays`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`calendars_id`,`holidays_id`),
  ADD KEY `holidays_id` (`holidays_id`);

--
-- Índices para tabela `glpi_cartridgeitems`
--
ALTER TABLE `glpi_cartridgeitems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `cartridgeitemtypes_id` (`cartridgeitemtypes_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `alarm_threshold` (`alarm_threshold`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_cartridgeitems_printermodels`
--
ALTER TABLE `glpi_cartridgeitems_printermodels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`printermodels_id`,`cartridgeitems_id`),
  ADD KEY `cartridgeitems_id` (`cartridgeitems_id`);

--
-- Índices para tabela `glpi_cartridgeitemtypes`
--
ALTER TABLE `glpi_cartridgeitemtypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_cartridges`
--
ALTER TABLE `glpi_cartridges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cartridgeitems_id` (`cartridgeitems_id`),
  ADD KEY `printers_id` (`printers_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_certificates`
--
ALTER TABLE `glpi_certificates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `is_template` (`is_template`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `certificatetypes_id` (`certificatetypes_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Índices para tabela `glpi_certificates_items`
--
ALTER TABLE `glpi_certificates_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`certificates_id`,`itemtype`,`items_id`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Índices para tabela `glpi_certificatetypes`
--
ALTER TABLE `glpi_certificatetypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `name` (`name`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Índices para tabela `glpi_changecosts`
--
ALTER TABLE `glpi_changecosts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `changes_id` (`changes_id`),
  ADD KEY `begin_date` (`begin_date`),
  ADD KEY `end_date` (`end_date`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `budgets_id` (`budgets_id`);

--
-- Índices para tabela `glpi_changes`
--
ALTER TABLE `glpi_changes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `date` (`date`),
  ADD KEY `closedate` (`closedate`),
  ADD KEY `status` (`status`),
  ADD KEY `priority` (`priority`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `itilcategories_id` (`itilcategories_id`),
  ADD KEY `users_id_recipient` (`users_id_recipient`),
  ADD KEY `solvedate` (`solvedate`),
  ADD KEY `urgency` (`urgency`),
  ADD KEY `impact` (`impact`),
  ADD KEY `time_to_resolve` (`time_to_resolve`),
  ADD KEY `global_validation` (`global_validation`),
  ADD KEY `users_id_lastupdater` (`users_id_lastupdater`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `locations_id` (`locations_id`);

--
-- Índices para tabela `glpi_changes_groups`
--
ALTER TABLE `glpi_changes_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`changes_id`,`type`,`groups_id`),
  ADD KEY `group` (`groups_id`,`type`);

--
-- Índices para tabela `glpi_changes_items`
--
ALTER TABLE `glpi_changes_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`changes_id`,`itemtype`,`items_id`),
  ADD KEY `item` (`itemtype`,`items_id`);

--
-- Índices para tabela `glpi_changes_problems`
--
ALTER TABLE `glpi_changes_problems`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`changes_id`,`problems_id`),
  ADD KEY `problems_id` (`problems_id`);

--
-- Índices para tabela `glpi_changes_suppliers`
--
ALTER TABLE `glpi_changes_suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`changes_id`,`type`,`suppliers_id`),
  ADD KEY `group` (`suppliers_id`,`type`);

--
-- Índices para tabela `glpi_changes_tickets`
--
ALTER TABLE `glpi_changes_tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`changes_id`,`tickets_id`),
  ADD KEY `tickets_id` (`tickets_id`);

--
-- Índices para tabela `glpi_changes_users`
--
ALTER TABLE `glpi_changes_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`changes_id`,`type`,`users_id`,`alternative_email`),
  ADD KEY `user` (`users_id`,`type`);

--
-- Índices para tabela `glpi_changetasks`
--
ALTER TABLE `glpi_changetasks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `changes_id` (`changes_id`),
  ADD KEY `state` (`state`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `users_id_editor` (`users_id_editor`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `date` (`date`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `begin` (`begin`),
  ADD KEY `end` (`end`),
  ADD KEY `taskcategories_id` (`taskcategories_id`),
  ADD KEY `tasktemplates_id` (`tasktemplates_id`),
  ADD KEY `is_private` (`is_private`);

--
-- Índices para tabela `glpi_changetemplatehiddenfields`
--
ALTER TABLE `glpi_changetemplatehiddenfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`changetemplates_id`,`num`);

--
-- Índices para tabela `glpi_changetemplatemandatoryfields`
--
ALTER TABLE `glpi_changetemplatemandatoryfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`changetemplates_id`,`num`);

--
-- Índices para tabela `glpi_changetemplatepredefinedfields`
--
ALTER TABLE `glpi_changetemplatepredefinedfields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `changetemplates_id` (`changetemplates_id`);

--
-- Índices para tabela `glpi_changetemplates`
--
ALTER TABLE `glpi_changetemplates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Índices para tabela `glpi_changevalidations`
--
ALTER TABLE `glpi_changevalidations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `users_id_validate` (`users_id_validate`),
  ADD KEY `changes_id` (`changes_id`),
  ADD KEY `submission_date` (`submission_date`),
  ADD KEY `validation_date` (`validation_date`),
  ADD KEY `status` (`status`);

--
-- Índices para tabela `glpi_clusters`
--
ALTER TABLE `glpi_clusters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `group_id_tech` (`groups_id_tech`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `clustertypes_id` (`clustertypes_id`),
  ADD KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Índices para tabela `glpi_clustertypes`
--
ALTER TABLE `glpi_clustertypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Índices para tabela `glpi_computerantiviruses`
--
ALTER TABLE `glpi_computerantiviruses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `antivirus_version` (`antivirus_version`),
  ADD KEY `signature_version` (`signature_version`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `is_uptodate` (`is_uptodate`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `computers_id` (`computers_id`),
  ADD KEY `date_expiration` (`date_expiration`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`);

--
-- Índices para tabela `glpi_computermodels`
--
ALTER TABLE `glpi_computermodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `product_number` (`product_number`);

--
-- Índices para tabela `glpi_computers`
--
ALTER TABLE `glpi_computers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `name` (`name`),
  ADD KEY `is_template` (`is_template`),
  ADD KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `computermodels_id` (`computermodels_id`),
  ADD KEY `networks_id` (`networks_id`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `computertypes_id` (`computertypes_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `serial` (`serial`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `uuid` (`uuid`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Índices para tabela `glpi_computers_items`
--
ALTER TABLE `glpi_computers_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `computers_id` (`computers_id`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`);

--
-- Índices para tabela `glpi_computertypes`
--
ALTER TABLE `glpi_computertypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_computervirtualmachines`
--
ALTER TABLE `glpi_computervirtualmachines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `computers_id` (`computers_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `name` (`name`),
  ADD KEY `virtualmachinestates_id` (`virtualmachinestates_id`),
  ADD KEY `virtualmachinesystems_id` (`virtualmachinesystems_id`),
  ADD KEY `vcpu` (`vcpu`),
  ADD KEY `ram` (`ram`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `uuid` (`uuid`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `virtualmachinetypes_id` (`virtualmachinetypes_id`);

--
-- Índices para tabela `glpi_configs`
--
ALTER TABLE `glpi_configs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`context`,`name`),
  ADD KEY `name` (`name`);

--
-- Índices para tabela `glpi_consumableitems`
--
ALTER TABLE `glpi_consumableitems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `consumableitemtypes_id` (`consumableitemtypes_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `alarm_threshold` (`alarm_threshold`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `otherserial` (`otherserial`);

--
-- Índices para tabela `glpi_consumableitemtypes`
--
ALTER TABLE `glpi_consumableitemtypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_consumables`
--
ALTER TABLE `glpi_consumables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date_in` (`date_in`),
  ADD KEY `date_out` (`date_out`),
  ADD KEY `consumableitems_id` (`consumableitems_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_contacts`
--
ALTER TABLE `glpi_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `contacttypes_id` (`contacttypes_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `usertitles_id` (`usertitles_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_contacts_suppliers`
--
ALTER TABLE `glpi_contacts_suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`suppliers_id`,`contacts_id`),
  ADD KEY `contacts_id` (`contacts_id`);

--
-- Índices para tabela `glpi_contacttypes`
--
ALTER TABLE `glpi_contacttypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_contractcosts`
--
ALTER TABLE `glpi_contractcosts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `contracts_id` (`contracts_id`),
  ADD KEY `begin_date` (`begin_date`),
  ADD KEY `end_date` (`end_date`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `budgets_id` (`budgets_id`);

--
-- Índices para tabela `glpi_contracts`
--
ALTER TABLE `glpi_contracts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `begin_date` (`begin_date`),
  ADD KEY `name` (`name`),
  ADD KEY `contracttypes_id` (`contracttypes_id`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_template` (`is_template`),
  ADD KEY `use_sunday` (`use_sunday`),
  ADD KEY `use_saturday` (`use_saturday`),
  ADD KEY `alert` (`alert`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_contracts_items`
--
ALTER TABLE `glpi_contracts_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`contracts_id`,`itemtype`,`items_id`),
  ADD KEY `item` (`itemtype`,`items_id`);

--
-- Índices para tabela `glpi_contracts_suppliers`
--
ALTER TABLE `glpi_contracts_suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`suppliers_id`,`contracts_id`),
  ADD KEY `contracts_id` (`contracts_id`);

--
-- Índices para tabela `glpi_contracttypes`
--
ALTER TABLE `glpi_contracttypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_crontasklogs`
--
ALTER TABLE `glpi_crontasklogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date` (`date`),
  ADD KEY `crontasks_id` (`crontasks_id`),
  ADD KEY `crontasklogs_id_state` (`crontasklogs_id`,`state`);

--
-- Índices para tabela `glpi_crontasks`
--
ALTER TABLE `glpi_crontasks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`itemtype`,`name`),
  ADD KEY `name` (`name`),
  ADD KEY `mode` (`mode`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_dashboards_dashboards`
--
ALTER TABLE `glpi_dashboards_dashboards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `name` (`name`),
  ADD KEY `users_id` (`users_id`);

--
-- Índices para tabela `glpi_dashboards_filters`
--
ALTER TABLE `glpi_dashboards_filters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboards_dashboards_id` (`dashboards_dashboards_id`),
  ADD KEY `users_id` (`users_id`);

--
-- Índices para tabela `glpi_dashboards_items`
--
ALTER TABLE `glpi_dashboards_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboards_dashboards_id` (`dashboards_dashboards_id`);

--
-- Índices para tabela `glpi_dashboards_rights`
--
ALTER TABLE `glpi_dashboards_rights`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`dashboards_dashboards_id`,`itemtype`,`items_id`),
  ADD KEY `item` (`itemtype`,`items_id`);

--
-- Índices para tabela `glpi_databaseinstancecategories`
--
ALTER TABLE `glpi_databaseinstancecategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_databaseinstances`
--
ALTER TABLE `glpi_databaseinstances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `name` (`name`),
  ADD KEY `databaseinstancetypes_id` (`databaseinstancetypes_id`),
  ADD KEY `databaseinstancecategories_id` (`databaseinstancecategories_id`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `is_helpdesk_visible` (`is_helpdesk_visible`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `autoupdatesystems_id` (`autoupdatesystems_id`);

--
-- Índices para tabela `glpi_databaseinstancetypes`
--
ALTER TABLE `glpi_databaseinstancetypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_databases`
--
ALTER TABLE `glpi_databases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `name` (`name`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `databaseinstances_id` (`databaseinstances_id`);

--
-- Índices para tabela `glpi_datacenters`
--
ALTER TABLE `glpi_datacenters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_dcrooms`
--
ALTER TABLE `glpi_dcrooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `datacenters_id` (`datacenters_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_devicebatteries`
--
ALTER TABLE `glpi_devicebatteries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `devicebatterymodels_id` (`devicebatterymodels_id`),
  ADD KEY `devicebatterytypes_id` (`devicebatterytypes_id`);

--
-- Índices para tabela `glpi_devicebatterymodels`
--
ALTER TABLE `glpi_devicebatterymodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `product_number` (`product_number`);

--
-- Índices para tabela `glpi_devicebatterytypes`
--
ALTER TABLE `glpi_devicebatterytypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_devicecameramodels`
--
ALTER TABLE `glpi_devicecameramodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `product_number` (`product_number`);

--
-- Índices para tabela `glpi_devicecameras`
--
ALTER TABLE `glpi_devicecameras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `devicecameramodels_id` (`devicecameramodels_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_devicecasemodels`
--
ALTER TABLE `glpi_devicecasemodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `product_number` (`product_number`);

--
-- Índices para tabela `glpi_devicecases`
--
ALTER TABLE `glpi_devicecases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `devicecasetypes_id` (`devicecasetypes_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `devicecasemodels_id` (`devicecasemodels_id`);

--
-- Índices para tabela `glpi_devicecasetypes`
--
ALTER TABLE `glpi_devicecasetypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_devicecontrolmodels`
--
ALTER TABLE `glpi_devicecontrolmodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `product_number` (`product_number`);

--
-- Índices para tabela `glpi_devicecontrols`
--
ALTER TABLE `glpi_devicecontrols`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `interfacetypes_id` (`interfacetypes_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `devicecontrolmodels_id` (`devicecontrolmodels_id`);

--
-- Índices para tabela `glpi_devicedrivemodels`
--
ALTER TABLE `glpi_devicedrivemodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `product_number` (`product_number`);

--
-- Índices para tabela `glpi_devicedrives`
--
ALTER TABLE `glpi_devicedrives`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `interfacetypes_id` (`interfacetypes_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `devicedrivemodels_id` (`devicedrivemodels_id`);

--
-- Índices para tabela `glpi_devicefirmwaremodels`
--
ALTER TABLE `glpi_devicefirmwaremodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `product_number` (`product_number`);

--
-- Índices para tabela `glpi_devicefirmwares`
--
ALTER TABLE `glpi_devicefirmwares`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `devicefirmwaremodels_id` (`devicefirmwaremodels_id`),
  ADD KEY `devicefirmwaretypes_id` (`devicefirmwaretypes_id`);

--
-- Índices para tabela `glpi_devicefirmwaretypes`
--
ALTER TABLE `glpi_devicefirmwaretypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_devicegenericmodels`
--
ALTER TABLE `glpi_devicegenericmodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `product_number` (`product_number`);

--
-- Índices para tabela `glpi_devicegenerics`
--
ALTER TABLE `glpi_devicegenerics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `devicegenerictypes_id` (`devicegenerictypes_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `devicegenericmodels_id` (`devicegenericmodels_id`);

--
-- Índices para tabela `glpi_devicegenerictypes`
--
ALTER TABLE `glpi_devicegenerictypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Índices para tabela `glpi_devicegraphiccardmodels`
--
ALTER TABLE `glpi_devicegraphiccardmodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `product_number` (`product_number`);

--
-- Índices para tabela `glpi_devicegraphiccards`
--
ALTER TABLE `glpi_devicegraphiccards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `interfacetypes_id` (`interfacetypes_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `chipset` (`chipset`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `devicegraphiccardmodels_id` (`devicegraphiccardmodels_id`);

--
-- Índices para tabela `glpi_deviceharddrivemodels`
--
ALTER TABLE `glpi_deviceharddrivemodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `product_number` (`product_number`);

--
-- Índices para tabela `glpi_deviceharddrives`
--
ALTER TABLE `glpi_deviceharddrives`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `interfacetypes_id` (`interfacetypes_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `deviceharddrivemodels_id` (`deviceharddrivemodels_id`);

--
-- Índices para tabela `glpi_devicememories`
--
ALTER TABLE `glpi_devicememories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `devicememorytypes_id` (`devicememorytypes_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `devicememorymodels_id` (`devicememorymodels_id`);

--
-- Índices para tabela `glpi_devicememorymodels`
--
ALTER TABLE `glpi_devicememorymodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `product_number` (`product_number`);

--
-- Índices para tabela `glpi_devicememorytypes`
--
ALTER TABLE `glpi_devicememorytypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_devicemotherboardmodels`
--
ALTER TABLE `glpi_devicemotherboardmodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `product_number` (`product_number`);

--
-- Índices para tabela `glpi_devicemotherboards`
--
ALTER TABLE `glpi_devicemotherboards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `devicemotherboardmodels_id` (`devicemotherboardmodels_id`);

--
-- Índices para tabela `glpi_devicenetworkcardmodels`
--
ALTER TABLE `glpi_devicenetworkcardmodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `product_number` (`product_number`);

--
-- Índices para tabela `glpi_devicenetworkcards`
--
ALTER TABLE `glpi_devicenetworkcards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `devicenetworkcardmodels_id` (`devicenetworkcardmodels_id`);

--
-- Índices para tabela `glpi_devicepcimodels`
--
ALTER TABLE `glpi_devicepcimodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `product_number` (`product_number`);

--
-- Índices para tabela `glpi_devicepcis`
--
ALTER TABLE `glpi_devicepcis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `devicenetworkcardmodels_id` (`devicenetworkcardmodels_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `devicepcimodels_id` (`devicepcimodels_id`);

--
-- Índices para tabela `glpi_devicepowersupplies`
--
ALTER TABLE `glpi_devicepowersupplies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `devicepowersupplymodels_id` (`devicepowersupplymodels_id`);

--
-- Índices para tabela `glpi_devicepowersupplymodels`
--
ALTER TABLE `glpi_devicepowersupplymodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `product_number` (`product_number`);

--
-- Índices para tabela `glpi_deviceprocessormodels`
--
ALTER TABLE `glpi_deviceprocessormodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `product_number` (`product_number`);

--
-- Índices para tabela `glpi_deviceprocessors`
--
ALTER TABLE `glpi_deviceprocessors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `deviceprocessormodels_id` (`deviceprocessormodels_id`);

--
-- Índices para tabela `glpi_devicesensormodels`
--
ALTER TABLE `glpi_devicesensormodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `product_number` (`product_number`);

--
-- Índices para tabela `glpi_devicesensors`
--
ALTER TABLE `glpi_devicesensors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `devicesensortypes_id` (`devicesensortypes_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `devicesensormodels_id` (`devicesensormodels_id`);

--
-- Índices para tabela `glpi_devicesensortypes`
--
ALTER TABLE `glpi_devicesensortypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Índices para tabela `glpi_devicesimcards`
--
ALTER TABLE `glpi_devicesimcards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `devicesimcardtypes_id` (`devicesimcardtypes_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`);

--
-- Índices para tabela `glpi_devicesimcardtypes`
--
ALTER TABLE `glpi_devicesimcardtypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_devicesoundcardmodels`
--
ALTER TABLE `glpi_devicesoundcardmodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `product_number` (`product_number`);

--
-- Índices para tabela `glpi_devicesoundcards`
--
ALTER TABLE `glpi_devicesoundcards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation` (`designation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `devicesoundcardmodels_id` (`devicesoundcardmodels_id`);

--
-- Índices para tabela `glpi_displaypreferences`
--
ALTER TABLE `glpi_displaypreferences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`users_id`,`itemtype`,`num`),
  ADD KEY `rank` (`rank`),
  ADD KEY `num` (`num`),
  ADD KEY `itemtype` (`itemtype`);

--
-- Índices para tabela `glpi_documentcategories`
--
ALTER TABLE `glpi_documentcategories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`documentcategories_id`,`name`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `level` (`level`);

--
-- Índices para tabela `glpi_documents`
--
ALTER TABLE `glpi_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `tickets_id` (`tickets_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `documentcategories_id` (`documentcategories_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `sha1sum` (`sha1sum`),
  ADD KEY `tag` (`tag`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_documents_items`
--
ALTER TABLE `glpi_documents_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`documents_id`,`itemtype`,`items_id`,`timeline_position`),
  ADD KEY `item` (`itemtype`,`items_id`,`entities_id`,`is_recursive`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date` (`date`),
  ADD KEY `timeline_position` (`timeline_position`);

--
-- Índices para tabela `glpi_documenttypes`
--
ALTER TABLE `glpi_documenttypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`ext`),
  ADD KEY `name` (`name`),
  ADD KEY `is_uploadable` (`is_uploadable`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_domainrecords`
--
ALTER TABLE `glpi_domainrecords`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `domains_id` (`domains_id`),
  ADD KEY `domainrecordtypes_id` (`domainrecordtypes_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_domainrecordtypes`
--
ALTER TABLE `glpi_domainrecordtypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Índices para tabela `glpi_domainrelations`
--
ALTER TABLE `glpi_domainrelations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Índices para tabela `glpi_domains`
--
ALTER TABLE `glpi_domains`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `domaintypes_id` (`domaintypes_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_template` (`is_template`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `date_expiration` (`date_expiration`),
  ADD KEY `date_domaincreation` (`date_domaincreation`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_domains_items`
--
ALTER TABLE `glpi_domains_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`domains_id`,`itemtype`,`items_id`),
  ADD KEY `domainrelations_id` (`domainrelations_id`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `is_deleted` (`is_deleted`);

--
-- Índices para tabela `glpi_domaintypes`
--
ALTER TABLE `glpi_domaintypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Índices para tabela `glpi_dropdowntranslations`
--
ALTER TABLE `glpi_dropdowntranslations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`itemtype`,`items_id`,`language`,`field`),
  ADD KEY `language` (`language`),
  ADD KEY `field` (`field`);

--
-- Índices para tabela `glpi_enclosuremodels`
--
ALTER TABLE `glpi_enclosuremodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `product_number` (`product_number`);

--
-- Índices para tabela `glpi_enclosures`
--
ALTER TABLE `glpi_enclosures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `enclosuremodels_id` (`enclosuremodels_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `group_id_tech` (`groups_id_tech`),
  ADD KEY `is_template` (`is_template`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_entities`
--
ALTER TABLE `glpi_entities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`entities_id`,`name`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `tickettemplates_id` (`tickettemplates_id`),
  ADD KEY `changetemplates_id` (`changetemplates_id`),
  ADD KEY `problemtemplates_id` (`problemtemplates_id`),
  ADD KEY `transfers_id` (`transfers_id`),
  ADD KEY `authldaps_id` (`authldaps_id`),
  ADD KEY `calendars_id` (`calendars_id`),
  ADD KEY `entities_id_software` (`entities_id_software`),
  ADD KEY `contracts_id_default` (`contracts_id_default`),
  ADD KEY `level` (`level`);

--
-- Índices para tabela `glpi_entities_knowbaseitems`
--
ALTER TABLE `glpi_entities_knowbaseitems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `knowbaseitems_id` (`knowbaseitems_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Índices para tabela `glpi_entities_reminders`
--
ALTER TABLE `glpi_entities_reminders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reminders_id` (`reminders_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Índices para tabela `glpi_entities_rssfeeds`
--
ALTER TABLE `glpi_entities_rssfeeds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rssfeeds_id` (`rssfeeds_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Índices para tabela `glpi_events`
--
ALTER TABLE `glpi_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date` (`date`),
  ADD KEY `level` (`level`),
  ADD KEY `item` (`type`,`items_id`);

--
-- Índices para tabela `glpi_fieldblacklists`
--
ALTER TABLE `glpi_fieldblacklists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_fieldunicities`
--
ALTER TABLE `glpi_fieldunicities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_filesystems`
--
ALTER TABLE `glpi_filesystems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_fqdns`
--
ALTER TABLE `glpi_fqdns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `name` (`name`),
  ADD KEY `fqdn` (`fqdn`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_groups`
--
ALTER TABLE `glpi_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `ldap_field` (`ldap_field`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `ldap_value` (`ldap_value`(200)),
  ADD KEY `ldap_group_dn` (`ldap_group_dn`(200)),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `is_requester` (`is_requester`),
  ADD KEY `is_watcher` (`is_watcher`),
  ADD KEY `is_assign` (`is_assign`),
  ADD KEY `is_notify` (`is_notify`),
  ADD KEY `is_itemgroup` (`is_itemgroup`),
  ADD KEY `is_usergroup` (`is_usergroup`),
  ADD KEY `is_manager` (`is_manager`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `level` (`level`);

--
-- Índices para tabela `glpi_groups_knowbaseitems`
--
ALTER TABLE `glpi_groups_knowbaseitems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `knowbaseitems_id` (`knowbaseitems_id`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Índices para tabela `glpi_groups_problems`
--
ALTER TABLE `glpi_groups_problems`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`problems_id`,`type`,`groups_id`),
  ADD KEY `group` (`groups_id`,`type`);

--
-- Índices para tabela `glpi_groups_reminders`
--
ALTER TABLE `glpi_groups_reminders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reminders_id` (`reminders_id`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Índices para tabela `glpi_groups_rssfeeds`
--
ALTER TABLE `glpi_groups_rssfeeds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rssfeeds_id` (`rssfeeds_id`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Índices para tabela `glpi_groups_tickets`
--
ALTER TABLE `glpi_groups_tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`tickets_id`,`type`,`groups_id`),
  ADD KEY `group` (`groups_id`,`type`);

--
-- Índices para tabela `glpi_groups_users`
--
ALTER TABLE `glpi_groups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`users_id`,`groups_id`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `is_manager` (`is_manager`),
  ADD KEY `is_userdelegate` (`is_userdelegate`);

--
-- Índices para tabela `glpi_holidays`
--
ALTER TABLE `glpi_holidays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `begin_date` (`begin_date`),
  ADD KEY `end_date` (`end_date`),
  ADD KEY `is_perpetual` (`is_perpetual`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_imageformats`
--
ALTER TABLE `glpi_imageformats`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_imageresolutions`
--
ALTER TABLE `glpi_imageresolutions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `is_video` (`is_video`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_impactcompounds`
--
ALTER TABLE `glpi_impactcompounds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Índices para tabela `glpi_impactcontexts`
--
ALTER TABLE `glpi_impactcontexts`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `glpi_impactitems`
--
ALTER TABLE `glpi_impactitems`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`itemtype`,`items_id`),
  ADD KEY `source` (`itemtype`,`items_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `impactcontexts_id` (`impactcontexts_id`);

--
-- Índices para tabela `glpi_impactrelations`
--
ALTER TABLE `glpi_impactrelations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`itemtype_source`,`items_id_source`,`itemtype_impacted`,`items_id_impacted`),
  ADD KEY `impacted_asset` (`itemtype_impacted`,`items_id_impacted`);

--
-- Índices para tabela `glpi_infocoms`
--
ALTER TABLE `glpi_infocoms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`itemtype`,`items_id`),
  ADD KEY `buy_date` (`buy_date`),
  ADD KEY `alert` (`alert`),
  ADD KEY `budgets_id` (`budgets_id`),
  ADD KEY `suppliers_id` (`suppliers_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `businesscriticities_id` (`businesscriticities_id`);

--
-- Índices para tabela `glpi_interfacetypes`
--
ALTER TABLE `glpi_interfacetypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_ipaddresses`
--
ALTER TABLE `glpi_ipaddresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `binary` (`binary_0`,`binary_1`,`binary_2`,`binary_3`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `item` (`itemtype`,`items_id`,`is_deleted`),
  ADD KEY `mainitem` (`mainitemtype`,`mainitems_id`,`is_deleted`);

--
-- Índices para tabela `glpi_ipaddresses_ipnetworks`
--
ALTER TABLE `glpi_ipaddresses_ipnetworks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`ipaddresses_id`,`ipnetworks_id`),
  ADD KEY `ipnetworks_id` (`ipnetworks_id`);

--
-- Índices para tabela `glpi_ipnetworks`
--
ALTER TABLE `glpi_ipnetworks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `network_definition` (`entities_id`,`address`,`netmask`),
  ADD KEY `address` (`address_0`,`address_1`,`address_2`,`address_3`),
  ADD KEY `netmask` (`netmask_0`,`netmask_1`,`netmask_2`,`netmask_3`),
  ADD KEY `gateway` (`gateway_0`,`gateway_1`,`gateway_2`,`gateway_3`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `ipnetworks_id` (`ipnetworks_id`),
  ADD KEY `level` (`level`);

--
-- Índices para tabela `glpi_ipnetworks_vlans`
--
ALTER TABLE `glpi_ipnetworks_vlans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `link` (`ipnetworks_id`,`vlans_id`),
  ADD KEY `vlans_id` (`vlans_id`);

--
-- Índices para tabela `glpi_items_clusters`
--
ALTER TABLE `glpi_items_clusters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`clusters_id`,`itemtype`,`items_id`),
  ADD KEY `item` (`itemtype`,`items_id`);

--
-- Índices para tabela `glpi_items_devicebatteries`
--
ALTER TABLE `glpi_items_devicebatteries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devicebatteries_id` (`devicebatteries_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `serial` (`serial`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`);

--
-- Índices para tabela `glpi_items_devicecameras`
--
ALTER TABLE `glpi_items_devicecameras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_id` (`items_id`),
  ADD KEY `devicecameras_id` (`devicecameras_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `item` (`itemtype`,`items_id`);

--
-- Índices para tabela `glpi_items_devicecameras_imageformats`
--
ALTER TABLE `glpi_items_devicecameras_imageformats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_devicecameras_id` (`items_devicecameras_id`),
  ADD KEY `imageformats_id` (`imageformats_id`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `is_deleted` (`is_deleted`);

--
-- Índices para tabela `glpi_items_devicecameras_imageresolutions`
--
ALTER TABLE `glpi_items_devicecameras_imageresolutions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_devicecameras_id` (`items_devicecameras_id`),
  ADD KEY `imageresolutions_id` (`imageresolutions_id`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `is_deleted` (`is_deleted`);

--
-- Índices para tabela `glpi_items_devicecases`
--
ALTER TABLE `glpi_items_devicecases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devicecases_id` (`devicecases_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `serial` (`serial`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`);

--
-- Índices para tabela `glpi_items_devicecontrols`
--
ALTER TABLE `glpi_items_devicecontrols`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devicecontrols_id` (`devicecontrols_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `serial` (`serial`),
  ADD KEY `busID` (`busID`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`);

--
-- Índices para tabela `glpi_items_devicedrives`
--
ALTER TABLE `glpi_items_devicedrives`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devicedrives_id` (`devicedrives_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `serial` (`serial`),
  ADD KEY `busID` (`busID`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`);

--
-- Índices para tabela `glpi_items_devicefirmwares`
--
ALTER TABLE `glpi_items_devicefirmwares`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devicefirmwares_id` (`devicefirmwares_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `serial` (`serial`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`);

--
-- Índices para tabela `glpi_items_devicegenerics`
--
ALTER TABLE `glpi_items_devicegenerics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devicegenerics_id` (`devicegenerics_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `serial` (`serial`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`);

--
-- Índices para tabela `glpi_items_devicegraphiccards`
--
ALTER TABLE `glpi_items_devicegraphiccards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devicegraphiccards_id` (`devicegraphiccards_id`),
  ADD KEY `specificity` (`memory`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `serial` (`serial`),
  ADD KEY `busID` (`busID`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`);

--
-- Índices para tabela `glpi_items_deviceharddrives`
--
ALTER TABLE `glpi_items_deviceharddrives`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deviceharddrives_id` (`deviceharddrives_id`),
  ADD KEY `specificity` (`capacity`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `serial` (`serial`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `busID` (`busID`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`);

--
-- Índices para tabela `glpi_items_devicememories`
--
ALTER TABLE `glpi_items_devicememories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devicememories_id` (`devicememories_id`),
  ADD KEY `specificity` (`size`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `serial` (`serial`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `busID` (`busID`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`);

--
-- Índices para tabela `glpi_items_devicemotherboards`
--
ALTER TABLE `glpi_items_devicemotherboards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devicemotherboards_id` (`devicemotherboards_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `serial` (`serial`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`);

--
-- Índices para tabela `glpi_items_devicenetworkcards`
--
ALTER TABLE `glpi_items_devicenetworkcards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devicenetworkcards_id` (`devicenetworkcards_id`),
  ADD KEY `specificity` (`mac`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `serial` (`serial`),
  ADD KEY `busID` (`busID`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`);

--
-- Índices para tabela `glpi_items_devicepcis`
--
ALTER TABLE `glpi_items_devicepcis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devicepcis_id` (`devicepcis_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `serial` (`serial`),
  ADD KEY `busID` (`busID`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`);

--
-- Índices para tabela `glpi_items_devicepowersupplies`
--
ALTER TABLE `glpi_items_devicepowersupplies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devicepowersupplies_id` (`devicepowersupplies_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `serial` (`serial`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`);

--
-- Índices para tabela `glpi_items_deviceprocessors`
--
ALTER TABLE `glpi_items_deviceprocessors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deviceprocessors_id` (`deviceprocessors_id`),
  ADD KEY `specificity` (`frequency`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `serial` (`serial`),
  ADD KEY `nbcores` (`nbcores`),
  ADD KEY `nbthreads` (`nbthreads`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `busID` (`busID`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`);

--
-- Índices para tabela `glpi_items_devicesensors`
--
ALTER TABLE `glpi_items_devicesensors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devicesensors_id` (`devicesensors_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `serial` (`serial`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`);

--
-- Índices para tabela `glpi_items_devicesimcards`
--
ALTER TABLE `glpi_items_devicesimcards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `devicesimcards_id` (`devicesimcards_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `serial` (`serial`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `lines_id` (`lines_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `groups_id` (`groups_id`);

--
-- Índices para tabela `glpi_items_devicesoundcards`
--
ALTER TABLE `glpi_items_devicesoundcards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devicesoundcards_id` (`devicesoundcards_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `serial` (`serial`),
  ADD KEY `busID` (`busID`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`);

--
-- Índices para tabela `glpi_items_disks`
--
ALTER TABLE `glpi_items_disks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `device` (`device`),
  ADD KEY `mountpoint` (`mountpoint`),
  ADD KEY `totalsize` (`totalsize`),
  ADD KEY `freesize` (`freesize`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `filesystems_id` (`filesystems_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_items_enclosures`
--
ALTER TABLE `glpi_items_enclosures`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item` (`itemtype`,`items_id`),
  ADD KEY `relation` (`enclosures_id`,`itemtype`,`items_id`);

--
-- Índices para tabela `glpi_items_kanbans`
--
ALTER TABLE `glpi_items_kanbans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`itemtype`,`items_id`,`users_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Índices para tabela `glpi_items_operatingsystems`
--
ALTER TABLE `glpi_items_operatingsystems`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`items_id`,`itemtype`,`operatingsystems_id`,`operatingsystemarchitectures_id`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `operatingsystems_id` (`operatingsystems_id`),
  ADD KEY `operatingsystemservicepacks_id` (`operatingsystemservicepacks_id`),
  ADD KEY `operatingsystemversions_id` (`operatingsystemversions_id`),
  ADD KEY `operatingsystemarchitectures_id` (`operatingsystemarchitectures_id`),
  ADD KEY `operatingsystemkernelversions_id` (`operatingsystemkernelversions_id`),
  ADD KEY `operatingsystemeditions_id` (`operatingsystemeditions_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Índices para tabela `glpi_items_problems`
--
ALTER TABLE `glpi_items_problems`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`problems_id`,`itemtype`,`items_id`),
  ADD KEY `item` (`itemtype`,`items_id`);

--
-- Índices para tabela `glpi_items_projects`
--
ALTER TABLE `glpi_items_projects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`projects_id`,`itemtype`,`items_id`),
  ADD KEY `item` (`itemtype`,`items_id`);

--
-- Índices para tabela `glpi_items_racks`
--
ALTER TABLE `glpi_items_racks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item` (`itemtype`,`items_id`,`is_reserved`),
  ADD KEY `relation` (`racks_id`,`itemtype`,`items_id`);

--
-- Índices para tabela `glpi_items_remotemanagements`
--
ALTER TABLE `glpi_items_remotemanagements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `item` (`itemtype`,`items_id`);

--
-- Índices para tabela `glpi_items_softwarelicenses`
--
ALTER TABLE `glpi_items_softwarelicenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `softwarelicenses_id` (`softwarelicenses_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`);

--
-- Índices para tabela `glpi_items_softwareversions`
--
ALTER TABLE `glpi_items_softwareversions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`itemtype`,`items_id`,`softwareversions_id`),
  ADD KEY `softwareversions_id` (`softwareversions_id`),
  ADD KEY `computers_info` (`entities_id`,`is_template_item`,`is_deleted_item`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `is_deleted_item` (`is_deleted_item`),
  ADD KEY `is_template_item` (`is_template_item`),
  ADD KEY `date_install` (`date_install`);

--
-- Índices para tabela `glpi_items_tickets`
--
ALTER TABLE `glpi_items_tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`itemtype`,`items_id`,`tickets_id`),
  ADD KEY `tickets_id` (`tickets_id`);

--
-- Índices para tabela `glpi_itilcategories`
--
ALTER TABLE `glpi_itilcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `knowbaseitemcategories_id` (`knowbaseitemcategories_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `is_helpdeskvisible` (`is_helpdeskvisible`),
  ADD KEY `itilcategories_id` (`itilcategories_id`),
  ADD KEY `tickettemplates_id_incident` (`tickettemplates_id_incident`),
  ADD KEY `tickettemplates_id_demand` (`tickettemplates_id_demand`),
  ADD KEY `changetemplates_id` (`changetemplates_id`),
  ADD KEY `problemtemplates_id` (`problemtemplates_id`),
  ADD KEY `is_incident` (`is_incident`),
  ADD KEY `is_request` (`is_request`),
  ADD KEY `is_problem` (`is_problem`),
  ADD KEY `is_change` (`is_change`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `level` (`level`);

--
-- Índices para tabela `glpi_itilfollowups`
--
ALTER TABLE `glpi_itilfollowups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `date` (`date`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `users_id_editor` (`users_id_editor`),
  ADD KEY `is_private` (`is_private`),
  ADD KEY `requesttypes_id` (`requesttypes_id`),
  ADD KEY `sourceitems_id` (`sourceitems_id`),
  ADD KEY `sourceof_items_id` (`sourceof_items_id`);

--
-- Índices para tabela `glpi_itilfollowuptemplates`
--
ALTER TABLE `glpi_itilfollowuptemplates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `requesttypes_id` (`requesttypes_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `is_private` (`is_private`);

--
-- Índices para tabela `glpi_itilsolutions`
--
ALTER TABLE `glpi_itilsolutions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `solutiontypes_id` (`solutiontypes_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `users_id_editor` (`users_id_editor`),
  ADD KEY `users_id_approval` (`users_id_approval`),
  ADD KEY `status` (`status`),
  ADD KEY `itilfollowups_id` (`itilfollowups_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_itils_projects`
--
ALTER TABLE `glpi_itils_projects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`itemtype`,`items_id`,`projects_id`),
  ADD KEY `projects_id` (`projects_id`);

--
-- Índices para tabela `glpi_knowbaseitemcategories`
--
ALTER TABLE `glpi_knowbaseitemcategories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`entities_id`,`knowbaseitemcategories_id`,`name`),
  ADD KEY `name` (`name`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `knowbaseitemcategories_id` (`knowbaseitemcategories_id`),
  ADD KEY `level` (`level`);

--
-- Índices para tabela `glpi_knowbaseitems`
--
ALTER TABLE `glpi_knowbaseitems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `is_faq` (`is_faq`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `begin_date` (`begin_date`),
  ADD KEY `end_date` (`end_date`);
ALTER TABLE `glpi_knowbaseitems` ADD FULLTEXT KEY `fulltext` (`name`,`answer`);
ALTER TABLE `glpi_knowbaseitems` ADD FULLTEXT KEY `name` (`name`);
ALTER TABLE `glpi_knowbaseitems` ADD FULLTEXT KEY `answer` (`answer`);

--
-- Índices para tabela `glpi_knowbaseitems_comments`
--
ALTER TABLE `glpi_knowbaseitems_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `knowbaseitems_id` (`knowbaseitems_id`),
  ADD KEY `parent_comment_id` (`parent_comment_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_knowbaseitems_items`
--
ALTER TABLE `glpi_knowbaseitems_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`itemtype`,`items_id`,`knowbaseitems_id`),
  ADD KEY `knowbaseitems_id` (`knowbaseitems_id`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Índices para tabela `glpi_knowbaseitems_knowbaseitemcategories`
--
ALTER TABLE `glpi_knowbaseitems_knowbaseitemcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `knowbaseitems_id` (`knowbaseitems_id`),
  ADD KEY `knowbaseitemcategories_id` (`knowbaseitemcategories_id`);

--
-- Índices para tabela `glpi_knowbaseitems_profiles`
--
ALTER TABLE `glpi_knowbaseitems_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `knowbaseitems_id` (`knowbaseitems_id`),
  ADD KEY `profiles_id` (`profiles_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Índices para tabela `glpi_knowbaseitems_revisions`
--
ALTER TABLE `glpi_knowbaseitems_revisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`knowbaseitems_id`,`revision`,`language`),
  ADD KEY `revision` (`revision`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `date` (`date`);

--
-- Índices para tabela `glpi_knowbaseitems_users`
--
ALTER TABLE `glpi_knowbaseitems_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `knowbaseitems_id` (`knowbaseitems_id`),
  ADD KEY `users_id` (`users_id`);

--
-- Índices para tabela `glpi_knowbaseitemtranslations`
--
ALTER TABLE `glpi_knowbaseitemtranslations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item` (`knowbaseitems_id`,`language`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);
ALTER TABLE `glpi_knowbaseitemtranslations` ADD FULLTEXT KEY `fulltext` (`name`,`answer`);
ALTER TABLE `glpi_knowbaseitemtranslations` ADD FULLTEXT KEY `name` (`name`);
ALTER TABLE `glpi_knowbaseitemtranslations` ADD FULLTEXT KEY `answer` (`answer`);

--
-- Índices para tabela `glpi_lineoperators`
--
ALTER TABLE `glpi_lineoperators`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`mcc`,`mnc`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_lines`
--
ALTER TABLE `glpi_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `lineoperators_id` (`lineoperators_id`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `linetypes_id` (`linetypes_id`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Índices para tabela `glpi_linetypes`
--
ALTER TABLE `glpi_linetypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_links`
--
ALTER TABLE `glpi_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_links_itemtypes`
--
ALTER TABLE `glpi_links_itemtypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`itemtype`,`links_id`),
  ADD KEY `links_id` (`links_id`);

--
-- Índices para tabela `glpi_locations`
--
ALTER TABLE `glpi_locations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`entities_id`,`locations_id`,`name`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `name` (`name`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `level` (`level`);

--
-- Índices para tabela `glpi_lockedfields`
--
ALTER TABLE `glpi_lockedfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`itemtype`,`items_id`,`field`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `is_global` (`is_global`);

--
-- Índices para tabela `glpi_logs`
--
ALTER TABLE `glpi_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `itemtype_link` (`itemtype_link`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `id_search_option` (`id_search_option`);

--
-- Índices para tabela `glpi_mailcollectors`
--
ALTER TABLE `glpi_mailcollectors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `last_collect_date` (`last_collect_date`);

--
-- Índices para tabela `glpi_manuallinks`
--
ALTER TABLE `glpi_manuallinks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `items_id` (`items_id`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Índices para tabela `glpi_manufacturers`
--
ALTER TABLE `glpi_manufacturers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_monitormodels`
--
ALTER TABLE `glpi_monitormodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `product_number` (`product_number`);

--
-- Índices para tabela `glpi_monitors`
--
ALTER TABLE `glpi_monitors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `is_template` (`is_template`),
  ADD KEY `is_global` (`is_global`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `monitormodels_id` (`monitormodels_id`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `monitortypes_id` (`monitortypes_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  ADD KEY `serial` (`serial`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `uuid` (`uuid`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Índices para tabela `glpi_monitortypes`
--
ALTER TABLE `glpi_monitortypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_networkaliases`
--
ALTER TABLE `glpi_networkaliases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `name` (`name`),
  ADD KEY `networknames_id` (`networknames_id`),
  ADD KEY `fqdns_id` (`fqdns_id`);

--
-- Índices para tabela `glpi_networkequipmentmodels`
--
ALTER TABLE `glpi_networkequipmentmodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `product_number` (`product_number`);

--
-- Índices para tabela `glpi_networkequipments`
--
ALTER TABLE `glpi_networkequipments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `is_template` (`is_template`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `networkequipmentmodels_id` (`networkequipmentmodels_id`),
  ADD KEY `networks_id` (`networks_id`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `networkequipmenttypes_id` (`networkequipmenttypes_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `serial` (`serial`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `uuid` (`uuid`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  ADD KEY `snmpcredentials_id` (`snmpcredentials_id`);

--
-- Índices para tabela `glpi_networkequipmenttypes`
--
ALTER TABLE `glpi_networkequipmenttypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_networkinterfaces`
--
ALTER TABLE `glpi_networkinterfaces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Índices para tabela `glpi_networknames`
--
ALTER TABLE `glpi_networknames`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `FQDN` (`name`,`fqdns_id`),
  ADD KEY `fqdns_id` (`fqdns_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `item` (`itemtype`,`items_id`,`is_deleted`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `ipnetworks_id` (`ipnetworks_id`);

--
-- Índices para tabela `glpi_networkportaggregates`
--
ALTER TABLE `glpi_networkportaggregates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `networkports_id` (`networkports_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_networkportaliases`
--
ALTER TABLE `glpi_networkportaliases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `networkports_id` (`networkports_id`),
  ADD KEY `networkports_id_alias` (`networkports_id_alias`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_networkportconnectionlogs`
--
ALTER TABLE `glpi_networkportconnectionlogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date` (`date`),
  ADD KEY `networkports_id_source` (`networkports_id_source`),
  ADD KEY `networkports_id_destination` (`networkports_id_destination`);

--
-- Índices para tabela `glpi_networkportdialups`
--
ALTER TABLE `glpi_networkportdialups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `networkports_id` (`networkports_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_networkportethernets`
--
ALTER TABLE `glpi_networkportethernets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `networkports_id` (`networkports_id`),
  ADD KEY `card` (`items_devicenetworkcards_id`),
  ADD KEY `type` (`type`),
  ADD KEY `speed` (`speed`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_networkportfiberchannels`
--
ALTER TABLE `glpi_networkportfiberchannels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `networkports_id` (`networkports_id`),
  ADD KEY `card` (`items_devicenetworkcards_id`),
  ADD KEY `type` (`networkportfiberchanneltypes_id`),
  ADD KEY `wwn` (`wwn`),
  ADD KEY `speed` (`speed`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_networkportfiberchanneltypes`
--
ALTER TABLE `glpi_networkportfiberchanneltypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_networkportlocals`
--
ALTER TABLE `glpi_networkportlocals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `networkports_id` (`networkports_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_networkportmetrics`
--
ALTER TABLE `glpi_networkportmetrics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`networkports_id`,`date`),
  ADD KEY `date` (`date`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Índices para tabela `glpi_networkports`
--
ALTER TABLE `glpi_networkports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `mac` (`mac`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_networkports_networkports`
--
ALTER TABLE `glpi_networkports_networkports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`networkports_id_1`,`networkports_id_2`),
  ADD KEY `networkports_id_2` (`networkports_id_2`);

--
-- Índices para tabela `glpi_networkports_vlans`
--
ALTER TABLE `glpi_networkports_vlans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`networkports_id`,`vlans_id`),
  ADD KEY `vlans_id` (`vlans_id`);

--
-- Índices para tabela `glpi_networkporttypes`
--
ALTER TABLE `glpi_networkporttypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `value_decimal` (`value_decimal`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `is_importable` (`is_importable`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_networkportwifis`
--
ALTER TABLE `glpi_networkportwifis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `networkports_id` (`networkports_id`),
  ADD KEY `card` (`items_devicenetworkcards_id`),
  ADD KEY `essid` (`wifinetworks_id`),
  ADD KEY `version` (`version`),
  ADD KEY `mode` (`mode`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `networkportwifis_id` (`networkportwifis_id`);

--
-- Índices para tabela `glpi_networks`
--
ALTER TABLE `glpi_networks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_notepads`
--
ALTER TABLE `glpi_notepads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `users_id_lastupdater` (`users_id_lastupdater`),
  ADD KEY `users_id` (`users_id`);

--
-- Índices para tabela `glpi_notifications`
--
ALTER TABLE `glpi_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `itemtype` (`itemtype`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_notifications_notificationtemplates`
--
ALTER TABLE `glpi_notifications_notificationtemplates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`notifications_id`,`mode`,`notificationtemplates_id`),
  ADD KEY `notificationtemplates_id` (`notificationtemplates_id`),
  ADD KEY `mode` (`mode`);

--
-- Índices para tabela `glpi_notificationtargets`
--
ALTER TABLE `glpi_notificationtargets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items` (`type`,`items_id`),
  ADD KEY `notifications_id` (`notifications_id`);

--
-- Índices para tabela `glpi_notificationtemplates`
--
ALTER TABLE `glpi_notificationtemplates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `itemtype` (`itemtype`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `name` (`name`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_notificationtemplatetranslations`
--
ALTER TABLE `glpi_notificationtemplatetranslations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notificationtemplates_id` (`notificationtemplates_id`);

--
-- Índices para tabela `glpi_notimportedemails`
--
ALTER TABLE `glpi_notimportedemails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `mailcollectors_id` (`mailcollectors_id`);

--
-- Índices para tabela `glpi_objectlocks`
--
ALTER TABLE `glpi_objectlocks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item` (`itemtype`,`items_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `date` (`date`);

--
-- Índices para tabela `glpi_olalevelactions`
--
ALTER TABLE `glpi_olalevelactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `olalevels_id` (`olalevels_id`);

--
-- Índices para tabela `glpi_olalevelcriterias`
--
ALTER TABLE `glpi_olalevelcriterias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `olalevels_id` (`olalevels_id`),
  ADD KEY `condition` (`condition`);

--
-- Índices para tabela `glpi_olalevels`
--
ALTER TABLE `glpi_olalevels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `olas_id` (`olas_id`);

--
-- Índices para tabela `glpi_olalevels_tickets`
--
ALTER TABLE `glpi_olalevels_tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`tickets_id`,`olalevels_id`),
  ADD KEY `olalevels_id` (`olalevels_id`);

--
-- Índices para tabela `glpi_olas`
--
ALTER TABLE `glpi_olas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `calendars_id` (`calendars_id`),
  ADD KEY `slms_id` (`slms_id`);

--
-- Índices para tabela `glpi_operatingsystemarchitectures`
--
ALTER TABLE `glpi_operatingsystemarchitectures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_operatingsystemeditions`
--
ALTER TABLE `glpi_operatingsystemeditions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Índices para tabela `glpi_operatingsystemkernels`
--
ALTER TABLE `glpi_operatingsystemkernels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Índices para tabela `glpi_operatingsystemkernelversions`
--
ALTER TABLE `glpi_operatingsystemkernelversions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `operatingsystemkernels_id` (`operatingsystemkernels_id`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Índices para tabela `glpi_operatingsystems`
--
ALTER TABLE `glpi_operatingsystems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_operatingsystemservicepacks`
--
ALTER TABLE `glpi_operatingsystemservicepacks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_operatingsystemversions`
--
ALTER TABLE `glpi_operatingsystemversions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_passivedcequipmentmodels`
--
ALTER TABLE `glpi_passivedcequipmentmodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `product_number` (`product_number`);

--
-- Índices para tabela `glpi_passivedcequipments`
--
ALTER TABLE `glpi_passivedcequipments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `passivedcequipmentmodels_id` (`passivedcequipmentmodels_id`),
  ADD KEY `passivedcequipmenttypes_id` (`passivedcequipmenttypes_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `group_id_tech` (`groups_id_tech`),
  ADD KEY `is_template` (`is_template`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Índices para tabela `glpi_passivedcequipmenttypes`
--
ALTER TABLE `glpi_passivedcequipmenttypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_pcivendors`
--
ALTER TABLE `glpi_pcivendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`vendorid`,`deviceid`),
  ADD KEY `deviceid` (`deviceid`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_pdumodels`
--
ALTER TABLE `glpi_pdumodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `is_rackable` (`is_rackable`),
  ADD KEY `product_number` (`product_number`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Índices para tabela `glpi_pdus`
--
ALTER TABLE `glpi_pdus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `pdumodels_id` (`pdumodels_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `group_id_tech` (`groups_id_tech`),
  ADD KEY `is_template` (`is_template`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `pdutypes_id` (`pdutypes_id`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Índices para tabela `glpi_pdus_plugs`
--
ALTER TABLE `glpi_pdus_plugs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plugs_id` (`plugs_id`),
  ADD KEY `pdus_id` (`pdus_id`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Índices para tabela `glpi_pdus_racks`
--
ALTER TABLE `glpi_pdus_racks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `racks_id` (`racks_id`),
  ADD KEY `pdus_id` (`pdus_id`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Índices para tabela `glpi_pdutypes`
--
ALTER TABLE `glpi_pdutypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `name` (`name`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Índices para tabela `glpi_pendingreasons`
--
ALTER TABLE `glpi_pendingreasons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `itilfollowuptemplates_id` (`itilfollowuptemplates_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `solutiontemplates_id` (`solutiontemplates_id`);

--
-- Índices para tabela `glpi_pendingreasons_items`
--
ALTER TABLE `glpi_pendingreasons_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`items_id`,`itemtype`),
  ADD KEY `pendingreasons_id` (`pendingreasons_id`),
  ADD KEY `item` (`itemtype`,`items_id`);

--
-- Índices para tabela `glpi_peripheralmodels`
--
ALTER TABLE `glpi_peripheralmodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `product_number` (`product_number`);

--
-- Índices para tabela `glpi_peripherals`
--
ALTER TABLE `glpi_peripherals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `is_template` (`is_template`),
  ADD KEY `is_global` (`is_global`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `peripheralmodels_id` (`peripheralmodels_id`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `peripheraltypes_id` (`peripheraltypes_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  ADD KEY `serial` (`serial`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `uuid` (`uuid`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Índices para tabela `glpi_peripheraltypes`
--
ALTER TABLE `glpi_peripheraltypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_phonemodels`
--
ALTER TABLE `glpi_phonemodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `product_number` (`product_number`);

--
-- Índices para tabela `glpi_phonepowersupplies`
--
ALTER TABLE `glpi_phonepowersupplies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_phones`
--
ALTER TABLE `glpi_phones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `is_template` (`is_template`),
  ADD KEY `is_global` (`is_global`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `phonemodels_id` (`phonemodels_id`),
  ADD KEY `phonepowersupplies_id` (`phonepowersupplies_id`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `phonetypes_id` (`phonetypes_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  ADD KEY `serial` (`serial`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `uuid` (`uuid`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Índices para tabela `glpi_phonetypes`
--
ALTER TABLE `glpi_phonetypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_planningeventcategories`
--
ALTER TABLE `glpi_planningeventcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_planningexternalevents`
--
ALTER TABLE `glpi_planningexternalevents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `name` (`name`),
  ADD KEY `planningexternaleventtemplates_id` (`planningexternaleventtemplates_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date` (`date`),
  ADD KEY `begin` (`begin`),
  ADD KEY `end` (`end`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `state` (`state`),
  ADD KEY `planningeventcategories_id` (`planningeventcategories_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_planningexternaleventtemplates`
--
ALTER TABLE `glpi_planningexternaleventtemplates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `state` (`state`),
  ADD KEY `planningeventcategories_id` (`planningeventcategories_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_planningrecalls`
--
ALTER TABLE `glpi_planningrecalls`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`itemtype`,`items_id`,`users_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `before_time` (`before_time`),
  ADD KEY `when` (`when`);

--
-- Índices para tabela `glpi_plugins`
--
ALTER TABLE `glpi_plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`directory`),
  ADD KEY `name` (`name`),
  ADD KEY `state` (`state`);

--
-- Índices para tabela `glpi_plugs`
--
ALTER TABLE `glpi_plugs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_printerlogs`
--
ALTER TABLE `glpi_printerlogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`printers_id`,`date`),
  ADD KEY `date` (`date`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_printermodels`
--
ALTER TABLE `glpi_printermodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `product_number` (`product_number`);

--
-- Índices para tabela `glpi_printers`
--
ALTER TABLE `glpi_printers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `is_template` (`is_template`),
  ADD KEY `is_global` (`is_global`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `printermodels_id` (`printermodels_id`),
  ADD KEY `networks_id` (`networks_id`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `printertypes_id` (`printertypes_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `last_pages_counter` (`last_pages_counter`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `serial` (`serial`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `uuid` (`uuid`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `snmpcredentials_id` (`snmpcredentials_id`),
  ADD KEY `autoupdatesystems_id` (`autoupdatesystems_id`);

--
-- Índices para tabela `glpi_printers_cartridgeinfos`
--
ALTER TABLE `glpi_printers_cartridgeinfos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `printers_id` (`printers_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_printertypes`
--
ALTER TABLE `glpi_printertypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_problemcosts`
--
ALTER TABLE `glpi_problemcosts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `problems_id` (`problems_id`),
  ADD KEY `begin_date` (`begin_date`),
  ADD KEY `end_date` (`end_date`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `budgets_id` (`budgets_id`);

--
-- Índices para tabela `glpi_problems`
--
ALTER TABLE `glpi_problems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `date` (`date`),
  ADD KEY `closedate` (`closedate`),
  ADD KEY `status` (`status`),
  ADD KEY `priority` (`priority`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `itilcategories_id` (`itilcategories_id`),
  ADD KEY `users_id_recipient` (`users_id_recipient`),
  ADD KEY `solvedate` (`solvedate`),
  ADD KEY `urgency` (`urgency`),
  ADD KEY `impact` (`impact`),
  ADD KEY `time_to_resolve` (`time_to_resolve`),
  ADD KEY `users_id_lastupdater` (`users_id_lastupdater`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `locations_id` (`locations_id`);

--
-- Índices para tabela `glpi_problems_suppliers`
--
ALTER TABLE `glpi_problems_suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`problems_id`,`type`,`suppliers_id`),
  ADD KEY `group` (`suppliers_id`,`type`);

--
-- Índices para tabela `glpi_problems_tickets`
--
ALTER TABLE `glpi_problems_tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`problems_id`,`tickets_id`),
  ADD KEY `tickets_id` (`tickets_id`);

--
-- Índices para tabela `glpi_problems_users`
--
ALTER TABLE `glpi_problems_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`problems_id`,`type`,`users_id`,`alternative_email`),
  ADD KEY `user` (`users_id`,`type`);

--
-- Índices para tabela `glpi_problemtasks`
--
ALTER TABLE `glpi_problemtasks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `problems_id` (`problems_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `users_id_editor` (`users_id_editor`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `date` (`date`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `begin` (`begin`),
  ADD KEY `end` (`end`),
  ADD KEY `state` (`state`),
  ADD KEY `taskcategories_id` (`taskcategories_id`),
  ADD KEY `tasktemplates_id` (`tasktemplates_id`),
  ADD KEY `is_private` (`is_private`);

--
-- Índices para tabela `glpi_problemtemplatehiddenfields`
--
ALTER TABLE `glpi_problemtemplatehiddenfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`problemtemplates_id`,`num`);

--
-- Índices para tabela `glpi_problemtemplatemandatoryfields`
--
ALTER TABLE `glpi_problemtemplatemandatoryfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`problemtemplates_id`,`num`);

--
-- Índices para tabela `glpi_problemtemplatepredefinedfields`
--
ALTER TABLE `glpi_problemtemplatepredefinedfields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `problemtemplates_id` (`problemtemplates_id`);

--
-- Índices para tabela `glpi_problemtemplates`
--
ALTER TABLE `glpi_problemtemplates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Índices para tabela `glpi_profilerights`
--
ALTER TABLE `glpi_profilerights`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`profiles_id`,`name`),
  ADD KEY `name` (`name`);

--
-- Índices para tabela `glpi_profiles`
--
ALTER TABLE `glpi_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `interface` (`interface`),
  ADD KEY `is_default` (`is_default`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `tickettemplates_id` (`tickettemplates_id`),
  ADD KEY `changetemplates_id` (`changetemplates_id`),
  ADD KEY `problemtemplates_id` (`problemtemplates_id`);

--
-- Índices para tabela `glpi_profiles_reminders`
--
ALTER TABLE `glpi_profiles_reminders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reminders_id` (`reminders_id`),
  ADD KEY `profiles_id` (`profiles_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Índices para tabela `glpi_profiles_rssfeeds`
--
ALTER TABLE `glpi_profiles_rssfeeds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rssfeeds_id` (`rssfeeds_id`),
  ADD KEY `profiles_id` (`profiles_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Índices para tabela `glpi_profiles_users`
--
ALTER TABLE `glpi_profiles_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `profiles_id` (`profiles_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `is_dynamic` (`is_dynamic`);

--
-- Índices para tabela `glpi_projectcosts`
--
ALTER TABLE `glpi_projectcosts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `projects_id` (`projects_id`),
  ADD KEY `begin_date` (`begin_date`),
  ADD KEY `end_date` (`end_date`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `budgets_id` (`budgets_id`);

--
-- Índices para tabela `glpi_projects`
--
ALTER TABLE `glpi_projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `code` (`code`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `projects_id` (`projects_id`),
  ADD KEY `projectstates_id` (`projectstates_id`),
  ADD KEY `projecttypes_id` (`projecttypes_id`),
  ADD KEY `priority` (`priority`),
  ADD KEY `date` (`date`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `plan_start_date` (`plan_start_date`),
  ADD KEY `plan_end_date` (`plan_end_date`),
  ADD KEY `real_start_date` (`real_start_date`),
  ADD KEY `real_end_date` (`real_end_date`),
  ADD KEY `percent_done` (`percent_done`),
  ADD KEY `show_on_global_gantt` (`show_on_global_gantt`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `projecttemplates_id` (`projecttemplates_id`),
  ADD KEY `is_template` (`is_template`);

--
-- Índices para tabela `glpi_projectstates`
--
ALTER TABLE `glpi_projectstates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `is_finished` (`is_finished`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_projecttasklinks`
--
ALTER TABLE `glpi_projecttasklinks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projecttasks_id_source` (`projecttasks_id_source`),
  ADD KEY `projecttasks_id_target` (`projecttasks_id_target`);

--
-- Índices para tabela `glpi_projecttasks`
--
ALTER TABLE `glpi_projecttasks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `projects_id` (`projects_id`),
  ADD KEY `projecttasks_id` (`projecttasks_id`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `plan_start_date` (`plan_start_date`),
  ADD KEY `plan_end_date` (`plan_end_date`),
  ADD KEY `real_start_date` (`real_start_date`),
  ADD KEY `real_end_date` (`real_end_date`),
  ADD KEY `percent_done` (`percent_done`),
  ADD KEY `projectstates_id` (`projectstates_id`),
  ADD KEY `projecttasktypes_id` (`projecttasktypes_id`),
  ADD KEY `projecttasktemplates_id` (`projecttasktemplates_id`),
  ADD KEY `is_template` (`is_template`),
  ADD KEY `is_milestone` (`is_milestone`);

--
-- Índices para tabela `glpi_projecttasks_tickets`
--
ALTER TABLE `glpi_projecttasks_tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`tickets_id`,`projecttasks_id`),
  ADD KEY `projects_id` (`projecttasks_id`);

--
-- Índices para tabela `glpi_projecttaskteams`
--
ALTER TABLE `glpi_projecttaskteams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`projecttasks_id`,`itemtype`,`items_id`),
  ADD KEY `item` (`itemtype`,`items_id`);

--
-- Índices para tabela `glpi_projecttasktemplates`
--
ALTER TABLE `glpi_projecttasktemplates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `projects_id` (`projects_id`),
  ADD KEY `projecttasks_id` (`projecttasks_id`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `plan_start_date` (`plan_start_date`),
  ADD KEY `plan_end_date` (`plan_end_date`),
  ADD KEY `real_start_date` (`real_start_date`),
  ADD KEY `real_end_date` (`real_end_date`),
  ADD KEY `percent_done` (`percent_done`),
  ADD KEY `projectstates_id` (`projectstates_id`),
  ADD KEY `projecttasktypes_id` (`projecttasktypes_id`),
  ADD KEY `is_milestone` (`is_milestone`);

--
-- Índices para tabela `glpi_projecttasktypes`
--
ALTER TABLE `glpi_projecttasktypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_projectteams`
--
ALTER TABLE `glpi_projectteams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`projects_id`,`itemtype`,`items_id`),
  ADD KEY `item` (`itemtype`,`items_id`);

--
-- Índices para tabela `glpi_projecttypes`
--
ALTER TABLE `glpi_projecttypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_queuednotifications`
--
ALTER TABLE `glpi_queuednotifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item` (`itemtype`,`items_id`,`notificationtemplates_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `sent_try` (`sent_try`),
  ADD KEY `create_time` (`create_time`),
  ADD KEY `send_time` (`send_time`),
  ADD KEY `sent_time` (`sent_time`),
  ADD KEY `mode` (`mode`),
  ADD KEY `notificationtemplates_id` (`notificationtemplates_id`),
  ADD KEY `recipient` (`recipient`(255));

--
-- Índices para tabela `glpi_rackmodels`
--
ALTER TABLE `glpi_rackmodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `product_number` (`product_number`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Índices para tabela `glpi_racks`
--
ALTER TABLE `glpi_racks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `rackmodels_id` (`rackmodels_id`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `racktypes_id` (`racktypes_id`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `group_id_tech` (`groups_id_tech`),
  ADD KEY `is_template` (`is_template`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `dcrooms_id` (`dcrooms_id`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Índices para tabela `glpi_racktypes`
--
ALTER TABLE `glpi_racktypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `name` (`name`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Índices para tabela `glpi_recurrentchanges`
--
ALTER TABLE `glpi_recurrentchanges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `changetemplates_id` (`changetemplates_id`),
  ADD KEY `next_creation_date` (`next_creation_date`),
  ADD KEY `calendars_id` (`calendars_id`);

--
-- Índices para tabela `glpi_refusedequipments`
--
ALTER TABLE `glpi_refusedequipments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `agents_id` (`agents_id`),
  ADD KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  ADD KEY `rules_id` (`rules_id`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Índices para tabela `glpi_registeredids`
--
ALTER TABLE `glpi_registeredids`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `device_type` (`device_type`);

--
-- Índices para tabela `glpi_reminders`
--
ALTER TABLE `glpi_reminders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `name` (`name`),
  ADD KEY `date` (`date`),
  ADD KEY `begin` (`begin`),
  ADD KEY `end` (`end`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `is_planned` (`is_planned`),
  ADD KEY `state` (`state`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_reminders_users`
--
ALTER TABLE `glpi_reminders_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reminders_id` (`reminders_id`),
  ADD KEY `users_id` (`users_id`);

--
-- Índices para tabela `glpi_remindertranslations`
--
ALTER TABLE `glpi_remindertranslations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item` (`reminders_id`,`language`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `date_mod` (`date_mod`);

--
-- Índices para tabela `glpi_requesttypes`
--
ALTER TABLE `glpi_requesttypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `is_helpdesk_default` (`is_helpdesk_default`),
  ADD KEY `is_followup_default` (`is_followup_default`),
  ADD KEY `is_mail_default` (`is_mail_default`),
  ADD KEY `is_mailfollowup_default` (`is_mailfollowup_default`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `is_ticketheader` (`is_ticketheader`),
  ADD KEY `is_itilfollowup` (`is_itilfollowup`);

--
-- Índices para tabela `glpi_reservationitems`
--
ALTER TABLE `glpi_reservationitems`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`itemtype`,`items_id`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Índices para tabela `glpi_reservations`
--
ALTER TABLE `glpi_reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `begin` (`begin`),
  ADD KEY `end` (`end`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `resagroup` (`reservationitems_id`,`group`);

--
-- Índices para tabela `glpi_rssfeeds`
--
ALTER TABLE `glpi_rssfeeds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `have_error` (`have_error`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_rssfeeds_users`
--
ALTER TABLE `glpi_rssfeeds_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rssfeeds_id` (`rssfeeds_id`),
  ADD KEY `users_id` (`users_id`);

--
-- Índices para tabela `glpi_ruleactions`
--
ALTER TABLE `glpi_ruleactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rules_id` (`rules_id`),
  ADD KEY `field_value` (`field`(50),`value`(50));

--
-- Índices para tabela `glpi_rulecriterias`
--
ALTER TABLE `glpi_rulecriterias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rules_id` (`rules_id`),
  ADD KEY `condition` (`condition`);

--
-- Índices para tabela `glpi_rulematchedlogs`
--
ALTER TABLE `glpi_rulematchedlogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agents_id` (`agents_id`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `rules_id` (`rules_id`);

--
-- Índices para tabela `glpi_rulerightparameters`
--
ALTER TABLE `glpi_rulerightparameters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_rules`
--
ALTER TABLE `glpi_rules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `sub_type` (`sub_type`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `condition` (`condition`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_savedsearches`
--
ALTER TABLE `glpi_savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `type` (`type`),
  ADD KEY `itemtype` (`itemtype`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `is_private` (`is_private`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `last_execution_time` (`last_execution_time`),
  ADD KEY `last_execution_date` (`last_execution_date`),
  ADD KEY `do_count` (`do_count`);

--
-- Índices para tabela `glpi_savedsearches_alerts`
--
ALTER TABLE `glpi_savedsearches_alerts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`savedsearches_id`,`operator`,`value`),
  ADD KEY `name` (`name`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_savedsearches_users`
--
ALTER TABLE `glpi_savedsearches_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`users_id`,`itemtype`),
  ADD KEY `savedsearches_id` (`savedsearches_id`);

--
-- Índices para tabela `glpi_slalevelactions`
--
ALTER TABLE `glpi_slalevelactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slalevels_id` (`slalevels_id`);

--
-- Índices para tabela `glpi_slalevelcriterias`
--
ALTER TABLE `glpi_slalevelcriterias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slalevels_id` (`slalevels_id`),
  ADD KEY `condition` (`condition`);

--
-- Índices para tabela `glpi_slalevels`
--
ALTER TABLE `glpi_slalevels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `slas_id` (`slas_id`);

--
-- Índices para tabela `glpi_slalevels_tickets`
--
ALTER TABLE `glpi_slalevels_tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`tickets_id`,`slalevels_id`),
  ADD KEY `slalevels_id` (`slalevels_id`);

--
-- Índices para tabela `glpi_slas`
--
ALTER TABLE `glpi_slas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `calendars_id` (`calendars_id`),
  ADD KEY `slms_id` (`slms_id`);

--
-- Índices para tabela `glpi_slms`
--
ALTER TABLE `glpi_slms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `calendars_id` (`calendars_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_snmpcredentials`
--
ALTER TABLE `glpi_snmpcredentials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `snmpversion` (`snmpversion`),
  ADD KEY `is_deleted` (`is_deleted`);

--
-- Índices para tabela `glpi_socketmodels`
--
ALTER TABLE `glpi_socketmodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_sockets`
--
ALTER TABLE `glpi_sockets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `socketmodels_id` (`socketmodels_id`),
  ADD KEY `location_name` (`locations_id`,`name`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `networkports_id` (`networkports_id`),
  ADD KEY `wiring_side` (`wiring_side`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_softwarecategories`
--
ALTER TABLE `glpi_softwarecategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `softwarecategories_id` (`softwarecategories_id`),
  ADD KEY `level` (`level`);

--
-- Índices para tabela `glpi_softwarelicenses`
--
ALTER TABLE `glpi_softwarelicenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `is_template` (`is_template`),
  ADD KEY `serial` (`serial`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `expire` (`expire`),
  ADD KEY `softwareversions_id_buy` (`softwareversions_id_buy`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `softwarelicensetypes_id` (`softwarelicensetypes_id`),
  ADD KEY `softwareversions_id_use` (`softwareversions_id_use`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `softwares_id_expire_number` (`softwares_id`,`expire`,`number`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `is_helpdesk_visible` (`is_helpdesk_visible`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `allow_overquota` (`allow_overquota`),
  ADD KEY `softwarelicenses_id` (`softwarelicenses_id`),
  ADD KEY `level` (`level`);

--
-- Índices para tabela `glpi_softwarelicensetypes`
--
ALTER TABLE `glpi_softwarelicensetypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `softwarelicensetypes_id` (`softwarelicensetypes_id`),
  ADD KEY `level` (`level`);

--
-- Índices para tabela `glpi_softwares`
--
ALTER TABLE `glpi_softwares`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `name` (`name`),
  ADD KEY `is_template` (`is_template`),
  ADD KEY `is_update` (`is_update`),
  ADD KEY `softwarecategories_id` (`softwarecategories_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `softwares_id` (`softwares_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_helpdesk_visible` (`is_helpdesk_visible`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_softwareversions`
--
ALTER TABLE `glpi_softwareversions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `arch` (`arch`),
  ADD KEY `softwares_id` (`softwares_id`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `operatingsystems_id` (`operatingsystems_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_solutiontemplates`
--
ALTER TABLE `glpi_solutiontemplates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `solutiontypes_id` (`solutiontypes_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_solutiontypes`
--
ALTER TABLE `glpi_solutiontypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_ssovariables`
--
ALTER TABLE `glpi_ssovariables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_states`
--
ALTER TABLE `glpi_states`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`states_id`,`name`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `is_visible_computer` (`is_visible_computer`),
  ADD KEY `is_visible_monitor` (`is_visible_monitor`),
  ADD KEY `is_visible_networkequipment` (`is_visible_networkequipment`),
  ADD KEY `is_visible_peripheral` (`is_visible_peripheral`),
  ADD KEY `is_visible_phone` (`is_visible_phone`),
  ADD KEY `is_visible_printer` (`is_visible_printer`),
  ADD KEY `is_visible_softwareversion` (`is_visible_softwareversion`),
  ADD KEY `is_visible_softwarelicense` (`is_visible_softwarelicense`),
  ADD KEY `is_visible_line` (`is_visible_line`),
  ADD KEY `is_visible_certificate` (`is_visible_certificate`),
  ADD KEY `is_visible_rack` (`is_visible_rack`),
  ADD KEY `is_visible_passivedcequipment` (`is_visible_passivedcequipment`),
  ADD KEY `is_visible_enclosure` (`is_visible_enclosure`),
  ADD KEY `is_visible_pdu` (`is_visible_pdu`),
  ADD KEY `is_visible_cluster` (`is_visible_cluster`),
  ADD KEY `is_visible_contract` (`is_visible_contract`),
  ADD KEY `is_visible_appliance` (`is_visible_appliance`),
  ADD KEY `is_visible_databaseinstance` (`is_visible_databaseinstance`),
  ADD KEY `is_visible_cable` (`is_visible_cable`),
  ADD KEY `is_visible_unmanaged` (`is_visible_unmanaged`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `level` (`level`);

--
-- Índices para tabela `glpi_suppliers`
--
ALTER TABLE `glpi_suppliers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `suppliertypes_id` (`suppliertypes_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `is_active` (`is_active`);

--
-- Índices para tabela `glpi_suppliers_tickets`
--
ALTER TABLE `glpi_suppliers_tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`tickets_id`,`type`,`suppliers_id`),
  ADD KEY `group` (`suppliers_id`,`type`);

--
-- Índices para tabela `glpi_suppliertypes`
--
ALTER TABLE `glpi_suppliertypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_taskcategories`
--
ALTER TABLE `glpi_taskcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `taskcategories_id` (`taskcategories_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `is_helpdeskvisible` (`is_helpdeskvisible`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `knowbaseitemcategories_id` (`knowbaseitemcategories_id`),
  ADD KEY `level` (`level`);

--
-- Índices para tabela `glpi_tasktemplates`
--
ALTER TABLE `glpi_tasktemplates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `taskcategories_id` (`taskcategories_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `is_private` (`is_private`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `groups_id_tech` (`groups_id_tech`);

--
-- Índices para tabela `glpi_ticketcosts`
--
ALTER TABLE `glpi_ticketcosts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `tickets_id` (`tickets_id`),
  ADD KEY `begin_date` (`begin_date`),
  ADD KEY `end_date` (`end_date`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `budgets_id` (`budgets_id`);

--
-- Índices para tabela `glpi_ticketrecurrents`
--
ALTER TABLE `glpi_ticketrecurrents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `tickettemplates_id` (`tickettemplates_id`),
  ADD KEY `next_creation_date` (`next_creation_date`),
  ADD KEY `calendars_id` (`calendars_id`);

--
-- Índices para tabela `glpi_tickets`
--
ALTER TABLE `glpi_tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date` (`date`),
  ADD KEY `closedate` (`closedate`),
  ADD KEY `status` (`status`),
  ADD KEY `priority` (`priority`),
  ADD KEY `request_type` (`requesttypes_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `users_id_recipient` (`users_id_recipient`),
  ADD KEY `solvedate` (`solvedate`),
  ADD KEY `takeintoaccountdate` (`takeintoaccountdate`),
  ADD KEY `urgency` (`urgency`),
  ADD KEY `impact` (`impact`),
  ADD KEY `global_validation` (`global_validation`),
  ADD KEY `slas_id_tto` (`slas_id_tto`),
  ADD KEY `slas_id_ttr` (`slas_id_ttr`),
  ADD KEY `time_to_resolve` (`time_to_resolve`),
  ADD KEY `time_to_own` (`time_to_own`),
  ADD KEY `olas_id_tto` (`olas_id_tto`),
  ADD KEY `olas_id_ttr` (`olas_id_ttr`),
  ADD KEY `slalevels_id_ttr` (`slalevels_id_ttr`),
  ADD KEY `internal_time_to_resolve` (`internal_time_to_resolve`),
  ADD KEY `internal_time_to_own` (`internal_time_to_own`),
  ADD KEY `users_id_lastupdater` (`users_id_lastupdater`),
  ADD KEY `type` (`type`),
  ADD KEY `itilcategories_id` (`itilcategories_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `name` (`name`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `ola_waiting_duration` (`ola_waiting_duration`),
  ADD KEY `olalevels_id_ttr` (`olalevels_id_ttr`);

--
-- Índices para tabela `glpi_ticketsatisfactions`
--
ALTER TABLE `glpi_ticketsatisfactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tickets_id` (`tickets_id`);

--
-- Índices para tabela `glpi_tickets_contracts`
--
ALTER TABLE `glpi_tickets_contracts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`tickets_id`,`contracts_id`),
  ADD KEY `contracts_id` (`contracts_id`);

--
-- Índices para tabela `glpi_tickets_tickets`
--
ALTER TABLE `glpi_tickets_tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`tickets_id_1`,`tickets_id_2`),
  ADD KEY `tickets_id_2` (`tickets_id_2`);

--
-- Índices para tabela `glpi_tickets_users`
--
ALTER TABLE `glpi_tickets_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`tickets_id`,`type`,`users_id`,`alternative_email`),
  ADD KEY `user` (`users_id`,`type`);

--
-- Índices para tabela `glpi_tickettasks`
--
ALTER TABLE `glpi_tickettasks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `date` (`date`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `users_id_editor` (`users_id_editor`),
  ADD KEY `tickets_id` (`tickets_id`),
  ADD KEY `is_private` (`is_private`),
  ADD KEY `taskcategories_id` (`taskcategories_id`),
  ADD KEY `state` (`state`),
  ADD KEY `users_id_tech` (`users_id_tech`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `begin` (`begin`),
  ADD KEY `end` (`end`),
  ADD KEY `tasktemplates_id` (`tasktemplates_id`),
  ADD KEY `sourceitems_id` (`sourceitems_id`),
  ADD KEY `sourceof_items_id` (`sourceof_items_id`);

--
-- Índices para tabela `glpi_tickettemplatehiddenfields`
--
ALTER TABLE `glpi_tickettemplatehiddenfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`tickettemplates_id`,`num`);

--
-- Índices para tabela `glpi_tickettemplatemandatoryfields`
--
ALTER TABLE `glpi_tickettemplatemandatoryfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`tickettemplates_id`,`num`);

--
-- Índices para tabela `glpi_tickettemplatepredefinedfields`
--
ALTER TABLE `glpi_tickettemplatepredefinedfields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickettemplates_id` (`tickettemplates_id`);

--
-- Índices para tabela `glpi_tickettemplates`
--
ALTER TABLE `glpi_tickettemplates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`);

--
-- Índices para tabela `glpi_ticketvalidations`
--
ALTER TABLE `glpi_ticketvalidations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `users_id_validate` (`users_id_validate`),
  ADD KEY `tickets_id` (`tickets_id`),
  ADD KEY `submission_date` (`submission_date`),
  ADD KEY `validation_date` (`validation_date`),
  ADD KEY `status` (`status`);

--
-- Índices para tabela `glpi_transfers`
--
ALTER TABLE `glpi_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_unmanageds`
--
ALTER TABLE `glpi_unmanageds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `manufacturers_id` (`manufacturers_id`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `networks_id` (`networks_id`),
  ADD KEY `states_id` (`states_id`),
  ADD KEY `groups_id_tech` (`groups_id_tech`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `is_dynamic` (`is_dynamic`),
  ADD KEY `serial` (`serial`),
  ADD KEY `otherserial` (`otherserial`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  ADD KEY `agents_id` (`agents_id`),
  ADD KEY `snmpcredentials_id` (`snmpcredentials_id`),
  ADD KEY `users_id_tech` (`users_id_tech`);

--
-- Índices para tabela `glpi_usbvendors`
--
ALTER TABLE `glpi_usbvendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`vendorid`,`deviceid`),
  ADD KEY `deviceid` (`deviceid`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_usercategories`
--
ALTER TABLE `glpi_usercategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_useremails`
--
ALTER TABLE `glpi_useremails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`users_id`,`email`),
  ADD KEY `email` (`email`),
  ADD KEY `is_default` (`is_default`),
  ADD KEY `is_dynamic` (`is_dynamic`);

--
-- Índices para tabela `glpi_users`
--
ALTER TABLE `glpi_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicityloginauth` (`name`,`authtype`,`auths_id`),
  ADD KEY `firstname` (`firstname`),
  ADD KEY `realname` (`realname`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `profiles_id` (`profiles_id`),
  ADD KEY `locations_id` (`locations_id`),
  ADD KEY `usertitles_id` (`usertitles_id`),
  ADD KEY `usercategories_id` (`usercategories_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `authitem` (`authtype`,`auths_id`),
  ADD KEY `is_deleted_ldap` (`is_deleted_ldap`),
  ADD KEY `date_creation` (`date_creation`),
  ADD KEY `begin_date` (`begin_date`),
  ADD KEY `end_date` (`end_date`),
  ADD KEY `sync_field` (`sync_field`),
  ADD KEY `groups_id` (`groups_id`),
  ADD KEY `users_id_supervisor` (`users_id_supervisor`),
  ADD KEY `auths_id` (`auths_id`),
  ADD KEY `default_requesttypes_id` (`default_requesttypes_id`),
  ADD KEY `user_dn_hash` (`user_dn_hash`);

--
-- Índices para tabela `glpi_usertitles`
--
ALTER TABLE `glpi_usertitles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_virtualmachinestates`
--
ALTER TABLE `glpi_virtualmachinestates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_virtualmachinesystems`
--
ALTER TABLE `glpi_virtualmachinesystems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_virtualmachinetypes`
--
ALTER TABLE `glpi_virtualmachinetypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_vlans`
--
ALTER TABLE `glpi_vlans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `tag` (`tag`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_vobjects`
--
ALTER TABLE `glpi_vobjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unicity` (`itemtype`,`items_id`),
  ADD KEY `item` (`itemtype`,`items_id`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- Índices para tabela `glpi_wifinetworks`
--
ALTER TABLE `glpi_wifinetworks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `is_recursive` (`is_recursive`),
  ADD KEY `essid` (`essid`),
  ADD KEY `name` (`name`),
  ADD KEY `date_mod` (`date_mod`),
  ADD KEY `date_creation` (`date_creation`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `glpi_agents`
--
ALTER TABLE `glpi_agents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_agenttypes`
--
ALTER TABLE `glpi_agenttypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `glpi_alerts`
--
ALTER TABLE `glpi_alerts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_apiclients`
--
ALTER TABLE `glpi_apiclients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `glpi_applianceenvironments`
--
ALTER TABLE `glpi_applianceenvironments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_appliances`
--
ALTER TABLE `glpi_appliances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_appliances_items`
--
ALTER TABLE `glpi_appliances_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_appliances_items_relations`
--
ALTER TABLE `glpi_appliances_items_relations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_appliancetypes`
--
ALTER TABLE `glpi_appliancetypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_authldapreplicates`
--
ALTER TABLE `glpi_authldapreplicates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_authldaps`
--
ALTER TABLE `glpi_authldaps`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_authmails`
--
ALTER TABLE `glpi_authmails`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_autoupdatesystems`
--
ALTER TABLE `glpi_autoupdatesystems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_blacklistedmailcontents`
--
ALTER TABLE `glpi_blacklistedmailcontents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_blacklists`
--
ALTER TABLE `glpi_blacklists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de tabela `glpi_budgets`
--
ALTER TABLE `glpi_budgets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_budgettypes`
--
ALTER TABLE `glpi_budgettypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_businesscriticities`
--
ALTER TABLE `glpi_businesscriticities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_cables`
--
ALTER TABLE `glpi_cables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_cablestrands`
--
ALTER TABLE `glpi_cablestrands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_cabletypes`
--
ALTER TABLE `glpi_cabletypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_calendars`
--
ALTER TABLE `glpi_calendars`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `glpi_calendarsegments`
--
ALTER TABLE `glpi_calendarsegments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `glpi_calendars_holidays`
--
ALTER TABLE `glpi_calendars_holidays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_cartridgeitems`
--
ALTER TABLE `glpi_cartridgeitems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_cartridgeitems_printermodels`
--
ALTER TABLE `glpi_cartridgeitems_printermodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_cartridgeitemtypes`
--
ALTER TABLE `glpi_cartridgeitemtypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_cartridges`
--
ALTER TABLE `glpi_cartridges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_certificates`
--
ALTER TABLE `glpi_certificates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_certificates_items`
--
ALTER TABLE `glpi_certificates_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_certificatetypes`
--
ALTER TABLE `glpi_certificatetypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_changecosts`
--
ALTER TABLE `glpi_changecosts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_changes`
--
ALTER TABLE `glpi_changes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_changes_groups`
--
ALTER TABLE `glpi_changes_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_changes_items`
--
ALTER TABLE `glpi_changes_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_changes_problems`
--
ALTER TABLE `glpi_changes_problems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_changes_suppliers`
--
ALTER TABLE `glpi_changes_suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_changes_tickets`
--
ALTER TABLE `glpi_changes_tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_changes_users`
--
ALTER TABLE `glpi_changes_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_changetasks`
--
ALTER TABLE `glpi_changetasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_changetemplatehiddenfields`
--
ALTER TABLE `glpi_changetemplatehiddenfields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_changetemplatemandatoryfields`
--
ALTER TABLE `glpi_changetemplatemandatoryfields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `glpi_changetemplatepredefinedfields`
--
ALTER TABLE `glpi_changetemplatepredefinedfields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_changetemplates`
--
ALTER TABLE `glpi_changetemplates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `glpi_changevalidations`
--
ALTER TABLE `glpi_changevalidations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_clusters`
--
ALTER TABLE `glpi_clusters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_clustertypes`
--
ALTER TABLE `glpi_clustertypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_computerantiviruses`
--
ALTER TABLE `glpi_computerantiviruses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_computermodels`
--
ALTER TABLE `glpi_computermodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_computers`
--
ALTER TABLE `glpi_computers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_computers_items`
--
ALTER TABLE `glpi_computers_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_computertypes`
--
ALTER TABLE `glpi_computertypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_computervirtualmachines`
--
ALTER TABLE `glpi_computervirtualmachines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_configs`
--
ALTER TABLE `glpi_configs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=311;

--
-- AUTO_INCREMENT de tabela `glpi_consumableitems`
--
ALTER TABLE `glpi_consumableitems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_consumableitemtypes`
--
ALTER TABLE `glpi_consumableitemtypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_consumables`
--
ALTER TABLE `glpi_consumables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_contacts`
--
ALTER TABLE `glpi_contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_contacts_suppliers`
--
ALTER TABLE `glpi_contacts_suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_contacttypes`
--
ALTER TABLE `glpi_contacttypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_contractcosts`
--
ALTER TABLE `glpi_contractcosts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_contracts`
--
ALTER TABLE `glpi_contracts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_contracts_items`
--
ALTER TABLE `glpi_contracts_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_contracts_suppliers`
--
ALTER TABLE `glpi_contracts_suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_contracttypes`
--
ALTER TABLE `glpi_contracttypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_crontasklogs`
--
ALTER TABLE `glpi_crontasklogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=592;

--
-- AUTO_INCREMENT de tabela `glpi_crontasks`
--
ALTER TABLE `glpi_crontasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de tabela `glpi_dashboards_dashboards`
--
ALTER TABLE `glpi_dashboards_dashboards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `glpi_dashboards_filters`
--
ALTER TABLE `glpi_dashboards_filters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_dashboards_items`
--
ALTER TABLE `glpi_dashboards_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de tabela `glpi_dashboards_rights`
--
ALTER TABLE `glpi_dashboards_rights`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_databaseinstancecategories`
--
ALTER TABLE `glpi_databaseinstancecategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_databaseinstances`
--
ALTER TABLE `glpi_databaseinstances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_databaseinstancetypes`
--
ALTER TABLE `glpi_databaseinstancetypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_databases`
--
ALTER TABLE `glpi_databases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_datacenters`
--
ALTER TABLE `glpi_datacenters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_dcrooms`
--
ALTER TABLE `glpi_dcrooms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_devicebatteries`
--
ALTER TABLE `glpi_devicebatteries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_devicebatterymodels`
--
ALTER TABLE `glpi_devicebatterymodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_devicebatterytypes`
--
ALTER TABLE `glpi_devicebatterytypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_devicecameramodels`
--
ALTER TABLE `glpi_devicecameramodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_devicecameras`
--
ALTER TABLE `glpi_devicecameras`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_devicecasemodels`
--
ALTER TABLE `glpi_devicecasemodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_devicecases`
--
ALTER TABLE `glpi_devicecases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_devicecasetypes`
--
ALTER TABLE `glpi_devicecasetypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_devicecontrolmodels`
--
ALTER TABLE `glpi_devicecontrolmodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_devicecontrols`
--
ALTER TABLE `glpi_devicecontrols`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_devicedrivemodels`
--
ALTER TABLE `glpi_devicedrivemodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_devicedrives`
--
ALTER TABLE `glpi_devicedrives`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_devicefirmwaremodels`
--
ALTER TABLE `glpi_devicefirmwaremodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_devicefirmwares`
--
ALTER TABLE `glpi_devicefirmwares`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_devicefirmwaretypes`
--
ALTER TABLE `glpi_devicefirmwaretypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `glpi_devicegenericmodels`
--
ALTER TABLE `glpi_devicegenericmodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_devicegenerics`
--
ALTER TABLE `glpi_devicegenerics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_devicegenerictypes`
--
ALTER TABLE `glpi_devicegenerictypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_devicegraphiccardmodels`
--
ALTER TABLE `glpi_devicegraphiccardmodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_devicegraphiccards`
--
ALTER TABLE `glpi_devicegraphiccards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_deviceharddrivemodels`
--
ALTER TABLE `glpi_deviceharddrivemodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_deviceharddrives`
--
ALTER TABLE `glpi_deviceharddrives`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_devicememories`
--
ALTER TABLE `glpi_devicememories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_devicememorymodels`
--
ALTER TABLE `glpi_devicememorymodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_devicememorytypes`
--
ALTER TABLE `glpi_devicememorytypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `glpi_devicemotherboardmodels`
--
ALTER TABLE `glpi_devicemotherboardmodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_devicemotherboards`
--
ALTER TABLE `glpi_devicemotherboards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_devicenetworkcardmodels`
--
ALTER TABLE `glpi_devicenetworkcardmodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_devicenetworkcards`
--
ALTER TABLE `glpi_devicenetworkcards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_devicepcimodels`
--
ALTER TABLE `glpi_devicepcimodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_devicepcis`
--
ALTER TABLE `glpi_devicepcis`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_devicepowersupplies`
--
ALTER TABLE `glpi_devicepowersupplies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_devicepowersupplymodels`
--
ALTER TABLE `glpi_devicepowersupplymodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_deviceprocessormodels`
--
ALTER TABLE `glpi_deviceprocessormodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_deviceprocessors`
--
ALTER TABLE `glpi_deviceprocessors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_devicesensormodels`
--
ALTER TABLE `glpi_devicesensormodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_devicesensors`
--
ALTER TABLE `glpi_devicesensors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_devicesensortypes`
--
ALTER TABLE `glpi_devicesensortypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_devicesimcards`
--
ALTER TABLE `glpi_devicesimcards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_devicesimcardtypes`
--
ALTER TABLE `glpi_devicesimcardtypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `glpi_devicesoundcardmodels`
--
ALTER TABLE `glpi_devicesoundcardmodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_devicesoundcards`
--
ALTER TABLE `glpi_devicesoundcards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_displaypreferences`
--
ALTER TABLE `glpi_displaypreferences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=308;

--
-- AUTO_INCREMENT de tabela `glpi_documentcategories`
--
ALTER TABLE `glpi_documentcategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_documents`
--
ALTER TABLE `glpi_documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `glpi_documents_items`
--
ALTER TABLE `glpi_documents_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `glpi_documenttypes`
--
ALTER TABLE `glpi_documenttypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de tabela `glpi_domainrecords`
--
ALTER TABLE `glpi_domainrecords`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_domainrecordtypes`
--
ALTER TABLE `glpi_domainrecordtypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `glpi_domainrelations`
--
ALTER TABLE `glpi_domainrelations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `glpi_domains`
--
ALTER TABLE `glpi_domains`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_domains_items`
--
ALTER TABLE `glpi_domains_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_domaintypes`
--
ALTER TABLE `glpi_domaintypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_dropdowntranslations`
--
ALTER TABLE `glpi_dropdowntranslations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_enclosuremodels`
--
ALTER TABLE `glpi_enclosuremodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_enclosures`
--
ALTER TABLE `glpi_enclosures`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_entities_knowbaseitems`
--
ALTER TABLE `glpi_entities_knowbaseitems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_entities_reminders`
--
ALTER TABLE `glpi_entities_reminders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_entities_rssfeeds`
--
ALTER TABLE `glpi_entities_rssfeeds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_events`
--
ALTER TABLE `glpi_events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT de tabela `glpi_fieldblacklists`
--
ALTER TABLE `glpi_fieldblacklists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_fieldunicities`
--
ALTER TABLE `glpi_fieldunicities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_filesystems`
--
ALTER TABLE `glpi_filesystems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `glpi_fqdns`
--
ALTER TABLE `glpi_fqdns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_groups`
--
ALTER TABLE `glpi_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_groups_knowbaseitems`
--
ALTER TABLE `glpi_groups_knowbaseitems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_groups_problems`
--
ALTER TABLE `glpi_groups_problems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_groups_reminders`
--
ALTER TABLE `glpi_groups_reminders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_groups_rssfeeds`
--
ALTER TABLE `glpi_groups_rssfeeds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_groups_tickets`
--
ALTER TABLE `glpi_groups_tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_groups_users`
--
ALTER TABLE `glpi_groups_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_holidays`
--
ALTER TABLE `glpi_holidays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_imageformats`
--
ALTER TABLE `glpi_imageformats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_imageresolutions`
--
ALTER TABLE `glpi_imageresolutions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_impactcompounds`
--
ALTER TABLE `glpi_impactcompounds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_impactcontexts`
--
ALTER TABLE `glpi_impactcontexts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_impactitems`
--
ALTER TABLE `glpi_impactitems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_impactrelations`
--
ALTER TABLE `glpi_impactrelations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_infocoms`
--
ALTER TABLE `glpi_infocoms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_interfacetypes`
--
ALTER TABLE `glpi_interfacetypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `glpi_ipaddresses`
--
ALTER TABLE `glpi_ipaddresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_ipaddresses_ipnetworks`
--
ALTER TABLE `glpi_ipaddresses_ipnetworks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_ipnetworks`
--
ALTER TABLE `glpi_ipnetworks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_ipnetworks_vlans`
--
ALTER TABLE `glpi_ipnetworks_vlans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_items_clusters`
--
ALTER TABLE `glpi_items_clusters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_items_devicebatteries`
--
ALTER TABLE `glpi_items_devicebatteries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_items_devicecameras`
--
ALTER TABLE `glpi_items_devicecameras`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_items_devicecameras_imageformats`
--
ALTER TABLE `glpi_items_devicecameras_imageformats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_items_devicecameras_imageresolutions`
--
ALTER TABLE `glpi_items_devicecameras_imageresolutions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_items_devicecases`
--
ALTER TABLE `glpi_items_devicecases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_items_devicecontrols`
--
ALTER TABLE `glpi_items_devicecontrols`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_items_devicedrives`
--
ALTER TABLE `glpi_items_devicedrives`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_items_devicefirmwares`
--
ALTER TABLE `glpi_items_devicefirmwares`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_items_devicegenerics`
--
ALTER TABLE `glpi_items_devicegenerics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_items_devicegraphiccards`
--
ALTER TABLE `glpi_items_devicegraphiccards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_items_deviceharddrives`
--
ALTER TABLE `glpi_items_deviceharddrives`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_items_devicememories`
--
ALTER TABLE `glpi_items_devicememories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_items_devicemotherboards`
--
ALTER TABLE `glpi_items_devicemotherboards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_items_devicenetworkcards`
--
ALTER TABLE `glpi_items_devicenetworkcards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_items_devicepcis`
--
ALTER TABLE `glpi_items_devicepcis`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_items_devicepowersupplies`
--
ALTER TABLE `glpi_items_devicepowersupplies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_items_deviceprocessors`
--
ALTER TABLE `glpi_items_deviceprocessors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_items_devicesensors`
--
ALTER TABLE `glpi_items_devicesensors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_items_devicesimcards`
--
ALTER TABLE `glpi_items_devicesimcards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_items_devicesoundcards`
--
ALTER TABLE `glpi_items_devicesoundcards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_items_disks`
--
ALTER TABLE `glpi_items_disks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_items_enclosures`
--
ALTER TABLE `glpi_items_enclosures`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_items_kanbans`
--
ALTER TABLE `glpi_items_kanbans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_items_operatingsystems`
--
ALTER TABLE `glpi_items_operatingsystems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_items_problems`
--
ALTER TABLE `glpi_items_problems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_items_projects`
--
ALTER TABLE `glpi_items_projects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_items_racks`
--
ALTER TABLE `glpi_items_racks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_items_remotemanagements`
--
ALTER TABLE `glpi_items_remotemanagements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_items_softwarelicenses`
--
ALTER TABLE `glpi_items_softwarelicenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_items_softwareversions`
--
ALTER TABLE `glpi_items_softwareversions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_items_tickets`
--
ALTER TABLE `glpi_items_tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_itilcategories`
--
ALTER TABLE `glpi_itilcategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `glpi_itilfollowups`
--
ALTER TABLE `glpi_itilfollowups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `glpi_itilfollowuptemplates`
--
ALTER TABLE `glpi_itilfollowuptemplates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_itilsolutions`
--
ALTER TABLE `glpi_itilsolutions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `glpi_itils_projects`
--
ALTER TABLE `glpi_itils_projects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_knowbaseitemcategories`
--
ALTER TABLE `glpi_knowbaseitemcategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_knowbaseitems`
--
ALTER TABLE `glpi_knowbaseitems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_knowbaseitems_comments`
--
ALTER TABLE `glpi_knowbaseitems_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_knowbaseitems_items`
--
ALTER TABLE `glpi_knowbaseitems_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_knowbaseitems_knowbaseitemcategories`
--
ALTER TABLE `glpi_knowbaseitems_knowbaseitemcategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_knowbaseitems_profiles`
--
ALTER TABLE `glpi_knowbaseitems_profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_knowbaseitems_revisions`
--
ALTER TABLE `glpi_knowbaseitems_revisions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_knowbaseitems_users`
--
ALTER TABLE `glpi_knowbaseitems_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_knowbaseitemtranslations`
--
ALTER TABLE `glpi_knowbaseitemtranslations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_lineoperators`
--
ALTER TABLE `glpi_lineoperators`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_lines`
--
ALTER TABLE `glpi_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_linetypes`
--
ALTER TABLE `glpi_linetypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_links`
--
ALTER TABLE `glpi_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_links_itemtypes`
--
ALTER TABLE `glpi_links_itemtypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_locations`
--
ALTER TABLE `glpi_locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_lockedfields`
--
ALTER TABLE `glpi_lockedfields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_logs`
--
ALTER TABLE `glpi_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1841;

--
-- AUTO_INCREMENT de tabela `glpi_mailcollectors`
--
ALTER TABLE `glpi_mailcollectors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_manuallinks`
--
ALTER TABLE `glpi_manuallinks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_manufacturers`
--
ALTER TABLE `glpi_manufacturers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_monitormodels`
--
ALTER TABLE `glpi_monitormodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_monitors`
--
ALTER TABLE `glpi_monitors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_monitortypes`
--
ALTER TABLE `glpi_monitortypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_networkaliases`
--
ALTER TABLE `glpi_networkaliases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_networkequipmentmodels`
--
ALTER TABLE `glpi_networkequipmentmodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_networkequipments`
--
ALTER TABLE `glpi_networkequipments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_networkequipmenttypes`
--
ALTER TABLE `glpi_networkequipmenttypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_networkinterfaces`
--
ALTER TABLE `glpi_networkinterfaces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_networknames`
--
ALTER TABLE `glpi_networknames`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_networkportaggregates`
--
ALTER TABLE `glpi_networkportaggregates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_networkportaliases`
--
ALTER TABLE `glpi_networkportaliases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_networkportconnectionlogs`
--
ALTER TABLE `glpi_networkportconnectionlogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_networkportdialups`
--
ALTER TABLE `glpi_networkportdialups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_networkportethernets`
--
ALTER TABLE `glpi_networkportethernets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_networkportfiberchannels`
--
ALTER TABLE `glpi_networkportfiberchannels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_networkportfiberchanneltypes`
--
ALTER TABLE `glpi_networkportfiberchanneltypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_networkportlocals`
--
ALTER TABLE `glpi_networkportlocals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_networkportmetrics`
--
ALTER TABLE `glpi_networkportmetrics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_networkports`
--
ALTER TABLE `glpi_networkports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_networkports_networkports`
--
ALTER TABLE `glpi_networkports_networkports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_networkports_vlans`
--
ALTER TABLE `glpi_networkports_vlans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_networkporttypes`
--
ALTER TABLE `glpi_networkporttypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=305;

--
-- AUTO_INCREMENT de tabela `glpi_networkportwifis`
--
ALTER TABLE `glpi_networkportwifis`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_networks`
--
ALTER TABLE `glpi_networks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_notepads`
--
ALTER TABLE `glpi_notepads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_notifications`
--
ALTER TABLE `glpi_notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de tabela `glpi_notifications_notificationtemplates`
--
ALTER TABLE `glpi_notifications_notificationtemplates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de tabela `glpi_notificationtargets`
--
ALTER TABLE `glpi_notificationtargets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT de tabela `glpi_notificationtemplates`
--
ALTER TABLE `glpi_notificationtemplates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de tabela `glpi_notificationtemplatetranslations`
--
ALTER TABLE `glpi_notificationtemplatetranslations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de tabela `glpi_notimportedemails`
--
ALTER TABLE `glpi_notimportedemails`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_objectlocks`
--
ALTER TABLE `glpi_objectlocks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_olalevelactions`
--
ALTER TABLE `glpi_olalevelactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_olalevelcriterias`
--
ALTER TABLE `glpi_olalevelcriterias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_olalevels`
--
ALTER TABLE `glpi_olalevels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_olalevels_tickets`
--
ALTER TABLE `glpi_olalevels_tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_olas`
--
ALTER TABLE `glpi_olas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_operatingsystemarchitectures`
--
ALTER TABLE `glpi_operatingsystemarchitectures`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_operatingsystemeditions`
--
ALTER TABLE `glpi_operatingsystemeditions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_operatingsystemkernels`
--
ALTER TABLE `glpi_operatingsystemkernels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_operatingsystemkernelversions`
--
ALTER TABLE `glpi_operatingsystemkernelversions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_operatingsystems`
--
ALTER TABLE `glpi_operatingsystems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_operatingsystemservicepacks`
--
ALTER TABLE `glpi_operatingsystemservicepacks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_operatingsystemversions`
--
ALTER TABLE `glpi_operatingsystemversions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_passivedcequipmentmodels`
--
ALTER TABLE `glpi_passivedcequipmentmodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_passivedcequipments`
--
ALTER TABLE `glpi_passivedcequipments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_passivedcequipmenttypes`
--
ALTER TABLE `glpi_passivedcequipmenttypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_pcivendors`
--
ALTER TABLE `glpi_pcivendors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_pdumodels`
--
ALTER TABLE `glpi_pdumodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_pdus`
--
ALTER TABLE `glpi_pdus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_pdus_plugs`
--
ALTER TABLE `glpi_pdus_plugs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_pdus_racks`
--
ALTER TABLE `glpi_pdus_racks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_pdutypes`
--
ALTER TABLE `glpi_pdutypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_pendingreasons`
--
ALTER TABLE `glpi_pendingreasons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_pendingreasons_items`
--
ALTER TABLE `glpi_pendingreasons_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_peripheralmodels`
--
ALTER TABLE `glpi_peripheralmodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_peripherals`
--
ALTER TABLE `glpi_peripherals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_peripheraltypes`
--
ALTER TABLE `glpi_peripheraltypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_phonemodels`
--
ALTER TABLE `glpi_phonemodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_phonepowersupplies`
--
ALTER TABLE `glpi_phonepowersupplies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_phones`
--
ALTER TABLE `glpi_phones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_phonetypes`
--
ALTER TABLE `glpi_phonetypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_planningeventcategories`
--
ALTER TABLE `glpi_planningeventcategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_planningexternalevents`
--
ALTER TABLE `glpi_planningexternalevents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_planningexternaleventtemplates`
--
ALTER TABLE `glpi_planningexternaleventtemplates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_planningrecalls`
--
ALTER TABLE `glpi_planningrecalls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_plugins`
--
ALTER TABLE `glpi_plugins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `glpi_plugs`
--
ALTER TABLE `glpi_plugs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_printerlogs`
--
ALTER TABLE `glpi_printerlogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_printermodels`
--
ALTER TABLE `glpi_printermodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_printers`
--
ALTER TABLE `glpi_printers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_printers_cartridgeinfos`
--
ALTER TABLE `glpi_printers_cartridgeinfos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_printertypes`
--
ALTER TABLE `glpi_printertypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_problemcosts`
--
ALTER TABLE `glpi_problemcosts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_problems`
--
ALTER TABLE `glpi_problems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_problems_suppliers`
--
ALTER TABLE `glpi_problems_suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_problems_tickets`
--
ALTER TABLE `glpi_problems_tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_problems_users`
--
ALTER TABLE `glpi_problems_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_problemtasks`
--
ALTER TABLE `glpi_problemtasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_problemtemplatehiddenfields`
--
ALTER TABLE `glpi_problemtemplatehiddenfields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_problemtemplatemandatoryfields`
--
ALTER TABLE `glpi_problemtemplatemandatoryfields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `glpi_problemtemplatepredefinedfields`
--
ALTER TABLE `glpi_problemtemplatepredefinedfields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_problemtemplates`
--
ALTER TABLE `glpi_problemtemplates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `glpi_profilerights`
--
ALTER TABLE `glpi_profilerights`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1243;

--
-- AUTO_INCREMENT de tabela `glpi_profiles`
--
ALTER TABLE `glpi_profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `glpi_profiles_reminders`
--
ALTER TABLE `glpi_profiles_reminders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_profiles_rssfeeds`
--
ALTER TABLE `glpi_profiles_rssfeeds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_profiles_users`
--
ALTER TABLE `glpi_profiles_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `glpi_projectcosts`
--
ALTER TABLE `glpi_projectcosts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_projects`
--
ALTER TABLE `glpi_projects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_projectstates`
--
ALTER TABLE `glpi_projectstates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `glpi_projecttasklinks`
--
ALTER TABLE `glpi_projecttasklinks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_projecttasks`
--
ALTER TABLE `glpi_projecttasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_projecttasks_tickets`
--
ALTER TABLE `glpi_projecttasks_tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_projecttaskteams`
--
ALTER TABLE `glpi_projecttaskteams`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_projecttasktemplates`
--
ALTER TABLE `glpi_projecttasktemplates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_projecttasktypes`
--
ALTER TABLE `glpi_projecttasktypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_projectteams`
--
ALTER TABLE `glpi_projectteams`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_projecttypes`
--
ALTER TABLE `glpi_projecttypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_queuednotifications`
--
ALTER TABLE `glpi_queuednotifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `glpi_rackmodels`
--
ALTER TABLE `glpi_rackmodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_racks`
--
ALTER TABLE `glpi_racks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_racktypes`
--
ALTER TABLE `glpi_racktypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_recurrentchanges`
--
ALTER TABLE `glpi_recurrentchanges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_refusedequipments`
--
ALTER TABLE `glpi_refusedequipments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_registeredids`
--
ALTER TABLE `glpi_registeredids`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_reminders`
--
ALTER TABLE `glpi_reminders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_reminders_users`
--
ALTER TABLE `glpi_reminders_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_remindertranslations`
--
ALTER TABLE `glpi_remindertranslations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_requesttypes`
--
ALTER TABLE `glpi_requesttypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `glpi_reservationitems`
--
ALTER TABLE `glpi_reservationitems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_reservations`
--
ALTER TABLE `glpi_reservations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_rssfeeds`
--
ALTER TABLE `glpi_rssfeeds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_rssfeeds_users`
--
ALTER TABLE `glpi_rssfeeds_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_ruleactions`
--
ALTER TABLE `glpi_ruleactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT de tabela `glpi_rulecriterias`
--
ALTER TABLE `glpi_rulecriterias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT de tabela `glpi_rulematchedlogs`
--
ALTER TABLE `glpi_rulematchedlogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_rulerightparameters`
--
ALTER TABLE `glpi_rulerightparameters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `glpi_rules`
--
ALTER TABLE `glpi_rules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT de tabela `glpi_savedsearches`
--
ALTER TABLE `glpi_savedsearches`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_savedsearches_alerts`
--
ALTER TABLE `glpi_savedsearches_alerts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_savedsearches_users`
--
ALTER TABLE `glpi_savedsearches_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_slalevelactions`
--
ALTER TABLE `glpi_slalevelactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_slalevelcriterias`
--
ALTER TABLE `glpi_slalevelcriterias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_slalevels`
--
ALTER TABLE `glpi_slalevels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_slalevels_tickets`
--
ALTER TABLE `glpi_slalevels_tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_slas`
--
ALTER TABLE `glpi_slas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_slms`
--
ALTER TABLE `glpi_slms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_snmpcredentials`
--
ALTER TABLE `glpi_snmpcredentials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `glpi_socketmodels`
--
ALTER TABLE `glpi_socketmodels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_sockets`
--
ALTER TABLE `glpi_sockets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_softwarecategories`
--
ALTER TABLE `glpi_softwarecategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `glpi_softwarelicenses`
--
ALTER TABLE `glpi_softwarelicenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_softwarelicensetypes`
--
ALTER TABLE `glpi_softwarelicensetypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `glpi_softwares`
--
ALTER TABLE `glpi_softwares`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_softwareversions`
--
ALTER TABLE `glpi_softwareversions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_solutiontemplates`
--
ALTER TABLE `glpi_solutiontemplates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_solutiontypes`
--
ALTER TABLE `glpi_solutiontypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_ssovariables`
--
ALTER TABLE `glpi_ssovariables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `glpi_states`
--
ALTER TABLE `glpi_states`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_suppliers`
--
ALTER TABLE `glpi_suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_suppliers_tickets`
--
ALTER TABLE `glpi_suppliers_tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_suppliertypes`
--
ALTER TABLE `glpi_suppliertypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_taskcategories`
--
ALTER TABLE `glpi_taskcategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_tasktemplates`
--
ALTER TABLE `glpi_tasktemplates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_ticketcosts`
--
ALTER TABLE `glpi_ticketcosts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_ticketrecurrents`
--
ALTER TABLE `glpi_ticketrecurrents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_tickets`
--
ALTER TABLE `glpi_tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `glpi_ticketsatisfactions`
--
ALTER TABLE `glpi_ticketsatisfactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_tickets_contracts`
--
ALTER TABLE `glpi_tickets_contracts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_tickets_tickets`
--
ALTER TABLE `glpi_tickets_tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_tickets_users`
--
ALTER TABLE `glpi_tickets_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `glpi_tickettasks`
--
ALTER TABLE `glpi_tickettasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_tickettemplatehiddenfields`
--
ALTER TABLE `glpi_tickettemplatehiddenfields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_tickettemplatemandatoryfields`
--
ALTER TABLE `glpi_tickettemplatemandatoryfields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `glpi_tickettemplatepredefinedfields`
--
ALTER TABLE `glpi_tickettemplatepredefinedfields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `glpi_tickettemplates`
--
ALTER TABLE `glpi_tickettemplates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `glpi_ticketvalidations`
--
ALTER TABLE `glpi_ticketvalidations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_transfers`
--
ALTER TABLE `glpi_transfers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `glpi_unmanageds`
--
ALTER TABLE `glpi_unmanageds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_usbvendors`
--
ALTER TABLE `glpi_usbvendors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_usercategories`
--
ALTER TABLE `glpi_usercategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_useremails`
--
ALTER TABLE `glpi_useremails`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_users`
--
ALTER TABLE `glpi_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `glpi_usertitles`
--
ALTER TABLE `glpi_usertitles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_virtualmachinestates`
--
ALTER TABLE `glpi_virtualmachinestates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_virtualmachinesystems`
--
ALTER TABLE `glpi_virtualmachinesystems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_virtualmachinetypes`
--
ALTER TABLE `glpi_virtualmachinetypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_vlans`
--
ALTER TABLE `glpi_vlans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_vobjects`
--
ALTER TABLE `glpi_vobjects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `glpi_wifinetworks`
--
ALTER TABLE `glpi_wifinetworks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
