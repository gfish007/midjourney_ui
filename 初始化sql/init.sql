/*
 Navicat Premium Data Transfer

 Source Server         : AWS
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : gfish.crrqpogediag.ap-east-1.rds.amazonaws.com:3906
 Source Schema         : mj

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 19/12/2023 16:34:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for df_account_auth
-- ----------------------------
DROP TABLE IF EXISTS `df_account_auth`;
CREATE TABLE `df_account_auth`  (
                                    `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                    `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                    `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                    `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                    `account_id` bigint NOT NULL DEFAULT 0 COMMENT '账户id',
                                    `auth_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '授权码',
                                    `use_flag` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT 'N' COMMENT '是否使用Y是N否',
                                    `gmt_active` datetime NULL DEFAULT NULL COMMENT '激活时间',
                                    `active_account_id` bigint NULL DEFAULT NULL COMMENT '激活账户id',
                                    `active_user_id` bigint NULL DEFAULT NULL COMMENT '激活用户id',
                                    `auth_way` enum('DAY','TIME') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '授权方式DAY 按天 TIME 指定时间',
                                    `auth_days` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '授权天数(为空则不限制）',
                                    `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '备注',
                                    `use_way` enum('OWNER','GOODS') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'OWNER' COMMENT '用途\'OWNER\',\'GOODS\'',
                                    `other_info` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '其他信息',
                                    `source` enum('CHATGPT','MJ') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'MJ' COMMENT '来源CHATGPT  MJ',
                                    `user_id` bigint NULL DEFAULT NULL COMMENT '创建的用户id',
                                    PRIMARY KEY (`id`) USING BTREE,
                                    INDEX `account_id`(`account_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1736578954858594307 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '账号授权表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_account_chatgpt
-- ----------------------------
DROP TABLE IF EXISTS `df_account_chatgpt`;
CREATE TABLE `df_account_chatgpt`  (
                                       `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                       `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                       `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                       `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                       `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL,
                                       `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
                                       `account_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '账号名',
                                       `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '密码',
                                       `mfa_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '二次验证',
                                       `access_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT 'access token',
                                       `session_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT 'session token',
                                       `refresh_access_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT 'refresh_access_token',
                                       `refresh_session_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT 'refresh_session_token',
                                       `gmt_access_expire` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '过期时间',
                                       `gmt_session_expire` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '过期时间',
                                       `gmt_refresh_access_expire` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '过期时间',
                                       `gmt_refresh_session_expire` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '过期时间',
                                       PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1727156149138935810 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = 'chatgpt账户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_account_chatgpt_share
-- ----------------------------
DROP TABLE IF EXISTS `df_account_chatgpt_share`;
CREATE TABLE `df_account_chatgpt_share`  (
                                             `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                             `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                             `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                             `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                             `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
                                             `chatgpt_id` bigint NULL DEFAULT NULL COMMENT 'chatgpt id',
                                             `share_token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '分享token',
                                             `gmt_expired` datetime NULL DEFAULT NULL COMMENT '账号过期时间',
                                             `response` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '响应信息',
                                             `sort` int NULL DEFAULT 1 COMMENT '排序',
                                             `auth_type` enum('O','A') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'O' COMMENT '权限类型 O 主账号 A授权',
                                             PRIMARY KEY (`id`) USING BTREE,
                                             INDEX `idx_userid_chatgptid`(`user_id` ASC, `chatgpt_id` ASC) USING BTREE,
                                             INDEX `idx_chatgptid`(`chatgpt_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1726538562755547138 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = 'chatgpt账户分享token' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_account_discord
-- ----------------------------
DROP TABLE IF EXISTS `df_account_discord`;
CREATE TABLE `df_account_discord`  (
                                       `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                       `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                       `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                       `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                       `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
                                       `account_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '自定义名称',
                                       `discord_user_id` bigint NULL DEFAULT NULL COMMENT 'discord用户Id',
                                       `owner_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'N' COMMENT '自有标识Y是N否',
                                       `guild_id` bigint NULL DEFAULT NULL COMMENT '服务器ID',
                                       `guild_title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '服务器title',
                                       `channel_id` bigint NULL DEFAULT NULL COMMENT '频道ID',
                                       `state` enum('invalid','normal','error','end','stop') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'normal' COMMENT '账号状态 待验证：invalid，正常：normal，异常：error，已结束：end',
                                       `acc_mode` enum('GROUP','SINGLE') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'GROUP' COMMENT '模式 GROUP | SINGLE',
                                       `default_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'N' COMMENT '默认账号',
                                       `num_execute` int NULL DEFAULT 50 COMMENT '可同时提交的任务数',
                                       `expire_time` datetime NULL DEFAULT NULL COMMENT '过期时间',
                                       PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1736579694696071170 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = 'discord账户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_account_discord_info
-- ----------------------------
DROP TABLE IF EXISTS `df_account_discord_info`;
CREATE TABLE `df_account_discord_info`  (
                                            `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                            `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                            `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                            `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                            `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
                                            `total_fast_times` int NULL DEFAULT NULL COMMENT '总快速次数',
                                            `total_turbo_times` int NULL DEFAULT NULL COMMENT '总turbo次数',
                                            `total_relax_times` int NULL DEFAULT NULL COMMENT '总relax次数',
                                            `fast_times` int NULL DEFAULT NULL COMMENT '快速次数',
                                            `turbo_times` int NULL DEFAULT NULL COMMENT 'turbo次数',
                                            `relax_times` int NULL DEFAULT NULL COMMENT 'relax次数',
                                            `expire_time` datetime NULL DEFAULT NULL COMMENT '过期时间',
                                            `num_execute` int NULL DEFAULT NULL COMMENT '执行数',
                                            `num_success` int NULL DEFAULT NULL COMMENT '成功数',
                                            PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1736579694696071170 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = 'discord账户使用记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_account_discord_ref
-- ----------------------------
DROP TABLE IF EXISTS `df_account_discord_ref`;
CREATE TABLE `df_account_discord_ref`  (
                                           `id` bigint NOT NULL COMMENT 'Id',
                                           `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                           `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                           `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                           `discord_user_id` bigint NULL DEFAULT NULL COMMENT 'discord用户id',
                                           `account_id` bigint NULL DEFAULT NULL COMMENT '账号id',
                                           PRIMARY KEY (`id`) USING BTREE,
                                           INDEX `idx_groupId_discordUserId`(`discord_user_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = 'discord账户组关联' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_dict
-- ----------------------------
DROP TABLE IF EXISTS `df_dict`;
CREATE TABLE `df_dict`  (
                            `id` bigint NOT NULL COMMENT 'Id',
                            `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                            `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                            `delete_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识 0 正常 1删除',
                            `group_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT 'groupKey',
                            `group_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT 'groupName',
                            `cons_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT 'cons_key',
                            `cons_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT 'cons_name',
                            `cons_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT 'cons_value',
                            `sort` int NULL DEFAULT 0 COMMENT '排序',
                            PRIMARY KEY (`id`) USING BTREE,
                            UNIQUE INDEX `idx_group_key_cons_key`(`group_key` ASC, `cons_key` ASC) USING BTREE,
                            INDEX `idx_cons_key`(`cons_key` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '字典配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_discord
-- ----------------------------
DROP TABLE IF EXISTS `df_discord`;
CREATE TABLE `df_discord`  (
                               `id` bigint NOT NULL COMMENT 'Id',
                               `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                               `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                               `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                               `mj_user_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT 'mj userId',
                               `global_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '名称',
                               `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '邮箱',
                               `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT 'discord用户名',
                               `user_token` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '用户token',
                               `session_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT 'session id',
                               `user_agent` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '调用discord接口、连接wss时的user-agent',
                               `use_concurrent` int NULL DEFAULT 0 COMMENT '已使用并发任务数',
                               `max_concurrent` int NULL DEFAULT 0 COMMENT '可并发任务数',
                               `mj_subscribe` int NULL DEFAULT 0 COMMENT 'mj订阅0 10 30 60 120',
                               `fast_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT 'N' COMMENT 'fast可用标识y是n否',
                               `state` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT 'Y' COMMENT '账号状态 Y可用 N禁用',
                               `discord_state` enum('NORMAL','VERIFY_HUMAN','EXPIRED') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'NORMAL' COMMENT 'DISCORD状态',
                               `mj_state` enum('VERIFY_HUMAN','STOP','NORMAL','BAN') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'STOP' COMMENT 'MJ状态',
                               `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '备注',
                               `info_str` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT 'info信息',
                               `error_msg` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '异常原因',
                               `owner_user_id` bigint NULL DEFAULT NULL COMMENT '账号持有用户id',
                               `private_channel_ids` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '[]' COMMENT '机器人的私人频道',
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = 'discord账户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_discord_channel
-- ----------------------------
DROP TABLE IF EXISTS `df_discord_channel`;
CREATE TABLE `df_discord_channel`  (
                                       `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                       `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                       `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                       `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                       `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '0' COMMENT '标题',
                                       `guild_id` bigint NOT NULL COMMENT '服务器ID',
                                       `enable_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT 'Y' COMMENT '启用标识 Y是N否',
                                       PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1715001594698797105 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = 'DISCORD频道表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_discord_group
-- ----------------------------
DROP TABLE IF EXISTS `df_discord_group`;
CREATE TABLE `df_discord_group`  (
                                     `id` bigint NOT NULL COMMENT 'Id',
                                     `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                     `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                     `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                     `user_id` bigint NULL DEFAULT NULL COMMENT '持有者用户id',
                                     `group_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '账户组名称',
                                     `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '备注',
                                     PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = 'discord账户组' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_discord_guild
-- ----------------------------
DROP TABLE IF EXISTS `df_discord_guild`;
CREATE TABLE `df_discord_guild`  (
                                     `id` bigint NOT NULL COMMENT 'Id',
                                     `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                     `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                     `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                     `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '服务器名称',
                                     `boot_niji` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'N' COMMENT 'niji机器人',
                                     `boot_midjourney` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'N' COMMENT 'midjourney 机器人',
                                     `boot_Insight_face_swap` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'N' COMMENT '换脸机器人',
                                     PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = 'discord服务器配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_discord_guild_member
-- ----------------------------
DROP TABLE IF EXISTS `df_discord_guild_member`;
CREATE TABLE `df_discord_guild_member`  (
                                            `id` bigint NOT NULL COMMENT 'Id',
                                            `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                            `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                            `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                            `discord_user_id` bigint NOT NULL COMMENT 'discord账户id',
                                            `guild_id` bigint NOT NULL COMMENT 'discord服务器id',
                                            PRIMARY KEY (`id`) USING BTREE,
                                            UNIQUE INDEX `unix_dui_gi`(`discord_user_id` ASC, `guild_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = 'discord服务器用户关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_discord_integration_config
-- ----------------------------
DROP TABLE IF EXISTS `df_discord_integration_config`;
CREATE TABLE `df_discord_integration_config`  (
                                                  `id` bigint NOT NULL COMMENT 'Id',
                                                  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                  `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                                  `delete_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识 0 正常 1删除',
                                                  `command_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '命令名',
                                                  `version` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '版本ID',
                                                  `command_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '命令对应ID',
                                                  `application_command` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '命令合计内容',
                                                  `boot_id` bigint NULL DEFAULT NULL COMMENT '机器人ID',
                                                  PRIMARY KEY (`id`) USING BTREE,
                                                  UNIQUE INDEX `unix_ci_cn`(`boot_id` ASC, `command_name` ASC) USING BTREE,
                                                  INDEX `idx_command_name`(`command_name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = 'discord版本配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_discord_server_zone
-- ----------------------------
DROP TABLE IF EXISTS `df_discord_server_zone`;
CREATE TABLE `df_discord_server_zone`  (
                                           `id` bigint NOT NULL COMMENT 'Id',
                                           `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                           `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                           `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                           `discord_id` bigint NULL DEFAULT NULL COMMENT '注册用户id',
                                           `zone_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '可用区code',
                                           PRIMARY KEY (`id`) USING BTREE,
                                           UNIQUE INDEX `unix_id_code`(`zone_code` ASC, `discord_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = 'Discord账号区域配置关联' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_draw_collect
-- ----------------------------
DROP TABLE IF EXISTS `df_draw_collect`;
CREATE TABLE `df_draw_collect`  (
                                    `id` bigint NOT NULL COMMENT 'Id',
                                    `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                    `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                    `delete_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识 0 正常 1删除',
                                    `user_id` bigint NOT NULL DEFAULT 0 COMMENT '用户id',
                                    `draw_task_id` bigint NOT NULL DEFAULT 0 COMMENT '绘画任务ID',
                                    `collect_category_id` bigint NOT NULL DEFAULT 0 COMMENT '分类ID',
                                    `sort` int NULL DEFAULT 0 COMMENT '排序',
                                    PRIMARY KEY (`id`) USING BTREE,
                                    INDEX `idx_uid_dtid_ccid`(`user_id` ASC, `collect_category_id` ASC, `draw_task_id` ASC) USING BTREE,
                                    INDEX `idx_task_id`(`draw_task_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '绘画任务收藏夹' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_draw_collect_category
-- ----------------------------
DROP TABLE IF EXISTS `df_draw_collect_category`;
CREATE TABLE `df_draw_collect_category`  (
                                             `id` bigint NOT NULL COMMENT 'Id',
                                             `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                             `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                             `delete_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识 0 正常 1删除',
                                             `user_id` bigint NOT NULL DEFAULT 0 COMMENT '用户id',
                                             `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '类目标题',
                                             `parent_id` bigint NOT NULL DEFAULT 0 COMMENT '父类目ID',
                                             `sort` int NULL DEFAULT 0 COMMENT '排序',
                                             PRIMARY KEY (`id`) USING BTREE,
                                             INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
                                             INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '绘画收藏夹分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_draw_task
-- ----------------------------
DROP TABLE IF EXISTS `df_draw_task`;
CREATE TABLE `df_draw_task`  (
                                 `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                 `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                 `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                 `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                 `space_id` bigint NULL DEFAULT NULL COMMENT '空间id',
                                 `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
                                 `ref_account_id` bigint NULL DEFAULT NULL COMMENT '账号ID',
                                 `privacy_mode` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '隐私模式Y是 N否',
                                 `channel` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '绘图通道 MJ：midjourney SD：stable dissfusion',
                                 `task_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '任务id(可能消息的MD5）',
                                 `prompt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '关键词内容JSON',
                                 `prompt_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '关键词翻译',
                                 `gmt_start` datetime NULL DEFAULT NULL COMMENT '任务开始时间',
                                 `gmt_finished` datetime NULL DEFAULT NULL COMMENT '完成时间',
                                 `use_seconds` int NULL DEFAULT 0 COMMENT '使用时间（秒）',
                                 `state` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '状态 PENDING:排队中 EXECUTING:执行中 FINISHED:已完成 FAIL:失败 取消:CANCEL 中断：DOWN',
                                 `sec_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'NOT_START' COMMENT '二级业务状态 未启动：NOT_START,已提交：SUBMITTED,执行中：IN_PROGRESS,失败： FAILURE,成功：SUCCESS',
                                 `response` json NULL COMMENT '返回内容JSON',
                                 `fail_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '失败消息',
                                 `result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '返回结果',
                                 `priority` tinyint NULL DEFAULT 0 COMMENT '任务优先级',
                                 PRIMARY KEY (`id`) USING BTREE,
                                 INDEX `idx_userid_spaceid_state`(`user_id` ASC, `space_id` ASC, `state` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1737004152040718338 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '绘画任务' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_draw_task_hot
-- ----------------------------
DROP TABLE IF EXISTS `df_draw_task_hot`;
CREATE TABLE `df_draw_task_hot`  (
                                     `id` bigint NOT NULL COMMENT 'Id',
                                     `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                     `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                     `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                     `task_id` bigint NULL DEFAULT NULL COMMENT '任务ID',
                                     `count_collect` bigint NULL DEFAULT NULL COMMENT '收藏统计',
                                     `count_love` bigint NULL DEFAULT NULL COMMENT '喜欢统计',
                                     PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '任务统计' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_draw_task_hot_rel
-- ----------------------------
DROP TABLE IF EXISTS `df_draw_task_hot_rel`;
CREATE TABLE `df_draw_task_hot_rel`  (
                                         `id` bigint NOT NULL COMMENT 'Id',
                                         `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                         `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         `task_id` bigint NULL DEFAULT NULL COMMENT '任务ID',
                                         `user_id` bigint NULL DEFAULT NULL COMMENT '收藏统计',
                                         PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '任务统计明细' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_draw_task_mj
-- ----------------------------
DROP TABLE IF EXISTS `df_draw_task_mj`;
CREATE TABLE `df_draw_task_mj`  (
                                    `id` bigint NOT NULL COMMENT 'Id',
                                    `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                    `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                    `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                    `user_id` bigint NULL DEFAULT NULL COMMENT '用户id(冗余)',
                                    `task_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '任务状态(冗余)',
                                    `space_id` bigint NULL DEFAULT NULL COMMENT '空间id',
                                    `account_id` bigint NULL DEFAULT NULL COMMENT '执行账户id',
                                    `account_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '执行账号名（冗余）',
                                    `ref_task_id` bigint NULL DEFAULT NULL COMMENT '关联上个任务ID',
                                    `boot_id` bigint NULL DEFAULT NULL COMMENT '机器人ID',
                                    `guild_id` bigint NULL DEFAULT NULL COMMENT 'guild ID',
                                    `guild_title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '服务器名称（冗余）',
                                    `channel_id` bigint NULL DEFAULT NULL COMMENT 'channel ID',
                                    `channel_title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '频道名称（冗余）',
                                    `discord_group_id` bigint NULL DEFAULT NULL COMMENT '账号组id',
                                    `discord_user_id` bigint NULL DEFAULT NULL COMMENT '对应账号id',
                                    `discord_user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '执行账号名（冗余）',
                                    `flags_raw` bigint NULL DEFAULT NULL COMMENT 'gpt说是标识用户是否是 Discord 员工，用户是否是 Discord 的合作伙伴，用户是否有 Nitro 订阅等。 待验证',
                                    `message_hash` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '图片hash',
                                    `ori_prompt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '原始prompt',
                                    `content_stripped` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '最终执行的prompt',
                                    `gmt_finished` datetime NULL DEFAULT NULL COMMENT '完成时间',
                                    `mode` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '模式RELAX、FAST',
                                    `command_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '操作类型imagine、blend...',
                                    `command_id` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '命令标识ID',
                                    `gmt_start` datetime NULL DEFAULT NULL COMMENT '任务开始时间',
                                    `message_id` bigint NULL DEFAULT NULL COMMENT '消息ID',
                                    `action_row` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '操作按钮',
                                    `gmt_choose` datetime NULL DEFAULT NULL COMMENT '任务选择时间',
                                    `mj_execute` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'N' COMMENT 'mj已运行 Y是N否',
                                    `privacy_mode` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'N' COMMENT '隐私模式Y是 N否',
                                    `origin` enum('SYS','DISCORD') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'SYS' COMMENT '来源 SYS 系统 DISCORD discord同步',
                                    `seed` bigint NULL DEFAULT NULL COMMENT 'seedId',
                                    `main_attachment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '主图',
                                    `ref_message_id` bigint NULL DEFAULT NULL COMMENT '关联消息id',
                                    `remark` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '备注扩展',
                                    `sec_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'NOT_START' COMMENT '二级业务状态 未启动：NOT_START,已提交：SUBMITTED,执行中：IN_PROGRESS,失败： FAILURE,成功：SUCCESS',
                                    PRIMARY KEY (`id`) USING BTREE,
                                    INDEX `idx_messge_id`(`message_id` ASC) USING BTREE,
                                    INDEX `idx_messageHash_discordUserId`(`message_hash` ASC, `discord_user_id` ASC) USING BTREE,
                                    INDEX `idx_disId_state`(`discord_user_id` ASC, `task_state` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '绘画任务' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_draw_task_mj_import
-- ----------------------------
DROP TABLE IF EXISTS `df_draw_task_mj_import`;
CREATE TABLE `df_draw_task_mj_import`  (
                                           `id` bigint NOT NULL COMMENT 'Id',
                                           `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                           `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                           `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                           `user_id` bigint NULL DEFAULT NULL COMMENT '用户id(冗余)',
                                           `task_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '任务状态(冗余)',
                                           `space_id` bigint NULL DEFAULT NULL COMMENT '空间id',
                                           `task_id` bigint NULL DEFAULT NULL COMMENT '任务ID',
                                           `account_id` bigint NULL DEFAULT NULL COMMENT '执行账户id',
                                           `account_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '执行账号名（冗余）',
                                           `ref_task_id` bigint NULL DEFAULT NULL COMMENT '关联上个任务ID',
                                           `boot_id` bigint NULL DEFAULT NULL COMMENT '机器人ID',
                                           `guild_id` bigint NULL DEFAULT NULL COMMENT 'guild ID',
                                           `guild_title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '服务器名称（冗余）',
                                           `channel_id` bigint NULL DEFAULT NULL COMMENT 'channel ID',
                                           `channel_title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '频道名称（冗余）',
                                           `discord_group_id` bigint NULL DEFAULT NULL COMMENT '账号组id',
                                           `discord_user_id` bigint NULL DEFAULT NULL COMMENT '对应账号id',
                                           `discord_user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '执行账号名（冗余）',
                                           `flags_raw` bigint NULL DEFAULT NULL COMMENT 'gpt说是标识用户是否是 Discord 员工，用户是否是 Discord 的合作伙伴，用户是否有 Nitro 订阅等。 待验证',
                                           `message_hash` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '图片hash',
                                           `ori_prompt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '原始prompt',
                                           `content_stripped` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '最终执行的prompt',
                                           `gmt_finished` datetime NULL DEFAULT NULL COMMENT '完成时间',
                                           `mode` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '模式RELAX、FAST',
                                           `command_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '操作类型imagine、blend...',
                                           `command_id` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '命令标识ID',
                                           `gmt_start` datetime NULL DEFAULT NULL COMMENT '任务开始时间',
                                           `message_id` bigint NULL DEFAULT NULL COMMENT '消息ID',
                                           `action_row` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '操作按钮',
                                           `gmt_choose` datetime NULL DEFAULT NULL COMMENT '任务选择时间',
                                           `mj_execute` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'N' COMMENT 'mj已运行 Y是N否',
                                           `privacy_mode` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'N' COMMENT '隐私模式Y是 N否',
                                           `origin` enum('SYS','DISCORD') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'SYS' COMMENT '来源 SYS 系统 DISCORD discord同步',
                                           `seed` bigint NULL DEFAULT NULL COMMENT 'seedId',
                                           `main_attachment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '主图',
                                           `custom_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '特殊标记',
                                           `batch_no` bigint NULL DEFAULT NULL COMMENT '批次号',
                                           PRIMARY KEY (`id`) USING BTREE,
                                           INDEX `idx_batch_no`(`batch_no` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '绘画任务导入备份表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_draw_task_mj_temp
-- ----------------------------
DROP TABLE IF EXISTS `df_draw_task_mj_temp`;
CREATE TABLE `df_draw_task_mj_temp`  (
                                         `id` bigint NOT NULL COMMENT 'Id',
                                         `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                         `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         `data` json NULL COMMENT '扩展字段',
                                         PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = 'MJ绘画任务扩展临时表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_draw_task_reamrk
-- ----------------------------
DROP TABLE IF EXISTS `df_draw_task_reamrk`;
CREATE TABLE `df_draw_task_reamrk`  (
                                        `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                        `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                        `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                        `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                        `ref_task_id` bigint NULL DEFAULT NULL COMMENT '绘画任务ID',
                                        `label` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '标签',
                                        `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '备注',
                                        PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1691264153135915010 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '绘画任务标记表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_draw_task_tag
-- ----------------------------
DROP TABLE IF EXISTS `df_draw_task_tag`;
CREATE TABLE `df_draw_task_tag`  (
                                     `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                     `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                     `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                     `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                     `task_id` bigint NULL DEFAULT NULL COMMENT '任务id',
                                     `tag_id` bigint NULL DEFAULT NULL COMMENT '标签id',
                                     `tag_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '标签名',
                                     `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
                                     PRIMARY KEY (`id`) USING BTREE,
                                     INDEX `idx_taskId_labelName`(`task_id` ASC, `tag_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1736376804656549890 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '绘画任务标签' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_draw_task_upscale
-- ----------------------------
DROP TABLE IF EXISTS `df_draw_task_upscale`;
CREATE TABLE `df_draw_task_upscale`  (
                                         `id` bigint NOT NULL COMMENT 'Id',
                                         `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                         `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         `upscale_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片连接，这里是media缩略图高清连接',
                                         `media_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片连接，这里是media缩略图连接',
                                         `prompt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '关键词',
                                         `public_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT 'N' COMMENT '公开标识 Y是N否',
                                         `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
                                         `count_hot` int NULL DEFAULT NULL COMMENT '火热数',
                                         `count_collect` int NULL DEFAULT NULL COMMENT '收藏数',
                                         PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '大图提取' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_drawing_example
-- ----------------------------
DROP TABLE IF EXISTS `df_drawing_example`;
CREATE TABLE `df_drawing_example`  (
                                       `id` bigint NOT NULL,
                                       `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                       `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                       `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                       `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片连接',
                                       `rewrite_image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '重写url',
                                       `prompt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '关键词',
                                       `sort` int NOT NULL DEFAULT 0,
                                       `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
                                       `show_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT 'Y是N否',
                                       `md5_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '唯一标识',
                                       `source` enum('MJ','SYS') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'SYS' COMMENT '来源',
                                       PRIMARY KEY (`id`) USING BTREE,
                                       UNIQUE INDEX `idx_md5Key`(`md5_key` ASC) USING BTREE,
                                       INDEX `idx_sort_id`(`sort` ASC, `id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_drawing_example_category
-- ----------------------------
DROP TABLE IF EXISTS `df_drawing_example_category`;
CREATE TABLE `df_drawing_example_category`  (
                                                `id` bigint NOT NULL,
                                                `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类目名称',
                                                `sort` int NOT NULL DEFAULT 0,
                                                `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                                `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                                `category_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类目编码',
                                                PRIMARY KEY (`id`) USING BTREE,
                                                INDEX `idx_category_code`(`category_code` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_drawing_example_rel
-- ----------------------------
DROP TABLE IF EXISTS `df_drawing_example_rel`;
CREATE TABLE `df_drawing_example_rel`  (
                                           `id` bigint NOT NULL,
                                           `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                           `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                           `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                           `sample_id` bigint NULL DEFAULT NULL COMMENT '样例id',
                                           `category_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类目编码',
                                           PRIMARY KEY (`id`) USING BTREE,
                                           UNIQUE INDEX `unix_categoryCode_sampleId`(`sample_id` ASC, `category_code` ASC) USING BTREE,
                                           INDEX `idx_category_code`(`category_code` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_goods
-- ----------------------------
DROP TABLE IF EXISTS `df_goods`;
CREATE TABLE `df_goods`  (
                             `id` bigint NOT NULL,
                             `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                             `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                             `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                             `user_id` bigint NULL DEFAULT NULL COMMENT '用户ID',
                             `goods_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '商品标题',
                             `stock` int NULL DEFAULT NULL COMMENT '商品库存',
                             `detail_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '商品描述',
                             `image_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '商品url连接',
                             `proxy_image_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '代理图片连接',
                             `goods_type` enum('GROUP','GOODS','AUTH_CODE') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '商品类型 GROUP,GOODS',
                             `ref_id` bigint NULL DEFAULT NULL COMMENT '关联id',
                             `special_label` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '特殊标签',
                             `goods_price` decimal(16, 2) NULL DEFAULT NULL COMMENT '商品价格',
                             `min_group_members` int NULL DEFAULT NULL COMMENT '最低成团人数',
                             `max_group_members` int NULL DEFAULT NULL COMMENT '最多成团人数',
                             `category_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '商品类目',
                             `goods_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '商品状态 UP、DOWN',
                             `skip_type` enum('THIRD','PLATFORM') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'PLATFORM' COMMENT '商品跳转类型 THIRD,PLATFORM',
                             `skip_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '跳转连接',
                             `info_body` json NULL COMMENT '更多详情',
                             PRIMARY KEY (`id`) USING BTREE,
                             INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
                             INDEX `idx_goods_title`(`goods_title` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_goods_stock
-- ----------------------------
DROP TABLE IF EXISTS `df_goods_stock`;
CREATE TABLE `df_goods_stock`  (
                                   `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                   `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                   `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                   `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                   `goods_id` bigint NOT NULL DEFAULT 0 COMMENT '商品id',
                                   `info_body` json NULL COMMENT '更多详情 比如授权码，比如账号密码',
                                   `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '备注',
                                   `state` enum('NONE','OUT_BOUND') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'NONE' COMMENT '状态\'NONE\',\'OUT_BOUND\' ',
                                   PRIMARY KEY (`id`) USING BTREE,
                                   INDEX `goods_id`(`goods_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1707787398890823682 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '商品库存表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_group_activity
-- ----------------------------
DROP TABLE IF EXISTS `df_group_activity`;
CREATE TABLE `df_group_activity`  (
                                      `id` bigint NOT NULL,
                                      `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                      `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                      `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                      `goods_id` bigint NULL DEFAULT NULL COMMENT '商品ID',
                                      `leader_user_id` bigint NULL DEFAULT NULL COMMENT '拼团领队ID',
                                      `goods_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '商品标题',
                                      `detail_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '商品描述',
                                      `image_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '商品url连接',
                                      `type` int NULL DEFAULT NULL COMMENT '商品类型',
                                      `special_lable` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '特殊标签',
                                      `goods_price` decimal(16, 2) NULL DEFAULT NULL COMMENT '商品价格',
                                      `min_group_memebers` int NULL DEFAULT NULL COMMENT '最低成团人数',
                                      `max_group_memebers` int NULL DEFAULT NULL COMMENT '最多成团人数',
                                      `category_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '商品类目',
                                      `status` enum('PENDING','SUCCESS','FAILED') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'PENDING' COMMENT '拼团状态',
                                      PRIMARY KEY (`id`) USING BTREE,
                                      INDEX `idx_leader_user_id`(`leader_user_id` ASC) USING BTREE,
                                      INDEX `idx_goods_id`(`goods_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '拼团表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_group_activity_member
-- ----------------------------
DROP TABLE IF EXISTS `df_group_activity_member`;
CREATE TABLE `df_group_activity_member`  (
                                             `id` bigint NOT NULL,
                                             `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                             `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                             `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                             `group_activity_id` bigint NULL DEFAULT NULL COMMENT '拼团成员ID',
                                             `user_id` bigint NULL DEFAULT NULL COMMENT '用户ID',
                                             PRIMARY KEY (`id`) USING BTREE,
                                             INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
                                             INDEX `idx_goods_id`(`group_activity_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_license_quota
-- ----------------------------
DROP TABLE IF EXISTS `df_license_quota`;
CREATE TABLE `df_license_quota`  (
                                     `id` bigint NOT NULL COMMENT 'Id',
                                     `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                     `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                     `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                     `hosting_ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '托管IP或host',
                                     `license_str` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT 'license',
                                     `hosting_user_id` bigint NULL DEFAULT NULL COMMENT '托管的用户id',
                                     `hosting_user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '托管的用户名',
                                     `quota` json NULL COMMENT '配额',
                                     `gmt_expire` datetime NULL DEFAULT NULL COMMENT '到期时间',
                                     `aes_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT 'aes加密key',
                                     PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '系统托管配额' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_message_consumer
-- ----------------------------
DROP TABLE IF EXISTS `df_message_consumer`;
CREATE TABLE `df_message_consumer`  (
                                        `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                        `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                        `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                        `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                        `md5_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '消息md5',
                                        `consumer_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '消费标识Y是N否',
                                        `topic` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT 'topic名称',
                                        `consumer_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '消费组名称',
                                        PRIMARY KEY (`id`) USING BTREE,
                                        INDEX `idx_md5Key_consumerFlag`(`md5_key` ASC, `consumer_flag` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1713540973226926082 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '消息消费管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_notice
-- ----------------------------
DROP TABLE IF EXISTS `df_notice`;
CREATE TABLE `df_notice`  (
                              `id` bigint NOT NULL COMMENT 'Id',
                              `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                              `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                              `delete_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识 0 正常 1删除',
                              `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
                              `enable_state` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '启用状态Y是N否',
                              PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '公告' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_robot_prompt
-- ----------------------------
DROP TABLE IF EXISTS `df_robot_prompt`;
CREATE TABLE `df_robot_prompt`  (
                                    `id` bigint NOT NULL,
                                    `question` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '翻译名称',
                                    `prompt` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'prompt',
                                    `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片连接',
                                    `type` int NULL DEFAULT NULL COMMENT '类型',
                                    `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                    `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                    `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                    `category_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类目',
                                    `rewrite_image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '重写url',
                                    PRIMARY KEY (`id`) USING BTREE,
                                    INDEX `idx_category_code`(`category_code` ASC) USING BTREE,
                                    INDEX `idx_question`(`question` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_robot_prompt_like
-- ----------------------------
DROP TABLE IF EXISTS `df_robot_prompt_like`;
CREATE TABLE `df_robot_prompt_like`  (
                                         `id` bigint NOT NULL,
                                         `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                         `user_id` bigint NULL DEFAULT NULL COMMENT '用户ID',
                                         `prompt_id` bigint NULL DEFAULT NULL COMMENT 'promptId',
                                         PRIMARY KEY (`id`) USING BTREE,
                                         UNIQUE INDEX `unix_ui_pi`(`user_id` ASC, `prompt_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_server_zone
-- ----------------------------
DROP TABLE IF EXISTS `df_server_zone`;
CREATE TABLE `df_server_zone`  (
                                   `id` bigint NOT NULL COMMENT 'Id',
                                   `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                   `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                   `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                   `use_level` int NULL DEFAULT 0 COMMENT '使用等级',
                                   `zone_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '名称',
                                   `public_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '公开标识Y是N否',
                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = 'Discord区域服务配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_trade
-- ----------------------------
DROP TABLE IF EXISTS `df_trade`;
CREATE TABLE `df_trade`  (
                             `id` bigint NOT NULL COMMENT 'Id',
                             `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                             `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                             `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                             `order_type` enum('GROUP','GOODS','AUTH_CODE') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'GOODS' COMMENT '订单类型',
                             `out_trade_no` bigint NULL DEFAULT NULL COMMENT '订单号',
                             `trade_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '交易流水号',
                             `buyer_id` bigint NULL DEFAULT NULL COMMENT '买家id',
                             `state` enum('WAIT_PAY','WAIT_SEND','FINISHED','CANCEL','CLOSED') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'WAIT_PAY' COMMENT '订单状态 \'CREATE\',\'WAIT_PAY\',\'WAIT_SEND\',\'FINISHED\',\'CNACEL\'',
                             `pay_state` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'N' COMMENT '支付状态 Y是N否',
                             `gmt_pay` datetime NULL DEFAULT NULL COMMENT '支付时间',
                             `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '备注',
                             `goods_id` bigint NULL DEFAULT NULL COMMENT '商品id',
                             `goods_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '商品标题',
                             `goods_price` decimal(16, 2) NULL DEFAULT NULL COMMENT '价格',
                             `deliver_obj` json NULL COMMENT '发货内容',
                             `qr_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '支付二维码',
                             `seller_id` bigint NULL DEFAULT NULL COMMENT '卖家ID',
                             `gmt_deliver` datetime NULL DEFAULT NULL COMMENT '发货时间',
                             PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_trade_result
-- ----------------------------
DROP TABLE IF EXISTS `df_trade_result`;
CREATE TABLE `df_trade_result`  (
                                    `id` bigint NOT NULL COMMENT 'Id',
                                    `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                    `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                    `notify_time` datetime NULL DEFAULT NULL COMMENT '通知时间。通知的发送时间。格式为 yyyy-MM-dd HH:mm:ss。',
                                    `notify_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通知类型。枚举值：trade_status_sync。',
                                    `notify_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通知校验 ID。',
                                    `sign_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签名类型。商家生成签名字符串所使用的签名算法类型，目前支持 RSA2 和 RSA，推荐使用 RSA2（如果开发者手动验签，不使用 SDK 验签，可以不传此参数）。',
                                    `sign` varchar(344) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签名。可查看异步返回结果的验签（如果开发者手动验签，不使用 SDK 验签，可以不传此参数）。',
                                    `trade_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付宝交易号。支付宝交易凭证号。',
                                    `app_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开发者的 app_id。支付宝分配给开发者的应用 APPID。',
                                    `auth_app_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开发者的 app_id，在服务商调用的场景下为授权方的 app_id。',
                                    `out_trade_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商户订单号。',
                                    `out_biz_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商家业务号。商家业务 ID，主要是退款通知中返回退款申请的流水号。',
                                    `buyer_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家支付宝用户号。买家支付宝账号对应的支付宝唯一用户号。',
                                    `buyer_logon_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家支付宝账号。',
                                    `seller_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家支付宝用户号。',
                                    `seller_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家支付宝账号。',
                                    `trade_status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易状态。咨询目前所处的状态。',
                                    `total_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '订单金额。本次交易支付的订单金额，单位为人民币（元）。支持小数点后两位。',
                                    `receipt_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '实收金额。商家在交易中实际收到的款项，单位为人民币（元）。支持小数点后两位。',
                                    `invoice_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '开票金额。用户在交易中支付的可开发票的金额。支持小数点后两位。',
                                    `buyer_pay_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '付款金额。用户在咨询中支付的金额。支持小数点后两位。',
                                    `point_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '集分宝金额。使用集分宝支付的金额。支持小数点后两位。',
                                    `refund_fee` decimal(11, 2) NULL DEFAULT NULL COMMENT '总退款金额。退款通知中，返回总退款金额，单位为元，支持小数点后两位。',
                                    `send_back_fee` decimal(11, 2) NULL DEFAULT NULL COMMENT '实际退款金额。商家实际退款给用户的金额，单位为元，支持小数点后两位。',
                                    `subject` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单标题。商品的标题/交易标题/订单标题/订单关键字等，是请求时对应的参数，原样通知回来。',
                                    `body` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品描述。该订单的备注、描述、明细等。对应请求时的 body 参数，原样通知回来。',
                                    `gmt_create` datetime NULL DEFAULT NULL COMMENT '交易创建时间。该笔交易创建的时间。格式为 yyyy-MM-dd HH:mm:ss。',
                                    `gmt_payment` datetime NULL DEFAULT NULL COMMENT '交易 付款时间。该笔交易的买家付款时间。格式为 yyyy-MM-dd HH:mm:ss。',
                                    `gmt_refund` datetime NULL DEFAULT NULL COMMENT '交易退款时间。该笔交易的退款时间。格式 为 yyyy-MM-dd HH:mm:ss.SS。',
                                    `gmt_close` datetime NULL DEFAULT NULL COMMENT '交易结束时间。该笔交易结束时间。格式为 yyyy-MM-dd HH:mm:ss。',
                                    `fund_bill_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '支付金额信息。支付成功的各个渠道金额信息，详请可查看下表资金明细信息说明。',
                                    `voucher_detail_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '优惠券信息。本交易支付时所使用的所有优惠券信息，详请可查看下表优惠券信息说明。',
                                    `biz_settle_mode` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账期结算标识，指已完成支付的订单会进行账期管控，不会实时结算。该参数目前会在使用小程序交易组件场景下返回。'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_user
-- ----------------------------
DROP TABLE IF EXISTS `df_user`;
CREATE TABLE `df_user`  (
                            `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                            `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                            `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                            `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                            `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '手机号',
                            `email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '邮箱',
                            `nick_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '昵称',
                            `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '密码',
                            `user_icon` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '头像',
                            `gmt_login` datetime NULL DEFAULT NULL COMMENT '登录时间',
                            `user_level` int NULL DEFAULT NULL COMMENT '用户等级',
                            `account_code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '账号编码',
                            `state` enum('unvaild','normal','forbidden') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'unvaild' COMMENT '账号状态unvaild，normal，forbidden',
                            `ref_user_id` bigint NULL DEFAULT NULL COMMENT '关联用户id',
                            `role` enum('ADMIN','USER','SUPPLIER') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'USER' COMMENT '身份角色 ADMIN USER SUPPLIER ',
                            PRIMARY KEY (`id`) USING BTREE,
                            UNIQUE INDEX `unix_email`(`email` ASC) USING BTREE,
                            INDEX `idx_gmt_create`(`gmt_create` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1736579403154194435 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_user_reamrk
-- ----------------------------
DROP TABLE IF EXISTS `df_user_reamrk`;
CREATE TABLE `df_user_reamrk`  (
                                   `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                   `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                   `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                   `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                   `user_id` bigint NULL DEFAULT NULL COMMENT '用户ID',
                                   `label` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '标签',
                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1691264153135915010 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '用户标记表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_user_setting
-- ----------------------------
DROP TABLE IF EXISTS `df_user_setting`;
CREATE TABLE `df_user_setting`  (
                                    `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                    `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                    `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                    `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                    `num_discord_import` int NULL DEFAULT NULL COMMENT 'discord 导入限制数量',
                                    `enable_acc_group` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'N' COMMENT '创建账号组权限',
                                    `enable_pub_goods` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'N' COMMENT '发布商品权限',
                                    `face_pay` json NULL COMMENT '当面付配置',
                                    `system_setting` json NULL COMMENT '系统个性化设置',
                                    `oss_setting` json NULL COMMENT '默认oss',
                                    `enable_oss` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'N' COMMENT '启用OSS Y是N否',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1736579403154194435 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '用户个性化配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_user_shop
-- ----------------------------
DROP TABLE IF EXISTS `df_user_shop`;
CREATE TABLE `df_user_shop`  (
                                 `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                 `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                 `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                 `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                 `shop_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '店铺编号',
                                 `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
                                 `shop_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '店铺图标',
                                 `shop_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '店铺名',
                                 `shop_type` enum('THIRD','SYS') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT 'THIRD' COMMENT '店铺类型',
                                 `link_url` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '跳转连接',
                                 `describe_info` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '店铺描述',
                                 `business_scope` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '[]' COMMENT '经营范围',
                                 `shop_label` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '号商',
                                 `apply_status` enum('APPLY','REJECT','SUCCESS') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT 'APPLY' COMMENT '启用标识 Y是N否',
                                 `status` enum('ENABLE','CLOSED') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'CLOSED' COMMENT '启用 & 关闭',
                                 `credit_level` tinyint NULL DEFAULT 1 COMMENT '信用等级',
                                 `apply_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '申请原因',
                                 `reject_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '驳回原因',
                                 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1730071445432201218 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '用户店铺表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_user_space
-- ----------------------------
DROP TABLE IF EXISTS `df_user_space`;
CREATE TABLE `df_user_space`  (
                                  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
                                  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '空间标题',
                                  `default_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'N' COMMENT '默认工作区Y是N否',
                                  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '备注',
                                  `sort` int NULL DEFAULT 99 COMMENT '排序',
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1736579404848693250 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '用户工作空间' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_user_space_task
-- ----------------------------
DROP TABLE IF EXISTS `df_user_space_task`;
CREATE TABLE `df_user_space_task`  (
                                       `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                       `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                       `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                       `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                       `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
                                       `space_id` bigint NULL DEFAULT NULL COMMENT '空间id',
                                       `task_id` bigint NULL DEFAULT NULL COMMENT '任务id',
                                       PRIMARY KEY (`id`) USING BTREE,
                                       UNIQUE INDEX `unix_taskId_spaceId`(`space_id` ASC, `task_id` ASC) USING BTREE,
                                       INDEX `idx_taskId_spaceId_modified`(`space_id` ASC, `task_id` ASC, `gmt_modified` DESC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1737004152971853826 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '用户工作空间关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_user_suggest
-- ----------------------------
DROP TABLE IF EXISTS `df_user_suggest`;
CREATE TABLE `df_user_suggest`  (
                                    `id` bigint NOT NULL COMMENT 'Id',
                                    `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                    `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                    `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                    `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
                                    `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '标题',
                                    `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '内容',
                                    `image_urls` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '相关图片',
                                    `category_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '反馈类目',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '用户反馈表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_user_tag
-- ----------------------------
DROP TABLE IF EXISTS `df_user_tag`;
CREATE TABLE `df_user_tag`  (
                                `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
                                `tag_name` bigint NULL DEFAULT NULL COMMENT '标签名',
                                PRIMARY KEY (`id`) USING BTREE,
                                INDEX `idx_user_id_tag_name`(`user_id` ASC, `tag_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '用户标签管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
                             `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                             `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                             `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                             `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                             `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '路径',
                             `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
                             `component` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '控件路径',
                             `redirect` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '重定向',
                             `parent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '父级菜单',
                             `meta` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '数据',
                             `roles` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '[\"ADMIN\",\"USER\",\"SUPPLIER\"]' COMMENT '允许的角色列表',
                             PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 132 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统菜单' ROW_FORMAT = Dynamic;



INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (1, 0, '2023-11-19 11:54:36', '2023-11-19 14:44:31', '/mj', 'mj', 'LAYOUT', '/mj/index', NULL, '{\"hideChildrenInMenu\": true, \"icon\": \"pepicons-pencil:paint-pallet\", \"title\": \"routes.app.mj.pageTitle\", \"orderNo\": 10}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (2, 0, '2023-11-19 11:54:37', '2023-11-19 14:44:48', '/mj/index', 'mjPage', '/df/mj/index.vue', NULL, '1', '{\"title\": \"routes.app.mj.pageTitle\", \"icon\": \"pepicons-pencil:paint-pallet\", \"hideMenu\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (3, 0, '2023-11-19 11:55:14', '2023-11-19 14:44:16', '/accDiscord', 'AccDiscord', 'LAYOUT', '/accDiscord/index', NULL, '{\"hideChildrenInMenu\": true, \"icon\": \"mdi:table-account\", \"title\": \"routes.app.account.pageTitle\", \"orderNo\": 40}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (4, 0, '2023-11-19 11:55:14', '2023-11-19 14:44:48', '/accDiscord/index', 'AccDiscordPage', '/df/discord/index.vue', NULL, '3', '{\"icon\": \"mdi:table-account\", \"title\": \"routes.app.account.pageTitle\", \"hideMenu\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (5, 0, '2023-11-19 11:55:50', '2023-11-19 14:44:13', '/collect', 'Collect', 'LAYOUT', '/collect/index', NULL, '{\"hideChildrenInMenu\": true, \"icon\": \"icon-park-twotone:collect-picture\", \"title\": \"routes.app.collect.pageTitle\", \"orderNo\": 21, \"ignoreKeepAlive\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (6, 0, '2023-11-19 11:55:50', '2023-11-19 14:44:48', '/collect/index', 'collectPage', '/df/collect/index.vue', NULL, '5', '{\"title\": \"routes.app.collect.pageTitle\", \"icon\": \"icon-park-twotone:collect-picture\", \"hideMenu\": true, \"ignoreKeepAlive\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (7, 0, '2023-11-19 11:56:14', '2023-11-19 14:44:09', '/example', 'Example', 'LAYOUT', '/example/index', NULL, '{\"hideChildrenInMenu\": true, \"icon\": \"streamline:ecology-science-alien-extraterristerial-life-form-space-universe-head\", \"title\": \"routes.app.example.pageTitle\", \"orderNo\": 21}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (8, 0, '2023-11-19 11:56:14', '2023-12-14 23:33:11', '/example/index', 'examplePage', '/df/example/index.vue', NULL, '7', '{\"title\": \"routes.app.example.pageTitle\", \"auth\":false, \"icon\": \"streamline:ecology-science-alien-extraterristerial-life-form-space-universe-head\", \"hideMenu\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (9, 0, '2023-11-19 11:56:23', '2023-11-19 14:44:05', '/goods', 'Goods', 'LAYOUT', '/goods/index', NULL, '{\"hideChildrenInMenu\": true, \"icon\": \"ph:shopping-cart-bold\", \"title\": \"routes.app.goods.pageTitle\", \"orderNo\": 40, \"hideMenu\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (10, 0, '2023-11-19 11:56:23', '2023-11-19 14:44:48', '/goods/index', 'GoodsPage', '/df/goods/index.vue', NULL, '9', '{\"icon\": \"ph:shopping-cart-bold\", \"title\": \"routes.app.goods.pageTitle\", \"hideMenu\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (11, 0, '2023-11-19 12:00:53', '2023-11-24 16:57:18', '/chatgpt', 'Chatgpt', 'LAYOUT', '/chatgpt/index', NULL, '{\"hideChildrenInMenu\": true, \"icon\": \"logos:openai-icon\", \"title\": \"routes.app.gpt.pageTitle\", \"orderNo\": 25}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (13, 0, '2023-11-19 12:02:06', '2023-11-19 14:43:56', '/jobList', 'JobList', 'LAYOUT', '/jobList/index', NULL, '{\"hideChildrenInMenu\": true, \"icon\": \"ant-design:comment-outlined\", \"title\": \"routes.app.jobList.pageTitle\", \"orderNo\": 40, \"hideMenu\": true, \"ignoreKeepAlive\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (14, 0, '2023-11-19 12:02:07', '2023-11-19 14:44:48', '/jobList/index/:spaceId/:spaceTitle', 'JobListPage', '/df/mj/mobile/jobList.vue', NULL, '13', '{\"icon\": \"ant-design:comment-outlined\", \"title\": \"routes.app.jobList.pageTitle\", \"hideMenu\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (15, 0, '2023-11-19 12:02:16', '2023-11-19 14:50:34', '/tools-link', 'ToolsLink', 'LAYOUT', '/tools-link/index', NULL, '{\"hideChildrenInMenu\": true, \"icon\": \"ant-design:idcard-outlined\", \"title\": \"routes.app.xhongs.pageTitle\", \"orderNo\": 40, \"hideMenu\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (16, 0, '2023-11-19 12:02:16', '2023-11-19 14:36:19', '/tools-link/index', 'ToolsLinkPage', '/df/tools/link/index.vue', NULL, '15', '{\"icon\": \"ant-design:idcard-outlined\", \"title\": \"routes.app.xhongs.pageTitle\", \"hideMenu\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (17, 0, '2023-11-19 12:02:50', '2023-11-22 10:41:38', '/public', 'Public', 'LAYOUT', '/public/index', NULL, '{\"hideChildrenInMenu\": true, \"icon\": \"gis:earth-north\", \"title\": \"routes.app.public.pageTitle\", \"orderNo\": 21, \"ignoreKeepAlive\": true,\"hideMenu\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (18, 0, '2023-11-19 12:02:50', '2023-11-19 14:44:48', '/public/index', 'publicPage', '/df/public/index.vue', NULL, '17', '{\"title\": \"routes.app.public.pageTitle\", \"icon\": \"gis:earth-north\", \"hideMenu\": true, \"ignoreKeepAlive\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (19, 0, '2023-11-19 12:02:59', '2023-11-19 14:43:36', '/setting', 'Setting', 'LAYOUT', '/setting/index', NULL, '{\"hideChildrenInMenu\": true, \"icon\": \"icon-park-twotone:people-safe\", \"title\": \"routes.app.setting.pageTitle\", \"orderNo\": 100, \"ignoreKeepAlive\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (20, 0, '2023-11-19 12:02:59', '2023-11-19 14:44:48', '/setting/index', 'SettingPage', '/df/setting/index.vue', NULL, '19', '{\"title\": \"routes.app.setting.pageTitle\", \"icon\": \"icon-park-twotone:people-safe\", \"hideMenu\": true, \"ignoreKeepAlive\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (21, 0, '2023-11-19 12:03:26', '2023-11-19 14:43:32', '/shop', 'Shop', 'LAYOUT', '/shop/index', NULL, '{\"hideChildrenInMenu\": true, \"icon\": \"ph:shopping-cart-bold\", \"title\": \"routes.app.shop.pageTitle\", \"orderNo\": 42}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (22, 0, '2023-11-19 12:03:26', '2023-11-19 14:44:48', '/shop/index', 'ShopPage', '/df/shop/shop_pc.vue', NULL, '21', '{\"icon\": \"ph:shopping-cart-bold\", \"title\": \"routes.app.shop.pageTitle\", \"hideMenu\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (23, 0, '2023-11-19 12:03:33', '2023-11-19 14:43:15', '/prompt', 'Prompt', 'LAYOUT', '/prompt/index', NULL, '{\"orderNo\": 20, \"icon\": \"ant-design:coffee-outlined\", \"title\": \"routes.mj.tools\", \"hideMenu\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (24, 0, '2023-11-19 12:03:34', '2023-11-19 14:44:48', '/prompt/index', 'PromptIndex', 'IFrame', NULL, '23', '{\"frameSrc\": \"https://ai.sppinfo.cn/\", \"icon\": \"ant-design:coffee-outlined\", \"title\": \"routes.mj.tools\", \"hideMenu\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (25, 0, '2023-11-19 12:04:13', '2023-11-19 14:43:10', '/trade', 'Trade', 'LAYOUT', '/trade/index', NULL, '{\"hideChildrenInMenu\": true, \"icon\": \"icon-park-outline:order\", \"title\": \"routes.app.trade.pageTitle\", \"orderNo\": 42, \"hideMenu\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (26, 0, '2023-11-19 12:04:13', '2023-11-19 14:44:48', '/trade/index', 'tradePage', '/df/trade/index.vue', NULL, '25', '{\"title\": \"routes.app.trade.pageTitle\", \"icon\": \"icon-park-outline:order\", \"hideMenu\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (111, 0, '2023-11-19 12:00:53', '2023-11-24 17:02:04', '/chatgpt/index', 'ChatgptPage', '/df/chatgpt/index.vue', NULL, '11', '{\"icon\": \"logos:openai-icon\", \"title\": \"GPT对话\", \"hideMenu\": false}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (112, 0, '2023-11-19 12:00:53', '2023-11-24 17:02:15', 'https://chat-shared3.zhile.io/shared.html?v=2', 'pandora-public', '', NULL, '11', '{\"icon\": \"gis:earth-north\", \"title\": \"公开PLUS\",\"hideMenu\": false}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (113, 0, '2023-11-19 12:00:53', '2023-11-24 17:03:42', '/pandora-private', 'pandora-private', '', NULL, '11', '{\"icon\": \"fluent:person-key-20-filled\", \"title\": \"拼团PLUS\",\"frameSrc\": \"https://gpt.gfish.top\", \"hideMenu\": false}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (130, 0, '2023-11-19 11:54:36', '2023-12-07 23:51:53', '/jobList', 'jobList', 'LAYOUT', '/jobList/index', NULL, '{\"hideChildrenInMenu\": true, \"icon\": \"pepicons-pencil:paint-pallet\", \"title\": \"routes.app.jobList.pageTitle\", \"orderNo\": 120, \"hideMenu\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (131, 0, '2023-11-19 11:54:37', '2023-12-08 00:02:38', '/jobList/index', 'jobListPage', '/df/mj/mobile/JobList.vue', NULL, '130', '{\"title\": \"routes.app.jobList.pageTitle\", \"icon\": \"icon-park-twotone:collect-picture\", \"hideMenu\": true, \"ignoreKeepAlive\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');


INSERT INTO `df_user` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `phone`, `email`, `nick_name`, `password`, `user_icon`, `gmt_login`, `user_level`, `account_code`, `state`, `ref_user_id`, `role`) VALUES (1687012973309075458, 0, '2023-08-03 16:10:10', '2023-12-19 11:53:07', '153XXXXXXXX', 'admin@admin.com', 'admin', '57331081823331c4', 'https://q1.qlogo.cn/g?b=qq&nk=190848757&s=640', '2023-12-19 03:53:07', 66, '666', 'normal', NULL, 'ADMIN');

INSERT INTO `df_dict` (`id`, `gmt_create`, `gmt_modified`, `delete_flag`, `group_key`, `group_name`, `cons_key`, `cons_name`, `cons_value`, `sort`) VALUES (1, '2023-08-15 13:19:49', '2023-08-15 13:19:49', 0, 'PROXY', 'DISCORD图片代理地址', 'DISCORD_IMAGE_PROXY', '', '[\"https://cdn.gfish.top\"]', 0);
INSERT INTO `df_dict` (`id`, `gmt_create`, `gmt_modified`, `delete_flag`, `group_key`, `group_name`, `cons_key`, `cons_name`, `cons_value`, `sort`) VALUES (3, '2023-09-13 10:48:26', '2023-09-13 10:48:26', 0, 'COOKIE_XHS', '小红书COOKIE', 'COOKIE_XHS', '', '', 0);
INSERT INTO `df_dict` (`id`, `gmt_create`, `gmt_modified`, `delete_flag`, `group_key`, `group_name`, `cons_key`, `cons_name`, `cons_value`, `sort`) VALUES (11, '2023-08-15 13:19:49', '2023-08-15 13:19:49', 0, 'PROXY', 'GPT代理', 'GPT_PROXY', '', '[\"https://mtf-cdn.gfish.top\"]', 0);
INSERT INTO `df_dict` (`id`, `gmt_create`, `gmt_modified`, `delete_flag`, `group_key`, `group_name`, `cons_key`, `cons_name`, `cons_value`, `sort`) VALUES (13, '2023-11-08 09:32:54', '2023-11-08 09:32:54', 0, 'BAIDU_TRANS_CONFIG', '百度翻译', 'BAIDU_TRANS_CONFIG', '', '{\r\n			\"appid\":\"\",\r\n			\"appSecret\":\"\"\r\n		}', 0);
INSERT INTO `df_dict` (`id`, `gmt_create`, `gmt_modified`, `delete_flag`, `group_key`, `group_name`, `cons_key`, `cons_name`, `cons_value`, `sort`) VALUES (15, '2023-11-12 10:07:43', '2023-11-12 10:07:43', 0, 'PROXY', 'CF图片代理', 'CF_PROXY', '', '[]', 0);
INSERT INTO `df_dict` (`id`, `gmt_create`, `gmt_modified`, `delete_flag`, `group_key`, `group_name`, `cons_key`, `cons_name`, `cons_value`, `sort`) VALUES (40, '2023-09-13 14:07:02', '2023-09-13 14:07:02', 0, 'WCHAT_GROUP', 'QQ交流配置', 'WCHAT_GROUP', '', '{\r\n\"wchatImage\":\"\",\r\n\"qqGroupList\":[]\r\n}', 0);
INSERT INTO `df_dict` (`id`, `gmt_create`, `gmt_modified`, `delete_flag`, `group_key`, `group_name`, `cons_key`, `cons_name`, `cons_value`, `sort`) VALUES (41, '2023-12-12 14:26:08', '2023-12-12 14:26:08', 0, 'TUTORIAL_INFO', '教程连接', 'TUTORIAL_INFO', '', 'https://x1grt4bhomu.feishu.cn/docx/TFB4dMBr9oEi0HxzrgmcqVV3njg', 0);
INSERT INTO `df_dict` (`id`, `gmt_create`, `gmt_modified`, `delete_flag`, `group_key`, `group_name`, `cons_key`, `cons_name`, `cons_value`, `sort`) VALUES (101, '2023-08-15 13:19:49', '2023-08-15 13:19:49', 0, 'MJ_PROMPT', 'niji敏感词', 'NIJI_BAN', '', '[\"blood\", \"twerk\", \"making love\", \"voluptuous\", \"naughty\", \"wincest\", \"orgy\", \"no clothes\", \"au naturel\", \"no shirt\", \"decapitate\", \"bare\", \"nude\", \"barely dressed\", \"nude\", \"bra\", \"risque\", \"scantily clad\", \"cleavage\", \"stripped\", \"infested\", \"full frontal\", \"unclothed\", \"invisible clothes\", \"wearing nothing\", \"lingerie\", \"with no shirt\", \"naked\", \"without clothes on\", \"negligee\", \"zero clothes\", \"gruesome\", \"fascist\", \"nazi\", \"prophet mohammed\", \"slave\", \"coon\", \"honkey\", \"cocaine\", \"heroin\", \"meth\", \"crack\", \"kill\", \"belle delphine\", \"hitler\", \"jinping\", \"lolita\", \"president xi\", \"torture\", \"disturbing\", \"farts\", \"fart\", \"poop\", \"infected\", \"warts\", \"shit\", \"brown pudding\", \"bunghole\", \"vomit\", \"voluptuous\", \"seductive\", \"sperm\", \"sexy\", \"sadist\", \"sensored\", \"censored\", \"silenced\", \"deepfake\", \"inappropriate\", \"waifu\", \"succubus\", \"slaughter\", \"surgery\", \"reproduce\", \"crucified\", \"seductively\", \"explicit\", \"inappropriate\", \"large bust\", \"explicit\", \"wang\", \"inappropriate\", \"teratoma\", \"intimate\", \"see through\", \"tryphophobia\", \"bloodbath\", \"wound\", \"cronenberg\", \"khorne\", \"cannibal\", \"cannibalism\", \"visceral\", \"guts\", \"bloodshot\", \"gory\", \"killing\", \"crucifixion\", \"surgery\", \"vivisection\", \"massacre\", \"hemoglobin\", \"suicide\", \"arse\", \"labia\", \"ass\", \"mammaries\", \"badonkers\", \"bloody\", \"minge\", \"big ass\", \"mommy milker\", \"booba\", \"nipple\", \"oppai\", \"booty\", \"organs\", \"bosom\", \"ovaries\", \"flesh\", \"breasts\", \"penis\", \"busty\", \"phallus\", \"clunge\", \"sexy female\", \"crotch\", \"skimpy\", \"dick\", \"thick\", \"bruises\", \"girth\", \"titty\", \"honkers\", \"vagina\", \"hooters\", \"veiny\", \"knob\", \"ahegao\", \"pinup\", \"ballgag\", \"car crash\", \"playboy\", \"bimbo\", \"pleasure\", \"bodily fluids\", \"pleasures\", \"boudoir\", \"rule34\", \"brothel\", \"seducing\", \"dominatrix\", \"corpse\", \"seductive\", \"erotic\", \"seductive\", \"fuck\", \"sensual\", \"hardcore\", \"sexy\", \"hentai\", \"shag\", \"horny\", \"crucified\", \"shibari\", \"incest\", \"smut\", \"jav\", \"succubus\", \"jerk off king at pic\", \"thot\", \"kinbaku\", \"legs spread\", \"sensuality\", \"belly button\", \"porn\", \"patriotic\", \"bleed\", \"excrement\", \"petite\", \"seduction\", \"mccurry\", \"provocative\", \"sultry\", \"erected\", \"camisole\", \"tight white\", \"arrest\", \"see-through\", \"feces\", \"anus\", \"revealing clothing\", \"vein\", \"loli\", \"-edge\", \"boobs\", \"-backed\", \"tied up\", \"zedong\", \"bathing\", \"jail\", \"reticulum\", \"rear end\", \"sakimichan\", \"behind bars\", \"shirtless\", \"sakimichan\", \"seductive\", \"sexi\", \"sexualiz\", \"sexual\"]', 0);
INSERT INTO `df_dict` (`id`, `gmt_create`, `gmt_modified`, `delete_flag`, `group_key`, `group_name`, `cons_key`, `cons_name`, `cons_value`, `sort`) VALUES (102, '2023-08-15 13:19:49', '2023-08-15 13:19:49', 0, 'MJ_PROMPT', '敏感词', 'BAN', '', '[\"blood\", \"twerk\", \"making love\", \"voluptuous\", \"naughty\", \"wincest\", \"orgy\", \"no clothes\", \"au naturel\", \"no shirt\", \"decapitate\", \"bare\", \"nude\", \"barely dressed\", \"nude\", \"bra\", \"risque\", \"scantily clad\", \"cleavage\", \"stripped\", \"infested\", \"full frontal\", \"unclothed\", \"invisible clothes\", \"wearing nothing\", \"lingerie\", \"with no shirt\", \"naked\", \"without clothes on\", \"negligee\", \"zero clothes\", \"gruesome\", \"fascist\", \"nazi\", \"prophet mohammed\", \"slave\", \"coon\", \"honkey\", \"cocaine\", \"heroin\", \"meth\", \"crack\", \"kill\", \"belle delphine\", \"hitler\", \"jinping\", \"lolita\", \"president xi\", \"torture\", \"disturbing\", \"farts\", \"fart\", \"poop\", \"infected\", \"warts\", \"shit\", \"brown pudding\", \"bunghole\", \"vomit\", \"voluptuous\", \"seductive\", \"sperm\", \"sexy\", \"sadist\", \"sensored\", \"censored\", \"silenced\", \"deepfake\", \"inappropriate\", \"waifu\", \"succubus\", \"slaughter\", \"surgery\", \"reproduce\", \"crucified\", \"seductively\", \"explicit\", \"inappropriate\", \"large bust\", \"explicit\", \"wang\", \"inappropriate\", \"teratoma\", \"intimate\", \"see through\", \"tryphophobia\", \"bloodbath\", \"wound\", \"cronenberg\", \"khorne\", \"cannibal\", \"cannibalism\", \"visceral\", \"guts\", \"bloodshot\", \"gory\", \"killing\", \"crucifixion\", \"surgery\", \"vivisection\", \"massacre\", \"hemoglobin\", \"suicide\", \"arse\", \"labia\", \"ass\", \"mammaries\", \"badonkers\", \"bloody\", \"minge\", \"big ass\", \"mommy milker\", \"booba\", \"nipple\", \"oppai\", \"booty\", \"organs\", \"bosom\", \"ovaries\", \"flesh\", \"breasts\", \"penis\", \"busty\", \"phallus\", \"clunge\", \"sexy female\", \"crotch\", \"skimpy\", \"dick\", \"thick\", \"bruises\", \"girth\", \"titty\", \"honkers\", \"vagina\", \"hooters\", \"veiny\", \"knob\", \"ahegao\", \"pinup\", \"ballgag\", \"car crash\", \"playboy\", \"bimbo\", \"pleasure\", \"bodily fluids\", \"pleasures\", \"boudoir\", \"rule34\", \"brothel\", \"seducing\", \"dominatrix\", \"corpse\", \"seductive\", \"erotic\", \"seductive\", \"fuck\", \"sensual\", \"hardcore\", \"sexy\", \"hentai\", \"shag\", \"horny\", \"crucified\", \"shibari\", \"incest\", \"smut\", \"jav\", \"succubus\", \"jerk off king at pic\", \"thot\", \"kinbaku\", \"legs spread\", \"sensuality\", \"belly button\", \"porn\", \"patriotic\", \"bleed\", \"excrement\", \"petite\", \"seduction\", \"mccurry\", \"provocative\", \"sultry\", \"erected\", \"camisole\", \"tight white\", \"arrest\", \"see-through\", \"feces\", \"anus\", \"revealing clothing\", \"vein\", \"loli\", \"-edge\", \"boobs\", \"-backed\", \"tied up\", \"zedong\", \"bathing\", \"jail\", \"reticulum\", \"rear end\", \"sakimichan\", \"behind bars\", \"shirtless\", \"sakimichan\", \"seductive\", \"sexi\", \"sexualiz\", \"sexual\"]', 0);
INSERT INTO `df_dict` (`id`, `gmt_create`, `gmt_modified`, `delete_flag`, `group_key`, `group_name`, `cons_key`, `cons_name`, `cons_value`, `sort`) VALUES (150, '2023-10-11 11:32:55', '2023-10-11 11:32:55', 0, 'NUM_DISCORD_IMPORT', 'DISCORD默认导入额度', 'NUM_DISCORD_IMPORT', '', '500', 0);
INSERT INTO `df_dict` (`id`, `gmt_create`, `gmt_modified`, `delete_flag`, `group_key`, `group_name`, `cons_key`, `cons_name`, `cons_value`, `sort`) VALUES (151, '2023-10-26 15:27:50', '2023-10-26 15:27:50', 0, 'DEFAULT_DISCORD_ACCOUNT', '默认用于更新API版本号的账号ID', 'DEFAULT_DISCORD_ACCOUNT', '', '', 0);
INSERT INTO `df_dict` (`id`, `gmt_create`, `gmt_modified`, `delete_flag`, `group_key`, `group_name`, `cons_key`, `cons_name`, `cons_value`, `sort`) VALUES (152, '2023-12-27 10:26:43', '2023-12-27 10:26:43', 0, 'PANDORA_CONFIG_INFO', 'Pandora 配置', 'PANDORA_CONFIG_INFO', '', '{\r\n    \"host\": \"",\r\n    \"poolToken\": \"\",    \"apiPrefix\": \"gpt4Access\",\r\n}', 0);


SET FOREIGN_KEY_CHECKS = 1;
