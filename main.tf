terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

resource "local_file" "test_files" {
  count    = 20
  filename = "${path.module}/file${count.index + 1}.txt"
  content  = ""
}