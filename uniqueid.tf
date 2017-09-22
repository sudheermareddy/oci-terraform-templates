resource "random_id" "unq" {
  keepers = {
    charset = "abcdefghijklmnopqrstuvwxyz0123456789"
  }

  byte_length = 2
}