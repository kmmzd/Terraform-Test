# Terraform-Test
Terraform sample template.  
Terraformテンプレートです。moduleを利用し、dev/prd環境ごとの作成を行います。  
dev環境は無料利用枠の範囲内で作成を行いますが、prd環境は一部料金が発生します。  
構成は、  
dev環境が、VPC内に配置した1台のALB、1台のEC2、1台のRDS（MySQL）。  
prd環境が、VPC内に配置した1台のALB、2台のEC2、1台のRDS（MySQL、マルチAZ）となります。
# Diagram
![tftest-dev-rereseize](https://user-images.githubusercontent.com/91016271/154847962-c7b62707-2689-4290-8ba9-8c6c721ae445.png)
![tftest-prd drawio-280](https://user-images.githubusercontent.com/91016271/154848117-587eea57-c44c-496f-b6f7-d4ab3223eefc.png)

# Directory structure

```
├── modules #childs module
│   ├── vpc.tf
|   ├── securitygroup.tf
|   ├── keypair.tf 
|   ├── iam.tf
|   ├── key_pair.tf
|   ├── ec2.tf
|   ├── rds.tf
|   ├── elb.tf
|   ├── variables.tf
|   └── outputs.tf 
├── template 
|   ├── user_data
|   |    └── mysql_install.sh
|   └── iam
|       ├── ec2_iam_policy.json
|       └── ec2_iam_role.json
└── envs # root module
    ├── dev
    │   ├── main.tf
    │   ├── variables.tf
    |   └── backend.tf
    └── prd
        ├── main.tf
        ├── variables.tf
        └── backend.tf   
```
