resource "random_id" "uniqueString" {
  keepers = {
    #Generate a new id each time we create a VCN environment
    DataString = "${var.VCN-DisplayName}"
  }
  byte_length = 2
}