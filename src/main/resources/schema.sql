CREATE TABLE IF NOT EXISTS `tag`(
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签名称',
  `valid` int(11) NULL DEFAULT 1 COMMENT '是否可用',
  `created_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录创建人账号ID',
  `created_at` datetime(0) NULL DEFAULT NOW() COMMENT '记录创建时间',
  `modified_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NOW() COMMENT '记录修改人账号ID',
  `modified_at` datetime(0) NULL DEFAULT NOW() COMMENT '记录修改时间',
  `version` INT NULL DEFAULT 0 COMMENT '用于乐观锁',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '合同标签表' ROW_FORMAT = Dynamic;