output "website_url" {
  description = "നിങ്ങളുടെ റെസ്യൂമെ വെബ്സൈറ്റ് ലിങ്ക്"
  value       = aws_s3_bucket_website_configuration.resume_config.website_endpoint
}