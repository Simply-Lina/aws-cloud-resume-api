resource "aws_dynamodb_table" "resume_table" {
  name           = var.name_dynamodb
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "resume"

  attribute {
    name = "resume"
    type = "S"
  }
  tags = {
    Name = var.name_dynamodb
  }
}
resource "aws_dynamodb_table_item" "Linet_Kendi_resume" {
  table_name = aws_dynamodb_table.resume_table.name
  hash_key   = aws_dynamodb_table.resume_table.hash_key

   item = <<ITEM

{
    "resume": {
      "S": "Linet_Kendi_resume"
    },
    "basics": {
      "M": {
        "location": {
          "M": {
            "address": {
              "S": "Waiyaki Way, Westlands"
            },
            "city": {
              "S": "Nairobi"
            },
            "countryCode": {
              "S": "KE"
            },
            "postalCode": {
              "S": "00000"
            },
            "region": {
              "S": "EA"
            }
          }
        },
        "name": {
          "S": "Linet Kendi"
        },
        "phone": {
          "S": "+24748115393"
        },
        "summary": {
          "S": "A summary of Linet Kendi's work experience and Certification."
        }
        
      }
    },
   
    "jobExperience": {
      "M": {
        "company": {
          "S": "Dell Technologies."
        },
        "position": {
          "S": "Technical Infrastrcture Engineer"
        },
        "startDate": {
          "S": "2023-10-04"
        },
        "endDate": {
          "S": "till-date"
        },
        "responsibilities": {
          "S": "Architect infrastrcture solutions(on-prem, hybrid or cloud), collaborated with cross-functional teams, and optimized performance."
        }
      }
    },
    "certification": {
      "M": {
        "name": {
          "S": "AWS Knowledge Architecting Badge - Solution Architect"
        },
        "institution": {
          "S": "Amazon Web Services"
        },
        "date": {
          "S": "2024"
        },
        "credlyLink": {
          "S": "https://www.credly.com/badges/5b0f1d10-92ba-4bda-bc1f-a8d0fac300d7/public_url"
        }
      },
     
        "name": {
          "S": "AWS Cloud Practitioner"
        },
        "institution": {
          "S": "Amazon Web Services"
        },
        "date": {
          "S": "2023"
        },
        "credlyLink": {
          "S": "https://www.credly.com/badges/17ec6a4b-bc0d-492e-8931-88fab33fab36/public_url"
        }
      }  
    }
ITEM
}