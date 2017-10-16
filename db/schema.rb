# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171016093723) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "Knome_schemas", force: :cascade do |t|
    t.text     "key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "abuses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "reported_item_id"
    t.string   "reported_item_type", limit: 32
    t.text     "reason"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "status",             limit: 255, default: "pending", null: false
    t.string   "category",           limit: 255
    t.integer  "confirmed_user_id"
    t.index ["confirmed_user_id"], name: "index_abuses_on_confirmed_user_id", using: :btree
    t.index ["reported_item_id", "reported_item_type"], name: "index_abuses_on_reported_item_id_and_reported_item_type", using: :btree
    t.index ["status"], name: "index_abuses_on_status", using: :btree
    t.index ["user_id"], name: "index_abuses_on_user_id", using: :btree
  end

  create_table "activity_stats", force: :cascade do |t|
    t.integer  "best_score",           default: 1
    t.integer  "start_activity_id"
    t.integer  "end_activity_id"
    t.integer  "user_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "distance_percentile",  default: 0
    t.integer  "speed_percentile",     default: 0
    t.integer  "quality_percentile",   default: 0
    t.integer  "frequency_percentile", default: 0
    t.integer  "activity_percentile",  default: 0
    t.index ["end_activity_id"], name: "index_activity_stats_on_end_activity_id", using: :btree
    t.index ["start_activity_id"], name: "index_activity_stats_on_start_activity_id", using: :btree
    t.index ["user_id"], name: "index_activity_stats_on_user_id", using: :btree
  end

  create_table "analytics_objectives", force: :cascade do |t|
    t.string   "description",     limit: 255
    t.integer  "user_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "analyzable_type", limit: 255
    t.integer  "analyzable_id"
    t.integer  "status",                      default: 0, null: false
    t.index ["analyzable_type", "analyzable_id"], name: "index_analytics_objectives_on_analyzable_type_and_analyzable_id", unique: true, using: :btree
  end

  create_table "analytics_stats", force: :cascade do |t|
    t.integer  "theme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "answers", force: :cascade do |t|
    t.text     "data"
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "justification", limit: 255, default: "", null: false
    t.index ["created_at"], name: "index_answers_on_created_at", using: :btree
    t.index ["question_id"], name: "index_answers_on_question_id", using: :btree
    t.index ["user_id"], name: "index_answers_on_user_id", using: :btree
  end

  create_table "app_launcher_apps", force: :cascade do |t|
    t.string   "name",              limit: 255,                 null: false
    t.integer  "app_id",                                        null: false
    t.string   "logo_file_name",    limit: 255
    t.string   "logo_content_type", limit: 255
    t.integer  "logo_file_size"
    t.text     "launch_url",                                    null: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "category_id"
    t.integer  "status",                        default: 1
    t.string   "display_title",     limit: 255
    t.boolean  "is_an_app",                     default: true,  null: false
    t.boolean  "password_required",             default: false, null: false
    t.index ["app_id"], name: "index_app_launcher_apps_on_app_id", unique: true, using: :btree
    t.index ["category_id"], name: "index_app_launcher_apps_on_category_id", using: :btree
    t.index ["display_title"], name: "index_app_launcher_apps_on_display_title", using: :btree
    t.index ["name"], name: "index_app_launcher_apps_on_name", unique: true, using: :btree
    t.index ["status"], name: "index_app_launcher_apps_on_status", using: :btree
  end

  create_table "app_launcher_apps_groups", id: false, force: :cascade do |t|
    t.integer "app_id",   null: false
    t.integer "group_id", null: false
    t.index ["app_id", "group_id"], name: "index_app_launcher_apps_groups_on_app_id_and_group_id", unique: true, using: :btree
    t.index ["app_id"], name: "index_app_launcher_apps_groups_on_app_id", using: :btree
    t.index ["group_id"], name: "index_app_launcher_apps_groups_on_group_id", using: :btree
  end

  create_table "app_launcher_categories", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.index ["name"], name: "index_app_launcher_categories_on_name", unique: true, using: :btree
  end

  create_table "app_launcher_groups", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.index ["name"], name: "index_app_launcher_groups_on_name", unique: true, using: :btree
  end

  create_table "attachments", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "data_file_name",    limit: 255
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size"
    t.integer  "conversion_state",              default: 0
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "caption",           limit: 255
    t.string   "title",             limit: 255
    t.string   "alt_text",          limit: 255
    t.index ["user_id"], name: "index_attachments_on_user_id", using: :btree
  end

  create_table "attachments_content_stats", id: false, force: :cascade do |t|
    t.integer "attachment_id",   null: false
    t.integer "content_stat_id", null: false
    t.index ["attachment_id", "content_stat_id"], name: "index_attachments_contnet_stats_on_a_id_and_cs_id", unique: true, using: :btree
    t.index ["attachment_id"], name: "index_attachments_content_stats_on_attachment_id", using: :btree
    t.index ["content_stat_id"], name: "index_attachments_content_stats_on_content_stat_id", using: :btree
  end

  create_table "audiences", force: :cascade do |t|
    t.integer  "activity_object_id"
    t.integer  "sphere_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["activity_object_id", "sphere_id"], name: "index_audiences_on_activity_object_id_and_sphere_id", unique: true, using: :btree
    t.index ["activity_object_id"], name: "index_audiences_on_activity_object_id", using: :btree
    t.index ["sphere_id"], name: "index_audiences_on_sphere_id", using: :btree
  end

  create_table "awardings", force: :cascade do |t|
    t.integer  "challenge_stat_id"
    t.integer  "user_id"
    t.integer  "content_id",                    null: false
    t.string   "content_type",      limit: 255, null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["challenge_stat_id", "content_id", "content_type"], name: "allowed_one_awarding", unique: true, using: :btree
    t.index ["user_id"], name: "index_awardings_on_user_id", using: :btree
  end

  create_table "badge_notifications", force: :cascade do |t|
    t.integer "microblog_id", null: false
    t.integer "badge_id",     null: false
    t.index ["microblog_id"], name: "index_badge_notifications_on_microblog_id", using: :btree
  end

  create_table "badges", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "logo_file_name",    limit: 255
    t.string   "logo_content_type", limit: 255
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "group",             limit: 255
    t.integer  "group_rank",                    default: 0
    t.integer  "category"
    t.string   "title",             limit: 255, default: ""
    t.text     "description",                   default: ""
    t.boolean  "enabled",                       default: false, null: false
    t.boolean  "featured",                      default: false
    t.boolean  "awarded_only_once",             default: true,  null: false
    t.integer  "user_id",                       default: 0,     null: false
    t.integer  "status",                        default: 1,     null: false
    t.string   "rejection_reason",  limit: 255
    t.integer  "source_id"
    t.index ["category"], name: "index_badges_on_category", using: :btree
    t.index ["enabled"], name: "index_badges_on_enabled", using: :btree
    t.index ["featured"], name: "index_badges_on_featured", using: :btree
    t.index ["group"], name: "index_badges_on_group", using: :btree
    t.index ["group_rank"], name: "index_badges_on_group_rank", using: :btree
    t.index ["name"], name: "index_badges_on_name", using: :btree
    t.index ["status"], name: "index_badges_on_status", using: :btree
  end

  create_table "banner_libraries", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "logo_file_name",    limit: 255
    t.string   "logo_content_type", limit: 255
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["category_id"], name: "index_banner_libraries_on_category_id", using: :btree
  end

  create_table "bets", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "betable_id"
    t.integer  "points"
    t.string   "result",       limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "betable_type", limit: 255
    t.index ["betable_id", "betable_type"], name: "index_bets_on_betable_id_and_betable_type", using: :btree
    t.index ["betable_id"], name: "index_bets_on_idea_id", using: :btree
    t.index ["user_id", "betable_id", "betable_type"], name: "index_bets_on_user_id_and_betable_id_and_betable_type", unique: true, using: :btree
    t.index ["user_id", "betable_id"], name: "index_bets_on_user_id_and_idea_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_bets_on_user_id", using: :btree
  end

  create_table "blocked_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "blocked_user_id"
    t.datetime "block_start_date"
    t.datetime "block_end_date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["block_end_date"], name: "index_blocked_users_on_block_end_date", using: :btree
    t.index ["blocked_user_id"], name: "index_blocked_users_on_blocked_user_id", using: :btree
    t.index ["user_id"], name: "index_blocked_users_on_user_id", using: :btree
  end

  create_table "blogposts", force: :cascade do |t|
    t.string   "title",                  limit: 255
    t.string   "type",                   limit: 255
    t.text     "description"
    t.text     "meta"
    t.integer  "user_id",                            null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.datetime "publish_date"
    t.datetime "scheduled_publish_date"
    t.text     "tagging_details"
    t.index ["created_at"], name: "index_blogposts_on_created_at", using: :btree
    t.index ["publish_date"], name: "index_blogposts_on_publish_date", using: :btree
    t.index ["scheduled_publish_date"], name: "index_blogposts_on_scheduled_publish_date", using: :btree
    t.index ["user_id"], name: "index_blogposts_on_user_id", using: :btree
  end

  create_table "categorizations", force: :cascade do |t|
    t.string   "title",          limit: 255
    t.text     "description"
    t.integer  "user_id"
    t.string   "ancestry",       limit: 255
    t.integer  "ancestry_depth",             default: 0
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "theme_id"
    t.index ["ancestry"], name: "index_categorizations_on_ancestry", using: :btree
    t.index ["user_id"], name: "index_categorizations_on_user_id", using: :btree
  end

  create_table "challenges", force: :cascade do |t|
    t.string   "title",                    limit: 255
    t.text     "description"
    t.integer  "user_id"
    t.datetime "expiry_date"
    t.integer  "bounty"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.integer  "awarder_id"
    t.datetime "result_declaration_date"
    t.text     "prize"
    t.string   "prize_image_file_name",    limit: 255
    t.string   "prize_image_content_type", limit: 255
    t.integer  "prize_image_file_size"
    t.datetime "prize_image_updated_at"
    t.integer  "challenge_type",                       default: 1
    t.text     "tagging_details"
    t.datetime "event_date"
    t.boolean  "is_ip_specific",                       default: false, null: false
    t.index ["awarder_id"], name: "index_challenges_on_awarder_id", using: :btree
    t.index ["challenge_type"], name: "index_challenges_on_challenge_type", using: :btree
    t.index ["created_at"], name: "index_challenges_on_created_at", using: :btree
    t.index ["event_date"], name: "index_challenges_on_event_date", using: :btree
    t.index ["expiry_date"], name: "index_challenges_on_expiry_date", using: :btree
    t.index ["is_ip_specific"], name: "index_challenges_on_is_ip_specific", using: :btree
    t.index ["result_declaration_date"], name: "index_challenges_on_result_declaration_date", using: :btree
    t.index ["user_id"], name: "index_challenges_on_user_id", using: :btree
  end

  create_table "choices", force: :cascade do |t|
    t.text     "option",                  null: false
    t.integer  "question_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "order",       default: 0, null: false
    t.index ["question_id"], name: "index_choices_on_question_id", using: :btree
  end

  create_table "clarifications", force: :cascade do |t|
    t.integer  "clarifiable_id"
    t.text     "description"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "clarifiable_type", limit: 255
    t.integer  "user_id"
    t.index ["clarifiable_id", "clarifiable_type"], name: "index_clarifications_on_clarifiable_id_and_clarifiable_type", using: :btree
    t.index ["clarifiable_id"], name: "index_clarifications_on_clarifiable_id", using: :btree
    t.index ["clarifiable_id"], name: "index_clarifications_on_question_id", unique: true, using: :btree
    t.index ["clarifiable_type"], name: "index_clarifications_on_clarifiable_type", using: :btree
    t.index ["user_id", "clarifiable_id", "clarifiable_type"], name: "index_clarifications_on_user_id_and_clarifiable_id_and_type", unique: true, using: :btree
    t.index ["user_id"], name: "index_clarifications_on_user_id", using: :btree
  end

  create_table "clusters", force: :cascade do |t|
    t.string   "title",       limit: 255,             null: false
    t.text     "description",                         null: false
    t.integer  "user_id",                             null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "view_id",                 default: 0, null: false
    t.index ["id", "view_id"], name: "index_clusters_on_id_and_view_id", using: :btree
    t.index ["user_id"], name: "index_clusters_on_user_id", using: :btree
  end

  create_table "clusters_communities", id: false, force: :cascade do |t|
    t.integer "community_id", null: false
    t.integer "cluster_id",   null: false
    t.index ["community_id", "cluster_id"], name: "index_clusters_communities_on_community_id_and_cluster_id", unique: true, using: :btree
  end

  create_table "code_reuses", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "upload_date"
    t.string   "name",        limit: 255
    t.string   "category",    limit: 255
    t.text     "tag"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
    t.index ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree
    t.index ["commentable_id"], name: "index_comments_on_commentable_id", using: :btree
    t.index ["commentable_stat_id"], name: "index_comments_on_commentable_stat_id", using: :btree
    t.index ["lft"], name: "index_comments_on_lft", using: :btree
    t.index ["parent_id"], name: "index_comments_on_parent_id", using: :btree
    t.index ["rgt"], name: "index_comments_on_rgt", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "comments_partitions_p0", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
    t.index ["commentable_stat_id"], name: "p0_commentable_stat_id_idx", using: :btree
    t.index ["lft"], name: "p0_lft_idx", using: :btree
    t.index ["parent_id"], name: "p0_parent_id_idx", using: :btree
    t.index ["rgt"], name: "p0_rgt_idx", using: :btree
    t.index ["user_id"], name: "p0_user_id_idx", using: :btree
  end

  create_table "comments_partitions_p1000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
    t.index ["commentable_stat_id"], name: "p1000000_commentable_stat_id_idx", using: :btree
    t.index ["lft"], name: "p1000000_lft_idx", using: :btree
    t.index ["parent_id"], name: "p1000000_parent_id_idx", using: :btree
    t.index ["rgt"], name: "p1000000_rgt_idx", using: :btree
    t.index ["user_id"], name: "p1000000_user_id_idx", using: :btree
  end

  create_table "comments_partitions_p10000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p11000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p12000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p13000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p14000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p15000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p16000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p17000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p18000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p19000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p2000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
    t.index ["commentable_stat_id"], name: "p2000000_commentable_stat_id_idx", using: :btree
    t.index ["lft"], name: "p2000000_lft_idx", using: :btree
    t.index ["parent_id"], name: "p2000000_parent_id_idx", using: :btree
    t.index ["rgt"], name: "p2000000_rgt_idx", using: :btree
    t.index ["user_id"], name: "p2000000_user_id_idx", using: :btree
  end

  create_table "comments_partitions_p20000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p21000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p22000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p23000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p24000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p25000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p26000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p27000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p28000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p29000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p3000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
    t.index ["commentable_stat_id"], name: "p3000000_commentable_stat_id_idx", using: :btree
    t.index ["lft"], name: "p3000000_lft_idx", using: :btree
    t.index ["parent_id"], name: "p3000000_parent_id_idx", using: :btree
    t.index ["rgt"], name: "p3000000_rgt_idx", using: :btree
    t.index ["user_id"], name: "p3000000_user_id_idx", using: :btree
  end

  create_table "comments_partitions_p30000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p31000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p32000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p33000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p34000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p35000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p36000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p37000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p38000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p39000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p4000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
    t.index ["commentable_stat_id"], name: "p4000000_commentable_stat_id_idx", using: :btree
    t.index ["lft"], name: "p4000000_lft_idx", using: :btree
    t.index ["parent_id"], name: "p4000000_parent_id_idx", using: :btree
    t.index ["rgt"], name: "p4000000_rgt_idx", using: :btree
    t.index ["user_id"], name: "p4000000_user_id_idx", using: :btree
  end

  create_table "comments_partitions_p40000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p41000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p42000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p43000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p44000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p45000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p46000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p47000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p48000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p49000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
  end

  create_table "comments_partitions_p5000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
    t.index ["commentable_stat_id"], name: "p5000000_commentable_stat_id_idx", using: :btree
    t.index ["lft"], name: "p5000000_lft_idx", using: :btree
    t.index ["parent_id"], name: "p5000000_parent_id_idx", using: :btree
    t.index ["rgt"], name: "p5000000_rgt_idx", using: :btree
    t.index ["user_id"], name: "p5000000_user_id_idx", using: :btree
  end

  create_table "comments_partitions_p6000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
    t.index ["commentable_stat_id"], name: "p6000000_commentable_stat_id_idx", using: :btree
    t.index ["lft"], name: "p6000000_lft_idx", using: :btree
    t.index ["parent_id"], name: "p6000000_parent_id_idx", using: :btree
    t.index ["rgt"], name: "p6000000_rgt_idx", using: :btree
    t.index ["user_id"], name: "p6000000_user_id_idx", using: :btree
  end

  create_table "comments_partitions_p7000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
    t.index ["commentable_stat_id"], name: "p7000000_commentable_stat_id_idx", using: :btree
    t.index ["lft"], name: "p7000000_lft_idx", using: :btree
    t.index ["parent_id"], name: "p7000000_parent_id_idx", using: :btree
    t.index ["rgt"], name: "p7000000_rgt_idx", using: :btree
    t.index ["user_id"], name: "p7000000_user_id_idx", using: :btree
  end

  create_table "comments_partitions_p8000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
    t.index ["commentable_stat_id"], name: "p8000000_commentable_stat_id_idx", using: :btree
    t.index ["lft"], name: "p8000000_lft_idx", using: :btree
    t.index ["parent_id"], name: "p8000000_parent_id_idx", using: :btree
    t.index ["rgt"], name: "p8000000_rgt_idx", using: :btree
    t.index ["user_id"], name: "p8000000_user_id_idx", using: :btree
  end

  create_table "comments_partitions_p9000000", id: :integer, default: -> { "nextval('comments_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "commentable_id",                  default: 0
    t.string   "commentable_type",    limit: 255, default: ""
    t.string   "title",               limit: 255, default: ""
    t.text     "body",                            default: ""
    t.string   "subject",             limit: 255, default: ""
    t.integer  "user_id",                         default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "commentable_stat_id"
    t.index ["commentable_stat_id"], name: "p9000000_commentable_stat_id_idx", using: :btree
    t.index ["lft"], name: "p9000000_lft_idx", using: :btree
    t.index ["parent_id"], name: "p9000000_parent_id_idx", using: :btree
    t.index ["rgt"], name: "p9000000_rgt_idx", using: :btree
    t.index ["user_id"], name: "p9000000_user_id_idx", using: :btree
  end

  create_table "communities", force: :cascade do |t|
    t.string   "name",                              limit: 255
    t.text     "description"
    t.integer  "user_id"
    t.string   "avatar_file_name",                  limit: 255
    t.string   "avatar_content_type",               limit: 255
    t.integer  "avatar_file_size"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.text     "extra_attributes"
    t.text     "short_description"
    t.integer  "theme"
    t.string   "logo_file_name",                    limit: 255
    t.string   "logo_content_type",                 limit: 255
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "knowmax_workspace_url",             limit: 255
    t.string   "knowmax_creation_trasaction_id",    limit: 255
    t.string   "knowmax_workspace_creation_status", limit: 255
    t.string   "knowmax_existing_link_url",         limit: 255
    t.string   "short_name",                        limit: 255
    t.integer  "merged_community_id"
    t.string   "custom_timeline",                   limit: 255
    t.index ["short_name"], name: "index_communities_on_short_name", unique: true, using: :btree
    t.index ["theme"], name: "index_communities_on_theme", using: :btree
    t.index ["user_id"], name: "index_communities_on_user_id", using: :btree
  end

  create_table "communities_members", id: false, force: :cascade do |t|
    t.integer "community_id", null: false
    t.integer "user_id",      null: false
    t.index ["community_id"], name: "index_communities_members_on_community_id", using: :btree
    t.index ["user_id", "community_id"], name: "index_communities_members_on_user_id_and_community_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_communities_members_on_user_id", using: :btree
  end

  create_table "communities_moderators", id: false, force: :cascade do |t|
    t.integer "community_id", null: false
    t.integer "user_id",      null: false
    t.index ["community_id"], name: "index_communities_moderators_on_community_id", using: :btree
    t.index ["user_id", "community_id"], name: "index_communities_moderators_on_user_id_and_community_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_communities_moderators_on_user_id", using: :btree
  end

  create_table "community_permission_communities", force: :cascade do |t|
    t.integer  "community_id"
    t.integer  "community_permission_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["community_id"], name: "index_community_permission_communities_on_community_id", using: :btree
    t.index ["community_permission_id"], name: "community_permission_index", using: :btree
  end

  create_table "community_permissions", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "community_profiles", force: :cascade do |t|
    t.integer  "community_id"
    t.float    "activity_percentile",                      default: 0.0
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.integer  "members_count",                            default: 0
    t.text     "welcome_message"
    t.text     "reject_message"
    t.string   "request_to_join_question",     limit: 255
    t.text     "warn_words"
    t.boolean  "get_ack_msg_on_invite_accept",             default: false
    t.boolean  "flag_spam",                                default: false, null: false
    t.boolean  "show_project_details",                     default: true
    t.float    "karma_value",                              default: 0.25
    t.text     "ratings"
    t.text     "invite_message"
    t.boolean  "show_download_option",                     default: true
    t.index ["activity_percentile"], name: "index_community_profiles_on_activity_percentile", using: :btree
    t.index ["community_id"], name: "index_community_profiles_on_community_id", unique: true, using: :btree
    t.index ["members_count"], name: "index_community_profiles_on_members_count", using: :btree
  end

  create_table "community_user_healths", force: :cascade do |t|
    t.float    "base_point",      default: 0.0
    t.float    "distance_point",  default: 0.0
    t.float    "quality_point",   default: 0.0
    t.float    "speed_point",     default: 0.0
    t.float    "frequency_point", default: 0.0
    t.integer  "user_id"
    t.integer  "community_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["community_id"], name: "index_community_user_healths_on_community_id", using: :btree
    t.index ["user_id"], name: "index_community_user_healths_on_user_id", using: :btree
  end

  create_table "community_vibrancies", force: :cascade do |t|
    t.float    "post_vibrancy",     default: 0.0
    t.float    "user_vibrancy",     default: 0.0
    t.float    "activity_vibrancy", default: 0.0
    t.integer  "community_id",                    null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["community_id"], name: "index_community_vibrancies_on_community_id", using: :btree
  end

  create_table "competency_masters", force: :cascade do |t|
    t.string   "competency_id",          limit: 255
    t.string   "name",                   limit: 255
    t.string   "description",            limit: 255
    t.string   "parent_competency_id",   limit: 255
    t.string   "parent_competency_name", limit: 255
    t.string   "focus_area",             limit: 255
    t.string   "sub_focus_area",         limit: 255
    t.string   "community",              limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.datetime "validity_date"
    t.index ["competency_id"], name: "index_competency_masters_on_competency_id", using: :btree
    t.index ["name"], name: "index_competency_masters_on_name", using: :btree
    t.index ["parent_competency_id"], name: "index_competency_masters_on_parent_competency_id", using: :btree
    t.index ["parent_competency_name"], name: "index_competency_masters_on_parent_competency_name", using: :btree
    t.index ["validity_date"], name: "index_competency_masters_on_validity_date", using: :btree
  end

  create_table "connections", force: :cascade do |t|
    t.integer  "outgoing_to_id"
    t.integer  "incoming_from_id"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["incoming_from_id", "outgoing_to_id"], name: "index_con_on_iid_oid", using: :btree
    t.index ["incoming_from_id"], name: "index_connections_on_incoming_from_id", using: :btree
    t.index ["outgoing_to_id"], name: "index_connections_on_outgoing_to_id", using: :btree
  end

  create_table "content_stat_others", force: :cascade do |t|
    t.integer  "stat_id"
    t.boolean  "stream_enabled"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "content_stats", force: :cascade do |t|
    t.integer  "content_id"
    t.string   "content_type",        limit: 255
    t.integer  "votes_count",                     default: 0,     null: false
    t.integer  "votes_for_count",                 default: 0,     null: false
    t.integer  "votes_against_count",             default: 0,     null: false
    t.integer  "comments_count",                  default: 0,     null: false
    t.integer  "answers_count",                   default: 0,     null: false
    t.integer  "favorites_count",                 default: 0,     null: false
    t.float    "popularity",                      default: 0.0,   null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "ideas_count",                     default: 0,     null: false
    t.integer  "followers_count",                 default: 0,     null: false
    t.integer  "status",                          default: 1,     null: false
    t.integer  "visibility",                      default: 1,     null: false
    t.boolean  "disable_activity",                default: false, null: false
    t.integer  "location_id"
    t.integer  "shares_count",                    default: 0,     null: false
    t.integer  "user_agent_id"
    t.integer  "post_type",                       default: 0
    t.index ["content_id", "content_type"], name: "index_content_stats_on_content_id_and_content_type", unique: true, using: :btree
    t.index ["status"], name: "index_content_stats_on_status", using: :btree
    t.index ["visibility"], name: "index_content_stats_on_visibility", using: :btree
  end

  create_table "conversation_messages", force: :cascade do |t|
    t.integer  "user_id",                                  null: false
    t.integer  "conversation_id",                          null: false
    t.text     "body"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "status",                      default: 1,  null: false
    t.integer  "message_type",                default: 1,  null: false
    t.string   "i18n_key",        limit: 255, default: "", null: false
    t.text     "i18n_args",                   default: "", null: false
    t.integer  "attachment_id"
    t.index ["id", "user_id", "attachment_id"], name: "index_conversation_messages_on_id_and_user_id_and_attachment_id", using: :btree
    t.index ["user_id", "conversation_id"], name: "index_conversation_messages_on_user_id_and_conversation_id", using: :btree
  end

  create_table "conversations", force: :cascade do |t|
    t.string   "subject",            limit: 255, null: false
    t.integer  "user_id",                        null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "knome_object_id"
    t.string   "knome_object_type",  limit: 255
    t.hstore   "status_store"
    t.hstore   "count_store"
    t.hstore   "email_notify_store"
    t.index ["count_store"], name: "index_conversations_on_count_store", using: :gist
    t.index ["email_notify_store"], name: "index_conversations_on_email_notify_store", using: :gist
    t.index ["status_store"], name: "index_conversations_on_status_store", using: :gist
    t.index ["user_id"], name: "index_conversations_on_user_id", using: :btree
  end

  create_table "custom_contents", force: :cascade do |t|
    t.integer  "content_id"
    t.string   "content_type", limit: 255
    t.integer  "timeline_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["content_id"], name: "index_custom_contents_on_content_id", using: :btree
    t.index ["timeline_id"], name: "index_custom_contents_on_timeline_id", using: :btree
  end

  create_table "custom_timelines", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.integer  "community_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "status",                   default: 1, null: false
    t.string   "description",  limit: 255
    t.index ["community_id"], name: "index_custom_timelines_on_community_id", using: :btree
    t.index ["status"], name: "index_custom_timelines_on_status", using: :btree
  end

  create_table "duplications", force: :cascade do |t|
    t.integer  "content_id",                 null: false
    t.string   "content_type",   limit: 255, null: false
    t.integer  "duplicate_id",               null: false
    t.string   "duplicate_type", limit: 255, null: false
    t.integer  "user_id",                    null: false
    t.integer  "status"
    t.integer  "acted_by"
    t.string   "remarks",        limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["content_id", "content_type"], name: "index_duplications_on_content_id_and_content_type", using: :btree
    t.index ["duplicate_id", "duplicate_type"], name: "index_duplications_on_duplicate_id_and_duplicate_type", using: :btree
    t.index ["user_id"], name: "index_duplications_on_user_id", using: :btree
  end

  create_table "evaluation_criteria", force: :cascade do |t|
    t.text     "criterion"
    t.string   "criterion_type", limit: 255
    t.integer  "weight",                     default: 0, null: false
    t.integer  "evaluation_id",                          null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "user_id"
    t.index ["criterion_type"], name: "index_evaluation_criteria_on_criterion_type", using: :btree
    t.index ["user_id"], name: "index_evaluation_criteria_on_user_id", using: :btree
  end

  create_table "evaluation_items", force: :cascade do |t|
    t.integer  "evaluation_criterion_id",                         null: false
    t.integer  "item_id",                                         null: false
    t.string   "item_type",               limit: 255,             null: false
    t.integer  "score",                               default: 0
    t.integer  "user_id",                                         null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  create_table "evaluations", force: :cascade do |t|
    t.integer  "content_id",               null: false
    t.string   "content_type", limit: 255, null: false
    t.integer  "owner_id",                 null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer  "activity_object_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "host_id"
    t.integer  "moderator_id"
    t.text     "metadata"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "host_comments_count",        default: 0
    t.integer  "participant_comments_count", default: 0
    t.index ["activity_object_id"], name: "index_events_on_activity_object_id", using: :btree
    t.index ["end_time"], name: "index_events_on_end_time", using: :btree
    t.index ["host_id"], name: "index_events_on_host_id", using: :btree
    t.index ["moderator_id"], name: "index_events_on_moderator_id", using: :btree
    t.index ["start_time"], name: "index_events_on_start_time", using: :btree
  end

  create_table "events_hosts", id: false, force: :cascade do |t|
    t.integer "event_id"
    t.integer "host_id"
    t.index ["event_id", "host_id"], name: "index_events_hosts_on_event_id_and_host_id", using: :btree
  end

  create_table "expert_contents", force: :cascade do |t|
    t.integer  "content_id",               null: false
    t.string   "content_type", limit: 255, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["content_id", "content_type"], name: "index_expert_contents_on_content_id_and_content_type", unique: true, using: :btree
  end

  create_table "experts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "knome_object_id"
    t.string   "knome_object_type", limit: 255
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.boolean  "system_determined",             default: true
    t.index ["knome_object_id", "knome_object_type"], name: "index_experts_on_knome_object_id_and_knome_object_type", using: :btree
    t.index ["user_id"], name: "index_experts_on_user_id", using: :btree
  end

  create_table "exports", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "exportable_id"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.string   "export_file_name",    limit: 255
    t.string   "export_content_type", limit: 255
    t.integer  "export_file_size"
    t.datetime "export_updated_at"
    t.integer  "status"
    t.string   "exportable_type",     limit: 255, default: "Community", null: false
    t.index ["user_id", "exportable_id"], name: "index_exports_on_user_id_and_exportable_id", using: :btree
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "favoritable_id"
    t.string   "favoritable_type", limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["favoritable_id", "favoritable_type"], name: "index_favorites_on_favoritable_id_and_favoritable_type", using: :btree
    t.index ["user_id"], name: "index_favorites_on_user_id", using: :btree
  end

  create_table "field_choices", force: :cascade do |t|
    t.string   "label",      limit: 255
    t.integer  "field_id"
    t.string   "status",     limit: 2,   default: "1", null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["field_id", "id"], name: "index_field_choices_on_field_id_and_id", using: :btree
  end

  create_table "fields", force: :cascade do |t|
    t.integer  "form_id"
    t.string   "label",      limit: 255,                 null: false
    t.string   "field_type", limit: 255, default: "0",   null: false
    t.string   "status",     limit: 2,   default: "1",   null: false
    t.integer  "sequence",               default: 0
    t.boolean  "required",               default: false
    t.hstore   "properties"
    t.hstore   "choices"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["choices"], name: "index_fields_on_choices", using: :gist
    t.index ["id", "form_id", "field_type"], name: "index_fields_on_id_and_form_id_and_field_type", using: :btree
    t.index ["id", "form_id"], name: "index_fields_on_id_and_form_id", using: :btree
    t.index ["properties"], name: "index_fields_on_properties", using: :gist
  end

  create_table "flat_bookings", force: :cascade do |t|
    t.integer  "agreement_amount"
    t.integer  "base_price"
    t.integer  "area"
    t.datetime "date_of_booking"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "followed_items", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "followable_id"
    t.string   "followable_type",  limit: 255
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.boolean  "followed_in_view",             default: false, null: false
    t.boolean  "is_include",                   default: true
    t.index ["followable_id", "followable_type", "user_id"], name: "index_uwl_on_kwi_and_kwt_and_user_id", using: :btree
    t.index ["followable_id", "followable_type"], name: "index_uwl_on_kwi_and_kwt", using: :btree
    t.index ["followed_in_view"], name: "index_followed_items_on_followed_in_view", using: :btree
    t.index ["user_id"], name: "index_user_watch_lists_on_user_id", using: :btree
  end

  create_table "form_responses", force: :cascade do |t|
    t.integer  "form_id"
    t.integer  "user_id"
    t.string   "status",     limit: 2, default: "1", null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["form_id", "user_id"], name: "index_form_responses_on_form_id_and_user_id", using: :btree
  end

  create_table "form_results", force: :cascade do |t|
    t.integer  "form_id"
    t.integer  "user_id"
    t.hstore   "data"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "field_id",         null: false
    t.integer  "field_choice_id"
    t.integer  "form_response_id", null: false
    t.integer  "attachment_id"
    t.index ["data"], name: "index_form_results_on_data", using: :gist
    t.index ["field_id", "field_choice_id"], name: "index_form_results_on_field_id_and_field_choice_id", using: :btree
    t.index ["form_response_id"], name: "index_form_results_on_form_response_id", using: :btree
    t.index ["id", "form_id", "user_id"], name: "index_form_results_on_id_and_form_id_and_user_id", using: :btree
  end

  create_table "forms", force: :cascade do |t|
    t.string   "title",             limit: 255,                 null: false
    t.text     "description",                                   null: false
    t.integer  "item_id"
    t.string   "item_type",         limit: 255
    t.integer  "user_id",                                       null: false
    t.string   "status",            limit: 2,   default: "1",   null: false
    t.integer  "form_type",                     default: 0,     null: false
    t.boolean  "template",                      default: false, null: false
    t.text     "properties"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.boolean  "results_viewable",              default: false, null: false
    t.boolean  "results_editable",              default: false, null: false
    t.boolean  "multiple_response",             default: false, null: false
    t.index ["id", "user_id"], name: "index_forms_on_id_and_user_id", using: :btree
  end

  create_table "idea_categorizations", force: :cascade do |t|
    t.integer  "taggable_id",               null: false
    t.string   "taggable_type", limit: 255, null: false
    t.integer  "category_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "idea_evaluations", force: :cascade do |t|
    t.integer  "content_id"
    t.string   "content_type",      limit: 255
    t.integer  "user_id"
    t.integer  "previous_status"
    t.integer  "current_status"
    t.integer  "categorization_id"
    t.integer  "challenge_stat_id"
    t.string   "remarks",           limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "benefits",          limit: 255
  end

  create_table "idea_to_challenges", force: :cascade do |t|
    t.integer  "idea_or_share_stat_id"
    t.integer  "challenge_or_share_stat_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["challenge_or_share_stat_id", "idea_or_share_stat_id"], name: "index_idea_to_challenges_on_challenge_and_idea_share_stat_id", unique: true, using: :btree
    t.index ["challenge_or_share_stat_id"], name: "index_idea_to_challenges_on_challenge_or_share_stat_id", using: :btree
    t.index ["idea_or_share_stat_id"], name: "index_idea_to_challenges_on_idea_or_share_stat_id", using: :btree
  end

  create_table "ideas", force: :cascade do |t|
    t.string   "title",             limit: 255
    t.text     "description"
    t.text     "meta"
    t.integer  "user_id"
    t.boolean  "selected",                      default: false
    t.text     "selection_remarks"
    t.integer  "selected_by"
    t.datetime "selected_at"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "challenge_id"
    t.boolean  "awarded",                       default: false, null: false
    t.text     "extra_attributes"
    t.float    "average_rating"
    t.text     "tagging_details"
    t.string   "theme_category",    limit: 255
    t.string   "contact_no",        limit: 255
    t.index ["awarded"], name: "index_ideas_on_awarded", using: :btree
    t.index ["challenge_id"], name: "index_ideas_on_challenge_id", using: :btree
    t.index ["created_at"], name: "index_ideas_on_created_at", using: :btree
    t.index ["extra_attributes"], name: "index_ideas_on_extra_attributes", using: :btree
    t.index ["selected_at"], name: "index_ideas_on_selected_at", using: :btree
    t.index ["user_id"], name: "index_ideas_on_user_id", using: :btree
  end

  create_table "keyword_alerts", force: :cascade do |t|
    t.string   "employee_id", limit: 255
    t.text     "keyword"
    t.integer  "created_by"
    t.datetime "expired_at"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["expired_at"], name: "index_keyword_alerts_on_expired_at", using: :btree
  end

  create_table "knome_batch_alerts", force: :cascade do |t|
    t.string   "batch_name",                  limit: 255
    t.integer  "number_of_records_to_update"
    t.integer  "migrated_records_count"
    t.integer  "number_of_errors_count"
    t.string   "migration_start_time",        limit: 255
    t.string   "migration_end_time",          limit: 255
    t.float    "migration_time"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "knome_object_activities", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "knome_object_id"
    t.string   "knome_object_type",    limit: 255
    t.string   "activity_type",        limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "activity_occurred_at",             null: false
    t.integer  "node_id"
    t.string   "node_type",            limit: 255
    t.integer  "content_stat_id"
    t.integer  "culprit_id"
    t.integer  "node_stat_id"
    t.index ["activity_occurred_at"], name: "index_knome_object_activities_on_activity_occurred_at", using: :btree
    t.index ["activity_type"], name: "index_knome_object_activities_on_action_type", using: :btree
    t.index ["content_stat_id"], name: "index_knome_object_activities_on_content_stat_id", using: :btree
    t.index ["knome_object_id", "knome_object_type"], name: "index_koa_on_koi_and_kot", using: :btree
    t.index ["knome_object_type"], name: "index_knome_object_activities_on_knome_object_type", using: :btree
    t.index ["node_id", "node_type"], name: "index_knome_object_activities_on_node_id_and_node_type", using: :btree
    t.index ["node_stat_id"], name: "node_stat_id", using: :btree
    t.index ["user_id"], name: "index_knome_object_activities_on_user_id", using: :btree
  end

  create_table "knome_object_activity_points", force: :cascade do |t|
    t.float    "base_point",                           default: 0.0
    t.float    "distance_point",                       default: 0.0
    t.float    "speed_point",                          default: 0.0
    t.float    "quality_point",                        default: 0.0
    t.integer  "knome_object_activity_id"
    t.integer  "user_id"
    t.string   "user_type",                limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.float    "frequency_point",                      default: 0.0
    t.integer  "creator_id"
    t.index ["creator_id"], name: "index_knome_object_activity_points_on_creator_id", using: :btree
    t.index ["knome_object_activity_id"], name: "index_knome_object_activity_points_on_knome_object_activity_id", using: :btree
    t.index ["user_id"], name: "index_knome_object_activity_points_on_user_id", using: :btree
    t.index ["user_type"], name: "index_knome_object_activity_points_on_user_type", using: :btree
  end

  create_table "knowmax_uploads", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.text     "keywords"
    t.datetime "updated_at",             null: false
  end

  create_table "legacy_sentiment_analyses", force: :cascade do |t|
    t.text     "inclusion_words"
    t.text     "exclusion_words"
    t.text     "location_ids"
    t.text     "ou_ids"
    t.datetime "from_date"
    t.datetime "to_date"
    t.text     "processed_sentiment"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "location_type",       limit: 255
    t.float    "latitude"
    t.float    "longitude"
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.text     "extra_attributes"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "ancestry",            limit: 255
    t.integer  "ancestry_depth",                  default: 0
    t.integer  "avatar_file_size"
    t.index ["ancestry"], name: "index_locations_on_ancestry", using: :btree
    t.index ["latitude"], name: "index_locations_on_latitude", using: :btree
    t.index ["longitude"], name: "index_locations_on_longitude", using: :btree
    t.index ["name"], name: "index_locations_on_name", using: :btree
  end

  create_table "media_directories", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.integer  "actor_id"
    t.integer  "status",                 default: 1, null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["actor_id"], name: "index_media_directories_on_actor_id", using: :btree
    t.index ["status"], name: "index_media_directories_on_status", using: :btree
  end

  create_table "media_directories_media_files", id: false, force: :cascade do |t|
    t.integer "media_file_id"
    t.integer "media_directory_id"
    t.index ["media_directory_id"], name: "index_media_directories_media_files_on_media_directory_id", using: :btree
    t.index ["media_file_id", "media_directory_id"], name: "index_on_file_id_directory_id", using: :btree
  end

  create_table "media_files", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.integer  "actor_id",                              null: false
    t.integer  "attachment_id",                         null: false
    t.integer  "is_featured",               default: 0, null: false
    t.integer  "user_id",                               null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["actor_id"], name: "index_media_files_on_actor_id", using: :btree
    t.index ["attachment_id"], name: "index_media_files_on_attachment_id", using: :btree
    t.index ["is_featured"], name: "index_media_files_on_is_featured", using: :btree
    t.index ["user_id"], name: "index_media_files_on_user_id", using: :btree
  end

  create_table "media_shares", force: :cascade do |t|
    t.integer  "activity_object_id",             null: false
    t.integer  "sphere_id",                      null: false
    t.integer  "user_id",                        null: false
    t.string   "message",            limit: 255
    t.text     "meta"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["activity_object_id"], name: "index_media_shares_on_activity_object_id", using: :btree
    t.index ["sphere_id"], name: "index_media_shares_on_sphere_id", using: :btree
    t.index ["user_id"], name: "index_media_shares_on_user_id", using: :btree
  end

  create_table "mentions", force: :cascade do |t|
    t.integer  "content_id"
    t.string   "content_type", limit: 255
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["content_id"], name: "index_mentions_on_content_id", using: :btree
    t.index ["user_id"], name: "index_mentions_on_user_id", using: :btree
  end

  create_table "message_common_data", force: :cascade do |t|
    t.integer  "sender_id",                default: 0,  null: false
    t.integer  "location_id",              default: 0,  null: false
    t.string   "title",        limit: 255, default: "", null: false
    t.text     "description",              default: "", null: false
    t.integer  "message_type",             default: 0,  null: false
    t.integer  "content_id"
    t.string   "content_type", limit: 255
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["content_type", "content_id"], name: "index_message_common_data_on_content_type_and_content_id", using: :btree
    t.index ["location_id"], name: "index_message_common_data_on_location_id", using: :btree
    t.index ["message_type"], name: "index_message_common_data_on_message_type", using: :btree
    t.index ["sender_id"], name: "index_message_common_data_on_sender_id", using: :btree
    t.index ["title"], name: "index_message_common_data_on_title", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "message_common_data_id",    default: 0,     null: false
    t.integer  "recipient_id",              default: 0,     null: false
    t.integer  "recipient_status",          default: 0,     null: false
    t.integer  "sender_status",             default: 0,     null: false
    t.integer  "action_taken_by_recipient", default: 0,     null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.boolean  "is_read_by_recipient",      default: false, null: false
    t.index ["action_taken_by_recipient"], name: "index_messages_on_action_taken_by_recipient", using: :btree
    t.index ["is_read_by_recipient", "recipient_id"], name: "index_messages_on_is_read_by_recipient_and_recipient_id", using: :btree
    t.index ["is_read_by_recipient"], name: "index_messages_on_is_read_by_recipient", using: :btree
    t.index ["message_common_data_id"], name: "index_messages_on_message_common_data_id", using: :btree
    t.index ["recipient_id"], name: "index_messages_on_recipient_id", using: :btree
    t.index ["recipient_status"], name: "index_messages_on_recipient_status", using: :btree
    t.index ["sender_status"], name: "index_messages_on_sender_status", using: :btree
  end

  create_table "microblogs", force: :cascade do |t|
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "generated_status", default: 1
    t.index ["created_at"], name: "index_microblogs_on_created_at", using: :btree
    t.index ["user_id"], name: "index_microblogs_on_user_id", using: :btree
  end

  create_table "notice_boards", force: :cascade do |t|
    t.string   "content_type",       limit: 255,             null: false
    t.integer  "content_id",                                 null: false
    t.integer  "activity_object_id",                         null: false
    t.integer  "user_id",                                    null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "position",                       default: 1, null: false
    t.index ["activity_object_id"], name: "index_notice_boards_on_activity_object_id", using: :btree
    t.index ["content_type", "content_id"], name: "index_notice_boards_on_content_type_and_content_id", using: :btree
    t.index ["user_id"], name: "index_notice_boards_on_user_id", using: :btree
  end

  create_table "notification_messages", force: :cascade do |t|
    t.integer  "user_id",                                              null: false
    t.string   "i18n_key",                 limit: 255,                 null: false
    t.text     "i18n_args",                                            null: false
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.boolean  "is_read",                              default: false, null: false
    t.integer  "knome_object_activity_id",                             null: false
    t.integer  "latest_entry_at"
    t.index ["is_read", "user_id"], name: "index_notification_messages_on_is_read_and_user_id", using: :btree
    t.index ["is_read"], name: "index_notification_messages_on_is_read", using: :btree
    t.index ["knome_object_activity_id"], name: "index_notification_messages_on_knome_object_activity_id", using: :btree
    t.index ["user_id"], name: "index_notification_messages_on_user_id", using: :btree
  end

  create_table "oauth_access_grants", force: :cascade do |t|
    t.integer  "resource_owner_id",             null: false
    t.integer  "application_id",                null: false
    t.string   "token",             limit: 255, null: false
    t.integer  "expires_in",                    null: false
    t.string   "redirect_uri",      limit: 255, null: false
    t.datetime "created_at",                    null: false
    t.datetime "revoked_at"
    t.string   "scopes",            limit: 255
    t.index ["token"], name: "index_oauth_access_grants_on_token", unique: true, using: :btree
  end

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id",                null: false
    t.string   "token",             limit: 255, null: false
    t.string   "refresh_token",     limit: 255
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",                    null: false
    t.string   "scopes",            limit: 255
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true, using: :btree
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id", using: :btree
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true, using: :btree
  end

  create_table "oauth_applications", force: :cascade do |t|
    t.string   "name",         limit: 255,              null: false
    t.string   "uid",          limit: 255,              null: false
    t.string   "secret",       limit: 255,              null: false
    t.string   "redirect_uri", limit: 255,              null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "scopes",       limit: 255, default: "", null: false
    t.index ["uid"], name: "index_oauth_applications_on_uid", unique: true, using: :btree
  end

  create_table "organization_unit_communities", force: :cascade do |t|
    t.integer  "organization_unit_id"
    t.integer  "community_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["community_id"], name: "index_organization_unit_communities_on_community_id", using: :btree
    t.index ["organization_unit_id"], name: "index_organization_unit_communities_on_organization_unit_id", using: :btree
  end

  create_table "organization_unit_owners", force: :cascade do |t|
    t.integer  "organization_unit_id"
    t.integer  "user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["organization_unit_id"], name: "index_organization_unit_owners_on_organization_unit_id", using: :btree
    t.index ["user_id"], name: "index_organization_unit_owners_on_user_id", using: :btree
  end

  create_table "organization_units", force: :cascade do |t|
    t.string   "ou_id",      limit: 255
    t.string   "ou_name",    limit: 255
    t.integer  "level"
    t.string   "ancestry",   limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "status",                 default: 1
    t.index ["ancestry"], name: "index_organization_units_on_ancestry", using: :btree
    t.index ["level"], name: "index_organization_units_on_level", using: :btree
    t.index ["ou_id"], name: "index_organization_units_on_ou_id", using: :btree
    t.index ["ou_name"], name: "index_organization_units_on_ou_name", using: :btree
  end

  create_table "ou_stats", force: :cascade do |t|
    t.text     "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pdfs", force: :cascade do |t|
    t.integer  "attachment_id"
    t.string   "data_file_name",    limit: 255
    t.string   "data_content_type", limit: 255
    t.string   "data_file_size",    limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["attachment_id"], name: "index_pdfs_on_attachment_id", using: :btree
  end

  create_table "poll_results", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "status"
    t.string   "poll_result_report_file_name",    limit: 255
    t.string   "poll_result_report_content_type", limit: 255
    t.integer  "poll_result_report_file_size"
    t.datetime "poll_result_report_updated_at"
    t.index ["user_id", "question_id"], name: "index_poll_results_on_user_id_and_question_id", using: :btree
  end

  create_table "processed_attachments", force: :cascade do |t|
    t.integer  "attachment_id"
    t.text     "data"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["attachment_id"], name: "index_processed_attachments_on_attachment_id", unique: true, using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "detail"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "base_iou",               limit: 255
    t.string   "assignment_status",      limit: 255
    t.integer  "supervisor_employee_id"
    t.text     "preferences"
    t.integer  "photo_status",                       default: 0,     null: false
    t.boolean  "daily_digest",                       default: false
    t.boolean  "weekly_digest",                      default: true
    t.string   "default_timeline",       limit: 255
    t.boolean  "notification_sound",                 default: true
    t.integer  "widget_preference",                  default: 1,     null: false
    t.text     "intro_preferences"
    t.integer  "workspace_preference"
    t.index ["daily_digest"], name: "index_profiles_on_daily_digest", using: :btree
    t.index ["supervisor_employee_id"], name: "index_profiles_on_supervisor_employee_id", using: :btree
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
    t.index ["weekly_digest"], name: "index_profiles_on_weekly_digest", using: :btree
  end

  create_table "project_communities", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "community_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["community_id"], name: "index_project_communities_on_community_id", using: :btree
    t.index ["project_id"], name: "index_project_communities_on_project_id", using: :btree
  end

  create_table "project_hierarchies", force: :cascade do |t|
    t.string   "isu",        limit: 255
    t.string   "sub_isu",    limit: 255
    t.string   "project",    limit: 255
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["user_id"], name: "index_project_hierarchies_on_user_id", using: :btree
  end

  create_table "project_owners", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_owners_on_project_id", using: :btree
    t.index ["user_id"], name: "index_project_owners_on_user_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "uniq_id"
    t.string   "name",          limit: 255
    t.integer  "won_number"
    t.text     "won_name"
    t.string   "delivery_unit", limit: 255
    t.string   "customer_name", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["uniq_id", "won_number"], name: "index_projects_on_uniq_id_and_won_number", using: :btree
    t.index ["uniq_id"], name: "index_projects_on_uniq_id", using: :btree
    t.index ["won_number"], name: "index_projects_on_won_number", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.string   "title",                      limit: 255
    t.text     "description"
    t.text     "meta"
    t.integer  "user_id"
    t.integer  "best_answer_id"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.boolean  "is_poll",                                default: false, null: false
    t.boolean  "poll_show_results",                      default: false, null: false
    t.datetime "poll_end_date"
    t.boolean  "poll_allow_multiple_choice",             default: false, null: false
    t.index ["created_at"], name: "index_questions_on_created_at", using: :btree
    t.index ["user_id"], name: "index_questions_on_user_id", using: :btree
  end

  create_table "quick_nav_items", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.string   "item_type",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["item_id", "item_type"], name: "index_quick_nav_items_on_item_id_and_item_type", using: :btree
    t.index ["user_id"], name: "index_quick_nav_items_on_user_id", using: :btree
  end

  create_table "quizzes", force: :cascade do |t|
    t.string   "name",                limit: 255, null: false
    t.integer  "user_id",                         null: false
    t.datetime "start_date",                      null: false
    t.datetime "end_date",                        null: false
    t.boolean  "is_featured"
    t.boolean  "is_contest"
    t.text     "prize"
    t.integer  "rating"
    t.integer  "participation_count"
    t.integer  "mw_quiz_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["id", "user_id"], name: "index_quizzes_on_id_and_user_id", using: :btree
  end

  create_table "rate_criteria", force: :cascade do |t|
    t.string   "name",                           limit: 255, null: false
    t.integer  "object_with_rate_criteria_id",               null: false
    t.string   "object_with_rate_criteria_type", limit: 255, null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.index ["name"], name: "index_rate_criteria_on_name", using: :btree
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "user_id",                                     null: false
    t.integer  "rateable_id",                                 null: false
    t.string   "rateable_type",     limit: 255,               null: false
    t.float    "value",                         default: 0.0
    t.integer  "rate_criterion_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.index ["rate_criterion_id"], name: "index_rates_on_rate_criterion_id", using: :btree
    t.index ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type", using: :btree
    t.index ["user_id"], name: "index_rates_on_user_id", using: :btree
  end

  create_table "recommendations", force: :cascade do |t|
    t.integer  "recommended_stat_id",               null: false
    t.integer  "recommendable_stat_id",             null: false
    t.integer  "reason",                            null: false
    t.integer  "score",                 default: 0, null: false
    t.integer  "action_taken",          default: 0, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["action_taken"], name: "index_recommendations_on_action_taken", using: :btree
    t.index ["reason"], name: "index_recommendations_on_reason", using: :btree
    t.index ["recommendable_stat_id"], name: "index_recommendations_on_recommendable_stat_id", using: :btree
    t.index ["recommended_stat_id"], name: "index_recommendations_on_recommended_stat_id", using: :btree
    t.index ["score"], name: "index_recommendations_on_score", using: :btree
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "requestable_id",               null: false
    t.string   "requestable_type", limit: 255, null: false
    t.integer  "user_id",                      null: false
    t.integer  "status",                       null: false
    t.integer  "request_type",                 null: false
    t.integer  "requestee_id"
    t.integer  "actor_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "title",                              limit: 255
    t.boolean  "view_blogposts",                                 default: true,  null: false
    t.boolean  "view_bytes",                                     default: true,  null: false
    t.boolean  "view_communities",                               default: true,  null: false
    t.boolean  "view_debates",                                   default: true,  null: false
    t.boolean  "view_questions",                                 default: true,  null: false
    t.boolean  "view_ideas",                                     default: true,  null: false
    t.boolean  "view_media",                                     default: true,  null: false
    t.boolean  "view_user_profiles",                             default: true,  null: false
    t.boolean  "view_wikis",                                     default: true,  null: false
    t.boolean  "view_comments",                                  default: true,  null: false
    t.boolean  "login",                                          default: true,  null: false
    t.boolean  "report_abuse",                                   default: true,  null: false
    t.boolean  "bookmark",                                       default: true,  null: false
    t.boolean  "vote_comments",                                  default: true,  null: false
    t.boolean  "vote_ideas",                                     default: true,  null: false
    t.boolean  "rate_media",                                     default: true,  null: false
    t.boolean  "comment",                                        default: true,  null: false
    t.boolean  "join_communities",                               default: true,  null: false
    t.boolean  "create_blogposts",                               default: true,  null: false
    t.boolean  "create_bytes",                                   default: true,  null: false
    t.boolean  "create_communities",                             default: true,  null: false
    t.boolean  "create_debates",                                 default: true,  null: false
    t.boolean  "create_questions",                               default: true,  null: false
    t.boolean  "create_ideas",                                   default: true,  null: false
    t.boolean  "create_media",                                   default: true,  null: false
    t.boolean  "create_wikis",                                   default: true,  null: false
    t.boolean  "edit_own_blogposts",                             default: true,  null: false
    t.boolean  "edit_own_bytes",                                 default: false, null: false
    t.boolean  "edit_own_communities",                           default: true,  null: false
    t.boolean  "edit_own_debates",                               default: false, null: false
    t.boolean  "edit_own_questions",                             default: false, null: false
    t.boolean  "edit_own_ideas",                                 default: false, null: false
    t.boolean  "edit_own_media",                                 default: false, null: false
    t.boolean  "edit_own_profile",                               default: true,  null: false
    t.boolean  "edit_own_wikis",                                 default: true,  null: false
    t.boolean  "edit_own_comments",                              default: false, null: false
    t.boolean  "delete_own_blogposts",                           default: false, null: false
    t.boolean  "delete_own_bytes",                               default: false, null: false
    t.boolean  "delete_own_communities",                         default: false, null: false
    t.boolean  "delete_own_debates",                             default: false, null: false
    t.boolean  "delete_own_questions",                           default: false, null: false
    t.boolean  "delete_own_ideas",                               default: false, null: false
    t.boolean  "delete_own_media",                               default: false, null: false
    t.boolean  "delete_own_wikis",                               default: false, null: false
    t.boolean  "delete_own_comments",                            default: false, null: false
    t.boolean  "moderate_blogposts",                             default: false, null: false
    t.boolean  "moderate_bytes",                                 default: false, null: false
    t.boolean  "moderate_communities",                           default: false, null: false
    t.boolean  "moderate_debates",                               default: false, null: false
    t.boolean  "moderate_questions",                             default: false, null: false
    t.boolean  "moderate_ideas",                                 default: false, null: false
    t.boolean  "moderate_media",                                 default: false, null: false
    t.boolean  "moderate_users",                                 default: false, null: false
    t.boolean  "moderate_wikis",                                 default: false, null: false
    t.boolean  "moderate_comments",                              default: false, null: false
    t.boolean  "moderate_reported_items",                        default: false, null: false
    t.boolean  "manage_services",                                default: false, null: false
    t.boolean  "manage_invite_codes",                            default: false, null: false
    t.boolean  "manage_badges",                                  default: false, null: false
    t.boolean  "manage_categories",                              default: false, null: false
    t.boolean  "manage_celebrity_items",                         default: false, null: false
    t.boolean  "manage_roles",                                   default: false, null: false
    t.boolean  "view_reports",                                   default: false, null: false
    t.boolean  "view_badges",                                    default: false, null: false
    t.boolean  "manage_activities",                              default: false, null: false
    t.boolean  "change_knome_settings",                          default: false, null: false
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
    t.boolean  "view_challenges",                                default: true,  null: false
    t.boolean  "create_challenges",                              default: false, null: false
    t.boolean  "edit_own_challenges",                            default: false, null: false
    t.boolean  "delete_own_challenges",                          default: false, null: false
    t.boolean  "moderate_challenges",                            default: false, null: false
    t.boolean  "view_microblogs",                                default: true,  null: false
    t.boolean  "create_microblogs",                              default: true,  null: false
    t.boolean  "moderate_microblogs",                            default: true,  null: false
    t.boolean  "edit_own_microblogs",                            default: true,  null: false
    t.boolean  "delete_own_microblogs",                          default: true,  null: false
    t.boolean  "view_views",                                     default: true,  null: false
    t.boolean  "create_views",                                   default: true,  null: false
    t.boolean  "moderate_views",                                 default: true,  null: false
    t.boolean  "edit_own_views",                                 default: true,  null: false
    t.boolean  "delete_own_views",                               default: true,  null: false
    t.boolean  "edit_locations"
    t.boolean  "create_global_views",                            default: false, null: false
    t.boolean  "moderate_answers",                               default: false
    t.boolean  "tag_competencies",                               default: false, null: false
    t.boolean  "translate",                                      default: false, null: false
    t.boolean  "moderate_user_profile",                          default: false, null: false
    t.boolean  "switch_user",                                    default: false, null: false
    t.boolean  "create_all_communities",                         default: false, null: false
    t.boolean  "moderate_app_launcher_apps",                     default: false, null: false
    t.boolean  "login_as_corporate",                             default: false, null: false
    t.boolean  "login_as_admin_bot",                             default: false, null: false
    t.boolean  "merge_tags",                                     default: false, null: false
    t.boolean  "create_sticky_notes",                            default: false, null: false
    t.boolean  "create_polls"
    t.boolean  "report_duplicate",                               default: true,  null: false
    t.boolean  "upload_processable_attachment",                  default: false, null: false
    t.boolean  "login_as_miracle_worker",                        default: false, null: false
    t.boolean  "rate_on_ideas",                                  default: false, null: false
    t.boolean  "evaluate_on_ideas",                              default: false, null: false
    t.boolean  "upload_document",                                default: false, null: false
    t.boolean  "upload_video",                                   default: false, null: false
    t.boolean  "select_idea",                                    default: false, null: false
    t.boolean  "create_live_chat",                               default: false, null: false
    t.boolean  "create_a_featured_community",                    default: false, null: false
    t.boolean  "access_analytics",                               default: false, null: false
    t.boolean  "view_community_vibrancy",                        default: false, null: false
    t.boolean  "create_sections",                                default: false, null: false
    t.boolean  "view_sections",                                  default: false, null: false
    t.boolean  "edit_own_sections",                              default: false, null: false
    t.boolean  "delete_own_sections",                            default: false, null: false
    t.boolean  "manage_clusters",                                default: false, null: false
    t.boolean  "create_badges",                                  default: false, null: false
    t.boolean  "access_listening_platform",                      default: false, null: false
    t.boolean  "create_forms",                                   default: true,  null: false
    t.boolean  "login_as_tml_user",                              default: false, null: false
    t.boolean  "login_as_lnd_user",                              default: false, null: false
    t.boolean  "data_analytics",                                 default: false, null: false
    t.boolean  "view_expert_search",                             default: false, null: false
    t.boolean  "login_as_titan_user",                            default: false, null: false
    t.boolean  "create_tasks",                                   default: true,  null: false
    t.boolean  "create_task_lists",                              default: true,  null: false
    t.boolean  "manage_categorization",                          default: false, null: false
    t.boolean  "login_as_cardiologist_vijay_surase",             default: false, null: false
    t.boolean  "view_innovations",                               default: false
    t.boolean  "edit_innovations",                               default: false
    t.boolean  "moderate_innovations",                           default: false
    t.boolean  "login_as_iam_user",                              default: false, null: false
    t.boolean  "login_as_fit_4_life_user",                       default: false, null: false
    t.boolean  "manage_workspaces",                              default: false, null: false
    t.boolean  "enable_challenge_poster",                        default: false, null: false
    t.boolean  "login_as_corporate_hr",                          default: false, null: false
    t.boolean  "create_hackathon",                               default: false
    t.boolean  "manage_security_widget",                         default: false
    t.boolean  "login_as_techcom_user",                          default: false, null: false
    t.boolean  "login_as_umeet_editorial_user",                  default: false
    t.boolean  "login_as_continuous_feedback_user",              default: false
    t.index ["create_challenges"], name: "index_roles_on_create_challenges", using: :btree
    t.index ["create_global_views"], name: "index_roles_on_create_global_views", using: :btree
    t.index ["delete_own_challenges"], name: "index_roles_on_delete_own_challenges", using: :btree
    t.index ["edit_own_challenges"], name: "index_roles_on_edit_own_challenges", using: :btree
    t.index ["moderate_answers"], name: "index_roles_on_moderate_answers", using: :btree
    t.index ["moderate_challenges"], name: "index_roles_on_moderate_challenges", using: :btree
    t.index ["title"], name: "index_roles_on_title", unique: true, using: :btree
    t.index ["view_challenges"], name: "index_roles_on_view_challenges", using: :btree
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_roles_users_on_role_id", using: :btree
    t.index ["user_id", "role_id"], name: "index_roles_users_on_user_id_and_role_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_roles_users_on_user_id", using: :btree
  end

  create_table "rolify_roles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "resource_id"
    t.string   "resource_type", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_rolify_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["name"], name: "index_rolify_roles_on_name", using: :btree
  end

  create_table "sections", force: :cascade do |t|
    t.integer  "user_id",                             null: false
    t.integer  "wiki_id",                             null: false
    t.string   "title",       limit: 255,             null: false
    t.text     "description"
    t.integer  "position",                default: 0
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.index ["lft"], name: "index_sections_on_lft", using: :btree
    t.index ["parent_id"], name: "index_sections_on_parent_id", using: :btree
    t.index ["rgt"], name: "index_sections_on_rgt", using: :btree
  end

  create_table "selections", force: :cascade do |t|
    t.integer  "selected_object_id",               null: false
    t.string   "selected_object_type", limit: 255, null: false
    t.integer  "user_id"
    t.text     "remarks"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["selected_object_id", "selected_object_type"], name: "index_selections_on_selected_object_id_and_selected_object_type", using: :btree
    t.index ["user_id"], name: "index_selections_on_user_id", using: :btree
  end

  create_table "settings", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "value"
    t.boolean  "enabled",                default: true, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["name"], name: "index_settings_on_name", using: :btree
  end

  create_table "shares", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "message"
    t.integer  "activity_object_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "id_of_share_submitted_to"
    t.index ["activity_object_id"], name: "index_shares_on_activity_object_id", using: :btree
    t.index ["id_of_share_submitted_to"], name: "index_shares_on_id_of_share_submitted_to", using: :btree
    t.index ["user_id"], name: "index_shares_on_user_id", using: :btree
  end

  create_table "sidebar_widgets", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.integer  "widgetable_id"
    t.string   "widgetable_type", limit: 255
    t.integer  "position"
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "slides", force: :cascade do |t|
    t.integer  "attachment_id"
    t.integer  "position"
    t.string   "data_file_name",    limit: 255
    t.string   "data_content_type", limit: 255
    t.string   "data_file_size",    limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["attachment_id"], name: "index_slides_on_attachment_id", using: :btree
    t.index ["position"], name: "index_slides_on_position", using: :btree
  end

  create_table "sphere_members", force: :cascade do |t|
    t.integer  "sphere_id"
    t.integer  "actor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actor_id"], name: "index_sphere_members_on_actor_id", using: :btree
    t.index ["sphere_id", "actor_id"], name: "index_sphere_members_on_sphere_id_and_actor_id", unique: true, using: :btree
    t.index ["sphere_id"], name: "index_sphere_members_on_sphere_id", using: :btree
  end

  create_table "spheres", force: :cascade do |t|
    t.integer  "actor_id"
    t.string   "name",        limit: 255
    t.text     "description"
    t.integer  "sphere_type",             default: 1, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["actor_id"], name: "index_spheres_on_actor_id", using: :btree
    t.index ["sphere_type"], name: "index_spheres_on_type", using: :btree
  end

  create_table "swfs", force: :cascade do |t|
    t.integer  "attachment_id"
    t.string   "data_file_name",    limit: 255
    t.string   "data_content_type", limit: 255
    t.string   "data_file_size",    limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["attachment_id"], name: "index_swfs_on_attachment_id", using: :btree
  end

  create_table "tag_healths", force: :cascade do |t|
    t.float    "performance_ratio", default: 0.0
    t.float    "health",            default: 0.0
    t.float    "base_point",        default: 0.0
    t.float    "distance_point",    default: 0.0
    t.float    "speed_point",       default: 0.0
    t.float    "quality_point",     default: 0.0
    t.float    "frequency_point",   default: 0.0
    t.integer  "tag_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["health"], name: "index_tag_healths_on_health", using: :btree
    t.index ["performance_ratio"], name: "index_tag_healths_on_performance_ratio", using: :btree
    t.index ["tag_id"], name: "index_tag_healths_on_tag_id", using: :btree
  end

  create_table "tag_valuations", force: :cascade do |t|
    t.integer  "tag_id"
    t.float    "value",      default: 1.0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["tag_id"], name: "index_tag_valuations_on_tag_id", using: :btree
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type", limit: 255
    t.integer  "tagger_id"
    t.string   "tagger_type",   limit: 255
    t.string   "context",       limit: 255
    t.datetime "created_at"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.integer "synonym_id",                 default: 0
    t.integer "taggings_count",             default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true, using: :btree
  end

  create_table "task_lists", force: :cascade do |t|
    t.string   "title",      limit: 255, null: false
    t.integer  "user_id",                null: false
    t.integer  "item_id"
    t.string   "item_type",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.text     "description",  null: false
    t.datetime "due_at"
    t.integer  "task_list_id", null: false
    t.integer  "user_id",      null: false
    t.integer  "assignee_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "state"
    t.datetime "completed_at"
    t.index ["completed_at"], name: "index_tasks_on_completed_at", using: :btree
    t.index ["state"], name: "index_tasks_on_state", using: :btree
  end

  create_table "tolk_locales", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name"], name: "index_tolk_locales_on_name", unique: true, using: :btree
  end

  create_table "tolk_phrases", force: :cascade do |t|
    t.text     "key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tolk_translations", force: :cascade do |t|
    t.integer  "phrase_id"
    t.integer  "locale_id"
    t.text     "text"
    t.text     "previous_text"
    t.boolean  "primary_updated", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["phrase_id", "locale_id"], name: "index_tolk_translations_on_phrase_id_and_locale_id", unique: true, using: :btree
  end

  create_table "user_agents", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["name"], name: "index_user_agents_on_name", using: :btree
  end

  create_table "user_allocation_stats", force: :cascade do |t|
    t.integer  "user_id",                                                null: false
    t.integer  "employee_id"
    t.integer  "project_id"
    t.integer  "project_number"
    t.string   "project_name",               limit: 255
    t.string   "depute_iou_name",            limit: 255
    t.integer  "depute_iou_id"
    t.string   "depute_location_name",       limit: 255
    t.boolean  "is_migrated",                            default: false
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.datetime "allocation_start_date"
    t.datetime "allocation_completion_date"
    t.string   "previous_project_name",      limit: 255
    t.index ["employee_id"], name: "index_user_allocation_stats_on_employee_id", using: :btree
    t.index ["project_id"], name: "index_user_allocation_stats_on_project_id", using: :btree
    t.index ["project_number"], name: "index_user_allocation_stats_on_project_number", using: :btree
    t.index ["user_id"], name: "index_user_allocation_stats_on_user_id", unique: true, using: :btree
  end

  create_table "user_allocations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_number"
    t.string   "project_name",               limit: 255
    t.string   "depute_iou_name",            limit: 255
    t.string   "project_location_name",      limit: 255
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.integer  "assignment_id"
    t.integer  "project_id"
    t.datetime "allocation_start_date"
    t.datetime "allocation_completion_date"
    t.text     "project_role_description"
    t.text     "dc_description"
    t.string   "work_type_name",             limit: 255
    t.boolean  "primary",                                default: false, null: false
    t.string   "depute_iou_name_temp",       limit: 255
    t.string   "temp",                       limit: 255
    t.index ["assignment_id"], name: "index_user_allocations_on_assignment_id", using: :btree
    t.index ["depute_iou_name"], name: "index_user_allocations_on_depute_iou_name", using: :btree
    t.index ["project_name"], name: "index_user_allocations_on_project_name", using: :btree
    t.index ["project_number"], name: "index_user_allocations_on_project_number", using: :btree
    t.index ["user_id"], name: "index_user_allocations_on_user_id", using: :btree
  end

  create_table "user_badges", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "badge_id"
    t.boolean  "active",              default: true
    t.integer  "content_stat_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.datetime "expires_at"
    t.datetime "awarded_at"
    t.text     "metadata"
    t.integer  "notification_status", default: 0
    t.integer  "location_id"
    t.boolean  "unique_award",                       null: false
    t.index ["awarded_at"], name: "index_user_badges_on_awarded_at", using: :btree
    t.index ["badge_id"], name: "index_user_badges_on_badge_id", using: :btree
    t.index ["content_stat_id"], name: "index_user_badges_on_content_stat_id", using: :btree
    t.index ["expires_at"], name: "index_user_badges_on_expires_at", using: :btree
    t.index ["notification_status"], name: "index_user_badges_on_notification_status", using: :btree
    t.index ["user_id", "badge_id", "awarded_at"], name: "index_user_badges_on_user_id_and_badge_id_and_awarded_at", unique: true, using: :btree
    t.index ["user_id", "badge_id"], name: "index_user_badges_on_user_id_and_badge_id", unique: true, where: "(unique_award IS TRUE)", using: :btree
    t.index ["user_id"], name: "index_user_badges_on_user_id", using: :btree
  end

  create_table "user_co_ownables", force: :cascade do |t|
    t.integer  "user_id",                     null: false
    t.integer  "co_ownable_id",               null: false
    t.string   "co_ownable_type", limit: 255, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["co_ownable_id"], name: "index_user_co_ownables_on_co_ownable_id", using: :btree
    t.index ["co_ownable_type"], name: "index_user_co_ownables_on_co_ownable_type", using: :btree
    t.index ["user_id", "co_ownable_type", "co_ownable_id"], name: "user_co_ownables_user_id_co_ownable_type_and_id_index", unique: true, using: :btree
    t.index ["user_id"], name: "index_user_co_ownables_on_user_id", using: :btree
  end

  create_table "user_competencies", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "competency_id"
    t.string   "icalms_id",        limit: 255
    t.string   "competency_level", limit: 255
    t.datetime "acquired_at"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["competency_id"], name: "index_user_competencies_on_competency_id", using: :btree
    t.index ["competency_level"], name: "index_user_competencies_on_competency_level", using: :btree
    t.index ["user_id", "competency_level"], name: "index_user_competencies_on_user_id_and_competency_level", using: :btree
    t.index ["user_id"], name: "index_user_competencies_on_user_id", using: :btree
  end

  create_table "user_conversations", force: :cascade do |t|
    t.integer  "user_id",                                     null: false
    t.integer  "conversation_id",                             null: false
    t.integer  "content_id"
    t.string   "content_type",    limit: 255
    t.integer  "status",                      default: 4,     null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "unread_count",                default: 0
    t.boolean  "email_notify",                default: false
    t.index ["user_id", "conversation_id"], name: "index_user_conversations_on_user_id_and_conversation_id", unique: true, using: :btree
    t.index ["user_id", "status"], name: "index_user_conversations_on_user_id_and_status", using: :btree
    t.index ["user_id"], name: "index_user_conversations_on_user_id", using: :btree
  end

  create_table "user_icalms_roles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "icalms_id",        limit: 255
    t.string   "common_role_name", limit: 255
    t.string   "unique_role_name", limit: 255
    t.string   "base_role_name",   limit: 255
    t.string   "role_type",        limit: 255
    t.datetime "role_start_date"
    t.datetime "role_end_date"
    t.datetime "role_assigned_on"
    t.boolean  "primary",                      default: false, null: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.index ["primary"], name: "index_user_icalms_roles_on_primary", using: :btree
    t.index ["user_id"], name: "index_user_icalms_roles_on_user_id", using: :btree
  end

  create_table "user_mindworks_badges", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.integer  "badge_id",    null: false
    t.integer  "badge_count"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id", "badge_id"], name: "index_user_mindworks_badges_on_user_id_and_badge_id", unique: true, using: :btree
  end

  create_table "user_notification_preferences", force: :cascade do |t|
    t.integer  "user_id",                                                     null: false
    t.string   "notification_preferencable_type", limit: 255,                 null: false
    t.integer  "notification_preferencable_id",                               null: false
    t.boolean  "receive_notification_message",                default: true,  null: false
    t.boolean  "receive_notification_email",                  default: false, null: false
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
    t.integer  "digest_frequency"
    t.index ["receive_notification_email"], name: "idx_on_unp_on_rne", using: :btree
    t.index ["receive_notification_message"], name: "idx_on_unp_on_rnm", using: :btree
    t.index ["user_id", "notification_preferencable_type", "notification_preferencable_id"], name: "idx_on_unp_on_ui_npt_npi", unique: true, using: :btree
  end

  create_table "user_stats", force: :cascade do |t|
    t.integer  "user_id",                                               null: false
    t.string   "employee_id",                   limit: 255
    t.integer  "fit_for_life_hrs_pledged",                  default: 0
    t.integer  "fit_for_life_hrs_achieved",                 default: 0
    t.integer  "fit_for_life_kms_pledged",                  default: 0
    t.integer  "fit_for_life_kms_achieved",                 default: 0
    t.integer  "purpose_for_life_hrs_pledged",              default: 0
    t.integer  "purpose_for_life_hrs_achieved",             default: 0
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.string   "responsibility_name",           limit: 255
    t.string   "primary_role",                  limit: 255
    t.index ["employee_id"], name: "index_user_stats_on_employee_id", using: :btree
    t.index ["user_id"], name: "index_user_stats_on_user_id", using: :btree
  end

  create_table "user_tag_healths", force: :cascade do |t|
    t.float    "user_performance_score",  default: 0.0
    t.integer  "tag_id"
    t.float    "base_point",              default: 0.0
    t.float    "distance_point",          default: 0.0
    t.float    "speed_point",             default: 0.0
    t.float    "quality_point",           default: 0.0
    t.float    "frequency_point",         default: 0.0
    t.float    "user_contribution_score", default: 0.0
    t.integer  "user_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["tag_id"], name: "index_user_tag_healths_on_tag_id", using: :btree
    t.index ["user_contribution_score"], name: "index_user_tag_healths_on_user_contribution_score", using: :btree
    t.index ["user_id"], name: "index_user_tag_healths_on_user_id", using: :btree
    t.index ["user_performance_score"], name: "index_user_tag_healths_on_user_performance_score", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                      limit: 255, default: "",               null: false
    t.string   "encrypted_password",         limit: 255, default: "",               null: false
    t.string   "reset_password_token",       limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",         limit: 255
    t.string   "last_sign_in_ip",            limit: 255
    t.string   "confirmation_token",         limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",                        default: 0
    t.string   "unlock_token",               limit: 255
    t.datetime "locked_at"
    t.string   "authentication_token",       limit: 255
    t.string   "first_name",                 limit: 255
    t.string   "last_name",                  limit: 255
    t.text     "about_me"
    t.integer  "profile_views_count",                    default: 0
    t.string   "contact_number",             limit: 255
    t.string   "location",                   limit: 255
    t.float    "points",                                 default: 0.0
    t.string   "time_zone",                  limit: 255
    t.string   "locale",                     limit: 255
    t.integer  "role_id"
    t.text     "meta"
    t.boolean  "delta",                                  default: true,             null: false
    t.datetime "created_at",                                                        null: false
    t.datetime "updated_at",                                                        null: false
    t.string   "avatar_file_name",           limit: 255
    t.string   "avatar_content_type",        limit: 255
    t.integer  "avatar_file_size"
    t.string   "icalms_role",                limit: 255
    t.boolean  "wizard_visited",                         default: false
    t.boolean  "terms_accepted",                         default: false
    t.integer  "employee_id"
    t.string   "gender",                     limit: 255
    t.string   "voip_number",                limit: 255
    t.string   "mobile_number",              limit: 255
    t.string   "user_edittable_icalms_role", limit: 255, default: "NO ROLE TAGGED", null: false
    t.string   "photo_file_name",            limit: 255
    t.string   "photo_content_type",         limit: 255
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "avatar_updated_at"
    t.boolean  "policy_accepted",                        default: false
    t.datetime "policy_accepted_at"
    t.text     "blocked_users"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["employee_id"], name: "index_users_on_employee_id", unique: true, using: :btree
    t.index ["icalms_role"], name: "index_users_on_icalms_role", using: :btree
    t.index ["points"], name: "index_users_on_points", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["role_id"], name: "index_users_on_role_id", using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  end

  create_table "users_rolify_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "rolify_role_id"
    t.index ["user_id", "rolify_role_id"], name: "index_users_rolify_roles_on_user_id_and_rolify_role_id", using: :btree
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",      limit: 255, null: false
    t.integer  "item_id",                    null: false
    t.string   "event",          limit: 255, null: false
    t.string   "whodunnit",      limit: 255
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
    t.text     "meta"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  end

  create_table "view_followables", force: :cascade do |t|
    t.integer  "view_id"
    t.integer  "followed_item_id"
    t.integer  "operator_type",    default: 0
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["followed_item_id"], name: "index_view_followables_on_followed_item_id", using: :btree
    t.index ["operator_type"], name: "index_view_followables_on_operator_type", using: :btree
    t.index ["view_id"], name: "index_view_followables_on_view_id", using: :btree
  end

  create_table "views", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.text     "description"
    t.integer  "user_id"
    t.text     "extra_fields"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "view_type",                default: 0
    t.integer  "status",                   default: 1, null: false
    t.text     "search_terms"
    t.text     "filters"
    t.index ["status"], name: "index_views_on_status", using: :btree
    t.index ["user_id"], name: "index_views_on_user_id", using: :btree
    t.index ["view_type"], name: "index_views_on_view_type", using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id",                                  null: false
    t.integer  "votable_id",                               null: false
    t.string   "votable_type", limit: 255,                 null: false
    t.boolean  "vote",                     default: false, null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["user_id"], name: "index_votes_on_user_id", using: :btree
    t.index ["votable_id", "votable_type", "user_id"], name: "index_votes_on_votable_id_and_votable_type_and_user_id", unique: true, using: :btree
    t.index ["votable_id", "votable_type"], name: "index_votes_on_votable_id_and_votable_type", using: :btree
  end

  create_table "widgets", force: :cascade do |t|
    t.string   "widget_host_type", limit: 255
    t.integer  "widget_host_id"
    t.text     "description"
    t.string   "title",            limit: 255
    t.integer  "status"
    t.integer  "user_id"
    t.integer  "widget_type"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.boolean  "scroll",                       default: false
    t.string   "user_role",        limit: 255
    t.index ["status"], name: "index_widgets_on_status", using: :btree
    t.index ["user_id"], name: "index_widgets_on_user_id", using: :btree
    t.index ["widget_host_type", "widget_host_id"], name: "index_widgets_on_widget_host_type_and_widget_host_id", using: :btree
  end

  create_table "wikis", force: :cascade do |t|
    t.string   "title",             limit: 255
    t.text     "short_description"
    t.integer  "user_id",                       null: false
    t.text     "tagging_details"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.datetime "publish_date"
  end

end
