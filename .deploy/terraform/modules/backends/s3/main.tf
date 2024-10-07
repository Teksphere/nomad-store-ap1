# s3 bucket to store our terraform state file remotely
resource "aws_s3_bucket" "terraform_state" {
    bucket = var.bucket_name # "terraform-up-and-running-state-fss"

    # prevent accidental deletion of this s3 bucket via terraform
    lifecycle {
      prevent_destroy = true
    }

    # Enable versioning so we can see the full revision history of our state files
    versioning {
      enabled = true
    }

    # Enable server-side encryption by default
    server_side_encryption_configuration {
      rule {
        apply_server_side_encryption_by_default {
          sse_algorithm = "AES256"
        }
      }
    }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name = var.dynamodb_name # "terraform-up-and-running-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}