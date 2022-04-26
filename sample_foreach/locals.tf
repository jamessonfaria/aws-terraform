locals {
  
    files = ["ips.json", "report.csv", "sitemap.xml"]

    file_extensions = [for file in local.files : regex("\\.[0-9a-z]+$", file)]

}