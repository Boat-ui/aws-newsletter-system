#  AWS Serverless Newsletter System

A complete, production-ready newsletter system built entirely on AWS serverless infrastructure.

##  Live Demo
- ** Main Website**: [https://d3o8vrxnvf3ttp.cloudfront.net](https://d3o8vrxnvf3ttp.cloudfront.net)
- ** Admin Dashboard**: [https://d3o8vrxnvf3ttp.cloudfront.net/admin.html](https://d3o8vrxnvf3ttp.cloudfront.net/admin.html) *(Token: \TravelAdmin123\)*
- ** API Endpoint**: [https://5if5zp12qa.execute-api.us-east-1.amazonaws.com/prod](https://5if5zp12qa.execute-api.us-east-1.amazonaws.com/prod)

##  Serverless Architecture
\\\
        
    User       CloudFront      S3       
   Browser          (CDN)            (Website)  
        
                                            
                                            
                                            
        
   API          Lambda       DynamoDB   
   Gateway         Functions        (Database)  
        

          ALL SERVICES ARE SERVERLESS!
          No EC2 instances to manage!
\\\

##  AWS Resources
| Service | Resource Name | Purpose |
|---------|--------------|---------|
| **CloudFront** | [d3o8vrxnvf3ttp.cloudfront.net](https://d3o8vrxnvf3ttp.cloudfront.net) | Global CDN for website |
| **S3** | website-boat | Static website hosting |
| **Lambda** | SaveEmailSubscription | Save email to database |
| **Lambda** | GetNewsletterSubscribers | Retrieve subscribers (admin) |
| **API Gateway** | NewsletterAPI (5if5zp12qa) | REST API endpoints |
| **DynamoDB** | NewsletterSubscribers | NoSQL database for emails |
| **IAM** | Various roles | Security & permissions |

##  Technical Stack
- **Frontend**: HTML5, CSS3, JavaScript (Vanilla)
- **Backend**: Node.js 18.x (AWS Lambda)
- **Database**: Amazon DynamoDB (NoSQL)
- **Infrastructure**: AWS Cloud (Serverless)
- **Deployment**: AWS CLI, Git, PowerShell

##  Deployment Status
 **All systems operational** 
-  Static website deployed to S3 + CloudFront
-  API Gateway with CORS enabled
-  Lambda functions integrated
-  DynamoDB table with proper schema
-  Security configured (IAM roles, admin token)

##  Security
- **Admin Authentication**: Token-based (\TravelAdmin123\)
- **API Security**: IAM roles & API keys
- **Database**: Fine-grained IAM policies
- **Network**: CloudFront HTTPS, Security Groups

##  Fully Serverless Architecture
This system is now **100% serverless**:

- ** Frontend**: S3 + CloudFront (static hosting)
- ** Backend**: API Gateway + Lambda (serverless functions)
- ** Database**: DynamoDB (managed NoSQL)
- ** Admin**: Served from S3 via CloudFront

**Benefits:**
 No servers to manage  
 Auto-scaling
 Pay-per-use pricing  
 High availability
 Built-in CDN (CloudFront)

##  Project Structure
\\\
aws-newsletter-system/
 website/                 # Static website files
    index.html          # Main landing page
    admin.html          # Admin dashboard
 lambda/                 # AWS Lambda functions
    save-subscription.js
    get-subscribers.js
 infrastructure/         # Infrastructure as Code
    README.md
 docs/                  # Documentation
    README.md
 README.md              # This file
 deploy.sh             # Deployment script
\\\

##  Local Development
1. Clone the repository:
   \\\ash
   git clone https://github.com/Boat-ui/aws-newsletter-system.git
   \\\

2. Test locally (requires AWS CLI):
   \\\ash
   ./deploy.sh
   \\\

##  API Documentation
### Subscribe to Newsletter
\\\http
POST https://5if5zp12qa.execute-api.us-east-1.amazonaws.com/prod/subscribe
Content-Type: application/json

{
  \"email\": \"user@example.com\"
}
\\\

### Get Subscribers (Admin Only)
\\\http
GET https://5if5zp12qa.execute-api.us-east-1.amazonaws.com/prod/subscribers?token=TravelAdmin123
\\\

##  Admin Access
1. Visit: [https://d3o8vrxnvf3ttp.cloudfront.net/admin.html](https://d3o8vrxnvf3ttp.cloudfront.net/admin.html)
2. Enter token: \TravelAdmin123\
3. Manage subscribers and monitor system

##  License
MIT License

##  Contributing
Pull requests are welcome. For major changes, please open an issue first.

---
**Maintained by Boat-ui** | **AWS Account**: Active | **Last Updated**: 2025-12-05
