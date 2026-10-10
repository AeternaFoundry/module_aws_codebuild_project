resource "aws_codebuild_project" "codebuild_projects" {
  for_each = var.codebuild_projects

  name                   = each.value.name
  service_role           = each.value.service_role
  auto_retry_limit       = each.value.auto_retry_limit
  badge_enabled          = each.value.badge_enabled
  build_timeout          = each.value.build_timeout
  concurrent_build_limit = each.value.concurrent_build_limit
  description            = each.value.description
  encryption_key         = each.value.encryption_key
  project_visibility     = each.value.project_visibility
  queued_timeout         = each.value.queued_timeout
  region                 = each.value.region
  resource_access_role   = each.value.resource_access_role
  source_version         = each.value.source_version
  tags                   = each.value.tags
  tags_all               = each.value.tags_all

  artifacts {
    artifact_identifier    = each.value.artifacts.artifact_identifier
    bucket_owner_access    = each.value.artifacts.bucket_owner_access
    encryption_disabled    = each.value.artifacts.encryption_disabled
    location               = each.value.artifacts.location
    name                   = each.value.artifacts.name
    namespace_type         = each.value.artifacts.namespace_type
    override_artifact_name = each.value.artifacts.override_artifact_name
    packaging              = each.value.artifacts.packaging
    path                   = each.value.artifacts.path
    type                   = each.value.artifacts.type
  }

  environment {
    certificate  = each.value.environment.certificate
    compute_type = each.value.environment.compute_type
    dynamic "docker_server" {
      for_each = each.value.environment.docker_server != null ? [each.value.environment.docker_server] : []
      content {
        compute_type       = docker_server.value.compute_type
        security_group_ids = docker_server.value.security_group_ids
      }
    }
    dynamic "environment_variable" {
      for_each = each.value.environment.environment_variable != null ? each.value.environment.environment_variable : []
      content {
        name  = environment_variable.value.name
        type  = environment_variable.value.type
        value = environment_variable.value.value
      }
    }
    dynamic "fleet" {
      for_each = each.value.environment.fleet != null ? [each.value.environment.fleet] : []
      content {
        fleet_arn = fleet.value.fleet_arn
      }
    }
    host_kernel                 = each.value.environment.host_kernel
    image                       = each.value.environment.image
    image_pull_credentials_type = each.value.environment.image_pull_credentials_type
    privileged_mode             = each.value.environment.privileged_mode
    dynamic "registry_credential" {
      for_each = each.value.environment.registry_credential != null ? [each.value.environment.registry_credential] : []
      content {
        credential          = registry_credential.value.credential
        credential_provider = registry_credential.value.credential_provider
      }
    }
    type = each.value.environment.type
  }

  source {
    dynamic "auth" {
      for_each = each.value.source.auth != null ? [each.value.source.auth] : []
      content {
        resource = auth.value.resource
        type     = auth.value.type
      }
    }
    dynamic "build_status_config" {
      for_each = each.value.source.build_status_config != null ? [each.value.source.build_status_config] : []
      content {
        context    = build_status_config.value.context
        target_url = build_status_config.value.target_url
      }
    }
    buildspec       = each.value.source.buildspec
    git_clone_depth = each.value.source.git_clone_depth
    dynamic "git_submodules_config" {
      for_each = each.value.source.git_submodules_config != null ? [each.value.source.git_submodules_config] : []
      content {
        fetch_submodules = git_submodules_config.value.fetch_submodules
      }
    }
    insecure_ssl        = each.value.source.insecure_ssl
    location            = each.value.source.location
    report_build_status = each.value.source.report_build_status
    type                = each.value.source.type
  }

  dynamic "build_batch_config" {
    for_each = each.value.build_batch_config != null ? [each.value.build_batch_config] : []
    content {
      combine_artifacts = build_batch_config.value.combine_artifacts
      dynamic "restrictions" {
        for_each = build_batch_config.value.restrictions != null ? [build_batch_config.value.restrictions] : []
        content {
          compute_types_allowed  = restrictions.value.compute_types_allowed
          maximum_builds_allowed = restrictions.value.maximum_builds_allowed
        }
      }
      service_role    = build_batch_config.value.service_role
      timeout_in_mins = build_batch_config.value.timeout_in_mins
    }
  }

  dynamic "cache" {
    for_each = each.value.cache != null ? [each.value.cache] : []
    content {
      cache_namespace = cache.value.cache_namespace
      location        = cache.value.location
      modes           = cache.value.modes
      type            = cache.value.type
    }
  }

  dynamic "file_system_locations" {
    for_each = each.value.file_system_locations != null ? each.value.file_system_locations : []
    content {
      identifier    = file_system_locations.value.identifier
      location      = file_system_locations.value.location
      mount_options = file_system_locations.value.mount_options
      mount_point   = file_system_locations.value.mount_point
      type          = file_system_locations.value.type
    }
  }

  dynamic "logs_config" {
    for_each = each.value.logs_config != null ? [each.value.logs_config] : []
    content {
      dynamic "cloudwatch_logs" {
        for_each = logs_config.value.cloudwatch_logs != null ? [logs_config.value.cloudwatch_logs] : []
        content {
          group_name  = cloudwatch_logs.value.group_name
          status      = cloudwatch_logs.value.status
          stream_name = cloudwatch_logs.value.stream_name
        }
      }
      dynamic "s3_logs" {
        for_each = logs_config.value.s3_logs != null ? [logs_config.value.s3_logs] : []
        content {
          bucket_owner_access = s3_logs.value.bucket_owner_access
          encryption_disabled = s3_logs.value.encryption_disabled
          location            = s3_logs.value.location
          status              = s3_logs.value.status
        }
      }
    }
  }

  dynamic "secondary_artifacts" {
    for_each = each.value.secondary_artifacts != null ? each.value.secondary_artifacts : []
    content {
      artifact_identifier    = secondary_artifacts.value.artifact_identifier
      bucket_owner_access    = secondary_artifacts.value.bucket_owner_access
      encryption_disabled    = secondary_artifacts.value.encryption_disabled
      location               = secondary_artifacts.value.location
      name                   = secondary_artifacts.value.name
      namespace_type         = secondary_artifacts.value.namespace_type
      override_artifact_name = secondary_artifacts.value.override_artifact_name
      packaging              = secondary_artifacts.value.packaging
      path                   = secondary_artifacts.value.path
      type                   = secondary_artifacts.value.type
    }
  }

  dynamic "secondary_source_version" {
    for_each = each.value.secondary_source_version != null ? each.value.secondary_source_version : []
    content {
      source_identifier = secondary_source_version.value.source_identifier
      source_version    = secondary_source_version.value.source_version
    }
  }

  dynamic "secondary_sources" {
    for_each = each.value.secondary_sources != null ? each.value.secondary_sources : []
    content {
      dynamic "auth" {
        for_each = secondary_sources.value.auth != null ? [secondary_sources.value.auth] : []
        content {
          resource = auth.value.resource
          type     = auth.value.type
        }
      }
      dynamic "build_status_config" {
        for_each = secondary_sources.value.build_status_config != null ? [secondary_sources.value.build_status_config] : []
        content {
          context    = build_status_config.value.context
          target_url = build_status_config.value.target_url
        }
      }
      buildspec       = secondary_sources.value.buildspec
      git_clone_depth = secondary_sources.value.git_clone_depth
      dynamic "git_submodules_config" {
        for_each = secondary_sources.value.git_submodules_config != null ? [secondary_sources.value.git_submodules_config] : []
        content {
          fetch_submodules = git_submodules_config.value.fetch_submodules
        }
      }
      insecure_ssl        = secondary_sources.value.insecure_ssl
      location            = secondary_sources.value.location
      report_build_status = secondary_sources.value.report_build_status
      source_identifier   = secondary_sources.value.source_identifier
      type                = secondary_sources.value.type
    }
  }

  dynamic "vpc_config" {
    for_each = each.value.vpc_config != null ? [each.value.vpc_config] : []
    content {
      security_group_ids = vpc_config.value.security_group_ids
      subnets            = vpc_config.value.subnets
      vpc_id             = vpc_config.value.vpc_id
    }
  }
}

