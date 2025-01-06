/*
 Navicat Premium Dump SQL

 Source Server         : MySQLi
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : web-project

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 05/01/2025 20:52:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cache
-- ----------------------------
DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cache
-- ----------------------------

-- ----------------------------
-- Table structure for cache_locks
-- ----------------------------
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cache_locks
-- ----------------------------

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for friends
-- ----------------------------
DROP TABLE IF EXISTS `friends`;
CREATE TABLE `friends`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `from_id` bigint UNSIGNED NOT NULL,
  `to_id` bigint UNSIGNED NOT NULL,
  `accepted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `friends_from_id_foreign`(`from_id` ASC) USING BTREE,
  INDEX `friends_to_id_foreign`(`to_id` ASC) USING BTREE,
  CONSTRAINT `friends_from_id_foreign` FOREIGN KEY (`from_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `friends_to_id_foreign` FOREIGN KEY (`to_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of friends
-- ----------------------------
INSERT INTO `friends` VALUES (1, 2, 3, 0);
INSERT INTO `friends` VALUES (2, 2, 4, 1);
INSERT INTO `friends` VALUES (3, 5, 2, 1);
INSERT INTO `friends` VALUES (4, 6, 2, 1);
INSERT INTO `friends` VALUES (6, 2, 19, 0);
INSERT INTO `friends` VALUES (7, 10, 2, 1);
INSERT INTO `friends` VALUES (8, 2, 21, 1);
INSERT INTO `friends` VALUES (9, 2, 12, 0);

-- ----------------------------
-- Table structure for job_batches
-- ----------------------------
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `cancelled_at` int NULL DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of job_batches
-- ----------------------------

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED NULL DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `jobs_queue_index`(`queue` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (41, '0001_01_01_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (42, '0001_01_01_000001_create_cache_table', 1);
INSERT INTO `migrations` VALUES (43, '0001_01_01_000002_create_jobs_table', 1);
INSERT INTO `migrations` VALUES (44, '2024_05_24_050655_create_posts_table', 1);
INSERT INTO `migrations` VALUES (45, '2024_05_24_050814_create_friends_table', 1);
INSERT INTO `migrations` VALUES (46, '2024_05_25_151445_delete_friends_table', 2);

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `posts_user_id_foreign`(`user_id` ASC) USING BTREE,
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 82 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES (1, 2, 'Commodi rerum animi rerum excepturi ut. Deleniti aut et quia placeat est tenetur esse. Explicabo quos reprehenderit reprehenderit exercitationem ipsum. Animi est alias distinctio totam molestias rem.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (2, 2, 'Aut in et soluta quia. A est ea aperiam consequuntur reiciendis.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (3, 2, 'Sed ex sequi non perspiciatis. Quia qui magnam molestiae aperiam. Ut animi doloribus aut molestiae harum.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (4, 2, 'Illum aut architecto expedita accusantium est laudantium qui. Libero qui quis aut qui mollitia et velit. Omnis labore rerum doloremque.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (5, 3, 'Consequatur et iste voluptatibus totam. Ut itaque et ipsam veritatis molestiae. Eum quisquam quaerat rerum molestias alias quod. In commodi non molestiae eaque reiciendis.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (6, 3, 'Vitae odio sint autem omnis minus sit. Nihil quod autem quas nihil. Quo fugit qui molestias culpa doloribus.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (7, 3, 'Enim culpa sunt illo vel. Qui pariatur eveniet sed velit nulla. Maxime sit at dolores officia.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (8, 3, 'Delectus dolorum doloribus sint voluptatum quia eligendi harum. Et et nam repudiandae earum sunt libero. Ut molestiae illum cupiditate ipsam natus quas. Illum vel ex est mollitia quo officia aliquam.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (9, 4, 'Nisi dolores cupiditate voluptas velit sapiente ipsam adipisci. Odit deleniti porro fuga dolores dignissimos eius. Aut adipisci sed eius vel ut adipisci. Vero eos aut sint est voluptatem.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (10, 4, 'Hic est amet voluptates minus tenetur. Quisquam atque ab iure error dolor illum. In odit aperiam placeat est natus.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (11, 4, 'Blanditiis quia eligendi cum et. Unde aliquam repellat nam autem. Saepe suscipit eos voluptatibus itaque qui.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (12, 4, 'Voluptate maxime velit incidunt quia quae non. Ipsum cum odit magnam qui expedita. Vero voluptatem inventore adipisci voluptates dolor.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (13, 5, 'Nesciunt excepturi vitae perspiciatis non omnis et vero. Nulla nobis et unde esse neque ut ratione. Officiis in quibusdam consectetur dolorem magni. Dolores eos earum nam et sit minima eos.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (14, 5, 'Esse non cupiditate in natus id. Aut itaque quia omnis eum consectetur. Exercitationem accusantium nihil quidem inventore.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (15, 5, 'Praesentium necessitatibus eveniet rerum animi distinctio. Omnis est placeat quo error. Incidunt occaecati vel quo ipsum quaerat earum dicta. Vitae sint cupiditate rerum rerum harum reiciendis et ut.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (16, 5, 'Explicabo atque assumenda dolore architecto. Repudiandae nobis ut voluptas nam repudiandae omnis. Laboriosam ipsam doloribus hic est fugit.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (17, 6, 'Itaque dolor velit aliquid molestiae quibusdam. Dolor ad voluptatum non non. Vitae dolores minus sed nesciunt et nesciunt aliquid.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (18, 6, 'Ea dolores delectus aut ut quae inventore quisquam. Qui labore ducimus qui. Culpa atque possimus laborum vel veritatis libero. Natus rem repellat ullam non quia et. Error molestias velit expedita ut.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (19, 6, 'Reiciendis dignissimos vitae laborum non. Odit error magni necessitatibus libero. Earum omnis et quia suscipit est pariatur expedita.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (20, 6, 'Occaecati distinctio ut quibusdam a ut ipsa perferendis. Dignissimos dolores id omnis voluptas harum nulla. Est fuga unde nesciunt porro qui qui.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (21, 7, 'Ullam dolorum et minus. Molestiae hic provident qui praesentium error exercitationem. Quidem voluptatem est occaecati et omnis ipsa.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (22, 7, 'Dolorem eos aut quo voluptas doloremque ratione. Vel quod voluptatem inventore dolor et. Et omnis aut aut vitae.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (23, 7, 'Expedita qui ullam amet est. Quia enim praesentium animi magni occaecati perferendis. Non architecto modi quo. Ut cum dolorem animi tempora iste.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (24, 7, 'Voluptas vitae occaecati hic. Suscipit dolorum enim dolorem qui natus dolorum aliquid.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (25, 8, 'Culpa eos sunt quam voluptatem dolor deserunt. Officia sed voluptas culpa fuga culpa odio. Officiis accusamus dicta ut eos consequuntur.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (26, 8, 'Voluptatem explicabo eius minus rem quisquam non accusantium a. Assumenda sunt molestiae doloribus aut et. Suscipit ea veniam rerum eligendi nemo iusto.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (27, 8, 'Ut quia dolorem repudiandae quaerat omnis ut. Quidem ut id laudantium amet enim qui fugiat. Quisquam libero ut minus vero atque autem.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (28, 8, 'Officia asperiores quo consequatur consequatur voluptas eaque quia sapiente. Dolorem occaecati explicabo delectus est ad natus eum at. Velit omnis dolorum consequatur maiores rerum exercitationem.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (29, 9, 'Eligendi nihil officiis accusamus ut suscipit. Accusantium odio reiciendis animi necessitatibus consequatur neque. Quam fugiat id voluptates consequuntur dolore dicta.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (30, 9, 'Doloremque consequatur repellat perspiciatis nihil modi. Id dolorem cumque deleniti minima dolorum aut voluptatem. Eveniet cupiditate amet perferendis nulla.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (31, 9, 'Sint consectetur voluptatem non exercitationem maiores maiores laudantium. Vel natus ipsum non doloribus quo sit architecto. Et nihil omnis id vitae accusamus sed debitis. Sit fugiat aut unde in in.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (32, 9, 'Aliquam recusandae molestiae sed eius perferendis quae et. Nihil odit et voluptas enim voluptatibus. Eveniet ipsam laudantium dolores similique. Odit et numquam sint labore porro facilis et.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (33, 10, 'Et eius quia dolores maiores consectetur explicabo. Accusamus et optio voluptatum alias. Nobis porro vel quia quia.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (34, 10, 'Aliquam aliquid tempora rerum nam aut. Architecto id qui molestias itaque quas cumque. Error voluptas delectus adipisci fuga natus eligendi.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (35, 10, 'Voluptatibus id voluptatem provident. Non ut est hic et. Nihil tempora qui voluptatem excepturi.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (36, 10, 'Quisquam enim itaque hic quisquam numquam delectus quo. Autem vel non eaque et cumque.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (37, 11, 'Vel reiciendis hic dignissimos sapiente cumque fugit voluptatem. At magnam sed hic sit quas deserunt vitae. Praesentium est repudiandae dolorum reiciendis in atque non.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (38, 11, 'Voluptates saepe consequatur et blanditiis. Aliquid ut asperiores earum neque tenetur. Nobis omnis tempora eum odit rerum. Ipsa dolorem magnam repellendus molestias sed sequi.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (39, 11, 'Est aut hic doloremque facilis dolorem quisquam molestiae. Dolor culpa nostrum temporibus quia eligendi corporis quia. Quae est ut sint.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (40, 11, 'In laboriosam et deserunt sint eaque explicabo veritatis. Perferendis quas vero inventore autem. Nostrum sed ipsa quo dolor ratione exercitationem aperiam. Doloribus beatae vitae ut totam iusto.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (41, 12, 'Adipisci earum consequatur assumenda sed eum qui. Illum nesciunt harum tempore. Illum fuga repellendus blanditiis labore qui est assumenda.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (42, 12, 'Voluptatem quia cupiditate error ad modi nulla consectetur. Quia laudantium harum adipisci rem ipsum quam et. Aut occaecati mollitia officiis molestias.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (43, 12, 'Ut libero voluptates facere voluptatem. Veniam soluta qui consequatur quis unde voluptatem. Qui et iusto rem impedit officiis qui. Similique eum alias aut.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (44, 12, 'Aliquid iste iure ipsam eligendi eligendi odit. Nisi suscipit iste ipsum quos. Inventore ipsa recusandae quibusdam quidem voluptas.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (45, 13, 'Nesciunt commodi ea enim sunt et. Ipsa quis hic tempore enim exercitationem. Illum magnam sequi quia veniam voluptatem doloremque harum.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (46, 13, 'Aliquam ipsa odio est atque modi rem laudantium. Maxime ipsam distinctio incidunt est laboriosam enim quam. Nemo possimus dolor maiores in nemo ut neque. Asperiores a ullam soluta nostrum earum.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (47, 13, 'Occaecati doloribus magnam rerum soluta ad dolorem aliquid. Quos cumque ut placeat omnis eum sed et. Qui voluptatem earum explicabo praesentium. Labore illo ducimus laudantium veniam ut qui maxime.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (48, 13, 'Molestiae alias dolor iste velit quidem sunt. Facilis sapiente est eligendi modi atque voluptatum voluptatem. Labore voluptas velit quia voluptatem delectus ab.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (49, 14, 'Doloribus nobis et ut. Ullam blanditiis et ut voluptas sint reiciendis sequi. Saepe veritatis omnis iste molestiae.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (50, 14, 'Eos eveniet ut reiciendis eius. Asperiores accusamus nesciunt officiis omnis exercitationem qui facilis. Iure voluptatibus vel sit at dolore repellendus vero.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (51, 14, 'Dignissimos voluptatem cupiditate voluptatibus est sed nesciunt. Blanditiis iste cumque ad quo aperiam praesentium. Ab enim non possimus sit neque inventore et.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (52, 14, 'Odit sint est in voluptas vero. In est aut eum praesentium temporibus saepe nisi. Ipsam quia deleniti perferendis natus aliquam earum a deleniti. Expedita iusto quo praesentium.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (53, 15, 'Accusantium omnis libero non. Quibusdam similique voluptas est officia deserunt pariatur consequatur. Ut adipisci reiciendis corrupti molestias eius.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (54, 15, 'Doloremque tempore qui repudiandae aliquid eos. Aut excepturi enim et ipsam omnis. Animi eveniet quia laborum numquam ex dicta. Totam voluptatem qui cupiditate rerum omnis ratione tempora eveniet.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (55, 15, 'Illo et non nisi et velit velit quia. Odit fugit laborum fugiat facere. Adipisci est quo eos ipsam eaque. Officiis et ad et sed voluptatum qui.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (56, 15, 'Officiis dignissimos sunt consequatur quam. Officiis dolores id aut incidunt rerum commodi nostrum. Ipsam eos delectus commodi rerum soluta culpa. Omnis ut eos omnis error.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (57, 16, 'Autem quo tenetur delectus illum impedit. Consequatur id debitis iste.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (58, 16, 'Fugit alias sapiente voluptatem corporis ut. Quidem sed voluptate ut eos natus tenetur reiciendis. Quia voluptas repudiandae aut veritatis eum enim tempora sit.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (59, 16, 'Asperiores voluptates corrupti non ut placeat porro ut. Rerum velit dolores excepturi recusandae et est. Est dignissimos qui quas. Officia ut molestiae asperiores voluptatum.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (60, 16, 'Perspiciatis id rerum aut exercitationem. Et ea molestiae quia. Cumque illum reprehenderit a ex mollitia ut. Molestiae vel quia ullam sed recusandae incidunt incidunt.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (61, 17, 'Praesentium ut quia ipsum. Ipsum eos omnis nesciunt et est suscipit neque.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (62, 17, 'Autem ea nesciunt ut velit vitae saepe. Doloribus dolores fuga dicta et sint ipsum vel tempore. Eveniet quo dicta velit nobis. Veritatis reiciendis ea iusto.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (63, 17, 'Nostrum nulla soluta laboriosam aut sed et. Nulla et possimus repudiandae itaque. Aut nostrum velit aut est officiis dolor. Aspernatur at accusantium reiciendis odio fuga totam.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (64, 17, 'Esse magnam velit voluptates impedit rerum. Commodi magnam expedita autem dolor dolore aut. Dolorem dignissimos rerum in laboriosam qui est.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (65, 18, 'Praesentium quia qui nihil doloribus eum. Omnis laudantium incidunt eos harum non. Accusamus doloribus deleniti tempora et asperiores facilis sed.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (66, 18, 'Officiis qui vitae itaque veritatis. Hic unde at eius sint et modi. Nostrum pariatur et deleniti corrupti quas quas eum reiciendis. Cupiditate nihil quos voluptas dolores minus molestiae.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (67, 18, 'Ut omnis nulla fugiat consequatur. Rem voluptas totam et nostrum. Est libero id officiis mollitia. Suscipit nostrum maiores consequuntur ipsa totam rem.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (68, 18, 'Consequatur ut ad ab qui quaerat exercitationem. Voluptates repellendus dolore illo quas. Et neque fugiat suscipit itaque ex.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (69, 19, 'Ipsa sit adipisci nihil odio molestias et error magnam. Recusandae vitae et id voluptas aspernatur sit. Nihil doloremque eum et sunt. Odio maxime et fugit quia praesentium molestiae.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (70, 19, 'Similique quaerat aut unde non optio asperiores sit. Quasi omnis voluptas aut qui aut veniam optio cum. Minima ut a enim ut. Ullam eligendi tempora voluptas ab eveniet qui.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (71, 19, 'Neque vel ullam aut sunt et est quia. Modi eligendi corrupti sequi aliquam nihil. Facilis nisi repudiandae cum molestiae.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (72, 19, 'Molestias repudiandae unde omnis ea ducimus dignissimos non. Vitae nisi aut nihil commodi aliquam ducimus quaerat.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (73, 20, 'Aliquid maiores soluta dolorem quibusdam. Omnis magnam vel blanditiis. Et facere sit pariatur. Id earum voluptatem ut laborum voluptatum suscipit.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (74, 20, 'Libero in id exercitationem aut dolorem dolor quibusdam. Deleniti nesciunt excepturi officiis qui. Adipisci fugit cum voluptas esse magnam. Non corrupti ea nobis voluptas quia natus.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (75, 20, 'Non et recusandae aut sunt quasi. Ut culpa sapiente et illo commodi dicta. Veniam cumque nihil corrupti sint dignissimos nam. Accusantium ut quo occaecati id consequatur natus.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (76, 20, 'Maiores consectetur quidem nihil a omnis. Vel sequi laudantium minima illo aut et voluptatum. Quibusdam quidem omnis dolores accusantium.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (77, 21, 'Sed fugiat quisquam aliquid vitae voluptas. Similique iusto repellat voluptas animi illum. Ipsa dolorem beatae assumenda laborum. Dolor dolor magnam maxime earum placeat blanditiis eius.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (78, 21, 'Et nihil sapiente aut aut amet consequuntur. Qui harum molestias et quia. Incidunt illo rerum eos unde voluptatem quo sit non.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (79, 21, 'Rerum est quam quis exercitationem laborum. A ab quos quo facere. Dolorum sed culpa aspernatur error autem.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (80, 21, 'Aspernatur quis maiores vitae nobis totam occaecati. Consectetur neque voluptatum provident maxime delectus aut. Voluptatem aut hic suscipit cum et enim pariatur. Consequatur unde quia quasi.', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `posts` VALUES (81, 2, 'My first post', '2024-05-25 07:25:54', '2024-05-25 07:25:54');

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sessions_user_id_index`(`user_id` ASC) USING BTREE,
  INDEX `sessions_last_activity_index`(`last_activity` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('rDBrl4wLzLFJSa3aQacmpq1NES4VGvFgzilg62Ki', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiV09NZmNFS0tKNGdGSkVkRVFLV0dQN0lnMG5iRE16ZVVjSTVpR1hCeCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM0OiJodHRwczovL3dlYi1wcm9qZWN0LnRlc3QvcHJvZmlsZS8yIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mjt9', 1716657103);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Lottie Hirthe IV', 'test@test.com', '2024-05-24 05:51:49', '$2y$12$vKOuZp96Jsr884zi4H0ef.3.TjkbPGmRhxFgXon8keWK5RV5t7sv6', 'UtEhXbs5syObM2XuJkOmSMI4gKqiW4cTj78M8dtYLWz8TwFrLg765jw2mw4y', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `users` VALUES (2, 'Darrell Leffler III', 'nemard@example.org', '2024-05-24 05:51:49', '$2y$12$vKOuZp96Jsr884zi4H0ef.3.TjkbPGmRhxFgXon8keWK5RV5t7sv6', 'NVQpcubHPS', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `users` VALUES (3, 'Reggie Effertz', 'aryanna.quigley@example.com', '2024-05-24 05:51:49', '$2y$12$vKOuZp96Jsr884zi4H0ef.3.TjkbPGmRhxFgXon8keWK5RV5t7sv6', 'k8Oz0UpZfy', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `users` VALUES (4, 'Miss Georgette Emmerich MD', 'enoch84@example.org', '2024-05-24 05:51:49', '$2y$12$vKOuZp96Jsr884zi4H0ef.3.TjkbPGmRhxFgXon8keWK5RV5t7sv6', 'efS6h7s85J', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `users` VALUES (5, 'Demond Gutkowski Sr.', 'rosella10@example.net', '2024-05-24 05:51:49', '$2y$12$vKOuZp96Jsr884zi4H0ef.3.TjkbPGmRhxFgXon8keWK5RV5t7sv6', 'aUJFE958ri', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `users` VALUES (6, 'Dr. Helene Gutkowski I', 'roma.murray@example.net', '2024-05-24 05:51:49', '$2y$12$vKOuZp96Jsr884zi4H0ef.3.TjkbPGmRhxFgXon8keWK5RV5t7sv6', '2x0BS8hYwT', '2024-05-24 05:51:49', '2024-05-25 16:21:37');
INSERT INTO `users` VALUES (7, 'Prof. Jarred Gutkowski Jr.', 'hal.harvey@example.org', '2024-05-24 05:51:49', '$2y$12$vKOuZp96Jsr884zi4H0ef.3.TjkbPGmRhxFgXon8keWK5RV5t7sv6', 'mPDaVS0N2J', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `users` VALUES (8, 'Cortez Davis', 'dking@example.net', '2024-05-24 05:51:49', '$2y$12$vKOuZp96Jsr884zi4H0ef.3.TjkbPGmRhxFgXon8keWK5RV5t7sv6', 'BH8utdyYlc', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `users` VALUES (9, 'Arlie Stark', 'abernathy.kirstin@example.org', '2024-05-24 05:51:49', '$2y$12$vKOuZp96Jsr884zi4H0ef.3.TjkbPGmRhxFgXon8keWK5RV5t7sv6', 'hP1Lf9RgDt', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `users` VALUES (10, 'Asha Hettinger', 'kenya51@example.org', '2024-05-24 05:51:49', '$2y$12$vKOuZp96Jsr884zi4H0ef.3.TjkbPGmRhxFgXon8keWK5RV5t7sv6', 'KKC2vCMXUC', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `users` VALUES (11, 'Ms. Margret Von II', 'windler.dion@example.com', '2024-05-24 05:51:49', '$2y$12$vKOuZp96Jsr884zi4H0ef.3.TjkbPGmRhxFgXon8keWK5RV5t7sv6', 'cJ33lbf6hP', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `users` VALUES (12, 'Reilly Nitzsche', 'johnnie.walter@example.net', '2024-05-24 05:51:49', '$2y$12$vKOuZp96Jsr884zi4H0ef.3.TjkbPGmRhxFgXon8keWK5RV5t7sv6', 'ttNdSd9G9R', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `users` VALUES (13, 'Willa Metz', 'bayer.skye@example.org', '2024-05-24 05:51:49', '$2y$12$vKOuZp96Jsr884zi4H0ef.3.TjkbPGmRhxFgXon8keWK5RV5t7sv6', 'RNUvQonWcN', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `users` VALUES (14, 'Dr. Eryn Heidenreich V', 'ibalistreri@example.com', '2024-05-24 05:51:49', '$2y$12$vKOuZp96Jsr884zi4H0ef.3.TjkbPGmRhxFgXon8keWK5RV5t7sv6', 'TAAumEImNy', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `users` VALUES (15, 'Prof. Delphine Bosco', 'heller.carson@example.net', '2024-05-24 05:51:49', '$2y$12$vKOuZp96Jsr884zi4H0ef.3.TjkbPGmRhxFgXon8keWK5RV5t7sv6', 'D2RcQxL6Tc', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `users` VALUES (16, 'Terrell Thiel', 'kaitlin71@example.com', '2024-05-24 05:51:49', '$2y$12$vKOuZp96Jsr884zi4H0ef.3.TjkbPGmRhxFgXon8keWK5RV5t7sv6', 'Xm8WDUUqty', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `users` VALUES (17, 'Mr. Jamie Fay III', 'ltoy@example.net', '2024-05-24 05:51:49', '$2y$12$vKOuZp96Jsr884zi4H0ef.3.TjkbPGmRhxFgXon8keWK5RV5t7sv6', 'q5VkCwLqjD', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `users` VALUES (18, 'Prof. Hermann Balistreri V', 'jocelyn.hyatt@example.net', '2024-05-24 05:51:49', '$2y$12$vKOuZp96Jsr884zi4H0ef.3.TjkbPGmRhxFgXon8keWK5RV5t7sv6', 'bD1ffbZdND', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `users` VALUES (19, 'Christopher Haag', 'xkihn@example.org', '2024-05-24 05:51:49', '$2y$12$vKOuZp96Jsr884zi4H0ef.3.TjkbPGmRhxFgXon8keWK5RV5t7sv6', 't9p8A7NwiO', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `users` VALUES (20, 'Tina Rodriguez', 'nolan.schiller@example.org', '2024-05-24 05:51:49', '$2y$12$vKOuZp96Jsr884zi4H0ef.3.TjkbPGmRhxFgXon8keWK5RV5t7sv6', 'BX77Pie5Ng', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `users` VALUES (21, 'Mr. Russell Ortiz', 'ryan.ofelia@example.net', '2024-05-24 05:51:49', '$2y$12$vKOuZp96Jsr884zi4H0ef.3.TjkbPGmRhxFgXon8keWK5RV5t7sv6', 'wor8laSeER', '2024-05-24 05:51:49', '2024-05-24 05:51:49');
INSERT INTO `users` VALUES (22, 'Test User', 'test@example.com', '2024-05-24 05:51:49', '$2y$12$vKOuZp96Jsr884zi4H0ef.3.TjkbPGmRhxFgXon8keWK5RV5t7sv6', 'RVV1JGE1eg', '2024-05-24 05:51:49', '2024-05-24 05:51:49');

SET FOREIGN_KEY_CHECKS = 1;
