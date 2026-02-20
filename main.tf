# 1. AWS പ്രൊവൈഡർ സെറ്റപ്പ്
provider "aws" {
  region = "us-east-2"
}

# 2. സ3 ബക്കറ്റ് നിർമ്മിക്കുന്നു (അല്ലെങ്കിൽ ഉള്ളതിനെ നിയന്ത്രിക്കുന്നു)
resource "aws_s3_bucket" "resume_bucket" {
  bucket = "resume-bucket2026"
}

# 3. വെബ്സൈറ്റ് ഹോസ്റ്റിംഗ് കോൺഫിഗറേഷൻ
resource "aws_s3_bucket_website_configuration" "resume_config" {
  bucket = aws_s3_bucket.resume_bucket.id

  index_document {
    suffix = "index.html"
  }
}

# 4. പബ്ലിക് ആക്സസ് ബ്ലോക്കുകൾ നീക്കം ചെയ്യുന്നു (AccessDenied ഒഴിവാക്കാൻ ഇത് അത്യാവശ്യമാണ്)
resource "aws_s3_bucket_public_access_block" "resume_access" {
  bucket = aws_s3_bucket.resume_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# 5. ബക്കറ്റ് പോളിസി (എല്ലാവർക്കും വെബ്സൈറ്റ് കാണാൻ അനുവാദം നൽകുന്നു)
resource "aws_s3_bucket_policy" "allow_public_access" {
  # ഈ ലൈൻ ശ്രദ്ധിക്കുക: മുകളിലെ ബ്ലോക്ക് നീക്കം ചെയ്തതിന് ശേഷം മാത്രമേ ഇത് പ്രവർത്തിക്കാവൂ
  depends_on = [aws_s3_bucket_public_access_block.resume_access]
  
  bucket = aws_s3_bucket.resume_bucket.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.resume_bucket.arn}/*"
      },
    ]
  })
}