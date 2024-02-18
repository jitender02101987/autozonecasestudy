# ----------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# These variables must be set when using this module.
# ----------------------------------------------------------------------------------------------------------------------

variable "name" {
  type        = string
  description = "(Required) The name of the Pub/Sub topic."
}

variable "project" {
  description = "(Required) The ID of the project in which the resources belong."
  type        = string
}

# ----------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These variables have defaults, but may be overridden.
# ----------------------------------------------------------------------------------------------------------------------

variable "labels" {
  type        = map(string)
  description = "(Optional) A map of labels to assign to the Pub/Sub topic. Default is '{}'."
  default = {}
}

variable "message_retention_duration" {
  type        = string
  description = "(Optional) Indicates the minimum duration to retain a message after it is published to the topic. If this field is set, messages published to the topic in the last messageRetentionDuration are always available to subscribers. For instance, it allows any attached subscription to seek to a timestamp that is up to messageRetentionDuration in the past. If this field is not set, message retention is controlled by settings on individual subscriptions. Cannot be more than 7 days or less than 10 minutes."
  default     = null
}

variable "kms_key_name" {
  type        = string
  description = "(Optional) The resource name of the Cloud KMS CryptoKey to be used to protect access to messages published on this topic. Default is 'null'."
  default     = null
}

variable "allowed_persistence_regions" {
  type        = set(string)
  description = "(Optional) A list of persistence regions. Default inherits from organization's Resource Location Restriction policy. Default is '{}'."
  default     = null
}


# ----------------------------------------------------------------------------------------------------------------------
# MODULE CONFIGURATION PARAMETERS
# These variables are used to configure the module.
# ----------------------------------------------------------------------------------------------------------------------

variable "module_enabled" {
  type        = bool
  description = "(Optional) Whether or not to create resources within the module."
  default     = true
}

variable "module_depends_on" {
  type        = any
  description = "(Optional) A list of external resources the module depends on."
  default     = []
}