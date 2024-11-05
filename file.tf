resource "aws_s3_bucket" "yakshith" {
    bucket = "pvr6063"

    tags = {
        "Name" ="koushik12"
    }
  
}


resource "aws_s3_bucket_public_access_block" "koushik123" {
    bucket = aws_s3_bucket.yakshith.id
    block_public_acls       = false
    ignore_public_acls      = false
    block_public_policy     = false
    restrict_public_buckets = false

}

resource "aws_s3_bucket_policy" "ajay-policy" {
    bucket = aws_s3_bucket.yakshith.id
    policy = jsonencode(
           {
          Id= "Policy1730782219806"
          Version= "2012-10-17"
          Statement= [
           {
          Sid= "Stmt1730782216326"
          Action= "s3:GetObject"
      
      Effect= "Allow",
      Resource= "${aws_s3_bucket.yakshith.arn}/*"
      Principal= "*"
    }
  ]

})
 
}

resource "aws_s3_object" "veni2" {
    bucket = aws_s3_bucket.yakshith.id
    key    = "FirewallPortsSCCMCBVerExternal.xlsx"
    source = "C:\\Users\\LENOVO T460\\Downloads\\FirewallPortsSCCMCBVerExternal.xlsx"
    content_type = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
  
}