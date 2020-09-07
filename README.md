# 如何在 GKE 部署 Jetty/IBM WebSphere Liberty
這次的 Lab，開發機器是使用 Mac 完成驗證的，Windows 機器在 Docker 的部分有一些要注意的地方，請先參閱 [https://docs.docker.com/docker-for-windows/install/](https://docs.docker.com/docker-for-windows/install/)

需要準備什麼
- GCP 帳號，有 gmail 就可以試用 （[https://cloud.google.com](https://cloud.google.com)）

會使用到的 GCP 服務
- Kubernetes Engine (GKE)
- Datastore
- Container Registry
- VPC 網路（設定防火牆用）
- 網路服務（設定 Load Balancer 用）

開發機器上需要先安裝的軟體與環境
-   Java SDK 8
-   Docker Desktop（[https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop)）
-   Google Cloud SDK（[https://cloud.google.com/sdk](https://cloud.google.com/sdk)）
-   Apache Maven（[https://maven.apache.org/](https://maven.apache.org/)）如果不用 Eclipse 就需要它
-   Eclipse for JavaEE（[https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2020-06/R/eclipse-jee-2020-06-R-macosx-cocoa-x86_64.dmg](https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2020-06/R/eclipse-jee-2020-06-R-macosx-cocoa-x86_64.dmg)）如果有裝 Eclipse 就不需要 Maven
-   Jetty Docker Image（[https://hub.docker.com/_/jetty](https://hub.docker.com/_/jetty)）先下載好可以節省時間
> `docker pull jetty:9.4-jdk8`
-   IBM WebSphere Liberty Docker Image（[https://hub.docker.com/_/websphere-liberty](https://hub.docker.com/_/websphere-liberty)）先下載好可以節省時間
> `docker pull websphere-liberty`
-   IBM® WebSphere® eXtreme Scale Liberty Deployment Docker Image（[https://hub.docker.com/r/ibmcom/xsld](https://hub.docker.com/r/ibmcom/xsld)）先下載好可以節省時間
> `docker pull ibmcom/xsld`
- 配置好 Docker push 到 GCP Container Registry，參考：[https://cloud.google.com/container-registry/docs/pushing-and-pulling](https://cloud.google.com/container-registry/docs/pushing-and-pulling)

# 兩個範例
- 將 Jetty 部署在 GKE 上面並且配置好 session persistence
- 將 IBM WebSphere Liberty 部署在 GKE 上面並且配置好 session persistence


## 在 GKE 建立 Kubernetes Cluster

在登入 GCP console 之後，要先建立一個專案，接著建立 Kubernetes Cluster。

如果想要完成 IBM WebSphere 這個例子，機器會需要選擇 size 大一點的，記得 lab 完成後就要把東西刪除乾淨，否則錢包會失血；如果只需要完成 Jetty 這個例子的話，機器可以選擇 size 小一點的。

## 將 Jetty 部署在 GKE 上面並且配置好 session persistence

-   先啟用 Google Cloud Datastore
-   配置使用 Google Cloud Datastore 的 Service Account
-   透過 Maven 在 local 端打包好 JavaEE demo application
-   將打包好的 JavaEE demo application 封裝到 Jetty Docker container 裡
-   將封裝好的 Jetty JavaEE Docker container push 到 Google Container Registry
-   將 Google Container Registry 上的 Jetty JavaEE container 部署至 GKE
-   測試 session persistence


## 將 IBM WebSphere Liberty 部署在 GKE 上面並且配置好 session persistence

全球首發！在網路上是找不到任何一份可以正常在 GKE 完成配置的 tutorial！

- 將 IBM® WebSphere® eXtreme Scale Liberty Deployment container push 到 Google Container Registry
- 將 Google Container Registry 上的 XSLD container 部署至 GKE
- 打開 GCP 防火牆，配置 XSLD
- 將打包好的 JavaEE demo application 封裝到 IBM WebSphere Liberty Docker container 裡
- 將封裝好的 IBM WebSphere Liberty JavaEE Docker container push 到 Google Container Registry
- 將 Google Container Registry 上的 IBM WebSphere Liberty JavaEE container 部署至 GKE
- 測試 session persistence