SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `app_db`
--

--
-- Structure de la table `incident`
--

CREATE TABLE `incident` (
  `id` int(11) NOT NULL,
  `priority_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `followed_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `reporter_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `priority`
--

CREATE TABLE `priority` (
  `id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `priority`
--

INSERT INTO `priority` (`id`, `label`, `priority`) VALUES
(1, 'Non urgent', 1),
(2, 'Urgent', 2),
(3, 'Bloquant', 3),
(4, 'Critique', 4);

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `type`
--

INSERT INTO `type` (`id`, `label`) VALUES
(1, 'Accès distant'),
(2, 'Applicatifs'),
(3, 'Autre'),
(4, 'Bureautique'),
(5, 'Messagerie'),
(6, 'Poste de travail'),
(7, 'Téléphonie');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`roles`)),
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `firstname`, `roles`, `password`) VALUES
(1, 'tech@tech.com', 'Tech 1', '[\"ROLE_TECH\"]', '$2y$13$6p9xltP.jLyGWDRX/VfVgeu1ZvHH./ES2zMau9z7RlcdHao0xTHma'),
(2, 'tech2@tech2.com', 'Tech 2', '[\"ROLE_TECH\"]', '$2y$13$4/j8zLm8AC3GhVUJT1y9auFOe8l0s.AA.fizokUuwecx2Euj2GrCu');


-- INSERT INTO `incident` (`id`, `priority_id`, `type_id`, `followed_by_id`, `updated_at`, `reporter_email`, `reference`, `description`, `status`) VALUES
--     (1, 1, 5, 2, '2023-10-20 22:35:09', 'colette.bourgeois@wanadoo.fr', '2310BMZYX', 'Quia molestiae sint quo est. Eum magnam error eligendi quasi nobis. Molestiae animi amet voluptatem est necessitatibus animi repudiandae perferendis. Esse sint repellat optio libero laudantium est excepturi eius. Dolor et reiciendis porro placeat est qui voluptatem itaque.', 'REJECTED'),
--     (2, 4, 5, 2, '2023-10-21 22:35:09', 'andre84@sfr.fr', '2310ZTWYM', 'Officiis ea magnam architecto quibusdam vel consectetur. Qui ut corrupti et dolore non perspiciatis. Quos et occaecati vero qui maiores.', 'RESOLVED'),
--     (3, 2, 7, 1, '2023-10-20 22:35:09', 'tristan60@wanadoo.fr', '2310XUMAQ', 'Ullam velit qui rerum delectus. Mollitia pariatur laudantium non perspiciatis cupiditate reprehenderit. Assumenda temporibus dolorum vel qui et veritatis libero.', 'REJECTED'),
--     (4, 3, 5, 2, '2023-10-20 22:35:09', 'fblot@gerard.com', '2310TMYPN', 'Molestiae numquam officia aut et nobis eveniet rem modi. Itaque nesciunt sequi et libero. Ut quae voluptatem facere et voluptatem modi.', 'REJECTED'),
--     (5, 2, 1, 2, '2023-10-18 22:35:09', 'louise95@hotmail.fr', '2310QRKJH', 'Occaecati labore magnam ab in dolor repellendus qui vel. Consequuntur non laudantium nesciunt et soluta. Aperiam molestias sed consequatur praesentium qui eaque.', 'NEW'),
--     (6, 4, 3, 1, '2023-10-20 22:35:09', 'guyot.ines@laposte.net', '2310DTBWQ', 'Quia labore aliquid saepe iure qui. Nisi nam amet illo ipsam.', 'REJECTED'),
--     (7, 3, 2, 1, '2023-10-20 22:35:09', 'juliette.maillet@tele2.fr', '2310VUZQM', 'Voluptas et qui qui inventore ut in aut dolores. Distinctio accusantium incidunt voluptatem quaerat veniam dolor sed. Necessitatibus dolore architecto consequatur sunt.', 'REJECTED'),
--     (8, 1, 2, 2, '2023-10-21 22:35:09', 'margaux58@martinez.fr', '2310STQVW', 'Aut dolor recusandae est autem. Aliquid et ipsam corporis quae natus deserunt. Omnis corporis voluptatem incidunt corrupti quia.', 'RESOLVED'),
--     (9, 1, 2, 2, '2023-10-18 22:35:09', 'dias.gabriel@live.com', '2310ZNMRY', 'Animi accusantium similique tenetur eos facilis. Nobis velit sed iste aut numquam ipsam officia. Possimus aut magnam vitae deleniti odit.', 'NEW'),
--     (10, 1, 4, 2, '2023-10-19 22:35:09', 'erenaud@joly.org', '2310WFBKA', 'Autem quis optio excepturi ab architecto qui harum. Officia minus vel suscipit libero architecto sit ratione. Ipsam minima esse quibusdam mollitia reprehenderit animi minima. Quia dolore praesentium laudantium. Alias natus maxime veniam itaque et.', 'PROCESSING'),
--     (11, 3, 5, NULL, '2023-10-18 22:35:09', 'christiane29@mace.org', '2310QNTMV', 'Voluptatum id aut quia dolor quas repudiandae omnis. Deserunt eos laudantium exercitationem error consequatur. Earum occaecati nisi et quis.', 'NEW'),
--     (12, 2, 7, 1, '2023-10-20 22:35:09', 'jacques.masse@free.fr', '2310MAHKD', 'Sit et debitis aliquid maxime velit molestiae consequuntur ad. Exercitationem magni sed doloribus impedit et. Praesentium nihil culpa alias sunt est et aut.', 'REJECTED'),
--     (13, 2, 1, 1, '2023-10-18 22:35:09', 'francoise.hamel@weber.fr', '2310AZQJK', 'Ipsam et veniam nihil amet repellat. Ea dicta autem rerum voluptate maxime. Et et rerum consequatur ab soluta mollitia.', 'NEW'),
--     (14, 4, 6, 2, '2023-10-19 22:35:09', 'fouquet.joseph@lesage.net', '2310TUEWP', 'Voluptates qui molestiae qui est. Explicabo in sed sequi unde. Et fugiat similique occaecati minus ut. Repellat nihil amet numquam sint quod nihil fugit.', 'PROCESSING'),
--     (15, 3, 2, 2, '2023-10-19 22:35:09', 'alexandria85@klein.com', '2310WARFQ', 'Rem nihil et nemo totam eos impedit maxime facilis. Aut temporibus culpa recusandae tempora sint quae. Omnis placeat consequuntur ut. Ea aut reiciendis consectetur alias est. Consequuntur autem dolore molestiae expedita recusandae porro.', 'PROCESSING'),
--     (16, 4, 3, 1, '2023-10-20 22:35:09', 'zoe61@martineau.fr', '2310AQXPW', 'Ad tempore laboriosam et tempora dolorem. Cumque eligendi quia molestiae soluta consequatur ex est. Odio non praesentium omnis aliquid magnam nesciunt sit. Dolores explicabo animi quod incidunt.', 'REJECTED'),
--     (17, 2, 6, NULL, '2023-10-18 22:35:09', 'hugues.boutin@orange.fr', '2310UWKXH', 'Labore itaque voluptas iure repellat non et inventore. Alias sit at ducimus quisquam placeat tenetur. Sequi eius saepe enim consectetur et ipsum nisi. Facilis ullam occaecati quia tenetur perferendis quod dicta ut.', 'NEW'),
--     (18, 3, 3, 2, '2023-10-18 22:35:09', 'roland99@durand.com', '2310BNTDY', 'Dolores qui recusandae unde inventore aut corporis. Voluptas aut est omnis quidem quae. Quo qui natus at saepe voluptate. Quis et et ut rerum optio rerum.', 'NEW'),
--     (19, 2, 4, 2, '2023-10-21 22:35:09', 'clegros@tele2.fr', '2310USDRK', 'Voluptatem expedita maxime reprehenderit optio. Non itaque saepe officiis commodi accusantium.', 'RESOLVED'),
--     (20, 1, 5, 2, '2023-10-19 22:35:09', 'vrobert@pons.fr', '2310RXPZT', 'Provident in et similique at aut dolor vero unde. Ea libero voluptatem ut totam. Mollitia eum fugiat rem minima nesciunt consectetur. Assumenda quibusdam aperiam ut qui rem.', 'PROCESSING'),
--     (21, 1, 4, 2, '2023-10-20 22:35:09', 'raymond22@laposte.net', '2310KVPYZ', 'Amet asperiores autem et qui nihil. Totam vitae nisi facere. Voluptas tempora officiis placeat neque.', 'REJECTED'),
--     (22, 4, 5, 1, '2023-10-19 22:35:09', 'mendes.laurence@cordier.net', '2310MKZNU', 'Exercitationem voluptatem eum excepturi eveniet. Est quo repellendus consequatur molestiae possimus accusamus maiores. Natus quia quis exercitationem qui perspiciatis.', 'PROCESSING'),
--     (23, 3, 5, NULL, '2023-10-18 22:35:09', 'lefort.margot@gmail.com', '2310JMGCT', 'Voluptatem et maiores reiciendis reiciendis maxime. Assumenda dignissimos at beatae unde natus officiis velit. Voluptatem eos similique reiciendis voluptas at quae distinctio molestiae.', 'NEW'),
--     (24, 4, 5, 1, '2023-10-21 22:35:09', 'plebon@alves.org', '2310TNSBJ', 'Quas ut est dolorum ut deserunt praesentium asperiores. Qui temporibus reiciendis facere maiores dolor dolores.', 'RESOLVED'),
--     (25, 3, 3, 1, '2023-10-18 22:35:09', 'blondel.theodore@dbmail.com', '2310MFUWK', 'Aliquam inventore voluptatum corporis eveniet autem id mollitia. Aspernatur rerum nesciunt ea ut dignissimos et. Repudiandae facere hic error suscipit fugiat velit.', 'NEW'),
--     (26, 2, 5, 1, '2023-10-20 22:35:09', 'nreynaud@ramos.com', '2310WGCHV', 'Dolor ab rerum nobis. Quo commodi sit voluptates labore delectus. Vel repellendus sint ex eaque deserunt. Rerum et nesciunt facere nisi vel.', 'REJECTED'),
--     (27, 1, 7, 1, '2023-10-21 22:35:09', 'georges11@gmail.com', '2310PGTDY', 'Doloribus rerum aut fugiat sint ut tempore et. Mollitia tempora autem voluptatem saepe. Et labore optio voluptatibus assumenda sed non. Eum cum repellendus doloribus nobis.', 'RESOLVED'),
--     (28, 2, 3, NULL, '2023-10-18 22:35:09', 'ruiz.emilie@live.com', '2310GYFQZ', 'Maxime ut est tenetur eius eos odio rerum. Et et cupiditate hic quo vel ipsa. Rerum voluptas magnam sunt nostrum molestiae quis nisi debitis. Enim odio laboriosam rerum ratione dolore quasi. Nostrum consectetur eos minus aut quibusdam iure animi enim.', 'NEW'),
--     (29, 1, 7, NULL, '2023-10-18 22:35:09', 'susan.brunet@live.com', '2310YRBGJ', 'Explicabo fuga molestiae et sit. Asperiores accusamus incidunt qui rem. Neque explicabo non non culpa dolor voluptas ratione labore. Sapiente illo sapiente aliquid rerum odio rerum. Quae qui et omnis animi.', 'NEW'),
--     (30, 3, 5, 1, '2023-10-19 22:35:09', 'mary.raymond@noos.fr', '2310NVYMT', 'Dolores provident ex error aut. Aspernatur totam deserunt dolorem autem qui cupiditate.', 'PROCESSING'),
--     (31, 4, 5, 2, '2023-10-19 22:35:09', 'laure.legrand@sfr.fr', '2310GJMKT', 'Cumque fugit nulla tenetur nemo rerum minima magnam. Vel officia laborum porro facere voluptatum odio. Ratione quos labore sit repellendus possimus. Veritatis sint maiores omnis consectetur laboriosam consectetur repudiandae et.', 'PROCESSING'),
--     (32, 1, 3, 1, '2023-10-21 22:35:09', 'remy92@faivre.fr', '2310FTAYH', 'Eveniet magnam officia totam. Ad itaque consequuntur illum a molestias ut excepturi aspernatur. Ut ut accusamus corrupti nulla voluptatem necessitatibus voluptatem laudantium.', 'RESOLVED'),
--     (33, 1, 3, NULL, '2023-10-18 22:35:09', 'marion.alix@noos.fr', '2310UWJRB', 'Qui beatae possimus ipsa in nam tenetur. Enim et vero excepturi dolor perspiciatis est rem. Totam placeat ut odio facilis laborum a sed. Necessitatibus temporibus sit velit placeat illum.', 'NEW'),
--     (34, 3, 7, NULL, '2023-10-18 22:35:09', 'alice43@live.com', '2310DKUHR', 'Fugiat officia aut dolorum qui. Qui perspiciatis itaque aut. Quo ut sed ut aut.', 'NEW'),
--     (35, 1, 3, NULL, '2023-10-18 22:35:09', 'guillaume91@diallo.net', '2310XVMKC', 'Aut quia neque ipsa nam excepturi voluptatibus ea. Quos provident qui eos odit. Nulla magnam at esse maxime dolorem voluptate. Est hic nihil enim qui eos sint.', 'NEW'),
--     (36, 2, 6, 1, '2023-10-19 22:35:09', 'lebon.manon@durand.com', '2310GNETP', 'Quia deserunt dolores et omnis nihil tenetur sit. Cum eos omnis unde eveniet. Quos aut ducimus consequatur delectus commodi neque quia.', 'PROCESSING'),
--     (37, 4, 1, 1, '2023-10-19 22:35:09', 'wleveque@hotmail.fr', '2310SKTXM', 'Voluptate laudantium autem et alias rerum dicta aut. Odit adipisci molestiae quaerat et. Quo nemo magnam ratione asperiores.', 'PROCESSING'),
--     (38, 3, 2, NULL, '2023-10-18 22:35:09', 'jean.chauvet@simon.fr', '2310MFUXB', 'Architecto laborum ducimus commodi ut assumenda laudantium. Delectus ut veniam eos aut. Aut voluptas ea quo dolore velit et ipsam.', 'NEW'),
--     (39, 2, 2, 1, '2023-10-20 22:35:09', 'claire10@descamps.fr', '2310FABVN', 'Adipisci enim doloremque beatae quis quis nesciunt ducimus. Quae rerum nostrum autem vel. Est nulla et harum molestias quibusdam iusto. Dolorem doloribus saepe deserunt qui ducimus aut perferendis.', 'REJECTED'),
--     (40, 4, 4, 1, '2023-10-18 22:35:09', 'manon.gallet@jourdan.com', '2310EUDGJ', 'Esse eum vel et reiciendis ut eaque sequi. Fugiat voluptas officia in. Odio omnis accusantium omnis sint veniam. Non consectetur quaerat fuga delectus qui.', 'NEW'),
--     (41, 4, 2, 2, '2023-10-20 22:35:09', 'sgautier@hotmail.fr', '2310CPRJS', 'Earum qui voluptas voluptatibus fuga. Rerum aspernatur aut aspernatur culpa. Ut consequatur quaerat pariatur velit nihil dolorem ea. Cupiditate architecto soluta voluptates saepe voluptatem.', 'REJECTED'),
--     (42, 2, 4, 1, '2023-10-20 22:35:09', 'riviere.agathe@besson.fr', '2310XZWQE', 'Maxime accusamus fuga at error aut provident possimus. Error enim sed illum numquam natus. Odio aut voluptas eos.', 'REJECTED'),
--     (43, 2, 5, 2, '2023-10-18 22:35:09', 'charles10@live.com', '2310NYBWA', 'Ut excepturi quam sint recusandae eum. Quia officia at doloribus nihil. Dolor ea illo vitae vitae ratione dolor.', 'NEW'),
--     (44, 3, 7, 1, '2023-10-20 22:35:09', 'cordier.jacqueline@dbmail.com', '2310ZDATY', 'Atque earum odio dignissimos placeat rerum quas praesentium et. Quo sit aut natus ea. Dolorem ut est dolorum quidem vero voluptate. Inventore eos eveniet sequi quibusdam maxime ducimus.', 'REJECTED'),
--     (45, 4, 1, 1, '2023-10-19 22:35:09', 'slanglois@yahoo.fr', '2310KSEPD', 'Doloribus provident sequi aut non quaerat ut. Et quibusdam molestiae doloribus nisi consequuntur quis aut. In sed fugiat deleniti nemo.', 'PROCESSING'),
--     (46, 3, 7, 2, '2023-10-21 22:35:09', 'jules.regnier@orange.fr', '2310DXCMP', 'Accusantium consequatur alias ratione amet. Autem perferendis dolor dolore praesentium vero facere. Error voluptatem dolor vel adipisci. Tempore illum deserunt inventore id voluptatem.', 'RESOLVED'),
--     (47, 4, 5, 2, '2023-10-21 22:35:09', 'aroger@club-internet.fr', '2310PJQYW', 'Expedita nemo ut quas corrupti exercitationem ipsam. Voluptatem corporis explicabo assumenda omnis tenetur velit numquam ea. Aperiam porro est sunt deserunt dolore et corrupti.', 'RESOLVED'),
--     (48, 3, 1, 1, '2023-10-21 22:35:09', 'michel.therese@legendre.fr', '2310GDTSW', 'Repudiandae itaque beatae rem illum quis assumenda impedit eos. Consequuntur numquam incidunt eveniet. Sequi atque et cumque cumque perspiciatis ducimus omnis. Et doloremque tempora atque voluptatum a ut voluptatem ea.', 'RESOLVED'),
--     (49, 1, 6, 2, '2023-10-20 22:35:09', 'bertrand78@weber.org', '2310AQURF', 'Culpa omnis assumenda dicta tempora distinctio porro dignissimos. Optio eos quidem ullam autem nemo ut magnam. Quia optio aliquam architecto nemo.', 'REJECTED'),
--     (50, 2, 3, 1, '2023-10-19 22:35:09', 'turpin.lorraine@yahoo.fr', '2310YFUZR', 'Rem facilis ea recusandae in. Voluptates temporibus ab accusantium. Amet aut accusamus corporis voluptatem inventore molestias.', 'PROCESSING');


--
-- Index pour la table `incident`
--
ALTER TABLE `incident`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_3D03A11A497B19F9` (`priority_id`),
  ADD KEY `IDX_3D03A11AC54C8C93` (`type_id`),
  ADD KEY `IDX_3D03A11A3970CDB6` (`followed_by_id`);

--
-- Index pour la table `priority`
--
ALTER TABLE `priority`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `incident`
--
ALTER TABLE `incident`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `priority`
--
ALTER TABLE `priority`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `type`
--
ALTER TABLE `type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `incident`
--
ALTER TABLE `incident`
  ADD CONSTRAINT `FK_3D03A11A3970CDB6` FOREIGN KEY (`followed_by_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_3D03A11A497B19F9` FOREIGN KEY (`priority_id`) REFERENCES `priority` (`id`),
  ADD CONSTRAINT `FK_3D03A11AC54C8C93` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
