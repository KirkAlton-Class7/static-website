# # ----------------------------------------------------------------
# # DNS
# # ----------------------------------------------------------------

# # ----------------------------------------------------------------
# # AWS ROUTE53 Configuration
# # ----------------------------------------------------------------

# # Hosted Zone Data for kirkdevsecops.com
# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone
# data "aws_route53_zone" "kirkdevsecops" {
#   name         = "kirkdevsecops.com"
#   private_zone = false
# }

# # Route 53 Record - Website Demo
# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate
# resource "aws_route53_record" "website_demo" {
#   zone_id = data.aws_route53_zone.kirkdevsecops.zone_id

#   name = "class-7-5-website-demo.kirkdevsecops.com"
#   type = "CNAME"
#   ttl  = 300

#   records = ["c.storage.googleapis.com"]
#   # Google Cloud Storage Request Endpoints
#   # https://docs.cloud.google.com/storage/docs/request-endpoints?utm_source=chatgpt.com#cname
# }

# # ACM Certificate - Website Demo
# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate
# resource "aws_acm_certificate" "website_demo" {
#   domain_name       = "class-7-5-website-demo.kirkdevsecops.com"
#   validation_method = "DNS"

#   lifecycle {
#     create_before_destroy = true
#   }
# }

# # DNS Validation Records for ACM Certificate - Website Demo
# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record
# resource "aws_route53_record" "website_demo_validation" {
#   for_each = {
#     for dvo in aws_acm_certificate.website_demo.domain_validation_options : dvo.domain_name => {
#       name   = dvo.resource_record_name
#       record = dvo.resource_record_value
#       type   = dvo.resource_record_type
#     }
#   }

#   zone_id = data.aws_route53_zone.kirkdevsecops.zone_id
#   records = [each.value.record]

#   allow_overwrite = true
#   name            = each.value.name
#   type            = each.value.type
#   ttl             = 60
# }
