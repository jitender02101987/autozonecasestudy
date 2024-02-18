module "pubsub" {
  for_each = { for pubsubtopic in var.pubsubtopics : pubsubtopic.name => pubsubtopic }
  source         = "../module/pubsub"
  module_enabled    = true
  module_depends_on = []
  name = each.value.name
  project = each.value.project
  message_retention_duration = each.value.message_retention_duration
  kms_key_name = each.value.kms_key_name
  allowed_persistence_regions = each.value.allowed_persistence_regions
}

