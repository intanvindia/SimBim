-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 28 Jun 2026 pada 07.26
-- Versi server: 8.0.40
-- Versi PHP: 8.5.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simbim`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anak`
--

CREATE TABLE `anak` (
  `id_anak` int NOT NULL,
  `nama_anak` varchar(100) NOT NULL,
  `usia` int NOT NULL,
  `id_user` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `anak`
--

INSERT INTO `anak` (`id_anak`, `nama_anak`, `usia`, `id_user`, `created_at`, `updated_at`) VALUES
(14, 'Zylong', 6, 2, '2026-06-26 17:14:32', '2026-06-26 17:14:32'),
(15, 'Cici', 6, 2, '2026-06-26 17:14:32', '2026-06-26 17:14:32'),
(16, 'Lesley', 6, 2, '2026-06-26 17:14:32', '2026-06-26 17:14:32'),
(17, 'Ixia', 6, 2, '2026-06-26 17:14:32', '2026-06-26 17:14:32'),
(18, 'Layla', 6, 4, '2026-06-26 17:14:32', '2026-06-26 17:26:38'),
(19, 'Ruby', 5, 6, '2026-06-26 17:14:32', '2026-06-26 17:32:47'),
(20, 'Miya', 6, 6, '2026-06-26 17:14:32', '2026-06-26 17:32:43'),
(21, 'Dora', 5, 6, '2026-06-26 17:14:32', '2026-06-26 17:32:41'),
(22, 'Rafa', 5, 4, '2026-06-26 17:14:32', '2026-06-26 17:31:33'),
(23, 'Michael', 7, 5, '2026-06-26 17:14:32', '2026-06-26 17:31:29'),
(24, 'Zira', 6, 5, '2026-06-26 17:14:32', '2026-06-26 17:30:57'),
(25, 'Maya', 6, 5, '2026-06-26 17:14:32', '2026-06-26 17:30:53'),
(26, 'Hilda', 7, 4, '2026-06-26 17:26:18', '2026-06-26 17:26:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `asesmen`
--

CREATE TABLE `asesmen` (
  `id_asesmen` int NOT NULL,
  `id_anak` int DEFAULT NULL,
  `tgl_asesmen` date NOT NULL,
  `status_follow_up` varchar(50) DEFAULT 'Belum Dihubungi',
  `catatan_follow_up` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `asesmen`
--

INSERT INTO `asesmen` (`id_asesmen`, `id_anak`, `tgl_asesmen`, `status_follow_up`, `catatan_follow_up`) VALUES
(14, 14, '2026-06-16', 'Belum Dihubungi', NULL),
(15, 15, '2026-06-16', 'Belum Dihubungi', NULL),
(16, 16, '2026-06-16', 'Belum Dihubungi', NULL),
(17, 17, '2026-06-16', 'Belum Dihubungi', NULL),
(18, 18, '2026-06-16', 'Belum Dihubungi', NULL),
(19, 19, '2026-06-16', 'Belum Dihubungi', NULL),
(20, 20, '2026-06-16', 'Belum Dihubungi', NULL),
(21, 21, '2026-06-16', 'Belum Dihubungi', NULL),
(22, 22, '2026-06-17', 'Belum Dihubungi', NULL),
(23, 23, '2026-06-17', 'Belum Dihubungi', NULL),
(24, 24, '2026-06-17', 'Belum Dihubungi', NULL),
(25, 25, '2026-06-17', 'Belum Dihubungi', NULL),
(26, 15, '2026-06-26', 'Belum Dihubungi', NULL),
(27, 26, '2026-06-26', 'Belum Dihubungi', NULL),
(28, 17, '2026-06-28', 'Belum Dihubungi', NULL),
(29, 17, '2026-06-28', 'Belum Dihubungi', NULL),
(30, 23, '2026-06-28', 'Belum Dihubungi', NULL),
(31, 24, '2026-06-28', 'Belum Dihubungi', NULL),
(32, 16, '2026-06-28', 'Belum Dihubungi', NULL),
(33, 21, '2026-06-28', 'Belum Dihubungi', NULL),
(34, 26, '2026-06-28', 'Belum Dihubungi', NULL),
(35, 15, '2026-06-28', 'Belum Dihubungi', NULL),
(36, 24, '2026-06-28', 'Belum Dihubungi', NULL),
(37, 20, '2026-06-28', 'Belum Dihubungi', NULL),
(38, 18, '2026-06-28', 'Belum Dihubungi', NULL),
(39, 19, '2026-06-28', 'Belum Dihubungi', NULL),
(40, 26, '2026-06-28', 'Belum Dihubungi', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_asesmen`
--

CREATE TABLE `detail_asesmen` (
  `id_detail` int NOT NULL,
  `id_asesmen` int DEFAULT NULL,
  `id_pertanyaan` int DEFAULT NULL,
  `nilai_input` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `detail_asesmen`
--

INSERT INTO `detail_asesmen` (`id_detail`, `id_asesmen`, `id_pertanyaan`, `nilai_input`) VALUES
(221, 14, 1, 1),
(222, 14, 2, 1),
(223, 14, 3, 1),
(224, 14, 4, 1),
(225, 14, 5, 1),
(226, 14, 6, 1),
(227, 14, 7, 1),
(228, 14, 8, 1),
(229, 14, 9, 1),
(230, 14, 10, 1),
(231, 14, 11, 1),
(232, 14, 12, 1),
(233, 14, 13, 1),
(234, 14, 14, 1),
(235, 14, 15, 1),
(236, 14, 16, 1),
(237, 14, 17, 1),
(238, 14, 18, 1),
(239, 14, 19, 1),
(240, 14, 20, 1),
(241, 15, 1, 5),
(242, 15, 2, 5),
(243, 15, 3, 5),
(244, 15, 4, 5),
(245, 15, 5, 5),
(246, 15, 6, 5),
(247, 15, 7, 5),
(248, 15, 8, 5),
(249, 15, 9, 5),
(250, 15, 10, 5),
(251, 15, 11, 5),
(252, 15, 12, 5),
(253, 15, 13, 5),
(254, 15, 14, 5),
(255, 15, 15, 5),
(256, 15, 16, 5),
(257, 15, 17, 5),
(258, 15, 18, 5),
(259, 15, 19, 5),
(260, 15, 20, 5),
(261, 16, 1, 1),
(262, 16, 2, 5),
(263, 16, 3, 2),
(264, 16, 4, 4),
(265, 16, 5, 3),
(266, 16, 6, 1),
(267, 16, 7, 5),
(268, 16, 8, 2),
(269, 16, 9, 1),
(270, 16, 10, 5),
(271, 16, 11, 1),
(272, 16, 12, 4),
(273, 16, 13, 5),
(274, 16, 14, 1),
(275, 16, 15, 3),
(276, 16, 16, 1),
(277, 16, 17, 5),
(278, 16, 18, 2),
(279, 16, 19, 1),
(280, 16, 20, 3),
(281, 17, 1, 1),
(282, 17, 2, 2),
(283, 17, 3, 1),
(284, 17, 4, 2),
(285, 17, 5, 5),
(286, 17, 6, 4),
(287, 17, 7, 2),
(288, 17, 8, 1),
(289, 17, 9, 1),
(290, 17, 10, 1),
(291, 17, 11, 1),
(292, 17, 12, 1),
(293, 17, 13, 1),
(294, 17, 14, 3),
(295, 17, 15, 1),
(296, 17, 16, 1),
(297, 17, 17, 1),
(298, 17, 18, 4),
(299, 17, 19, 1),
(300, 17, 20, 1),
(301, 18, 1, 5),
(302, 18, 2, 5),
(303, 18, 3, 5),
(304, 18, 4, 5),
(305, 18, 5, 1),
(306, 18, 6, 1),
(307, 18, 7, 1),
(308, 18, 8, 1),
(309, 18, 9, 1),
(310, 18, 10, 1),
(311, 18, 11, 1),
(312, 18, 12, 1),
(313, 18, 13, 5),
(314, 18, 14, 5),
(315, 18, 15, 5),
(316, 18, 16, 5),
(317, 18, 17, 1),
(318, 18, 18, 1),
(319, 18, 19, 1),
(320, 18, 20, 1),
(321, 19, 1, 1),
(322, 19, 2, 1),
(323, 19, 3, 1),
(324, 19, 4, 1),
(325, 19, 5, 5),
(326, 19, 6, 5),
(327, 19, 7, 5),
(328, 19, 8, 5),
(329, 19, 9, 1),
(330, 19, 10, 1),
(331, 19, 11, 1),
(332, 19, 12, 1),
(333, 19, 13, 1),
(334, 19, 14, 3),
(335, 19, 15, 1),
(336, 19, 16, 2),
(337, 19, 17, 1),
(338, 19, 18, 3),
(339, 19, 19, 1),
(340, 19, 20, 1),
(341, 20, 1, 1),
(342, 20, 2, 4),
(343, 20, 3, 1),
(344, 20, 4, 1),
(345, 20, 5, 1),
(346, 20, 6, 1),
(347, 20, 7, 1),
(348, 20, 8, 1),
(349, 20, 9, 1),
(350, 20, 10, 1),
(351, 20, 11, 1),
(352, 20, 12, 1),
(353, 20, 13, 5),
(354, 20, 14, 5),
(355, 20, 15, 5),
(356, 20, 16, 5),
(357, 20, 17, 5),
(358, 20, 18, 5),
(359, 20, 19, 5),
(360, 20, 20, 5),
(361, 21, 1, 1),
(362, 21, 2, 2),
(363, 21, 3, 3),
(364, 21, 4, 4),
(365, 21, 5, 5),
(366, 21, 6, 1),
(367, 21, 7, 1),
(368, 21, 8, 5),
(369, 21, 9, 1),
(370, 21, 10, 1),
(371, 21, 11, 1),
(372, 21, 12, 1),
(373, 21, 13, 1),
(374, 21, 14, 1),
(375, 21, 15, 5),
(376, 21, 16, 1),
(377, 21, 17, 1),
(378, 21, 18, 5),
(379, 21, 19, 3),
(380, 21, 20, 1),
(381, 22, 1, 1),
(382, 22, 2, 5),
(383, 22, 3, 3),
(384, 22, 4, 4),
(385, 22, 5, 5),
(386, 22, 6, 4),
(387, 22, 7, 5),
(388, 22, 8, 5),
(389, 22, 9, 1),
(390, 22, 10, 2),
(391, 22, 11, 3),
(392, 22, 12, 2),
(393, 22, 13, 5),
(394, 22, 14, 4),
(395, 22, 15, 4),
(396, 22, 16, 4),
(397, 22, 17, 3),
(398, 22, 18, 2),
(399, 22, 19, 4),
(400, 22, 20, 4),
(401, 23, 1, 5),
(402, 23, 2, 2),
(403, 23, 3, 1),
(404, 23, 4, 2),
(405, 23, 5, 1),
(406, 23, 6, 1),
(407, 23, 7, 4),
(408, 23, 8, 5),
(409, 23, 9, 1),
(410, 23, 10, 5),
(411, 23, 11, 4),
(412, 23, 12, 5),
(413, 23, 13, 1),
(414, 23, 14, 1),
(415, 23, 15, 2),
(416, 23, 16, 4),
(417, 23, 17, 1),
(418, 23, 18, 3),
(419, 23, 19, 2),
(420, 23, 20, 1),
(421, 24, 1, 5),
(422, 24, 2, 5),
(423, 24, 3, 2),
(424, 24, 4, 3),
(425, 24, 5, 3),
(426, 24, 6, 3),
(427, 24, 7, 4),
(428, 24, 8, 5),
(429, 24, 9, 5),
(430, 24, 10, 4),
(431, 24, 11, 5),
(432, 24, 12, 5),
(433, 24, 13, 1),
(434, 24, 14, 2),
(435, 24, 15, 2),
(436, 24, 16, 2),
(437, 24, 17, 1),
(438, 24, 18, 1),
(439, 24, 19, 1),
(440, 24, 20, 2),
(441, 25, 1, 1),
(442, 25, 2, 1),
(443, 25, 3, 1),
(444, 25, 4, 2),
(445, 25, 5, 2),
(446, 25, 6, 3),
(447, 25, 7, 1),
(448, 25, 8, 1),
(449, 25, 9, 1),
(450, 25, 10, 2),
(451, 25, 11, 3),
(452, 25, 12, 4),
(453, 25, 13, 3),
(454, 25, 14, 2),
(455, 25, 15, 1),
(456, 25, 16, 1),
(457, 25, 17, 2),
(458, 25, 18, 1),
(459, 25, 19, 1),
(460, 25, 20, 1),
(461, 26, 1, 5),
(462, 26, 2, 3),
(463, 26, 3, 5),
(464, 26, 4, 2),
(465, 26, 5, 2),
(466, 26, 6, 2),
(467, 26, 7, 5),
(468, 26, 8, 5),
(469, 26, 9, 4),
(470, 26, 10, 3),
(471, 26, 11, 2),
(472, 26, 12, 2),
(473, 26, 13, 1),
(474, 26, 14, 4),
(475, 26, 15, 1),
(476, 26, 16, 1),
(477, 26, 17, 1),
(478, 26, 18, 1),
(479, 26, 19, 1),
(480, 26, 20, 5),
(481, 27, 1, 5),
(482, 27, 2, 5),
(483, 27, 3, 1),
(484, 27, 4, 5),
(485, 27, 5, 3),
(486, 27, 6, 4),
(487, 27, 7, 4),
(488, 27, 8, 4),
(489, 27, 9, 4),
(490, 27, 10, 4),
(491, 27, 11, 2),
(492, 27, 12, 1),
(493, 27, 13, 4),
(494, 27, 14, 5),
(495, 27, 15, 5),
(496, 27, 16, 1),
(497, 27, 17, 4),
(498, 27, 18, 4),
(499, 27, 19, 3),
(500, 27, 20, 3),
(501, 28, 1, 5),
(502, 28, 2, 3),
(503, 28, 3, 3),
(504, 28, 4, 3),
(505, 28, 5, 1),
(506, 28, 6, 3),
(507, 28, 7, 4),
(508, 28, 8, 5),
(509, 28, 9, 1),
(510, 28, 10, 1),
(511, 28, 11, 3),
(512, 28, 12, 1),
(513, 28, 13, 1),
(514, 28, 14, 1),
(515, 28, 15, 5),
(516, 28, 16, 5),
(517, 28, 17, 5),
(518, 28, 18, 5),
(519, 28, 19, 5),
(520, 28, 20, 5),
(521, 29, 1, 5),
(522, 29, 2, 2),
(523, 29, 3, 1),
(524, 29, 4, 2),
(525, 29, 5, 5),
(526, 29, 6, 5),
(527, 29, 7, 2),
(528, 29, 8, 1),
(529, 29, 9, 1),
(530, 29, 10, 1),
(531, 29, 11, 1),
(532, 29, 12, 3),
(533, 29, 13, 1),
(534, 29, 14, 2),
(535, 29, 15, 2),
(536, 29, 16, 2),
(537, 29, 17, 5),
(538, 29, 18, 5),
(539, 29, 19, 5),
(540, 29, 20, 5),
(541, 30, 1, 5),
(542, 30, 2, 5),
(543, 30, 3, 5),
(544, 30, 4, 5),
(545, 30, 5, 2),
(546, 30, 6, 2),
(547, 30, 7, 2),
(548, 30, 8, 2),
(549, 30, 9, 2),
(550, 30, 10, 2),
(551, 30, 11, 1),
(552, 30, 12, 1),
(553, 30, 13, 2),
(554, 30, 14, 1),
(555, 30, 15, 2),
(556, 30, 16, 2),
(557, 30, 17, 2),
(558, 30, 18, 2),
(559, 30, 19, 2),
(560, 30, 20, 1),
(561, 31, 1, 1),
(562, 31, 2, 2),
(563, 31, 3, 2),
(564, 31, 4, 3),
(565, 31, 5, 1),
(566, 31, 6, 3),
(567, 31, 7, 1),
(568, 31, 8, 3),
(569, 31, 9, 5),
(570, 31, 10, 5),
(571, 31, 11, 5),
(572, 31, 12, 5),
(573, 31, 13, 1),
(574, 31, 14, 1),
(575, 31, 15, 1),
(576, 31, 16, 3),
(577, 31, 17, 2),
(578, 31, 18, 1),
(579, 31, 19, 1),
(580, 31, 20, 3),
(581, 32, 1, 5),
(582, 32, 2, 5),
(583, 32, 3, 5),
(584, 32, 4, 5),
(585, 32, 5, 5),
(586, 32, 6, 5),
(587, 32, 7, 5),
(588, 32, 8, 5),
(589, 32, 9, 5),
(590, 32, 10, 5),
(591, 32, 11, 5),
(592, 32, 12, 5),
(593, 32, 13, 5),
(594, 32, 14, 5),
(595, 32, 15, 5),
(596, 32, 16, 5),
(597, 32, 17, 5),
(598, 32, 18, 5),
(599, 32, 19, 5),
(600, 32, 20, 5),
(601, 33, 1, 3),
(602, 33, 2, 3),
(603, 33, 3, 2),
(604, 33, 4, 2),
(605, 33, 5, 1),
(606, 33, 6, 2),
(607, 33, 7, 3),
(608, 33, 8, 1),
(609, 33, 9, 5),
(610, 33, 10, 5),
(611, 33, 11, 5),
(612, 33, 12, 5),
(613, 33, 13, 3),
(614, 33, 14, 2),
(615, 33, 15, 2),
(616, 33, 16, 2),
(617, 33, 17, 1),
(618, 33, 18, 1),
(619, 33, 19, 1),
(620, 33, 20, 3),
(621, 34, 1, 1),
(622, 34, 2, 3),
(623, 34, 3, 1),
(624, 34, 4, 1),
(625, 34, 5, 2),
(626, 34, 6, 2),
(627, 34, 7, 1),
(628, 34, 8, 3),
(629, 34, 9, 5),
(630, 34, 10, 5),
(631, 34, 11, 5),
(632, 34, 12, 5),
(633, 34, 13, 2),
(634, 34, 14, 3),
(635, 34, 15, 3),
(636, 34, 16, 3),
(637, 34, 17, 1),
(638, 34, 18, 2),
(639, 34, 19, 1),
(640, 34, 20, 2),
(641, 35, 1, 5),
(642, 35, 2, 5),
(643, 35, 3, 5),
(644, 35, 4, 5),
(645, 35, 5, 2),
(646, 35, 6, 1),
(647, 35, 7, 1),
(648, 35, 8, 2),
(649, 35, 9, 1),
(650, 35, 10, 1),
(651, 35, 11, 1),
(652, 35, 12, 1),
(653, 35, 13, 1),
(654, 35, 14, 1),
(655, 35, 15, 1),
(656, 35, 16, 2),
(657, 35, 17, 1),
(658, 35, 18, 1),
(659, 35, 19, 1),
(660, 35, 20, 2),
(661, 36, 1, 5),
(662, 36, 2, 5),
(663, 36, 3, 5),
(664, 36, 4, 5),
(665, 36, 5, 5),
(666, 36, 6, 5),
(667, 36, 7, 5),
(668, 36, 8, 5),
(669, 36, 9, 5),
(670, 36, 10, 5),
(671, 36, 11, 5),
(672, 36, 12, 5),
(673, 36, 13, 5),
(674, 36, 14, 5),
(675, 36, 15, 5),
(676, 36, 16, 5),
(677, 36, 17, 5),
(678, 36, 18, 5),
(679, 36, 19, 5),
(680, 36, 20, 5),
(681, 37, 1, 5),
(682, 37, 2, 5),
(683, 37, 3, 5),
(684, 37, 4, 5),
(685, 37, 5, 1),
(686, 37, 6, 2),
(687, 37, 7, 2),
(688, 37, 8, 1),
(689, 37, 9, 2),
(690, 37, 10, 2),
(691, 37, 11, 1),
(692, 37, 12, 1),
(693, 37, 13, 1),
(694, 37, 14, 1),
(695, 37, 15, 2),
(696, 37, 16, 2),
(697, 37, 17, 1),
(698, 37, 18, 1),
(699, 37, 19, 2),
(700, 37, 20, 2),
(701, 38, 1, 1),
(702, 38, 2, 2),
(703, 38, 3, 2),
(704, 38, 4, 2),
(705, 38, 5, 2),
(706, 38, 6, 2),
(707, 38, 7, 2),
(708, 38, 8, 3),
(709, 38, 9, 5),
(710, 38, 10, 5),
(711, 38, 11, 5),
(712, 38, 12, 5),
(713, 38, 13, 1),
(714, 38, 14, 3),
(715, 38, 15, 2),
(716, 38, 16, 2),
(717, 38, 17, 3),
(718, 38, 18, 2),
(719, 38, 19, 1),
(720, 38, 20, 3),
(721, 39, 1, 5),
(722, 39, 2, 5),
(723, 39, 3, 5),
(724, 39, 4, 5),
(725, 39, 5, 1),
(726, 39, 6, 2),
(727, 39, 7, 1),
(728, 39, 8, 2),
(729, 39, 9, 2),
(730, 39, 10, 1),
(731, 39, 11, 2),
(732, 39, 12, 2),
(733, 39, 13, 1),
(734, 39, 14, 2),
(735, 39, 15, 2),
(736, 39, 16, 2),
(737, 39, 17, 2),
(738, 39, 18, 2),
(739, 39, 19, 1),
(740, 39, 20, 1),
(741, 40, 1, 5),
(742, 40, 2, 5),
(743, 40, 3, 5),
(744, 40, 4, 5),
(745, 40, 5, 1),
(746, 40, 6, 2),
(747, 40, 7, 2),
(748, 40, 8, 2),
(749, 40, 9, 1),
(750, 40, 10, 2),
(751, 40, 11, 2),
(752, 40, 12, 1),
(753, 40, 13, 1),
(754, 40, 14, 2),
(755, 40, 15, 1),
(756, 40, 16, 2),
(757, 40, 17, 2),
(758, 40, 18, 2),
(759, 40, 19, 2),
(760, 40, 20, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas_bimbel`
--

CREATE TABLE `kelas_bimbel` (
  `id_kelas` int NOT NULL,
  `nama_kelas` varchar(100) NOT NULL,
  `status_kelas` enum('Aktif','Coming Soon') NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `kelas_bimbel`
--

INSERT INTO `kelas_bimbel` (`id_kelas`, `nama_kelas`, `status_kelas`, `deleted_at`) VALUES
(1, 'Digital Art', 'Aktif', NULL),
(2, 'Art & Craft', 'Aktif', NULL),
(3, 'Public Speaking', 'Aktif', NULL),
(4, 'Coding', 'Coming Soon', NULL),
(5, 'Music (Gitar, Piano)', 'Coming Soon', NULL),
(6, 'Balet', 'Coming Soon', NULL),
(7, 'Teater', 'Coming Soon', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kriteria`
--

CREATE TABLE `kriteria` (
  `id_kriteria` int NOT NULL,
  `nama_kriteria` varchar(100) NOT NULL,
  `sifat` enum('Benefit','Cost') NOT NULL,
  `bobot_awal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `kriteria`
--

INSERT INTO `kriteria` (`id_kriteria`, `nama_kriteria`, `sifat`, `bobot_awal`) VALUES
(1, 'Kecenderungan Logika & Teknologi', 'Benefit', 4),
(2, 'Kecenderungan Finemotorik & Visual-Spasial', 'Benefit', 4),
(3, 'Kecenderungan Auditori & Ritme Musik', 'Benefit', 3),
(4, 'Kinetik, Kelenturan, & Ekspresi Tubuh', 'Benefit', 3),
(5, 'Komunikasi Interpersonal & Rasa Percaya Diri', 'Benefit', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `logs`
--

CREATE TABLE `logs` (
  `id_log` int NOT NULL,
  `id_user` int DEFAULT NULL,
  `aktivitas` varchar(255) NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `logs`
--

INSERT INTO `logs` (`id_log`, `id_user`, `aktivitas`, `waktu`) VALUES
(1, 1, 'Memperbarui Pengaturan Situs', '2026-06-16 21:25:36'),
(2, 1, 'Memperbarui Pengaturan Situs', '2026-06-16 21:33:15'),
(3, 1, 'Memperbarui Pengaturan Situs', '2026-06-16 21:33:20'),
(4, 1, 'Memperbarui Pengaturan Situs', '2026-06-16 21:33:23'),
(5, 1, 'Memperbarui Pengaturan Situs', '2026-06-16 21:33:28'),
(6, 1, 'Memperbarui Pengaturan Situs', '2026-06-16 21:37:52'),
(7, 1, 'Memperbarui Pengaturan Situs', '2026-06-16 21:38:00'),
(8, 1, 'Memperbarui Pengaturan Situs', '2026-06-16 21:38:14'),
(9, 1, 'Memperbarui Pengaturan Situs', '2026-06-16 21:38:18'),
(10, 1, 'Memperbarui Pengaturan Situs', '2026-06-16 21:38:20'),
(11, 1, 'Memperbarui Pengaturan Situs', '2026-06-16 21:38:25'),
(12, 1, 'Memperbarui Pengaturan Situs', '2026-06-16 21:43:59'),
(13, 1, 'Memperbarui data user: user (ID: 2)', '2026-06-17 14:02:01'),
(14, 1, 'Memperbarui Pengaturan Situs', '2026-06-17 14:12:06'),
(15, 1, 'Memperbarui Pengaturan Situs', '2026-06-17 14:12:39'),
(16, 1, 'Memperbarui Pengaturan Situs', '2026-06-17 14:12:53'),
(17, 1, 'Memperbarui Pengaturan Situs', '2026-06-23 14:56:12'),
(18, 1, 'Memperbarui data user: admin (ID: 1)', '2026-06-26 17:33:57'),
(19, 1, 'Memperbarui data user: user (ID: 2)', '2026-06-26 17:34:39'),
(20, 1, 'Memperbarui data user: user (ID: 2)', '2026-06-26 17:34:50'),
(21, 1, 'Memperbarui Pengaturan Situs', '2026-06-26 17:46:16'),
(22, 1, 'Memperbarui Pengaturan Situs', '2026-06-28 05:12:43'),
(23, 1, 'Memperbarui data user: staf_demo (ID: 3)', '2026-06-28 06:08:13'),
(24, 1, 'Memperbarui data user: admin (ID: 1)', '2026-06-28 06:15:27'),
(25, 1, 'Memperbarui data user: staf_demo (ID: 3)', '2026-06-28 06:15:45'),
(26, 1, 'Memperbarui data user: user2 (ID: 4)', '2026-06-28 06:15:49'),
(27, 2, 'User login ke sistem.', '2026-06-28 07:19:43'),
(28, 1, 'User login ke sistem.', '2026-06-28 07:20:28'),
(29, 3, 'User login ke sistem.', '2026-06-28 07:21:02'),
(30, 6, 'User login ke sistem.', '2026-06-28 07:21:32'),
(31, 3, 'User login ke sistem.', '2026-06-28 07:21:42'),
(32, 1, 'User login ke sistem.', '2026-06-28 07:22:33'),
(33, 1, 'Memperbarui data user: user (ID: 2)', '2026-06-28 07:22:46'),
(34, 3, 'User login ke sistem.', '2026-06-28 07:22:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_kriteria_kelas`
--

CREATE TABLE `nilai_kriteria_kelas` (
  `id_nilai_kelas` int NOT NULL,
  `id_kelas` int DEFAULT NULL,
  `id_kriteria` int DEFAULT NULL,
  `nilai_default` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `nilai_kriteria_kelas`
--

INSERT INTO `nilai_kriteria_kelas` (`id_nilai_kelas`, `id_kelas`, `id_kriteria`, `nilai_default`) VALUES
(36, 1, 1, 5),
(37, 1, 2, 5),
(38, 1, 3, 1),
(39, 1, 4, 1),
(40, 1, 5, 1),
(41, 2, 1, 2),
(42, 2, 2, 5),
(43, 2, 3, 1),
(44, 2, 4, 2),
(45, 2, 5, 1),
(46, 3, 1, 1),
(47, 3, 2, 1),
(48, 3, 3, 2),
(49, 3, 4, 2),
(50, 3, 5, 5),
(51, 4, 1, 5),
(52, 4, 2, 2),
(53, 4, 3, 1),
(54, 4, 4, 1),
(55, 4, 5, 1),
(56, 5, 1, 1),
(57, 5, 2, 1),
(58, 5, 3, 5),
(59, 5, 4, 2),
(60, 5, 5, 2),
(61, 6, 1, 1),
(62, 6, 2, 1),
(63, 6, 3, 3),
(64, 6, 4, 5),
(65, 6, 5, 1),
(66, 7, 1, 1),
(67, 7, 2, 1),
(68, 7, 3, 2),
(69, 7, 4, 4),
(70, 7, 5, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengaturan`
--

CREATE TABLE `pengaturan` (
  `nama_key` varchar(50) NOT NULL,
  `nilai_value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `pengaturan`
--

INSERT INTO `pengaturan` (`nama_key`, `nilai_value`) VALUES
('contact_email', 'admin@simbim.com'),
('footer_text', 'SIMBIM Indonesia. All Rights Reserved.'),
('global_announcement', ''),
('google_sheets_access_token', ''),
('google_sheets_client_id', ''),
('google_sheets_client_secret', ''),
('google_sheets_enabled', '0'),
('google_sheets_redirect_uri', 'http://localhost/SimBim/google_oauth_callback.php'),
('google_sheets_refresh_token', ''),
('google_sheets_spreadsheet_id', ''),
('google_sheets_token_expires_at', ''),
('hero_banner', 'assets/img/banner.png'),
('maintenance_mode', '0'),
('registration_open', '1'),
('site_favicon', 'https://w7.pngwing.com/pngs/211/301/png-transparent-white-and-red-rocket-ship-illustration-spacecraft-rocket-free-content-rocket-presentation-vehicle-website-thumbnail.png'),
('site_logo', ''),
('site_name', 'SIMBIM Indonesia'),
('tagline', 'Membangun Masa Depan Cerdas Sejak Dini'),
('whatsapp_admin', '628123456789');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pertanyaan`
--

CREATE TABLE `pertanyaan` (
  `id_pertanyaan` int NOT NULL,
  `teks_pertanyaan` text NOT NULL,
  `id_kriteria` int DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `pertanyaan`
--

INSERT INTO `pertanyaan` (`id_pertanyaan`, `teks_pertanyaan`, `id_kriteria`, `deleted_at`) VALUES
(1, 'Anak senang bermain game atau aplikasi interaktif yang membutuhkan pemecahan masalah (puzzle, labirin, dll).', 1, NULL),
(2, 'Anak sering penasaran dan bertanya tentang cara kerja suatu barang elektronik atau susunan mainan (suka membongkar-pasang).', 1, NULL),
(3, 'Anak cepat memahami instruksi yang melibatkan pola berurutan atau sebab-akibat (jika begini, maka begitu).', 1, NULL),
(4, 'Anak tertarik mempelajari simbol, angka, atau logika dasar di komputer/gadget.', 1, NULL),
(5, 'Anak betah berlama-lama mewarnai, menggambar, atau mencoret-coret kertas dengan rapi.', 2, NULL),
(6, 'Anak mahir membuat bentuk menggunakan media fisik seperti lilin mainan (playdough), kertas lipat (origami), atau balok susun (Lego).', 2, NULL),
(7, 'Anak sangat peka terhadap kombinasi warna, estetika, atau detail visual di sekitarnya.', 2, NULL),
(8, 'Anak lebih suka memperhatikan gambar ilustrasi di buku cerita daripada sekadar mendengarkan teks jalannya cerita.', 2, NULL),
(9, 'Anak sering bersenandung, bernyanyi secara spontan, atau mengetuk-ngetuk jari mengikuti irama lagu.', 3, NULL),
(10, 'Anak sangat cepat menghafal nada atau lirik dari lagu yang baru didengarnya beberapa kali.', 3, NULL),
(11, 'Anak tertarik dan sering meminta untuk mencoba memainkan alat musik tertentu (gitar, piano, atau mainan musik).', 3, NULL),
(12, 'Anak bisa membedakan suara instrumen yang berbeda atau peka jika ada nada lagu yang sumbang/salah.', 3, NULL),
(13, 'Anak suka menari, melompat, atau menggerakkan tubuh secara ritmis saat mendengar musik.', 4, NULL),
(14, 'Anak memiliki keseimbangan dan kelenturan fisik yang baik (misal: suka meniru gerakan senam, atletik, atau balet).', 4, NULL),
(15, 'Anak sangat ekspresif menggunakan gerakan tangan, gestur, atau bahasa tubuh saat menceritakan sesuatu.', 4, NULL),
(16, 'Anak lebih menyukai aktivitas fisik yang aktif bergerak daripada duduk diam dalam waktu lama.', 4, NULL),
(17, 'Anak berani berbicara di depan orang banyak, menyapa orang baru, atau menjadi pusat perhatian tanpa rasa malu.', 5, NULL),
(18, 'Anak pandai bercerita dengan intonasi yang seru, meniru suara karakter, atau suka bermain peran (berakting/berpura-pura).', 5, NULL),
(19, 'Anak mudah bergaul, cepat akrab, dan suka memimpin teman-temannya saat bermain bersama.', 5, NULL),
(20, 'Anak mampu mengungkapkan keinginan, emosi, atau pendapatnya dengan kalimat yang jelas dan terstruktur.', 5, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `rekomendasi_hasil`
--

CREATE TABLE `rekomendasi_hasil` (
  `id_asesmen` int NOT NULL,
  `id_kelas` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `rekomendasi_hasil`
--

INSERT INTO `rekomendasi_hasil` (`id_asesmen`, `id_kelas`, `created_at`) VALUES
(14, 1, '2026-06-26 16:58:13'),
(15, 1, '2026-06-26 16:55:58'),
(16, 1, '2026-06-26 16:56:02'),
(17, 1, '2026-06-26 16:58:02'),
(18, 1, '2026-06-26 16:56:05'),
(19, 2, '2026-06-26 16:57:54'),
(20, 3, '2026-06-26 16:56:09'),
(21, 1, '2026-06-26 16:56:13'),
(22, 1, '2026-06-26 16:53:52'),
(23, 1, '2026-06-26 16:55:28'),
(24, 1, '2026-06-26 16:55:33'),
(25, 3, '2026-06-26 16:55:43'),
(26, 1, '2026-06-26 17:22:30'),
(27, 1, '2026-06-26 17:28:31'),
(28, 3, '2026-06-28 06:42:22'),
(29, 3, '2026-06-28 06:41:30'),
(30, 1, '2026-06-28 06:51:28'),
(35, 1, '2026-06-28 07:20:02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `level` varchar(20) NOT NULL DEFAULT 'orang_tua'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `nama_lengkap`, `no_hp`, `level`) VALUES
(1, 'admin', '$2y$10$aIcc5kBKlSr.oBC3AeZ0XOWiTzO8RHasQfT5abp1bMAHAMebXPc9K', 'admin', '081290320438', 'admin'),
(2, 'user', '$2y$10$O6fyh2bT1GvKwIE.oMD3Z.DZr9UsBQSBSOZDB8IPHBaV2rRW.IKlS', 'Orang Tua Satu', '081290320438', 'orang_tua'),
(3, 'staf_demo', '$2y$10$sL.rZNXRuNWB7R.b4XABe.fsZuoPjuRkyAc1T5oGIIBpo4XU7IB8m', 'Staff TU', '081290320438', 'staf'),
(4, 'user2', '$2y$10$xygqMD95Z29F6RAUEvrz0.LanD/h3YoGciSVpcgAboqUHU8b6/.ZO', 'Orang Tua Dua', '081290320438', 'orang_tua'),
(5, 'user3', '$2y$10$4MJ8sE.P9Fdsk4xUO/fppuGTBsJyIoWrAsVJRmpwFBtxJ.7lYR4Vq', 'Orang Tua Tiga', NULL, 'orang_tua'),
(6, 'user4', '$2y$10$v3Zy7qCsYjmBjcBcAUFAOOYBZ5bGQYUSbX5EU9K8Lx24l74kRb7qK', 'Orang Tua Empat', NULL, 'orang_tua');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anak`
--
ALTER TABLE `anak`
  ADD PRIMARY KEY (`id_anak`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `asesmen`
--
ALTER TABLE `asesmen`
  ADD PRIMARY KEY (`id_asesmen`),
  ADD KEY `id_anak` (`id_anak`);

--
-- Indeks untuk tabel `detail_asesmen`
--
ALTER TABLE `detail_asesmen`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_asesmen` (`id_asesmen`),
  ADD KEY `id_pertanyaan` (`id_pertanyaan`);

--
-- Indeks untuk tabel `kelas_bimbel`
--
ALTER TABLE `kelas_bimbel`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indeks untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id_kriteria`);

--
-- Indeks untuk tabel `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id_log`);

--
-- Indeks untuk tabel `nilai_kriteria_kelas`
--
ALTER TABLE `nilai_kriteria_kelas`
  ADD PRIMARY KEY (`id_nilai_kelas`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indeks untuk tabel `pengaturan`
--
ALTER TABLE `pengaturan`
  ADD PRIMARY KEY (`nama_key`);

--
-- Indeks untuk tabel `pertanyaan`
--
ALTER TABLE `pertanyaan`
  ADD PRIMARY KEY (`id_pertanyaan`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indeks untuk tabel `rekomendasi_hasil`
--
ALTER TABLE `rekomendasi_hasil`
  ADD PRIMARY KEY (`id_asesmen`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `idx_level` (`level`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `anak`
--
ALTER TABLE `anak`
  MODIFY `id_anak` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `asesmen`
--
ALTER TABLE `asesmen`
  MODIFY `id_asesmen` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `detail_asesmen`
--
ALTER TABLE `detail_asesmen`
  MODIFY `id_detail` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=761;

--
-- AUTO_INCREMENT untuk tabel `kelas_bimbel`
--
ALTER TABLE `kelas_bimbel`
  MODIFY `id_kelas` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id_kriteria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `logs`
--
ALTER TABLE `logs`
  MODIFY `id_log` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `nilai_kriteria_kelas`
--
ALTER TABLE `nilai_kriteria_kelas`
  MODIFY `id_nilai_kelas` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT untuk tabel `pertanyaan`
--
ALTER TABLE `pertanyaan`
  MODIFY `id_pertanyaan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `anak`
--
ALTER TABLE `anak`
  ADD CONSTRAINT `anak_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `asesmen`
--
ALTER TABLE `asesmen`
  ADD CONSTRAINT `asesmen_ibfk_1` FOREIGN KEY (`id_anak`) REFERENCES `anak` (`id_anak`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_asesmen`
--
ALTER TABLE `detail_asesmen`
  ADD CONSTRAINT `detail_asesmen_ibfk_1` FOREIGN KEY (`id_asesmen`) REFERENCES `asesmen` (`id_asesmen`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_asesmen_ibfk_2` FOREIGN KEY (`id_pertanyaan`) REFERENCES `pertanyaan` (`id_pertanyaan`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `nilai_kriteria_kelas`
--
ALTER TABLE `nilai_kriteria_kelas`
  ADD CONSTRAINT `nilai_kriteria_kelas_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `kelas_bimbel` (`id_kelas`) ON DELETE CASCADE,
  ADD CONSTRAINT `nilai_kriteria_kelas_ibfk_2` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pertanyaan`
--
ALTER TABLE `pertanyaan`
  ADD CONSTRAINT `pertanyaan_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `rekomendasi_hasil`
--
ALTER TABLE `rekomendasi_hasil`
  ADD CONSTRAINT `rekomendasi_hasil_ibfk_1` FOREIGN KEY (`id_asesmen`) REFERENCES `asesmen` (`id_asesmen`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rekomendasi_hasil_ibfk_2` FOREIGN KEY (`id_kelas`) REFERENCES `kelas_bimbel` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
