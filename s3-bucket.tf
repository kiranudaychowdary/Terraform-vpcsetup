# resource "aws_s3_bucket" "terraform_test" {
#   bucket = "${var.s3-name}"
#   acl = "private"
#   versioning {
#     enabled = true
#   } 
#   tags = {
#     Name = "${var.s3-name}"
#   }
# }