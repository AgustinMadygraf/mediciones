CREATE TABLE `MT` (
  `id`        INT(11) NOT NULL AUTO_INCREMENT,
  `fecha`     VARCHAR(255) NOT NULL,
  `unixtime`  INT(16) NOT NULL,
  `datetime`  DATETIME NOT NULL,
  `pot_III`   FLOAT NOT NULL,
  `v_l1_l2`   FLOAT NOT NULL,
  `v_l2_l3`   FLOAT NOT NULL,
  `v_l3_l1`   FLOAT NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
