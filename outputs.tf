output "codebuild_projects_id" {
  description = "Map of id values across all codebuild_projects, keyed the same as var.codebuild_projects"
  value       = { for k, v in aws_codebuild_project.codebuild_projects : k => v.id if v.id != null && length(v.id) > 0 }
}
output "codebuild_projects_arn" {
  description = "Map of arn values across all codebuild_projects, keyed the same as var.codebuild_projects"
  value       = { for k, v in aws_codebuild_project.codebuild_projects : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "codebuild_projects_artifacts" {
  description = "Map of artifacts values across all codebuild_projects, keyed the same as var.codebuild_projects"
  value       = { for k, v in aws_codebuild_project.codebuild_projects : k => one(v.artifacts) if v.artifacts != null && length(v.artifacts) > 0 }
}
output "codebuild_projects_auto_retry_limit" {
  description = "Map of auto_retry_limit values across all codebuild_projects, keyed the same as var.codebuild_projects"
  value       = { for k, v in aws_codebuild_project.codebuild_projects : k => v.auto_retry_limit if v.auto_retry_limit != null }
}
output "codebuild_projects_badge_enabled" {
  description = "Map of badge_enabled values across all codebuild_projects, keyed the same as var.codebuild_projects"
  value       = { for k, v in aws_codebuild_project.codebuild_projects : k => v.badge_enabled if v.badge_enabled != null }
}
output "codebuild_projects_badge_url" {
  description = "Map of badge_url values across all codebuild_projects, keyed the same as var.codebuild_projects"
  value       = { for k, v in aws_codebuild_project.codebuild_projects : k => v.badge_url if v.badge_url != null && length(v.badge_url) > 0 }
}
output "codebuild_projects_build_batch_config" {
  description = "Map of build_batch_config values across all codebuild_projects, keyed the same as var.codebuild_projects"
  value       = { for k, v in aws_codebuild_project.codebuild_projects : k => one(v.build_batch_config) if v.build_batch_config != null && length(v.build_batch_config) > 0 }
}
output "codebuild_projects_build_timeout" {
  description = "Map of build_timeout values across all codebuild_projects, keyed the same as var.codebuild_projects"
  value       = { for k, v in aws_codebuild_project.codebuild_projects : k => v.build_timeout if v.build_timeout != null }
}
output "codebuild_projects_cache" {
  description = "Map of cache values across all codebuild_projects, keyed the same as var.codebuild_projects"
  value       = { for k, v in aws_codebuild_project.codebuild_projects : k => one(v.cache) if v.cache != null && length(v.cache) > 0 }
}
output "codebuild_projects_concurrent_build_limit" {
  description = "Map of concurrent_build_limit values across all codebuild_projects, keyed the same as var.codebuild_projects"
  value       = { for k, v in aws_codebuild_project.codebuild_projects : k => v.concurrent_build_limit if v.concurrent_build_limit != null }
}
output "codebuild_projects_description" {
  description = "Map of description values across all codebuild_projects, keyed the same as var.codebuild_projects"
  value       = { for k, v in aws_codebuild_project.codebuild_projects : k => v.description if v.description != null && length(v.description) > 0 }
}
output "codebuild_projects_encryption_key" {
  description = "Map of encryption_key values across all codebuild_projects, keyed the same as var.codebuild_projects"
  value       = { for k, v in aws_codebuild_project.codebuild_projects : k => v.encryption_key if v.encryption_key != null && length(v.encryption_key) > 0 }
}
output "codebuild_projects_environment" {
  description = "Map of environment values across all codebuild_projects, keyed the same as var.codebuild_projects"
  value       = { for k, v in aws_codebuild_project.codebuild_projects : k => one(v.environment) if v.environment != null && length(v.environment) > 0 }
}
output "codebuild_projects_file_system_locations" {
  description = "Map of file_system_locations values across all codebuild_projects, keyed the same as var.codebuild_projects"
  value       = { for k, v in aws_codebuild_project.codebuild_projects : k => v.file_system_locations if v.file_system_locations != null && length(v.file_system_locations) > 0 }
}
output "codebuild_projects_logs_config" {
  description = "Map of logs_config values across all codebuild_projects, keyed the same as var.codebuild_projects"
  value       = { for k, v in aws_codebuild_project.codebuild_projects : k => one(v.logs_config) if v.logs_config != null && length(v.logs_config) > 0 }
}
output "codebuild_projects_name" {
  description = "Map of name values across all codebuild_projects, keyed the same as var.codebuild_projects"
  value       = { for k, v in aws_codebuild_project.codebuild_projects : k => v.name if v.name != null && length(v.name) > 0 }
}
output "codebuild_projects_project_visibility" {
  description = "Map of project_visibility values across all codebuild_projects, keyed the same as var.codebuild_projects"
  value       = { for k, v in aws_codebuild_project.codebuild_projects : k => v.project_visibility if v.project_visibility != null && length(v.project_visibility) > 0 }
}
output "codebuild_projects_public_project_alias" {
  description = "Map of public_project_alias values across all codebuild_projects, keyed the same as var.codebuild_projects"
  value       = { for k, v in aws_codebuild_project.codebuild_projects : k => v.public_project_alias if v.public_project_alias != null && length(v.public_project_alias) > 0 }
}
output "codebuild_projects_queued_timeout" {
  description = "Map of queued_timeout values across all codebuild_projects, keyed the same as var.codebuild_projects"
  value       = { for k, v in aws_codebuild_project.codebuild_projects : k => v.queued_timeout if v.queued_timeout != null }
}
output "codebuild_projects_region" {
  description = "Map of region values across all codebuild_projects, keyed the same as var.codebuild_projects"
  value       = { for k, v in aws_codebuild_project.codebuild_projects : k => v.region if v.region != null && length(v.region) > 0 }
}
output "codebuild_projects_resource_access_role" {
  description = "Map of resource_access_role values across all codebuild_projects, keyed the same as var.codebuild_projects"
  value       = { for k, v in aws_codebuild_project.codebuild_projects : k => v.resource_access_role if v.resource_access_role != null && length(v.resource_access_role) > 0 }
}
output "codebuild_projects_secondary_artifacts" {
  description = "Map of secondary_artifacts values across all codebuild_projects, keyed the same as var.codebuild_projects"
  value       = { for k, v in aws_codebuild_project.codebuild_projects : k => v.secondary_artifacts if v.secondary_artifacts != null && length(v.secondary_artifacts) > 0 }
}
output "codebuild_projects_secondary_source_version" {
  description = "Map of secondary_source_version values across all codebuild_projects, keyed the same as var.codebuild_projects"
  value       = { for k, v in aws_codebuild_project.codebuild_projects : k => v.secondary_source_version if v.secondary_source_version != null && length(v.secondary_source_version) > 0 }
}
output "codebuild_projects_secondary_sources" {
  description = "Map of secondary_sources values across all codebuild_projects, keyed the same as var.codebuild_projects"
  value       = { for k, v in aws_codebuild_project.codebuild_projects : k => v.secondary_sources if v.secondary_sources != null && length(v.secondary_sources) > 0 }
}
output "codebuild_projects_service_role" {
  description = "Map of service_role values across all codebuild_projects, keyed the same as var.codebuild_projects"
  value       = { for k, v in aws_codebuild_project.codebuild_projects : k => v.service_role if v.service_role != null && length(v.service_role) > 0 }
}
output "codebuild_projects_source" {
  description = "Map of source values across all codebuild_projects, keyed the same as var.codebuild_projects"
  value       = { for k, v in aws_codebuild_project.codebuild_projects : k => one(v.source) if v.source != null && length(v.source) > 0 }
}
output "codebuild_projects_source_version" {
  description = "Map of source_version values across all codebuild_projects, keyed the same as var.codebuild_projects"
  value       = { for k, v in aws_codebuild_project.codebuild_projects : k => v.source_version if v.source_version != null && length(v.source_version) > 0 }
}
output "codebuild_projects_tags" {
  description = "Map of tags values across all codebuild_projects, keyed the same as var.codebuild_projects"
  value       = { for k, v in aws_codebuild_project.codebuild_projects : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "codebuild_projects_tags_all" {
  description = "Map of tags_all values across all codebuild_projects, keyed the same as var.codebuild_projects"
  value       = { for k, v in aws_codebuild_project.codebuild_projects : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}
output "codebuild_projects_vpc_config" {
  description = "Map of vpc_config values across all codebuild_projects, keyed the same as var.codebuild_projects"
  value       = { for k, v in aws_codebuild_project.codebuild_projects : k => one(v.vpc_config) if v.vpc_config != null && length(v.vpc_config) > 0 }
}

