# Terraform-Test
Terraform sample template.  
Terraformテンプレートです。moduleを利用し、dev/prd環境ごとの作成を行います。  
dev環境は無料利用枠の範囲内で作成を行いますが、prd環境は一部料金が発生します。  
構成は、  
dev環境が、VPC内に配置した1台のALB、1台のEC2、1台のRDS（MySQL）。  
prd環境が、VPC内に配置した1台のALB、2台のEC2、1台のRDS（MySQL、マルチAZ）となります。
# Diagram
![tftest-dev 250](https://user-images.githubusercontent.com/91016271/154978777-b597341f-eefe-41e4-bfcc-f57f9f09a7f3.png)
![tftest-prd 280](https://user-images.githubusercontent.com/91016271/154848117-587eea57-c44c-496f-b6f7-d4ab3223eefc.png)

# Directory structure

```
├── modules #child module
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
    |   ├── versions.tf
    |   └── backend.tf
    └── prd
        ├── main.tf
        ├── variables.tf
        ├── versions.tf
        └── backend.tf   
```

# modules
子モジュールのディレクトリです。   
`.tf`ファイルは、作成するリソースごとに分割しています。  

参照の煩雑さを軽減するため、変数およびアウトプットは、`variables.tf`と`outputs.tf`にまとめて記載しています。  

ec2インスタンス用のキーペアは、`key_pair.tf`にてterraformから直接作成を行います。  
作成したprivate_keyは`.tfstate`ファイルに直接記載されるため、注意が必要です。  
また、作成したキーペアはs3に保管されます。

# template
ユーザーデータ、iamポリシー、iamロールのテンプレートファイルを配置するディレクトリです。  

`mysql_install.sh`：mysqlのインストールが定義されています。  
`iam`サブディレクトリ：ec2用のiamポリシーおよびロールが定義されています。  
S3,cloudwatch,ssm,RDSのポリシーを付与します。  

各テンプレートは、`modules`ディレクトリにて参照されます。

# envs
ルートモジュールのディレクトリです。  
`terraform apply`は、`dev`および`prd`サブディレクトリにて行います。  

`main.tf`：子モジュールの呼び出しを行います。  
`variables.tf`：環境ごとの差違を定義します。  
`versions.tf`：プロバイダーを定義しています。  
`backend.tf`：`.tfstate`ファイルをs3に保存する設定を行います。  

なお、`.tfstate`ファイルを保管するs3自体は、terraformでの作成を行いません（s3を作成した`.tfstate`ファイルの管理問題を避けるため）。  
