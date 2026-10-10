variable "codebuild_projects" {
  description = <<EOT
Map of codebuild_projects, attributes below
Required:
    - name
    - service_role
    - artifacts (block):
        - artifact_identifier (optional)
        - bucket_owner_access (optional)
        - encryption_disabled (optional)
        - location (optional)
        - name (optional)
        - namespace_type (optional)
        - override_artifact_name (optional)
        - packaging (optional)
        - path (optional)
        - type (required)
    - environment (block):
        - certificate (optional)
        - compute_type (required)
        - docker_server (optional, block):
            - compute_type (required)
            - security_group_ids (optional)
        - environment_variable (optional, block):
            - name (required)
            - type (optional)
            - value (required)
        - fleet (optional, block):
            - fleet_arn (optional)
        - host_kernel (optional)
        - image (required)
        - image_pull_credentials_type (optional)
        - privileged_mode (optional)
        - registry_credential (optional, block):
            - credential (required)
            - credential_provider (required)
        - type (required)
    - source (block):
        - auth (optional, block):
            - resource (required)
            - type (required)
        - build_status_config (optional, block):
            - context (optional)
            - target_url (optional)
        - buildspec (optional)
        - git_clone_depth (optional)
        - git_submodules_config (optional, block):
            - fetch_submodules (required)
        - insecure_ssl (optional)
        - location (optional)
        - report_build_status (optional)
        - type (required)
Optional:
    - auto_retry_limit
    - badge_enabled
    - build_timeout
    - concurrent_build_limit
    - description
    - encryption_key
    - project_visibility
    - queued_timeout
    - region
    - resource_access_role
    - source_version
    - tags
    - tags_all
    - build_batch_config (block):
        - combine_artifacts (optional)
        - restrictions (optional, block):
            - compute_types_allowed (optional)
            - maximum_builds_allowed (optional)
        - service_role (required)
        - timeout_in_mins (optional)
    - cache (block):
        - cache_namespace (optional)
        - location (optional)
        - modes (optional)
        - type (optional)
    - file_system_locations (block):
        - identifier (optional)
        - location (optional)
        - mount_options (optional)
        - mount_point (optional)
        - type (optional)
    - logs_config (block):
        - cloudwatch_logs (optional, block):
            - group_name (optional)
            - status (optional)
            - stream_name (optional)
        - s3_logs (optional, block):
            - bucket_owner_access (optional)
            - encryption_disabled (optional)
            - location (optional)
            - status (optional)
    - secondary_artifacts (block):
        - artifact_identifier (required)
        - bucket_owner_access (optional)
        - encryption_disabled (optional)
        - location (optional)
        - name (optional)
        - namespace_type (optional)
        - override_artifact_name (optional)
        - packaging (optional)
        - path (optional)
        - type (required)
    - secondary_source_version (block):
        - source_identifier (required)
        - source_version (required)
    - secondary_sources (block):
        - auth (optional, block):
            - resource (required)
            - type (required)
        - build_status_config (optional, block):
            - context (optional)
            - target_url (optional)
        - buildspec (optional)
        - git_clone_depth (optional)
        - git_submodules_config (optional, block):
            - fetch_submodules (required)
        - insecure_ssl (optional)
        - location (optional)
        - report_build_status (optional)
        - source_identifier (required)
        - type (required)
    - vpc_config (block):
        - security_group_ids (required)
        - subnets (required)
        - vpc_id (required)
EOT

  type = map(object({
    name                   = string
    service_role           = string
    auto_retry_limit       = optional(number)
    badge_enabled          = optional(bool)
    build_timeout          = optional(number)
    concurrent_build_limit = optional(number)
    description            = optional(string)
    encryption_key         = optional(string)
    project_visibility     = optional(string)
    queued_timeout         = optional(number)
    region                 = optional(string)
    resource_access_role   = optional(string)
    source_version         = optional(string)
    tags                   = optional(map(string))
    tags_all               = optional(map(string))
    artifacts = object({
      artifact_identifier    = optional(string)
      bucket_owner_access    = optional(string)
      encryption_disabled    = optional(bool)
      location               = optional(string)
      name                   = optional(string)
      namespace_type         = optional(string)
      override_artifact_name = optional(bool)
      packaging              = optional(string)
      path                   = optional(string)
      type                   = string
    })
    environment = object({
      certificate  = optional(string)
      compute_type = string
      docker_server = optional(object({
        compute_type       = string
        security_group_ids = optional(list(string))
      }))
      environment_variable = optional(list(object({
        name  = string
        type  = optional(string)
        value = string
      })))
      fleet = optional(object({
        fleet_arn = optional(string)
      }))
      host_kernel                 = optional(string)
      image                       = string
      image_pull_credentials_type = optional(string)
      privileged_mode             = optional(bool)
      registry_credential = optional(object({
        credential          = string
        credential_provider = string
      }))
      type = string
    })
    source = object({
      auth = optional(object({
        resource = string
        type     = string
      }))
      build_status_config = optional(object({
        context    = optional(string)
        target_url = optional(string)
      }))
      buildspec       = optional(string)
      git_clone_depth = optional(number)
      git_submodules_config = optional(object({
        fetch_submodules = bool
      }))
      insecure_ssl        = optional(bool)
      location            = optional(string)
      report_build_status = optional(bool)
      type                = string
    })
    build_batch_config = optional(object({
      combine_artifacts = optional(bool)
      restrictions = optional(object({
        compute_types_allowed  = optional(list(string))
        maximum_builds_allowed = optional(number)
      }))
      service_role    = string
      timeout_in_mins = optional(number)
    }))
    cache = optional(object({
      cache_namespace = optional(string)
      location        = optional(string)
      modes           = optional(list(string))
      type            = optional(string)
    }))
    file_system_locations = optional(list(object({
      identifier    = optional(string)
      location      = optional(string)
      mount_options = optional(string)
      mount_point   = optional(string)
      type          = optional(string)
    })))
    logs_config = optional(object({
      cloudwatch_logs = optional(object({
        group_name  = optional(string)
        status      = optional(string)
        stream_name = optional(string)
      }))
      s3_logs = optional(object({
        bucket_owner_access = optional(string)
        encryption_disabled = optional(bool)
        location            = optional(string)
        status              = optional(string)
      }))
    }))
    secondary_artifacts = optional(list(object({
      artifact_identifier    = string
      bucket_owner_access    = optional(string)
      encryption_disabled    = optional(bool)
      location               = optional(string)
      name                   = optional(string)
      namespace_type         = optional(string)
      override_artifact_name = optional(bool)
      packaging              = optional(string)
      path                   = optional(string)
      type                   = string
    })))
    secondary_source_version = optional(list(object({
      source_identifier = string
      source_version    = string
    })))
    secondary_sources = optional(list(object({
      auth = optional(object({
        resource = string
        type     = string
      }))
      build_status_config = optional(object({
        context    = optional(string)
        target_url = optional(string)
      }))
      buildspec       = optional(string)
      git_clone_depth = optional(number)
      git_submodules_config = optional(object({
        fetch_submodules = bool
      }))
      insecure_ssl        = optional(bool)
      location            = optional(string)
      report_build_status = optional(bool)
      source_identifier   = string
      type                = string
    })))
    vpc_config = optional(object({
      security_group_ids = set(string)
      subnets            = set(string)
      vpc_id             = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.codebuild_projects : (
        v.secondary_artifacts == null || (length(v.secondary_artifacts) <= 12)
      )
    ])
    error_message = "Each secondary_artifacts list must contain at most 12 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.codebuild_projects : (
        v.secondary_source_version == null || (length(v.secondary_source_version) <= 12)
      )
    ])
    error_message = "Each secondary_source_version list must contain at most 12 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.codebuild_projects : (
        v.secondary_sources == null || (length(v.secondary_sources) <= 12)
      )
    ])
    error_message = "Each secondary_sources list must contain at most 12 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.codebuild_projects : (
        v.build_batch_config == null || (v.build_batch_config.restrictions == null || (v.build_batch_config.restrictions.maximum_builds_allowed == null || (v.build_batch_config.restrictions.maximum_builds_allowed >= 1 && v.build_batch_config.restrictions.maximum_builds_allowed <= 100)))
      )
    ])
    error_message = "must be between 1 and 100"
  }
  validation {
    condition = alltrue([
      for k, v in var.codebuild_projects : (
        v.build_batch_config == null || (v.build_batch_config.timeout_in_mins == null || (v.build_batch_config.timeout_in_mins >= 5 && v.build_batch_config.timeout_in_mins <= 2160))
      )
    ])
    error_message = "must be between 5 and 2160"
  }
  validation {
    condition = alltrue([
      for k, v in var.codebuild_projects : (
        v.build_timeout == null || (v.build_timeout >= 5 && v.build_timeout <= 2160)
      )
    ])
    error_message = "must be between 5 and 2160"
  }
  validation {
    condition = alltrue([
      for k, v in var.codebuild_projects : (
        v.concurrent_build_limit == null || (v.concurrent_build_limit >= 1)
      )
    ])
    error_message = "must be at least 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.codebuild_projects : (
        v.queued_timeout == null || (v.queued_timeout >= 5 && v.queued_timeout <= 480)
      )
    ])
    error_message = "must be between 5 and 480"
  }
  validation {
    condition = alltrue([
      for k, v in var.codebuild_projects : (
        v.secondary_sources == null || alltrue([for item in v.secondary_sources : (item.git_clone_depth == null || (item.git_clone_depth >= 0))])
      )
    ])
    error_message = "must be at least 0"
  }
  # Note: 41 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

