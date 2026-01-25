variable "credentials" {
  description = "My credentials"
  default     = "C:/Users/Daniel/DE_zoomcap_2026/01_docker_terraform/Terraform/terraform_setup/keys/my_creds.json"
}

variable "project" {
  description = "Project name"
  default     = "project-0c3c5223-416f-4242-b0f"
}

variable "region" {
  description = "Region"
  default     = "us-central1"
}

variable "location" {
  description = "Project location"
  default     = "US"
}

variable "bq_dataset_name" {
  description = "Bigquery dataset"
  default     = "test_dataset"
}

variable "gcs_bucket_name" {
  description = "Bucket name"
  default     = "project-0c3c5223-416f-4242-b0f-terra-bucket"
}

variable "gcs_storage_class" {
  description = "Bucket storage class"
  default     = "STANDARD"
}