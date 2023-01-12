resource "aws_instance" "hello_world" {
  ami           = "ami-0a313d6098716f372"
  instance_type = "t2.micro"
  key_name      = "terraform"
}