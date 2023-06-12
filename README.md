# AWS-2tier-Architecture

A 2-tier architecture refers to a system design where there are two distinct layers or tiers: the presentation tier and the data tier. In the context of Terraform, this architecture can be implemented by provisioning infrastructure resources using Terraform modules.

Presentation Tier: This tier, also known as the front-end tier, handles the user interface and client interactions. It typically includes web servers, load balancers, and other components that serve and process user requests.

Data Tier: This tier, also known as the back-end tier, stores and manages the data required by the application. It usually consists of databases, data storage systems, and related infrastructure components.

In this Project, I have used Terraform to create the following services on AWS Cloud:
'''
Custom VPC
2 Public Subnets
2 Private Subnets
Internet Gateway
NAT Gateway
Public Route Table with Public subnets Association
Private Route Table with Private Subnets Assocaiation 
1 RDS MySQL
2 EC2 Instances with Apache Bootstrapped in Public Subnets
Web Tier Security Group
Database Tier Security Group
Load Balancer with Target Group and Listener Configuration
'''

