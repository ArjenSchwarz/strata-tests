terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

resource "local_file" "test_files" {
  count    = 2
  filename = "${path.module}/subdir/file${count.index + 1}.txt"
  content  = ""
}

resource "local_file" "other_files" {
  count    = 2
  filename = "${path.module}/subdir/other_file${count.index + 1}.txt"
  content  = ""
}

output "test_file_names" {
  description = "Names of the created subdir test files"
  value       = local_file.test_files[*].filename
}